# ❄️🐟 Nix.fish

[Fish](https://fishshell.com/) port of [`~/.nix-profile/etc/profile.d/nix.sh`](https://github.com/NixOS/nix/blob/master/scripts/nix-profile.sh.in) which sets up [Nix](https://nixos.org/) environment.

## Installation

- [plug.fish](https://github.com/kidonng/plug.fish)

  ```sh
  plug install kidonng/nix.fish
  ```

- [Fisher](https://github.com/jorgebucaran/fisher)

  ```sh
  fisher install kidonng/nix.fish
  ```

## Difference from [nix-env.fish](https://github.com/lilyball/nix-env.fish)

- **Works with [`nix shell`](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-shell.html) / [`nix-shell`](https://nixos.org/manual/nix/stable/command-ref/nix-shell.html)**

  Nix.fish checks `$PATH` for `/nix/store/*` and respects [`$fish_user_paths`](https://fishshell.com/docs/current/cmds/fish_add_path.html?highlight=fish_user_paths) thus:

  - `$PATH` is always set up correctly
  - `conf.d`, function and completion scripts are loaded on the fly.

- **Faster shell startup**

  Nix.fish is pure fish, while nix-env.fish starts Bash to capture environment variables and hence slower.

- Doesn't replicate [`__fish_build_paths.fish`](https://github.com/NixOS/nixpkgs/blob/09c38c29f2c719cd76ca17a596c2fdac9e186ceb/pkgs/shells/fish/default.nix#L76-L117)

  `__fish_build_paths.fish` handles vendored fish scripts from Nixpkgs. It's error-prone to replicate its logic when it is present.

  For other fish packages, consider using nix-env.fish instead.
