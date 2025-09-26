SMODS.Rarity {
    key = "epic",
    pools = {
        ["milkys_jokers"] = true
    },
    default_weight = 0.024,
    badge_colour = HEX('f1824a'),
    loc_txt = {
        name = "Epic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "meta",
    pools = { 
        ["milkys_jokers"] = true 
    },
    default_weight = 0,
    badge_colour = HEX('e873ff'),
    loc_txt = {
        name = "Meta"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
SMODS.Rarity {
    key = "jimmy",
    default_weight = 0.25,
        pools = { 
        ["milkys_jokers"] = true}, 
    badge_colour = HEX("7f7fb1"),
    loc_txt = {
        name = "JIMMY"
    },
    get_weight = function(self, weight, object_type)
        return weight --jmimy
    end,
}
SMODS.Rarity {
    key = "pseudolegend",
    pools = { 
        ["milkys_jokers"] = true
    }, 
    default_weight = 0,
    badge_colour = HEX("a954b6"),
    loc_txt = {
        name = "Pseudo-Legendary"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
SMODS.Rarity {
    key = "legendplus",
    pools = { 
        ["milkys_jokers"] = true
    }, 
    default_weight = 0,
    badge_colour = HEX("b500ff"),
    loc_txt = {
        name = "Legendary+"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
