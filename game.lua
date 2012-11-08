--defines


QUIT = 0
NORMAL = 1
PARSE_ERROR = 2


function parse(str)
	if (str == "help") then return dohelp(str) end
	if (str == "look") then return dolook(str) end
	if (str == "exit") then return doexit(str) end
	
	return PARSE_ERROR
end


function dohelp(str)
	print("Help")
	print("Type \"command [[arg]...]\" to interact with the game.")
	return NORMAL
end

function dolook(str)
	print("You look around.")
	print("You see a grue.")
	return NORMAL
end

function doexit(str)
	print("Thank you for playing!")
	return QUIT
end



--the entry point

local state = NORMAL

while state ~= QUIT do
	io.write(">")
	local input = io.read()
	
	state = parse(input)
	
	if state == PARSE_ERROR then
		print("Parse error: ", input)
	end
end

