local Adverts = {
  ad_mkt_yixi = {atlas = 'mktjk_PlushVanity_Ads', pos = {x=0,y=0}, base_size = 0.6},
  ad_mkt_victory = {atlas = 'mktjk_VictoryBand_Ads', pos = {x=0,y=0}, base_size = 0.4},
  ad_mkt_birdbrain = {atlas = 'mktjk_Birdbrain_Ads', pos = {x=0,y=0}, base_size = 0.46},
  ad_mkt_ado = {atlas = 'mktjk_Ado_Ads', pos = {x=0,y=0}, base_size = 0.25},
}

for key, ad in pairs(Adverts) do
  HotPotato.Ads.Adverts[key] = ad
end