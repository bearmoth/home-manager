# Home Manager

## Installing Home Manager

When first running the configuration, home-manager is not installed. Ironically, home-manager installs home-manager. To get around this, we can use the `nix run` command to run the configuration with the `home-manager` package.

```bash
nix run .#homeConfigurations.<USER>.activationPackage
```
