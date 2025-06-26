#!/bin/sh
export PKG_PATH="https://mirror.bytemark.co.uk/pub/OpenBSD/$(uname -r)/packages/$(uname -m)/"

safe_pkg_add() {
  for pkg in "$@"; do
    echo "Installing $pkg..."
    pkg_add -v "$pkg" || echo "⚠️ Skipped $pkg"
  done
}

safe_pkg_add sudo doas mate lxde gnome firefox vlc libreoffice gimp curl wget git neofetch htop xarchiver qbittorrent

echo 'exec mate-session' > /home/gameuser/.xsession
chown gameuser:gameuser /home/gameuser/.xsession

echo "✅ Post-install done: DEs, tools, and user setup complete."
