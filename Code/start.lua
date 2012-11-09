--launch the game, after ensuring this is the game directory


local function file_exists(fname)
	local f = io.open(fname, "r")
	if f~=nil then io.close(f) return true else return false end
end

-- Lua implementation of PHP scandir function
-- copied from http://stackoverflow.com/questions/5303174/get-list-of-directory-in-a-lua
-- modified slightly (made it Windows-compatible)
function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('dir "'..directory..'"'):lines() do
        i = i + 1
        t[i] = filename
    end
    return t
end

dir = {}
dir.engine = "Engine/"
dir.games = "Game/"

--probably improve this later
if not file_exists("start.lua") or not file_exists("Engine/main") then
	print("Directory error")
	return
end


io.write("Available Games:\n")
for g,k in scandir(dir.games) do io.write(k .. "\n") end


io.write("Enter game name: ")
local name = io.read()
dir.game = dir.games .. name .. "/"

dofile(dir.engine .. "main")
