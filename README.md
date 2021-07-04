# ❄️🐟 Nix.fish

Fish port of [`~/.nix-profile/etc/profile.d/nix.sh`](https://github.com/NixOS/nix/blob/master/scripts/nix-profile.sh.in) which sets up [Nix](https://nixos.org/) environment.

## Installation

- [plug.fish](https://github.com/kidonng/plug.fish)

  ```sh
  plug install kidonng/nix.fish
  ```

- [Fisher](https://github.com/jorgebucaran/fisher)

  ```sh
  fisher install kidonng/nix.fish
  ```

## Comparison with [nix-env.fish](https://github.com/lilyball/nix-env.fish)

- **Faster startup.** `Nix.fish` is pure fish while `nix-env.fish` starts a Bash shell to capture environment variables and hence slower.
- **Works with [`nix run`](https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-run.html) and [`nix-shell`](https://nixos.org/manual/nix/unstable/command-ref/nix-shell.html).** `Nix.fish` checks for `/nix/store/*` in `$PATH` so additional functions and completions are available on the fly.
- Supports [single-user mode](https://nixos.org/manual/nix/unstable/installation/single-user.html) only. It's the most prominent installation method so `Nix.fish` doesn't include a port of `/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh` (multi-user daemon script). **For multi-user mode support consider `nix-env.fish` instead.**
- Doesn't replicate [`$__fish_data_dir/__fish_build_paths.fish`](https://github.com/NixOS/nixpkgs/blob/09c38c29f2c719cd76ca17a596c2fdac9e186ceb/pkgs/shells/fish/default.nix#L76-L117). It handles vendored `conf.d`, function and completion scripts and is included in [Nixpkgs version of fish](https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/shells/fish/default.nix). It's error-prone to replicate its logic when it is present. **If fish isn't installed from Nixpkgs, consider `nix-env.fish` instead.**
