--launch the game, after ensuring this is the game directory


local function file_exists(fname)
	local f = io.open(fname, "r")
	if f~=nil then io.close(f) return true else return false end
end



--probably improve this later
if not file_exists("start.lua") or not file_exists("engine\\main") then
	print("Directory error")
	return
end



io.write("Enter game name: ")
local name = io.read()


dir = {}
dir.engine = "engine//"
dir.game = "game//" .. name .. "//"


dofile(dir.engine .. "main")
