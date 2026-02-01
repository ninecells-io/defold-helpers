local color_helper = require("helpers.color_helper")

local M = {}

function M.create_box_node(root, width, height, pos, pivot, visible, as_circle, inherit_alpha)

	local box = (function()
		if as_circle or false then
			return gui.new_pie_node(
				vmath.vector3(),
				vmath.vector3(width, height, 1.0)
			)
		else
			return gui.new_box_node(
				vmath.vector3(),
				vmath.vector3(width, height, 1.0)
			)
		end
	end)()

	gui.set_pivot(box, pivot or gui.PIVOT_CENTER)
	if pos then
		gui.set_position(box, pos)
	end
	
	gui.set_size_mode(box, gui.SIZE_MODE_MANUAL)
	gui.set_visible(box, visible == nil and true or visible)
	gui.set_inherit_alpha(box, inherit_alpha == nil and true or inherit_alpha)
	gui.set_alpha(box, 1)
	gui.set_blend_mode(box, gui.BLEND_ALPHA)
	gui.set_parent(box, root)

	return box
end

function M.create_text_node(root, caption, size, text_color, font_name, visible, inherit_alpha)
	local text = gui.new_text_node(vmath.vector3(), caption)
	gui.set_parent(text, root, false)
	gui.set_visible(text, visible == nil and true or visible)
	gui.set_inherit_alpha(text, inherit_alpha == nil and true or inherit_alpha)

	gui.set_font(text, hash(font_name or "default"))

	local s = gui.get_size(text)
	
	gui.set_color(text, text_color and color_helper.to_vector(text_color) or vmath.vector4(0, 0, 0, 1))
	
	local scale = size / s.y
	gui.set_scale(text, vmath.vector3(scale, scale, 0))

	return text
end

function M.get_text_metrics(text)
	local font = gui.get_font(text)
	return resource.get_text_metrics(font, gui.get_text(text))
end

return M