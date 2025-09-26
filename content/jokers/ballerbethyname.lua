SMODS.Joker{ --Baller Be Thy Name
    key = "ballerbethyname",
    config = {
        extra = {
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
            -- give xmult 
            if context.joker_main then
                local jackCount = 0
                local queenCount = 0
                local kingCount = 0

                for _, card in ipairs(context.scoring_hand) do
                    if card:get_id() == 11 then --counting jacks
                        jackCount = jackCount + 1
                    end
                    if card:get_id() == 12 then -- counting queens
                        queenCount = queenCount + 1
                    end
                    if card:get_id() == 13 then -- counting queens
                        kingCount = kingCount + 1
                    end
                end

                if jackCount >= 3 or queenCount >= 3 or kingCount >= 3 then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end 
    end
}