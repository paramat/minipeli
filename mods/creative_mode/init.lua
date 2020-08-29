local creative_mode_cache = minetest.settings:get_bool("creative_mode")

if creative_mode_cache then
	-- Override the hand for special capabilities
	local digtime = 42
	local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}

	minetest.override_item("", {
		range = 8,
		tool_capabilities = {
			full_punch_interval = 0.5,
			max_drop_level = 3,
			groupcaps = {
				crumbly = caps,
				cracky  = caps,
				snappy  = caps,
				choppy  = caps,
				oddly_breakable_by_hand = caps,
				dig_immediate =
					{times = {[2] = digtime, [3] = 0}, uses = 0, maxlevel = 256},
			},
		}
	})

	-- When placing a node, do not remove from inventory
	minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
		if placer and placer:is_player() then
			return true
		end
	end)
end


-- When digging a node, do not add to inventory if already present

local old_handle_node_drops = minetest.handle_node_drops

function minetest.handle_node_drops(pos, drops, digger)
	if not digger or not digger:is_player() or not creative_mode_cache then
		return old_handle_node_drops(pos, drops, digger)
	end

	local inv = digger:get_inventory()
	if inv then
		for _, item in ipairs(drops) do
			if not inv:contains_item("main", item, true) then
				inv:add_item("main", item)
			end
		end
	end
end
