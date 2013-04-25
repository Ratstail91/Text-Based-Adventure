--[[

	The parsing function splits the input string into an array, then 
	selects the correct function to call based on the first argument. It passes 
	the remaining arguments (after poping the first one) to the function called.

--]]


function parse(input)
	--get the array, & the command
	local args = splitstring(input, "%g+")
	
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

