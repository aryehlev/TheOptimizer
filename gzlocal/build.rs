use std::{env, fs, path::Path};

fn main() {
    let variant = if env::var_os("CARGO_FEATURE_STOCK").is_some() {
        "stock"
    } else if env::var_os("CARGO_FEATURE_SIZED").is_some() {
        "sized"
    } else {
        "patched"
    };
    let root = Path::new("vendor").join(variant);
    let mut build = cc::Build::new();
    build
        .include(&root)
        .define("NDEBUG", None)
        .opt_level(2) // what libdeflate's own build uses
        .flag_if_supported("-std=gnu11")
        .warnings(false);
    // libdeflate's own build omits frame pointers. GZLOCAL_FRAME_POINTERS=1
    // keeps them, for profilers that walk the stack by frame pointer.
    if env::var_os("GZLOCAL_FRAME_POINTERS").is_some() {
        build.flag_if_supported("-fno-omit-frame-pointer");
    } else {
        build.flag_if_supported("-fomit-frame-pointer");
    }
    for dir in [root.join("lib"), root.join("lib/x86"), root.join("lib/arm"), root.join("lib/riscv")] {
        let Ok(entries) = fs::read_dir(&dir) else { continue };
        for entry in entries.flatten() {
            if entry.path().extension().is_some_and(|e| e == "c") {
                build.file(entry.path());
            }
        }
    }
    build.compile("deflate_gzlocal");
    println!("cargo:rerun-if-changed=vendor");
    println!("cargo:rerun-if-env-changed=GZLOCAL_FRAME_POINTERS");
    println!("cargo:rustc-env=GZLOCAL_VARIANT={variant}");
    println!("cargo:rustc-check-cfg=cfg(gzlocal_session)");
    if variant == "patched" {
        println!("cargo:rustc-cfg=gzlocal_session");
    }
}
