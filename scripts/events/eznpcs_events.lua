local eznpcs = require('scripts/ezlibs-scripts/eznpcs/eznpcs')
local eztriggers = require('scripts/ezlibs-scripts/eztriggers')
local ezmemory = require('scripts/ezlibs-scripts/ezmemory')
local ezmystery = require('scripts/ezlibs-scripts/ezmystery')
local ezweather = require('scripts/ezlibs-scripts/ezweather')
local ezshortcuts = require('scripts/ezlibs-custom/ezshortcuts')
local ezwarps = require('scripts/ezlibs-scripts/ezwarps/main')
local ezencounters = require('scripts/ezlibs-scripts/ezencounters/main')
local helpers = require('scripts/ezlibs-scripts/helpers')
local playerNaviCache = require('scripts/ezlibs-custom/player_navi_cache')

local ScaleNPC = {
    name = "ScaleNPC",
    action = function(npc, player_id, dialogue, relay_object)
        return async(function()
            Net.animate_bot_properties(bot_id, {
                {
                  properties = {
                    { property = "ScaleX", value = 16/8,},
                    { property = "ScaleY", value = 16/8,}
                  },
                  duration = .25
                }
              })
        end)
    end
}
eznpcs.add_event(ScaleNPC)