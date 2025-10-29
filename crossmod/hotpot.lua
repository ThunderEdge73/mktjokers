if HotPotato then

-- hotpot ad shit

SMODS.Atlas {
    key = "PlushVanity_Ads",
    path = "hp/ads/plushyixi.png",
    px = 300,
    py = 200,
}

SMODS.Atlas {
    key = "VictoryBand_Ads",
    path = "hp/ads/victoryband.png",
    px = 300,
    py = 250,
}

SMODS.Atlas {
    key = "Birdbrain_Ads",
    path = "hp/ads/bb.png",
    px = 474,
    py = 496,
}

SMODS.Atlas {
    key = "Ado_Ads",
    path = "hp/ads/ado.png",
    px = 373,
    py = 373,
}

local function load_hpot_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/content/hotpot"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("content/hotpot/" .. file_name))()
        end
    end
end

local function load_hpot_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/content/hotpot/jokers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("content/hotpot/jokers" .. file_name))()
        end
    end
end

load_hpot_folder()
load_hpot_jokers_folder()

end