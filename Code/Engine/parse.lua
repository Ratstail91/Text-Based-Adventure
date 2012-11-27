--[[

	The parsing function splits the input string into an array, then 
	selects the correct function to call based on the first argument. It passes 
	the remaining arguments (after poping the first one) to the function called.

--]]


--predefined utility functions
local function splitinput(str, c)
	local array = {}
	for w in string.gmatch(str, c) do
		table.insert(array, w)
	end
	return array
end


function parse(input)
	--get the array, & the command
	local args = splitinput(input, "%g+")
	
	local command = table.remove(args, 1)
	
	--select the correct function to call
	if command == "help" then return dohelp(args) end
	if command == "exit" then return doexit(args) end
	if command == "quit" then return doexit(args) end
	if command == "look" then return dolook(args) end
	if command == "move" then return domove(args) end
	if command == "goto" then return domove(args) end
	
	--more to come
	
	return gamestate.parseError
end

