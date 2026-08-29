# Contexte de developpement

Ce projet sert a deployer rapidement une distrobox Arch Linux orientee gaming via une TUI bash.

## Objectif

Fournir un assistant interactif simple qui guide l'utilisateur dans la creation et la preparation d'une box Arch Linux prete pour les usages gaming.

## Points d'interet

### Choisir NVIDIA si besoin

- Detecter ou demander si l'utilisateur utilise un GPU NVIDIA.
- Prevoir une option claire dans la TUI pour activer la configuration NVIDIA.
- Adapter les paquets et etapes d'installation selon ce choix.

### Creer la box

- Demander ou definir le nom de la distrobox.
- Utiliser une image Arch Linux adaptee.
- Creer la box avec les options necessaires pour un usage desktop/gaming.
- Prevoir les controles d'erreur si la box existe deja ou si `distrobox` est absent.

### Installer base-devel et modifier makepkg.conf

- Installer `base-devel` dans la box.
- Modifier `/etc/makepkg.conf` pour optimiser la compilation.
- Points a evaluer :
  - `MAKEFLAGS` selon le nombre de coeurs disponibles.
  - Compression des paquets.
  - Options compatibles avec une configuration generique et fiable.

### Installer yay-bin

- Installer un helper AUR via `yay-bin`.
- Gerer les prerequis Git et compilation.
- Eviter de lancer les operations AUR en root.
- Verifier que `yay` est disponible apres installation.

### Installer les applications gaming necessaires

- Identifier la liste minimale d'applications gaming.
- Prevoir des groupes ou profils d'installation si besoin.
- Exemples de categories :
  - Lanceurs et stores.
  - Outils Wine/Proton.
  - Outils de performance et monitoring.
  - Utilitaires audio, manettes et compatibilite.

## Notes de conception

- La TUI doit rester rapide, lisible et robuste.
- Les etapes doivent etre relancables autant que possible.
- Chaque action importante doit afficher un resume avant execution.
- Les erreurs doivent proposer une sortie propre et indiquer l'etape concernee.
