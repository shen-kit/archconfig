#!/bin/sh
# create-symlinks.sh

SRC="$(realpath "../bashscripts")"
TARGET="$HOME/.bashscripts"
if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
  rm "$TARGET"
  log "Deleted $TARGET"
fi
ln -s "$SRC" "$TARGET"

log "Creating symlinks for home files"
DEST="$HOME"
for item in ../home/.*; do
    SRC="$(realpath "$item")"
    TARGET="$DEST/$(basename "$item")"
    if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
        rm "$TARGET"
        log "Deleted $TARGET"
    fi
    ln -s "$SRC" "$TARGET"
    log "Created symlink: $TARGET -> $SRC"
done

log "Creating symlinks for .config files"
DEST="$HOME/.config"
mkdir -p "$DEST"
for item in ../dotfiles/*; do
    SRC="$(realpath "$item")"
    TARGET="$DEST/$(basename "$item")"
    if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
        rm -rf "$TARGET"
        warn "Deleted $TARGET"
    fi
    ln -s "$SRC" "$TARGET"
    log "Created symlink: $TARGET -> $SRC"
done
