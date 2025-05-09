# wezterm
if ! [[ "$PATH" =~ "/usr/bin/wezterm-gui:" ]]
then
  PATH="/usr/bin/wezterm-gui:$PATH"
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
if ! [[ "$PATH" =~ "/usr/local/go/bin:$HOME/dev/.go/bin:" ]]
then
  PATH="/usr/local/go/bin:$HOME/dev/.go/bin:$PATH"
fi

# ruby gems
if ! [[ "$PATH" =~ "$GEM_HOME/bin" ]]
then
  PATH="$GEM_HOME/bin:$PATH"
fi

# cargo binaries
if ! [[ "$PATH" =~ "/home/shenkit/.cargo/bin" ]]
then
  PATH="/home/shenkit/.cargo/bin:$PATH"
fi

export PATH
