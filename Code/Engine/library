--[[

	This is a library of generic utility functions. I'd
	rather have them together here than spread throughout
	the project and duplicated.

--]]


function file_exists(fname)
	local f = io.open(fname, "r")
	if f~=nil then io.close(f) return true else return false end
end


function tablesize(t)
	local count = 0
	for _ in pairs(t) do count = count + 1 end
	return count
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


--debugging functions go here

function debugtable(t) --tmp debug
	for k, v in pairs(t) do
		print(k, v)
	end
end
