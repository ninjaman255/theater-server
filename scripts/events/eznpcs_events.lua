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
          { property = "ScaleX", value = 2, },
          { property = "ScaleY", value = 2, }
        },
        duration = 0
      })
    end)
  end
}
eznpcs.add_event(ScaleNPC)

local PlayEpisode = {
  name = "Play Episode",
  action = function(npc, player_id, dialogue, relay_object)
    return async(function()
      local bot_id = npc.bot_id
      local area_id = Net.get_player_area(player_id)
      local blockerRelay = Net.get_object_by_name(area_id, "Blocker Relay")
      -- Net.play_sound(area_id, "/server/assets/music/episode.ogg")
      Net.play_sound_for_player(player_id, "/server/assets/music/episode1.ogg")
      Net.exclude_object_for_player(player_id, relay_object.id)
      Net.include_object_for_player(player_id, blockerRelay.id)
      Net.set_object_visibility(area_id, blockerRelay.id, false)
      return Net.animate_bot(bot_id, "PLAY")
    end)
  end
}
eznpcs.add_event(PlayEpisode)
