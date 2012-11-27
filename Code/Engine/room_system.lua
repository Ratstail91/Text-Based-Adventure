--[[

	This is the room system

	see Pseudocode/Room System.txt

--]]


Room = {
	prototype = {
		name = "No Name", --new rooms should *always* have unique names
		desc = "No Description", --and descriptions
		itemlist = {},
		doorlist = {}
	},
	list = {} --the global list of rooms
}


--Note: This might be a bit round-a-bout, but you can add an anonymous room without deleting previous ones.
setmetatable(Room.list, {__index = function(t, key)
	for k, v in pairs(Room.list) do
		if key == v.name then return v end
	end
end})


function Room:new(arg)
	local o = deepcopy(self.prototype)
	if type(arg) == "table" then --copy args into this room
		for k, v in pairs(arg) do
			o[deepcopy(k)] = deepcopy(v)
		end
	end
	table.insert(Room.list, o) --add to the room list
	return o
end

