local mp = require("mp")

local positions = {}
local last_path = nil

local function current_key()
	return mp.get_property("path")
end

local function remember_position()
	local path = current_key()
	local pos = mp.get_property_number("time-pos")
	if path and pos then
		positions[path] = pos
	end
end

mp.register_event("file-loaded", function()
	local path = current_key()
	last_path = path

	local pos = positions[path]
	if pos and pos > 1 then
		mp.commandv("seek", pos, "absolute", "exact")
	end
end)

mp.register_event("end-file", function()
	remember_position()
end)

mp.observe_property("time-pos", "number", function()
	local path = current_key()
	local pos = mp.get_property_number("time-pos")
	if path and pos then
		positions[path] = pos
	end
end)
