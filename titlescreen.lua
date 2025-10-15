local main_menu_hook = Game.main_menu
function Game.main_menu(change_context)
    local ret = main_menu_hook(change_context)
    G.SPLASH_MKTJK_LOGO = Sprite(
        0, 0,
        6.00000000000000069,
        6.00000000000000069 * G.ASSET_ATLAS["mktjk_milkybanner"].py / G.ASSET_ATLAS["mktjk_milkybanner"].px,
        G.ASSET_ATLAS["mktjk_milkybanner"],
        { x = 0, y = 0 }
    )
    G.SPLASH_MKTJK_LOGO:set_alignment({
        major = G.title_top,
        type = "cm",
        bond = "Strong",
        offset = { x = 0, y = -3.5 }
    })
    G.SPLASH_MKTJK_LOGO.tilt_var = { mx = 0, my = 0, dx = 0, dy = 0, amt = 0 }
    G.SPLASH_MKTJK_LOGO.states.collide.can = true
    function G.SPLASH_MKTJK_LOGO:click()
        play_sound('button', 1, 0.3)
        G.FUNCS['openModUI_milkysbullshit']()
    end
    function G.SPLASH_MKTJK_LOGO:hover()
        G.SPLASH_MKTJK_LOGO:juice_up(0.05,0.05)
        Node.hover(self)
    end
    function G.SPLASH_MKTJK_LOGO:stop_hover()
        Node.stop_hover(self)
    end
    return ret
end

SMODS.Atlas {
    key = "milkybanner",
    px = 197, -- replace with dimensions of the thing u want to use
    py = 38,
    path = "MILKY.png"
}