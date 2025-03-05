-- {{{ Global Variable Definitions
-- moved here in module as local variable
-- }}}

local _M = {
  terminal        = "wezterm start --always-new-process",
  browserPersonal = "brave --profile-directory='Default'",
  browserUni      = "brave --profile-directory='Profile 1'",
  browserWork     = "brave --profile-directory='Profile 2'",
  fileExplorer    = "thunar",

  modkey          = "Mod4",
  altkey          = "Mod1",
}

return _M
