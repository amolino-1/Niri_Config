local presets = {
	{
		name = "off",
		crop_left_eye = false,
		zoom = 0.0,
		vr = false,
	},
	{
		name = "classic",
		crop_left_eye = true,
		zoom = 0.10,
		vr = true,
	},
	{
		name = "medium",
		crop_left_eye = true,
		zoom = 0.28,
		vr = true,
	},
	{
		name = "tight",
		crop_left_eye = true,
		zoom = 0.45,
		vr = true,
	},
}

-- 0.0 = no extra vertical crop
-- 1.0 = full aspect correction with no horizontal stretch
local aspect_correction = 1.0

local index = 1

local function reset_vr_view()
	mp.set_property("video-crop", "")
	mp.set_property_number("video-scale-x", 1.0)
	mp.set_property_number("video-scale-y", 1.0)
	mp.set_property_number("video-zoom", 0.0)
	mp.set_property_number("video-pan-x", 0.0)
	mp.set_property_number("video-pan-y", 0.0)
end

local function apply_left_eye_crop()
	local vp = mp.get_property_native("video-params")
	if not vp or not vp.w or not vp.h then
		return false, "video params unavailable"
	end

	local full_w = vp.w
	local full_h = vp.h
	local crop_w = math.floor(full_w / 2)

	if crop_w < 2 or full_h < 2 then
		return false, "video too small"
	end

	-- Full-frame aspect ratio.
	local target_aspect = full_w / full_h

	-- Height needed to preserve that aspect ratio after cropping to one eye,
	-- without using non-uniform horizontal stretching.
	local fully_corrected_h = math.floor((crop_w / target_aspect) + 0.5)

	if fully_corrected_h < 2 then
		fully_corrected_h = 2
	end
	if fully_corrected_h > full_h then
		fully_corrected_h = full_h
	end

	-- Blend between no vertical crop and full correction.
	local crop_h = math.floor(full_h - (full_h - fully_corrected_h) * aspect_correction + 0.5)

	if crop_h < 2 then
		crop_h = 2
	end
	if crop_h > full_h then
		crop_h = full_h
	end

	local offset_y = math.floor((full_h - crop_h) / 2)

	mp.set_property("video-crop", string.format("%dx%d+0+%d", crop_w, crop_h, offset_y))

	-- No non-uniform stretching.
	mp.set_property_number("video-scale-x", 1.0)
	mp.set_property_number("video-scale-y", 1.0)

	return true, string.format("%dx%d+0+%d", crop_w, crop_h, offset_y)
end

local function apply_preset()
	local p = presets[index]

	if p.vr then
		mp.commandv("apply-profile", "vr")
	else
		mp.commandv("apply-profile", "vr", "restore")
	end

	reset_vr_view()

	local crop_info = "(none)"
	if p.crop_left_eye then
		local ok, info = apply_left_eye_crop()
		crop_info = info
		if not ok then
			mp.osd_message("VR preset failed: " .. info, 2.0)
			return
		end
	end

	mp.set_property_number("video-zoom", p.zoom)

	local hwdec = mp.get_property("hwdec-current") or "(unknown)"
	local crop = mp.get_property("video-crop") or "(none)"

	mp.osd_message(
		("VR preset: %s\nzoom: %.2f\nhwdec: %s\ncrop: %s\naspect-correction: %.2f"):format(
			p.name,
			p.zoom,
			hwdec,
			crop,
			aspect_correction
		),
		2.0
	)
end

local function cycle_preset()
	index = index + 1
	if index > #presets then
		index = 1
	end
	apply_preset()
end

mp.register_event("file-loaded", function()
	index = 1
	apply_preset()
end)

mp.register_script_message("vr-cycle", cycle_preset)
