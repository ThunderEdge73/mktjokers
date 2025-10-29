SMODS.current_mod.description_loc_vars = function(self)
    return {
        text_colour = G.C.WHITE,
        background_colour = HEX("00000000"),
        scale = 1.1
    }
end

SMODS.Atlas {
    key = "milky_credits",
    px = 1656,
    py = 647,
    path = "logo_credit.png"
}


SMODS.current_mod.custom_ui = function(mod_nodes)
    G.mktjk_credit_sprite = Sprite(
        0,
        0,
        5.5,
        5.5 * G.ASSET_ATLAS["mktjk_milky_credits"].py / G.ASSET_ATLAS["mktjk_milky_credits"].px,
        G.ASSET_ATLAS["mktjk_milky_credits"],
        {x = 0, y = 0}
    )
    G.mktjk_credit_sprite:define_draw_steps({ {
        shader = 'dissolve',
    } })
    G.mktjk_credit_sprite.tilt_var = { mx = 0, my = 0, dx = 0, dy = 0, amt = 0 }
    G.mktjk_credit_sprite.states.collide.can = true
    function G.mktjk_credit_sprite:hover()
        G.mktjk_credit_sprite:juice_up(0.1,0.1)
        Node.hover(self)
    end
    function G.mktjk_credit_sprite:stop_hover()
        Node.stop_hover(self)
    end
    table.insert(mod_nodes, 2, {
        n = G.UIT.R,
        config = {align = "cm"},
        nodes = {
            {
                n = G.UIT.C,
                config = {align = "cm"},
                nodes = {
                    {
                        n = G.UIT.O,
                        config = {
                            object = G.mktjk_credit_sprite
                        }
                    }
                }
            }
        }
    })
    table.insert(mod_nodes, {
        n = G.UIT.R,
        config = {align = "cm"},
        nodes = {
            {
                n = G.UIT.C,
                config = {align = "cm"},
                nodes = {
                    UIBox_button({
                        button = "mktjk_website",
                        label = {localize("b_mktjk_website")},
                        minw = 6
                    })
                }
            }
        }
    })
end

local XmainMenuHook = Game.main_menu
function Game:main_menu(ctx)
    local r = XmainMenuHook(self,ctx)
    if self.title_top then
        local tg = self.title_top
        local card = Card(tg.T.x,tg.T.y,G.CARD_W,G.CARD_H,nil,G.P_CENTERS['j_mktjk_milky'])
        card.bypass_discovery_center = true
        card.T.w = card.T.w * 1.35
        card.T.h = card.T.h * 1.35
        
        G.title_top.T.w = G.title_top.T.w + 1.35
        G.title_top.T.x = G.title_top.T.x - 0.7
        card:set_sprites(card.config.center)
        card.no_ui = true
        card.states.visible = false
        self.title_top:emplace(card)
        self.title_top:align_cards()
        G.E_MANAGER:add_event(
            Event{
                delay = 0.5,
                func = function ()
                    if ctx == "splash" then
                        card.states.visible = true
                        card:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 0.5)
                    else
                        card.states.visible = true
                        card:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 0.2)
                    end
                    return true
                end
            }
        )
    end

    return r
end

function G.FUNCS.mktjk_website()
    love.system.openURL("https://milkyway.moe")
end

-- Credits Tab - Derived from Joyous Spring credits tab
SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = localize('b_mktjk_credits'),
            tab_definition_function = function()
                local modNodes = {}
                modNodes[#modNodes + 1] = {}
                local loc_vars = { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.4 }
                localize { type = 'descriptions', key = 'mktjk_credits', set = 'Other', nodes = modNodes[#modNodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow }
                modNodes[#modNodes] = desc_from_rows(modNodes[#modNodes])
                modNodes[#modNodes].config.colour = loc_vars.background_colour or modNodes[#modNodes].config.colour

                return {
                    n = G.UIT.ROOT,
                    config = {
                        emboss = 0.05,
                        minh = 6,
                        r = 0.1,
                        minw = 6,
                        align = "tm",
                        padding = 0.2,
                        colour = G.C.BLACK
                    },
                    nodes = modNodes
                }
            end
        }
    }
end
mktjk.config = SMODS.current_mod.config
SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.05,
            r = 0.1,
            padding = 0.1,
            colour = G.C.BLACK
        },
        nodes = {
            {
                n = G.UIT.C,
                config = {
                    align = "cm"
                },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { align = "cr" },
                        nodes = {
                            create_toggle({
                                label = "Disable Main Menu Logo",
                                ref_table = mktjk.config,
                                ref_value = "menu_logo",
                            })
                        }
                    }
                }
            }
        }
    }
end