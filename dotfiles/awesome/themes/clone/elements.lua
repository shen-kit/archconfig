local gmc                   = require("themes.gmc")

local theme_assets          = require("beautiful.theme_assets")
local xresources            = require("beautiful.xresources")
local dpi                   = xresources.apply_dpi

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

Theme.font                  = "Arimo Nerd Font 9"
Theme.taglist_font          = "FiraCode Nerd Font Mono"

Theme.bg_normal             = "#222222"
Theme.bg_focus              = "#4a4a4a"
Theme.bg_minimize           = "#222222"
Theme.bg_urgent             = "#ff0000"

Theme.fg_normal             = "#eeeeee"
Theme.fg_focus              = "#ffffff"
Theme.fg_urgent             = "#ffffff"

-- Theme.tasklist_disable_icon = true
-- Theme.tasklist_fg_normal    = "#aaaaaa"
-- Theme.tasklist_bg_focus     = Theme.bg_normal

Theme.useless_gap           = dpi(2)
Theme.border_width          = dpi(1)

Theme.border_normal         = gmc.color['grey800']
Theme.border_focus          = gmc.color['blue800'] .. "cc"
Theme.border_marked         = gmc.color['orange500'] .. "cc"

-- Generate taglist squares:
local taglist_square_size   = dpi(4)
Theme.taglist_squares_sel   = theme_assets.taglist_squares_sel(
  taglist_square_size, gmc.color['black']
)
Theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
  taglist_square_size, gmc.color['white']
)

-- Display the taglist squares
Theme.taglist_squares_sel   = Theme_path .. "taglist/square_sel.png"
Theme.taglist_squares_unsel = Theme_path .. "taglist/square_unsel.png"
