{
  description = "Alesh nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew}:
    let
      configuration = { pkgs, config, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages = [ 
          pkgs.aerospace
          pkgs.alacritty
          pkgs.arc-browser
          pkgs.git
          pkgs.fzf
          pkgs.lsd
          pkgs.mkalias
          pkgs.neovim
          pkgs.raycast
          pkgs.ripgrep
          pkgs.rustup
          pkgs.zoxide
        ];

        homebrew = {
          enable = true;
          brews = [
            "mas"
          ];
          casks = [
            "betterdisplay"
            "bitwarden"
            "discord"
            "font-hack-nerd-font"
            "obs"
          ];
          taps = [];
          masApps = {
            "Klack" = 6446206067;
          };
          onActivation.cleanup = "zap";
        };

        # APFS aliases
        system.activationScripts.applications.text = let
          env = pkgs.buildEnv {
            name = "system-applications";
            paths = config.environment.systemPackages;
            pathsToLink = "/Applications";
          };
        in
          pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
            done
          '';

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;

        # Whether to configure zsh as an interactive shell.
        programs.zsh.enable = true;

        /*
        *  macOS resets this file when doing a system update.
        *  As such, sudo authentication with Touch ID won’t work 
        *  after a system update until the nix-darwin 
        *  configuration is reapplied.
        */
        # Enable sudo authentication with Touch ID.
        security.pam.enableSudoTouchIdAuth = true;

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Enable alternative shell support in nix-darwin.
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in
      {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Andress-MacBook-Pro
      darwinConfigurations."Andress-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        modules = [ 
          configuration 
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "alesh";
            };
          }
        ];
      };
    };
}
