--[[

	This is the item system. The items are not very tightly monitored
	since they can exist in many different places.

	see Pseudocode/Item System.txt

--]]

Item = {
	class = tableprotect({
		none	= 0, --placeholder
		misc	= 1,
		weapon	= 2,
		armour	= 3,
		food	= 4,
		key		= 5,
	}),
	prototype = tableprotect({
		name = "No Name",
		desc = "No Description",
		class = 0,
		stat = {}, --type dependant table
	})
}

function Item:new(arg)
	--
end