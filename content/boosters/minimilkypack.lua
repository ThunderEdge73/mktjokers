SMODS.Booster {
    key = 'mini_milky_pack',
    loc_txt = {
        name = "Mini MiLKY Pack",
        text = {
            "Choose 1 of 3 MiLKY's Jokers"
        },
    },
    config = { extra = 3, choose = 1 },
    atlas = "boosters",
    cost = 4,
    pos = { x = 0, y = 0 },
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
            key_append = "mktjk_milky_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}
