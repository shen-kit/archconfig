#!/bin/sh
# install-packages.sh

install_pacman_pkg() {
  local pkg=$1
  if pacman -Qi "$pkg" &>/dev/null; then
    log "$pkg is already installed"
  else
    if sudo pacman -S --noconfirm --needed "$pkg"; then
      log "$pkg installed successfully"
    else
      warn "$pkg failed to install"
    fi
  fi
}

install_aur_pkg() {
  local pkg=$1
  if paru -Qi "$pkg" &>/dev/null; then
    log "$pkg is already installed (AUR)"
  else
    if paru -S --noconfirm --needed "$pkg"; then
      log "$pkg installed successfully (AUR)"
    else
      warn "$pkg failed to install (AUR)"
    fi
  fi
}

PACMAN_PKGS=(
  # core system & services
  blueman
  cronie
  inetutils
  keyd
  man-db
  networkmanager
  pass
  power-profiles-daemon
  rclone
  sddm
  keychain

  # niri / desktop
  niri
  xwayland-satellite
  xdg-desktop-portal-gnome
  xdg-desktop-portal-gtk
  wl-clipboard
  fuzzel
  brightnessctl
  wlsunset

  # file managers & viewers
  thunar
  zathura
  zathura-pdf-mupdf

  # terminals & shells
  wezterm
  zsh
  starship

  # CLI utils
  bat
  eza
  fd
  fzf
  less
  ripgrep
  tldr
  trash-cli
  zoxide
  htop
  unzip
  bluetui
  playerctl

  # dev – core
  git
  vim
  neovim
  docker
  nodejs
  python

  # dev – extra
  lazygit
  tree-sitter-cli
  ruff
  stylua
  lua-language-server
  typescript-language-server

  # fonts
  noto-fonts-emoji
  ttf-fira-code
  otf-monaspace

  # misc
  rclone
  blender
  obs-studio
  discord
)

AUR_PKGS=(
  # niri-required
  dms-shell-bin
  matugen
  qt6-multimedia-ffmpeg

  # GUI apps
  brave-bin
  slack-desktop
  spotify
  obsidian

  # TUI apps
  yazi
  cava

  # dev
  basedpyright
  docker-language-server
  jdtls
  prettierd
)

#========================#
# Installation
#========================#

# Needed for AUR
log "Installing base-devel..." 
sudo pacman -S --noconfirm --needed base-devel

# Install paru if not installed
if ! command -v paru &>/dev/null; then
  log "Installing paru (AUR helper)..."
  cd /tmp
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
  cd "$HOME"
fi

# Install pacman packages
log "Installing pacman packages..."
for pkg in "${PACMAN_PKGS[@]}"; do
  install_pacman_pkg "$pkg"
done

# Install AUR packages
log "Installing AUR packages..."
for pkg in "${AUR_PKGS[@]}"; do
  install_aur_pkg "$pkg"
done

# Final system cleanup
log "Cleaning up..."
orphans=$(pacman -Qtdq || true)
if [[ -n "$orphans" ]]; then
  sudo pacman -Rns --noconfirm $orphans
  log "Removed orphans"
else
  log "No orphaned packages found."
fi

log "Installation complete!"
