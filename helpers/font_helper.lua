local string_helper = require("helpers.string_helper")

local M = {}

function M.create_font(name, path)

    local fontc_path = string_helper.join_path(path, name) .. ".fontc"
    local ok, metrics = pcall(resource.get_text_metrics, fontc_path, "Wg")

    if not metrics or not ok then
        return nil
    end

    return {
        name = hash(name),
        path = string_helper.join_path(path, name) .. ".font",
        path_fontc = fontc_path,
        size = metrics.height
    }
end

return M