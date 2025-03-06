#!/bin/bash
#
# See README.md for more details about the input format.

delim="$(printf '\t')"

remove_empty_lines () {
	sed '/^$/d'
}

~/.config/charpicker/effective_special_character_list.sh | remove_empty_lines | column -t -s "$delim" > ~/.config/charpicker/special_character_list.rofi
~/.config/charpicker/effective_special_character_list.sh | remove_empty_lines | cut -d "$delim" -f 2 > ~/.config/charpicker/special_character_list.symbols
sha1sum < ~/.config/charpicker/effective_special_character_list.sh > .compiled-sha1
