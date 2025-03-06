# overwrite Ctrl+s (from XON/XOFF) to allow it to be used for reverse search (Ctrl+R opposite)
stty -ixon

# override Ctrl+w to use different delimeters (include "/" instead of only whitespace)
stty werase undef
bind '"\C-w":unix-filename-rubout'

