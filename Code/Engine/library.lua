--[[

	This is a library of generic utility functions. I'd
	rather have them together here than spread throughout
	the project and duplicated.

	Please note that tableprotect() and deepcopy don't work well
	together. To create a deepcopy of a protected table, you must
	do this:

	copy = deepcopy(getmetatable(orig).__index)

--]]


function fileexists(fname)
	local f = io.open(fname, "r")
	if f~=nil then io.close(f) return true else return false end
end


function tablesize(t)
	local count = 0
	for _ in pairs(t) do count = count + 1 end
	return count
end


--http://www.gammon.com.au/forum/bbshowpost.php?bbsubject_id=8028
function tableprotect(tbl)
	return setmetatable({},
	{
		__index = tbl,
		__newindex = function(t, k, v)
			error("Attempting to change constant " .. tostring(k), 2)
		end
	})
end


function deepcopy(orig)
	local copy
	if type(orig) == 'table' then
		copy = {}
		for k, v in pairs(orig) do
			copy[deepcopy(k)] = deepcopy(v)
		end
	else
		copy = orig
	end
	return copy
end


function splitstring(str, delim)
	local array = {}
	for w in string.gmatch(str, delim) do
		table.insert(array, w)
	end
	return array
end


--debugging functions go here

function tabledebugdisplay(t) --tmp debug
	for k, v in pairs(t) do
		print(k, v)
	end
end
