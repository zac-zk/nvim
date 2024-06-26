G = {}

function G.map(maps)
    for _, map in pairs(maps) do
        vim.keymap.set(map[1], map[2], map[3], map[4])
    end
end

return G
