local players = {}

local preloadForPlayer = {}


local assetPaths = { episode1 = "/server/assets/music/episode1.ogg" }

Net:on("player_connect", function(event)
    players[event.player_id] = "online"

    local interactRelay = Net.get_object_by_name("default", "Interact Relay")
    local blockerRelay = Net.get_object_by_name("default", "Blocker Relay")

    local playerHasAsset = Net.has_asset(assetPaths["episode1"])
    if not playerHasAsset then
        Net.provide_asset("default", assetPaths["episode1"])
    end

    Net.exclude_object_for_player(event.player_id, blockerRelay.id)
    Net.include_object_for_player(event.player_id, interactRelay.id)
    print(event.player_id)
end)

Net:on("player_disconnect", function(event)
    players.remove(event.player_id)
    print(event.player_id)
end)

Net:on("tick", function(event)
    -- print("tick")
end)
