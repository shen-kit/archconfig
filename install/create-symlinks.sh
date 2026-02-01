#!/bin/sh
# create-symlinks.sh

SRC="$(realpath "../bashscripts")"
TARGET="$REAL_HOME/.bashscripts"
ln -sf "$SRC" "$TARGET"

log "Creating symlinks for home files"
DEST="$REAL_HOME"
for item in ../home/.*; do
    SRC="$(realpath "$item")"
    TARGET="$DEST/$(basename "$item")"
    ln -sf "$SRC" "$TARGET"
    chown -h "$REAL_USER:$REAL_USER" "$TARGET"
    log "Created symlink: $TARGET -> $SRC"
done

log "Creating symlinks for .config files"
DEST="$REAL_HOME/.config"
mkdir -p "$DEST"
for item in ../dotfiles/*; do
    SRC="$(realpath "$item")"
    TARGET="$DEST/$(basename "$item")"
    ln -s "$SRC" "$TARGET"
    chown -h "$REAL_USER:$REAL_USER" "$TARGET"
    log "Created symlink: $TARGET -> $SRC"
done
