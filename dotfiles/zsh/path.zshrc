# wezterm
if ! [[ "$PATH" =~ "/usr/bin/wezterm-gui:" ]]
then
  export PATH="/usr/bin/wezterm-gui:$PATH"
fi

# user bin
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# custom bash scripts
if ! [[ "$PATH" =~ "$HOME/.bashscripts:" ]]
then
    PATH="$HOME/.bashscripts:$PATH"
fi

# go
if ! [[ "$PATH" =~ "/usr/local/go/bin:$HOME/compsci/go/bin:" ]]
then
    PATH="/usr/local/go/bin:$HOME/compsci/go/bin:$PATH"
fi

export PATH
