-- nvim-web-devicons

require "nvim-web-devicons".setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
        COPYING = {
            icon = "©", --  ©
            color = "#cbcb41",
            cterm_color = "185",
            name = "License",
        },
        ["COPYING.LESSER"] = {
            icon = "©",
            color = "#cbcb41",
            cterm_color = "185",
            name = "License",
        },
        license = {
            icon = "©",
            color = "#cbcb41",
            cterm_color = "185",
            name = "License",
        },
        LICENSE = {
            icon = "©",
            color = "#cbcb41",
            cterm_color = "185",
            name = "License",
        },
    };
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true;
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
}


--  license
--  COPYING
--  COPYING.LESSER
--  LICENSE
