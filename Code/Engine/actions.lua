--[[

	This is all of the primary actions of the game (at least until a more indepth one is needed).

--]]


function dolook(args)
	io.write("You look around.\n")
	
	
	--this would use room specific attributes
	
	io.write("You see a grue.\n")
	io.write("You see a chair.\n")
	io.write("I give you a hamburger.\n")
	
	return gamestate.normal
end


function domove(args)
	io.write("You try to move, but the programmers haven't implemented that functionality yet.\n")
	
	return gamestate.normal
end


function doexit(args)
	io.write("Thanks for playing!\n")
	return gamestate.quit
end

