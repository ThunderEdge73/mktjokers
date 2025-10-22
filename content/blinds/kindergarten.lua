SMODS.Blind {
    key = "kindergarten",
    atlas = "blinds",
    pos = { x = 0, y = 1 },
    boss = {min = 1},
    boss_colour = HEX("8AF8FF")
}

-- hook mult's calc_effect to redirect XMult to +Mult
local mult_calc_ref = SMODS.Scoring_Parameters.mult.calc_effect
SMODS.Scoring_Parameters.mult.calc_effect = function(self, effect, scored_card, key, amount, from_edition)
    if G.GAME.blind.config.blind.key == "bl_mktjk_kindergarten" then
        if (key == "x_mult" or key == "xmult" or key == "Xmult") then
            return mult_calc_ref(self, effect, scored_card, "mult", amount, from_edition)
        elseif (key == "x_mult_mod" or key == "Xmult_mod") then
            return mult_calc_ref(self, effect, scored_card, "mult_mod", amount, from_edition)
        end
    end
    return mult_calc_ref(self, effect, scored_card, key, amount, from_edition)
end
