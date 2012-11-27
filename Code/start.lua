--[[

	Launch the game, after ensuring this is the game directory.
	Directories aren't really supported by lua, so this could be a bit tricky,
	depending on platform.

--]]


--temporaty utility function, since I can't load "library" yet
local function fileexists(fname)
	local f = io.open(fname, "r")
	if f~=nil then io.close(f) return true else return false end
end


--get the name (the name of the game folder)

io.write("Enter game name: ")
local name = io.read()


--setup the directories

dir = {}
dir.engine = "Engine/"
dir.games = "Games/"
dir.loadedgame = dir.games .. name .. "/"


--Check to see that the initial files are available

if
	not fileexists("start.lua") or
	not fileexists("Engine/main.lua") or
	not fileexists(dir.loadedgame .. "main.lua")
then
	print("Directory error")
	return
end


--remove the utility functions before entering the engine

fileexists = nil


--kick the engine into gear

dofile(dir.engine .. "main.lua")
