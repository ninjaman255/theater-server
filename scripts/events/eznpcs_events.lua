local eznpcs = require('scripts/ezlibs-scripts/eznpcs/eznpcs')
local eztriggers = require('scripts/ezlibs-scripts/eztriggers')
local ezmemory = require('scripts/ezlibs-scripts/ezmemory')
local ezmystery = require('scripts/ezlibs-scripts/ezmystery')
local ezweather = require('scripts/ezlibs-scripts/ezweather')
local ezwarps = require('scripts/ezlibs-scripts/ezwarps/main')
local ezencounters = require('scripts/ezlibs-scripts/ezencounters/main')
local helpers = require('scripts/ezlibs-scripts/helpers')

local ScaleNPC = {
    name = "ScaleNPC",
    action = function(npc, player_id, dialogue, relay_object)
        return async(function()
            return Net.animate_bot_properties(npc.id, {
                  properties = {
                    { property = "ScaleX", value = 2,},
                    { property = "ScaleY", value = 2,}
                  },
                duration = 0  
              })
        end)
    end
}
eznpcs.add_event(ScaleNPC)