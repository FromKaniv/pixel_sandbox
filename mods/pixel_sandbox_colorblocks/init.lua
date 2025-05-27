local colors = {
    "red", "blue", "yellow", "green",
    "orange", "purple", "black", "white"
}

for _, color in ipairs(colors) do
    local color_cap = color:gsub("^%l", string.upper)

    core.register_node("pixel_sandbox_colorblocks:" .. color, {
        description = color_cap .. " Block",
        tiles = { "pixel_sandbox_colorblocks_" .. color .. ".png" },
        groups = { dig_immediate = 3, not_in_creative_inventory = 0 },
        stack_max = 1,
        drop = "",

        on_place = function(itemstack, placer, pointed_thing)
            core.item_place_node(ItemStack("pixel_sandbox_colorblocks:" .. color), placer, pointed_thing)
            return itemstack
        end,
    })
end

core.register_on_joinplayer(function(player)
    player:set_physics_override({fly = true})
    core.set_player_privs(player:get_player_name(), {fly = true})
    player:set_inventory_formspec("")

    local inv = player:get_inventory()
    local colors = {
        "red", "blue", "yellow", "green",
        "orange", "purple", "black", "white"
    }

    inv:set_list("main", {})

    for i, color in ipairs(colors) do
        local item = ItemStack("pixel_sandbox_colorblocks:" .. color)
        item:set_count(1)
        inv:set_stack("main", i, item)
    end
end)
