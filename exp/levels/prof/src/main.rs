//! Where the time goes: runs one encoder at one level over a set of payloads
//! for a while, notes where the program is every half millisecond of CPU
//! time, and writes the addresses out.
//!
//!   prof <ld|fg> <level> <seconds> <records.bin> <samples.out>
//!
//! `tools/where.py` turns the addresses into functions and source lines.
use std::sync::atomic::{AtomicUsize, Ordering};

const MAX: usize = 1 << 18;
static mut PCS: [usize; MAX] = [0; MAX];
static N: AtomicUsize = AtomicUsize::new(0);

extern "C" fn on_tick(_sig: libc::c_int, _info: *mut libc::siginfo_t, ctx: *mut libc::c_void) {
    unsafe {
        let uc = ctx as *mut libc::ucontext_t;
        #[cfg(target_arch = "x86_64")]
        let pc = (*uc).uc_mcontext.gregs[libc::REG_RIP as usize] as usize;
        #[cfg(target_arch = "aarch64")]
        let pc = (*uc).uc_mcontext.pc as usize;
        let i = N.fetch_add(1, Ordering::Relaxed);
        if i < MAX {
            (*core::ptr::addr_of_mut!(PCS))[i] = pc;
        }
    }
}

fn main() {
    let a: Vec<String> = std::env::args().collect();
    let level: i32 = a[2].parse().unwrap();
    let seconds: f64 = a[3].parse().unwrap();
    let data = std::fs::read(&a[4]).unwrap();
    let mut recs = Vec::new();
    let mut off = 0;
    while off + 4 <= data.len() {
        let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
        recs.push(&data[off + 4..off + 4 + n]);
        off += 4 + n;
    }
    let mut ld = gzlocal::Gzip::new(level.max(1));
    let mut fg = fastgzip::Gzip::with_level(level as u8);
    let ours = a[1] == "fg";
    let mut pass = |sink: &mut usize| {
        for r in &recs {
            *sink += if ours { fg.compress(r).len() } else { ld.compress(r).len() };
        }
    };
    let mut sink = 0;
    pass(&mut sink); // tables touched, codes built
    unsafe {
        let mut sa: libc::sigaction = core::mem::zeroed();
        sa.sa_sigaction = on_tick as usize;
        sa.sa_flags = libc::SA_SIGINFO | libc::SA_RESTART;
        libc::sigaction(libc::SIGPROF, &sa, core::ptr::null_mut());
        let every = libc::timeval { tv_sec: 0, tv_usec: 499 };
        let t = libc::itimerval { it_interval: every, it_value: every };
        libc::setitimer(libc::ITIMER_PROF, &t, core::ptr::null_mut());
    }
    let start = std::time::Instant::now();
    let mut passes = 0u64;
    while start.elapsed().as_secs_f64() < seconds {
        pass(&mut sink);
        passes += 1;
    }
    let took = start.elapsed().as_secs_f64();
    unsafe {
        let off: libc::itimerval = core::mem::zeroed();
        libc::setitimer(libc::ITIMER_PROF, &off, core::ptr::null_mut());
    }
    let n = N.load(Ordering::Relaxed).min(MAX);
    let mut out = String::new();
    for i in 0..n {
        out.push_str(&format!("{:x}\n", unsafe { (*core::ptr::addr_of!(PCS))[i] }));
    }
    std::fs::write(&a[5], out).unwrap();
    eprintln!(
        "{} level {level}: {:.1} us a payload, {n} samples ({sink})",
        a[1],
        took / (passes as f64 * recs.len() as f64) * 1e6
    );
}
