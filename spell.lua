spell = { name = {}, cost = {}, effects = {} }

function spell:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function spell:cast()
	for i, v in pairs(self.cost) do
		local res = v.resource
		local cost = v.cost
		if not RESMAN:canAfford(res, cost) then
			return false
		end
	end

	--need to deduct costs

	self.effects()
end

SPELLBOOK = {}

SPELLBOOK.makeTrash = spell:new({
	name = "Make trash",
	cost = { { resource = "Mana", cost = 15 } },
	effects = function()
		RESMAN:change("Trash", 1)
	end,
})
