# dbx-arch-gaming

Script bash interactif pour deployer rapidement une distrobox Arch Linux orientee gaming.

Le projet fournit une TUI simple autour de `distrobox` pour creer une box Arch, l'isoler avec un home dedie, configurer Pacman, installer `yay-bin`, installer les paquets gaming, puis exporter les applications vers l'hote.

## Prerequis

- `bash`
- `distrobox`
- `podman`
- un utilisateur non-root

Le script refuse d'etre lance en root. Les commandes privilegiees sont executees avec `sudo` uniquement a l'interieur de la box.

## Lancement

```bash
./dbx-gaming-deploy
```

Mode debug / dry-run :

```bash
./dbx-gaming-deploy --debug
```

ou :

```bash
./dbx-gaming-deploy --dry-run
```

Le mode debug affiche les commandes prevues sans les executer.

## Configuration

Variables supportees :

```bash
BOX_NAME=arch-gaming
IMAGE=docker.io/library/archlinux:latest
GPU_VENDOR=nvidia
BOX_HOME="$HOME/.distrobox/arch-gaming"
```

Exemple :

```bash
GPU_VENDOR=amd BOX_NAME=arch-gaming ./dbx-gaming-deploy
```

Valeurs possibles pour `GPU_VENDOR` :

- `nvidia`
- `amd`
- `intel`
- `none`

Si `BOX_HOME` n'est pas defini, le script utilise :

```bash
$HOME/.distrobox/$BOX_NAME
```

## Etapes

Le menu propose :

1. Configurer
2. Creer la box
3. Modifier `pacman.conf`
4. Installer `base-devel`
5. Modifier `makepkg.conf`
6. Installer Vulkan GPU
7. Installer `yay-bin`
8. Installer les apps gaming
9. Exporter les apps gaming
10. Deploiement complet

## Configuration systeme dans la box

`pacman.conf` :

- active `Color`
- active le depot `[multilib]`
- rafraichit les depots avec `pacman -Sy`

`makepkg.conf` :

- configure `MAKEFLAGS="-j$(nproc)"`
- remplace `debug` par `!debug` dans `OPTIONS`

## Vulkan

Le script installe les paquets Vulkan selon le GPU choisi.

NVIDIA :

- `vulkan-icd-loader`
- `lib32-vulkan-icd-loader`
- `vulkan-tools`
- `nvidia-utils`
- `lib32-nvidia-utils`

AMD :

- `mesa`
- `lib32-mesa`
- `vulkan-radeon`
- `lib32-vulkan-radeon`
- `vulkan-mesa-layers`
- `lib32-vulkan-mesa-layers`

Intel :

- `mesa`
- `lib32-mesa`
- `vulkan-intel`
- `lib32-vulkan-intel`
- `vulkan-mesa-layers`
- `lib32-vulkan-mesa-layers`

## Applications gaming

Les applications gaming sont installees via `yay` en mode automatique :

```bash
yay -S --needed --noconfirm --answerdiff None --answerclean None ...
```

Liste actuelle :

- `steam`
- `lutris`
- `heroic-games-launcher-bin`
- `protonplus`
- `gamemode`
- `lib32-gamemode`
- `mangohud`
- `lib32-mangohud`
- `goverlay`

## Exports

Les applications suivantes sont exportees vers l'hote avec `distrobox-export --app` :

- `steam`
- `lutris`
- `heroic`
- `protonplus`
- `goverlay`
