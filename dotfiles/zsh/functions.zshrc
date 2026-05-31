# ========== HELPERS ==========

# Prepend a directory to PATH if it is not already present.
function path_prepend_once() {
    local dir="$1"

    [[ -n "$dir" ]] || return
    (( ${path[(Ie)$dir]} )) || path=("$dir" $path)
}
