-- mods/default/tools.lua

-- To stay simple tools don't use maxlevel.
-- The engine assumes maxlevel=1, so we have to specify 0
-- A bug adds + 1 to uses, so we subtract 1.

--
-- The Hand
--

minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=1.5},
	range = 4.0,
	tool_capabilities = {
		full_punch_interval = 0.9,
		groupcaps = {
			crumbly = {times={[2]=2.50, [3]=1.00}, uses=0, maxlevel=0},
			snappy = {times={[3]=0.60}, uses=0, maxlevel=0},
			oddly_breakable_by_hand = {times={[1]=1.80,[2]=1.20,[3]=0.40}, uses=0}
		},
	},
})

--
-- Tool definition
--

-- Picks
minetest.register_tool("default:pick_wood", {
	description = "Wooden Pickaxe",
	inventory_image = "default_tool_woodpick.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		groupcaps={
			cracky = {times={[1]=1.6, [2]=1.6, [3]=1.6}, uses=20-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_tool("default:pick_stone", {
	description = "Stone Pickaxe",
	inventory_image = "default_tool_stonepick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		groupcaps={
			cracky = {times={[1]=1.00, [2]=1.00, [3]=1.00}, uses=80-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

--[[minetest.register_tool("default:pick_copper", {
	description = "Copper Pickaxe",
	inventory_image = "default_tool_copperpick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		groupcaps={
			cracky = {times={[2]=1.40, [3]=0.80}, uses=60-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool(":default:pick_bronze", {
	description = "Bronze Pickaxe",
	inventory_image = "default_tool_bronzepick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		groupcaps={
			cracky = {times={[2]=1.10, [3]=0.60}, uses=80-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("default:pick_steel", {
	description = "Steel Pickaxe",
	inventory_image = "default_tool_steelpick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		groupcaps={
			cracky = {times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=120-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})--]]

minetest.register_tool("default:pick_mese", {
	description = "Mese Pickaxe",
	inventory_image = "default_tool_mesepick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		groupcaps={
			cracky = {times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=30-1, maxlevel=0},
			crumbly = {times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=30-1, maxlevel=0},
			snappy = {times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=30-1, maxlevel=0},
			choppy = {times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=30-1, maxlevel=0}
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

-- Shovels
minetest.register_tool("default:shovel_wood", {
	description = "Wooden Shovel",
	inventory_image = "default_tool_woodshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		groupcaps={
			crumbly = {times={[1]=0.80, [2]=0.80, [3]=0.80}, uses=20-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("default:shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "default_tool_stoneshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.4,
		groupcaps={
			crumbly = {times={[1]=0.60, [2]=0.60, [3]=0.60}, uses=80-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

--[[minetest.register_tool("default:shovel_copper", {
	description = "Copper Shovel",
	inventory_image = "default_tool_coppershovel.png",
	tool_capabilities = {
		full_punch_interval = 1.1,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.90, [3]=0.40}, uses=60-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool(":default:shovel_bronze", {
	description = "Bronze Shovel",
	inventory_image = "default_tool_bronzeshovel.png",
	wield_image = "default_tool_bronzeshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.80, [3]=0.30}, uses=80-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("default:shovel_steel", {
	description = "Steel Shovel",
	inventory_image = "default_tool_steelshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.1,
		groupcaps={
			crumbly = {times={[1]=0.80, [2]=0.60, [3]=0.20}, uses=120-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})--]]

-- Axes
minetest.register_tool("default:axe_wood", {
	description = "Wooden Axe",
	inventory_image = "default_tool_woodaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		groupcaps={
			choppy = {times={[1]=1.50, [2]=1.50, [3]=1.50}, uses=20-1, maxlevel=0},
			snappy={times={[1]=0.40, [2]=0.40, [3]=0.40}, uses=60-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("default:axe_stone", {
	description = "Stone Axe",
	inventory_image = "default_tool_stoneaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		groupcaps={
			choppy={times={[1]=0.70, [2]=0.70, [3]=0.70}, uses=80-1, maxlevel=0},
			snappy={times={[1]=0.30, [2]=0.30, [3]=0.30}, uses=240-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

--[[minetest.register_tool("default:axe_copper", {
	description = "Copper Axe",
	inventory_image = "default_tool_copperaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.1,
		groupcaps={
			choppy={times={[1]=0.90, [2]=0.60, [3]=0.50}, uses=60-1, maxlevel=0},
			snappy={times={[1]=3.0, [2]=1.20, [3]=0.20}, uses=160-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool(":default:axe_bronze", {
	description = "Bronze Axe",
	inventory_image = "default_tool_bronzeaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.1,
		groupcaps={
			choppy={times={[1]=0.70, [2]=0.40, [3]=0.30}, uses=80-1, maxlevel=0},
			snappy={times={[1]=2.8, [2]=1.10, [3]=0.15}, uses=240-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("default:axe_steel", {
	description = "Steel Axe",
	inventory_image = "default_tool_steelaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		groupcaps={
			choppy={times={[1]=0.60, [2]=0.30, [3]=0.20}, uses=120-1, maxlevel=0},
			snappy={times={[1]=2.5, [2]=1.00, [3]=0.10}, uses=360-1, maxlevel=0},
		},
	},
	sound = {breaks = "default_tool_breaks"},
})--]]