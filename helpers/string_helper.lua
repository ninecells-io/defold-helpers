local M = {}

function M.join_path(a, b)
    if not a or a == "" then return b end
    if not b or b == "" then return a end

    local a_ends_slash = a:sub(-1) == "/"
    local b_starts_slash = b:sub(1, 1) == "/"

    if a_ends_slash and b_starts_slash then
        return a .. b:sub(2)      -- remove extra slash
    elseif not a_ends_slash and not b_starts_slash then
        return a .. "/" .. b      -- add missing slash
    else
        return a .. b             -- already correct
    end
end

function M.string_starts_with(s, sub)
	return string.sub(s, 1, string.len(sub)) == sub
end

return M