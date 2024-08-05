require("colors")
resourceManager = {}
resourceManager.resources = {}
resourceManager.resList = {}

function resourceManager:change(res, amt)
	self.resources[res]:change(amt)
end

function resource

function resourceManager:update(dt)
	for i, v in pairs(self.resources) do
		v:update(dt)
	end
end

function resourceManager:draw()
	local startX = 32
	local startY = 32
	for i = 1, #self.resList do
		self.resources[self.resList[i]]:draw(startX, startY)
		startY = startY + 64
	end
end

function resourceManager:addResource(resTable)
	local resName = resTable.name
	self.resList[#self.resList + 1] = resName

	self.resources[resName] = resTable
end

resourceManager:addResource(resource:new({ name = "Mana", rate = 5, max = 100, color = COLORS.blue }))
resourceManager:addResource(resource:new({ name = "Trash", rate = 0, max = 20, color = COLORS.gray }))
resourceManager:addResource(resource:new({ name = "Gold", rate = 0, max = 100, color = COLORS.gold }))
