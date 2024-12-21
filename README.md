# Syrma-Nvim

A flake of my personalized Nvim config using Birdee's [nixCats](https://github.com/BirdeeHub/nixCats-nvim) for package management.

You're free to fork, copy-paste, or do whatever you want with it. However, I'd strongly advise checking out the aforementioned repo instead. My config is a mess, I don't have time to clean it up at the moment, and quite frankly, I also have no clue what I'm doing. :)

## Flake setup

```nix
# flake.nix
inputs = {
  syrma-nvim.url = "github:paru-de/syrma-nvim";
}
```

```nix
# configuration.nix
environment.systemPackages = with pkgs; [
  ...
  inputs.syrma-nvim.packages.${system}.syrma-nvim
];

environment.variables.EDITOR = "syrma-nvim";
```


