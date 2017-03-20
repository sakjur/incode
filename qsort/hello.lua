
local class = {
	setstring = function(self, str)
		self.str = str
	end,
	hi = function(self)
		print(self.str)
	end
}

class:setstring("hello world")
class:hi()

for k, v in pairs(class) do
	print(k, type(v), v)
end

