--[[

	All of the various help functions, including the in-depth information

--]]

local commands = {
"help:  Displays this help.",
"look:  Displays information about the current room.",
"move [door]:  Move to another room, via this door.",
"goto [door]:  Alias of move.",
"exit:  Exits the game.",
"quit:  Alias of exit."
}


function dohelp(args)
	--generic help
	
	if tablesize(args) == 0 then
		io.write("Help\n")
		for k,v in pairs(commands) do
			io.write("\t" .. v .. "\n")
		end
		return gamestate.normal
	end
	
	--specialised help inquiries, in their own functions
	
	io.write("\"help [keyword]\" called, but no specialized help just yet.\n")
	
	--etc.
	
	return gamestate.normal
end
