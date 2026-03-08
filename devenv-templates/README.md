# Templates for quickly initializing devenv

Start by calling `devenv init` in the project folder.

Replace the auto-generated `devenv.nix` with the template from this folder.

## Language-specific notes

### Rust

Copy `rust-toolchain.toml` from the template directory to the project folder.

Replace any toolchain options in the TOML file, *not* the Nix flake.

NOTE: You may need to activate `rust-overlay` the first time:

```bash
devenv inputs add rust-overlay github:oxalica/rust-overlay --follows nixpkgs
```
