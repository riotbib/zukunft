# zukunft

Survey tool for aquiring information about the wanted further development of Hackspace Marburg

## Depedency

`bottlepy`, and NixOS, kinda.

## Installation

### NixOS Module

On a NixOS system one can configure zukunft as a module.

```nix
{ config, pkgs, ... }:
{
  imports = [ /path/to/zukunft/repo/ ];

  services = {
    zukunft = {
      enable = true;
      path = "/var/lib/zukunft";
      token = "OrdnungInsChaos";
  };
}
```
