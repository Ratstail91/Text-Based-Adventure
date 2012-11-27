--load the engine

dofile(dir.engine .. "library.lua")
dofile(dir.engine .. "help.lua")
dofile(dir.engine .. "actions.lua")
dofile(dir.engine .. "parse.lua")


--load the game

dofile(dir.loadedgame .. "main.lua")


--the gamestates available

gamestate = tableprotect({
	quit = 0,
	normal = 1,
	parseError = 2,
})


--main loop

local state = gamestate.normal

while state ~= gamestate.quit do
	--smooth, consistent interface
	io.write("TBA>")
	
	local input = io.read()
	
	if string.len(input) > 0 then
		state = parse(input)
		
		if (state == gamestate.parseError) then
			print("Unknown expression: ", input)
		end
	end
end

