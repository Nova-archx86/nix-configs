

# NixOS Config

My absolute mess of a nixos config :3


## Installation

At the time of writting this, my journey into NixOS and the Nix enviorment is still fairly new, so it is likely
this flake will be unstable and quite a mess and will probably change&#x2026; ****A LOT****. With that said the only
command ideally neaded to be run would be:

(This command assumes that your hardware-configuration.nix is located in /etc/nixos and as such I recommend setting up the bootloader there rather than in configuration.nix)

    # For my desktop enviorment (more hosts can be located in the hosts dir, for now its just the two.)
    sudo nixos-rebuild switch --impure --flake .#dt-polonium
    
    # For my laptop/mobile enviorment:
    sudo nixos-rebuild switch --impure --flake .#lt-caesium

While in the directory of the repo inside of an existing NixOS install.

