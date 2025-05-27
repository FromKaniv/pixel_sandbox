local floor_color = string.lower(core.settings:get("floor_color"))

core.register_on_generated(function(minp, maxp, blockseed)
    if maxp.y < 0 then
    elseif minp.y > 0 then
        return
    end

    local vm, emin, emax = core.get_mapgen_object("voxelmanip")
    local data = vm:get_data()

    local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
    local c_stone = core.get_content_id("pixel_sandbox_colorblocks:" .. floor_color)

    for z = minp.z, maxp.z do
        for y = math.max(minp.y, -31000), math.min(maxp.y, -1) do
            for x = minp.x, maxp.x do
                local i = area:index(x, y, z)
                data[i] = c_stone
            end
        end
    end

    vm:set_data(data)
    vm:write_to_map()
end)
