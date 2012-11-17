--the gamestates available

QUIT		= 0
NORMAL		= 1
PARSE_ERROR	= 2


--load the engine

dofile(dir.engine .. "library")
dofile(dir.engine .. "help")
dofile(dir.engine .. "actions")
dofile(dir.engine .. "parse")


--load the game

dofile(dir.loadedgame .. "main.lua")


--main loop

local state = NORMAL

while state ~= QUIT do
	--smooth, consistent interface
	io.write("TBA>")
	
	local input = io.read()
	
	state = parse(input)
	
	if (state == PARSE_ERROR) then
		print("Parse Error: ", input)
	end
end

