--[[

	This is the room system. It's designed so that no room can be lost,
	or removed from the list without it being deleted. This is because
	rooms should be created at the beginning of a scenario, and exist
	until the end.

	see Pseudocode/Room System.txt

--]]


Room = {
	prototype = tableprotect({
		name = "No Name", --new rooms should *always* have unique names
		desc = "No Description", --and descriptions
		itemlist = {},
		doorlist = {}
	}),
	list = {} --the global list of rooms
}


--Note: This might be a bit round-a-bout, but you can add an anonymous room without deleting previous ones.
setmetatable(Room.list, {
	__index = function(t, k)
		for _, v in pairs(Room.list) do
			if k == v.name then return v end
		end
	end,
	__newindex = function(t, k, v)
		error("Attempting to assign room " .. tostring(k),2)
	end
})


function Room:new(arg)
	--add a single room
	local o = deepcopy(getmetatable(self.prototype).__index)
	if type(arg) == "table" then --copy args into this room
		for k, v in pairs(arg) do
			o[deepcopy(k)] = deepcopy(v)
		end
	end
	table.insert(Room.list, o) --add to the room list
	return o
end


function Room:delete(arg)
	--delete a single room
	if type(arg) == 'nil' then
		table.remove(Room.list) --no args
		return
	end

	if type(arg) == 'number' then
		table.remove(Room.list, arg)
		return
	end

	if type(arg) == 'string' then
		Room:delete(Room.list[arg]) --reuse this function
		return
	end

	if type(arg) == 'table' then
		for k, v in pairs(Room.list) do
			if arg == v then table.remove(Room.list, k) end
		end
		return
	end

	error("Unknown argument type", 2)
end


function Room:clear()
	--delete all rooms
	mt = getmetatable(Room.list)
	Room.list = {}
	setmetatable(Room.list, mt)
end
