SMODS.Tag {
    key = "dithered",
    min_ante = 3,

    loc_txt = {
        ['name'] = 'Dithered Tag',
        ['text'] = {
            'Next base edition shop',
            'Joker is free and',
            'becomes {C:edition}Dithered{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'tags',
    pos = {
        x = 0,
        y = 0
    },
    
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS["e_mktjk_dithered"]
    end,

    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_mktjk_dithered", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end
}