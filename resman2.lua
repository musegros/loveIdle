require("colors")
local R = {}

resourceManager = R
R.resources = {}

--resList is an array of resources to they're drawn in the same order
R.resList = {}

function R:change(res, amt)
	self.resources[res]:change(amt)
end

function R:canAfford(res, amt)
	if self.resources[res].amount - amt >= 0 then
		return true
	end
	return false
end

function R:update(dt)
	for i, v in pairs(self.resources) do
		v:update(dt)
	end
end

function R:draw()
	local startX = 32
	local startY = 32
	for i = 1, #self.resList do
		self.resources[self.resList[i]]:draw(startX, startY)
		startY = startY + 64
	end
end

function R:addResource(resTable)
	local resName = resTable.name
	self.resList[#self.resList + 1] = resName

	self.resources[resName] = resTable
end

R:addResource(resource:new({ name = "Mana", rate = 20, max = 100, color = COLORS.blue }))
R:addResource(resource:new({ name = "Trash", rate = 0, max = 20, color = COLORS.gray }))
R:addResource(resource:new({ name = "Gold", rate = 0, max = 100, color = COLORS.gold }))

return resourceManager
