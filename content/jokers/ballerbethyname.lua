SMODS.Joker{ --Baller Be Thy Name
    key = "ballerbethyname",
    config = {
        extra = {
            jackCount = 0,
            queenCount = 0,
            kingCount = 0,
            Xmult = math.pi
        }
    },
    loc_txt = {
        ['name'] = 'Baller Be Thy Name',
        ['text'] = {
            [1] = 'If played hand contains a',
            [2] = '{C:attention}3 of a Kind{} with only {C:attention}Face Cards{},',
            [3] = 'give {X:red,C:white,f:4}Xπ{} Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    soul_pos = {x = 3, y = 6, draw=function (card, scale_mod, rotate_mod)
        if card.children.floating_sprite then
            card.children.floating_sprite.T.w = 1.4
            rotate_mod = 0
            local sc = 0
            local xm = -0.25
            local ym = 0
            card.children.floating_sprite:draw_shader('dissolve', nil, nil,nil,card.children.center,sc, rotate_mod,xm,ym,nil, 0.6)
        end
    end},
    pronouns = 'they_them',
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pools = { 
        ["milkys_jokers"] = true 
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 11 then
                card.ability.extra.jackCount = (card.ability.extra.jackCount) + 1
            elseif context.other_card:get_id() == 12 then
                card.ability.extra.queenCount = (card.ability.extra.queenCount) + 1
            elseif context.other_card:get_id() == 13 then
                card.ability.extra.kingCount = (card.ability.extra.kingCount) + 1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if card.ability.extra.jackCount or card.ability.extra.queenCount or card.ability.extra.kingCount >= 3 then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}