local pi = math.pi
local player_in_bed = 0
local is_sp = minetest.is_singleplayer()
local enable_respawn = minetest.settings:get_bool("enable_bed_respawn")
if enable_respawn == nil then
	enable_respawn = true
end

-- Helper functions

local function get_look_yaw(pos)
	local rotation = minetest.get_node(pos).param2
	if rotation > 3 then
		rotation = rotation % 4 -- Mask colorfacedir values
	end
	if rotation == 1 then
		return pi / 2, rotation
	elseif rotation == 3 then
		return -pi / 2, rotation
	elseif rotation == 0 then
		return pi, rotation
	else
		return 0, rotation
	end
end

local function is_night_skip_enabled()
	local enable_night_skip = minetest.settings:get_bool("enable_bed_night_skip")
	if enable_night_skip == nil then
		enable_night_skip = true
	end
	return enable_night_skip
end

local function check_in_beds(players)
	local in_bed = beds.player
	if not players then
		players = minetest.get_connected_players()
	end

	for n, player in ipairs(players) do
		local name = player:get_player_name()
		if not in_bed[name] then
			return false
		end
	end

	return #players > 0
end

local function lay_down(player, pos, bed_pos, state, skip)
	local name = player:get_player_name()
	local hud_flags = player:hud_get_flags()

	if not player or not name then
		return
	end

	-- stand up
	if state ~= nil and not state then
		local p = beds.pos[name] or nil
		if beds.player[name] ~= nil then
			beds.player[name] = nil
			player_in_bed = player_in_bed - 1
		end
		-- skip here to prevent sending player specific changes (used for leaving players)
		if skip then
			return
		end
		if p then
			player:setpos(p)
		end
	-- lay down
	else
		beds.player[name] = 1
		player_in_bed = player_in_bed + 1
	end

	player:hud_set_flags(hud_flags)
end

local function update_formspecs(finished)
	local ges = #minetest.get_connected_players()
	local form_n
	local is_majority = (ges / 2) < player_in_bed

	if finished then
		form_n = beds.formspec .. "label[2.7,11; Good morning.]"
	else
		form_n = beds.formspec .. "label[2.2,11;" .. tostring(player_in_bed) ..
			" of " .. tostring(ges) .. " players are in bed]"
		if is_majority and is_night_skip_enabled() then
			form_n = form_n .. "button_exit[2,8;4,0.75;force;Force night skip]"
		end
	end

	for name,_ in pairs(beds.player) do
		minetest.show_formspec(name, "beds_form", form_n)
	end
end


-- Public functions

function beds.kick_players()
	for name, _ in pairs(beds.player) do
		local player = minetest.get_player_by_name(name)
		lay_down(player, nil, nil, false)
	end
end

function beds.skip_night()
	minetest.set_timeofday(0.23)
end

function beds.on_rightclick(pos, player)
	local name = player:get_player_name()
	local ppos = player:getpos()

	-- move to bed
	if not beds.player[name] then
		lay_down(player, ppos, pos)
		beds.set_spawns() -- save respawn positions when entering bed
	else
		lay_down(player, nil, nil, false)
	end

	if not is_sp then
		update_formspecs(false)
	end

	-- skip the night and let all players stand up
	if check_in_beds() then
		minetest.after(0, function()
			if not is_sp then
				update_formspecs(is_night_skip_enabled())
			end
			if is_night_skip_enabled() then
				beds.skip_night()
				beds.kick_players()
			end
		end)
	end
end


-- Callbacks
-- Only register respawn callback if respawn enabled
if enable_respawn then
	-- respawn player at bed if enabled and valid position is found
	minetest.register_on_respawnplayer(function(player)
		local name = player:get_player_name()
		local pos = beds.spawn[name]
		if pos then
			player:setpos(pos)
			return true
		end
	end)
end

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	lay_down(player, nil, nil, false, true)
	beds.player[name] = nil
	if check_in_beds() then
		minetest.after(2, function()
			update_formspecs(is_night_skip_enabled())
			if is_night_skip_enabled() then
				beds.skip_night()
				beds.kick_players()
			end
		end)
	end
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "beds_form" then
		return
	end
	if fields.quit or fields.leave then
		lay_down(player, nil, nil, false)
		update_formspecs(false)
	end

	if fields.force then
		update_formspecs(is_night_skip_enabled())
		if is_night_skip_enabled() then
			beds.skip_night()
			beds.kick_players()
		end
	end
end)