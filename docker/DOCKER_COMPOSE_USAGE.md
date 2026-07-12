# Docker Compose in NixOS

This repository now includes both traditional Docker Compose and the Nix-native Arion approach.

## Method 1: Traditional Docker Compose

Use the `docker-compose.yml` file:

```bash
# Run the compose file
docker-compose up

# Run in detached mode
docker-compose up -d

# View logs
docker-compose logs

# Stop and remove containers
docker-compose down
```

## Method 2: Arion (Nix-native)

Use the `arion-compose.nix` file for a more Nix-integrated approach:

```bash
# Run with arion
arion up

# Run in detached mode
arion up -d

# View logs
arion logs

# Stop and remove containers
arion down
```

## After Rebuilding

Once you run `nh os switch` or `sudo nixos-rebuild switch --flake .`, you'll have:
- `docker-compose` command available
- `arion` command available

Both files define the same hello-world container for demonstration.

## Advantages of Arion

- Type-checked configuration using Nix
- Better integration with NixOS modules
- Can reference Nix packages directly
- Declarative and reproducible
- Can build custom Docker images from Nix derivations
