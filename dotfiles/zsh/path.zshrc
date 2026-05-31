# ========== PATH ==========

# user bin
path_prepend_once "$HOME/bin"
path_prepend_once "$HOME/.local/bin"

# custom bash scripts
path_prepend_once "$HOME/.bashscripts"

# npm
path_prepend_once "$HOME/.local/share/npm/bin"

# go
path_prepend_once "$HOME/dev/.go/bin"
path_prepend_once /usr/local/go/bin

# cargo binaries
path_prepend_once /home/shenkit/.cargo/bin

export PATH
