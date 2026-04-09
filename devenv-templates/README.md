# Templates for quickly initializing devenv

Copy all files in this directory to your project folder.

Call `devenv init`, and say [n]o to replacing the existing `devenv.nix`.

## Language-specific notes

### Rust

Copy `rust-toolchain.toml` from the template directory to the project folder.

Replace any toolchain options in the TOML file, *not* the Nix flake.

NOTE: You may need to activate `rust-overlay` the first time:

```bash
devenv inputs add rust-overlay github:oxalica/rust-overlay --follows nixpkgs
```

This should already exist in `devenv.yaml`, but if it does not, use the above command.
