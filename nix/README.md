# Setting Up Nix Configuration

> This is probably the most in-progress section of my dotfiles. Expect things to break until a more solid solution is available.

For these configurations to work you must first install [Nix](https://nixos.org/download/) in your system. 

## Setup Nix-darwin

Nix.sh is a script that copies /nix and /nix-darwin into ~/.config
```
$ ./nix.sh
Usage: nix.sh [options]

   copy             Copies /nix and /nix-darwin to ~/.config

```

### Installing Nix-Darwin
```
nix run nix-darwin -- switch --flake ~/.config/nix-darwin
```
For more information about [nix-darwin](https://github.com/LnL7/nix-darwin) read their getting started section.


