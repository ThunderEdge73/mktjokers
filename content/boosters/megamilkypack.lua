SMODS.Booster {
    key = 'mega_milky_pack',
    loc_txt = {
        name = "Mega MiLKY Pack",
        text = {
            "Choose 2 of 6 MiLKY's Jokers"
        },
    },
    config = { extra = 6, choose = 2 },
    atlas = "boosters",
    cost = 8,
    pos = { x = 1, y = 0 },
    group_key = "milkysboosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "milkys_jokers",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "mktjk_mega_milky_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}
