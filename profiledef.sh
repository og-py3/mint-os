#!/usr/bin/env bash
# =============================================================================
# Mint OS — profiledef.sh  |  archiso profile definition
# =============================================================================

iso_name="mintos"
iso_label="MINTOS_$(date +%Y%m)"
iso_publisher="Mint OS <https://github.com/mintos>"
iso_application="Mint OS — Rolling Linux | KDE Plasma | Security"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=(
    'bios.syslinux.mbr'
    'bios.syslinux.eltorito'
    'uefi-x64.systemd-boot.esp'
    'uefi-x64.systemd-boot.eltorito'
)
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '19' '-b' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')

file_permissions=(
  # System security files
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/etc/sudoers.d/mintos"]="0:0:440"

  # Mint OS CLI tools — Tier 1: Core
  ["/usr/local/bin/mint-installer"]="0:0:755"
  ["/usr/local/bin/mint-firstboot"]="0:0:755"
  ["/usr/local/bin/mint-tools-setup"]="0:0:755"
  ["/usr/local/bin/mint-update"]="0:0:755"
  ["/usr/local/bin/mint-hardware"]="0:0:755"
  ["/usr/local/bin/mint-privacy"]="0:0:755"
  ["/usr/local/bin/mint-health"]="0:0:755"
  ["/usr/local/bin/mint-snapshot"]="0:0:755"
  ["/usr/local/bin/mint-gaming"]="0:0:755"
  ["/usr/local/bin/mint-setup-aur"]="0:0:755"
  ["/usr/local/bin/mint-fetch"]="0:0:755"
  ["/usr/local/bin/mint-clean"]="0:0:755"
  ["/usr/local/bin/mint-doctor"]="0:0:755"
  ["/usr/local/bin/mint-backup"]="0:0:755"
  ["/usr/local/bin/mint-optimizer"]="0:0:755"
  ["/usr/local/bin/mint-driver-manager"]="0:0:755"
  ["/usr/local/bin/mint-welcome"]="0:0:755"
  ["/usr/local/bin/mint-zram-init"]="0:0:755"

  # Mint OS CLI tools — Tier 2: Intelligence & Futuristic features
  ["/usr/local/bin/mint-ai"]="0:0:755"
  ["/usr/local/bin/mint-dash"]="0:0:755"
  ["/usr/local/bin/mint-gaming-mode"]="0:0:755"
  ["/usr/local/bin/mint-adaptive"]="0:0:755"
  ["/usr/local/bin/mint-privacy-center"]="0:0:755"
  ["/usr/local/bin/mint-rollback"]="0:0:755"
  ["/usr/local/bin/mint-nexus"]="0:0:755"

  # Branding assets
  ["/usr/share/pixmaps/mintos-logo.png"]="0:0:644"
  ["/usr/share/mint-os/logo.png"]="0:0:644"

  # Plymouth theme
  ["/usr/share/mint-os/plymouth-theme/mintos.script"]="0:0:644"
  ["/usr/share/mint-os/plymouth-theme/mintos.plymouth"]="0:0:644"
)
