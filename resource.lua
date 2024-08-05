resource = { name = "", rate = 0, max = 100, amount = 0, color = { 1, 1, 1 } }

function resource:new(o)
	o = o or {}
	-- o = o or { name = "", rate = 0, max = 100, amount = 0, color = { 1, 1, 1 } }
	setmetatable(o, self)
	self.__index = self
	return o
end

function resource:update(dt)
	self.amount = self.amount + self.rate * dt
	self.amount = math.min(self.amount, self.max)
end

function resource:add(x)
	local newAmount = self.amount + x
	self.amount = math.min(newAmount, self.max)
end

function resource:change(x)
	self.amount = self.amount + x
end

function resource:draw(x, y)
	local barHeight = 36
	local barWidth = 400
	local nameText = love.graphics.newText(global.font, self.name)
	local amountText = love.graphics.newText(global.font, "" .. math.floor(self.amount) .. "/" .. self.max)
	local barY = y + nameText:getHeight()
	local amountY = barY + (barHeight / 2) - (amountText:getHeight() / 2)

	love.graphics.draw(nameText, x, y)
	love.graphics.setColor(self.color)
	love.graphics.rectangle("fill", x, barY, self.amount / self.max * barWidth, barHeight)

	love.graphics.setColor({ 0, 0, 0 })
	love.graphics.rectangle("fill", x + 5, amountY, amountText:getWidth(), amountText:getHeight())
	love.graphics.setColor(COLORS.white)
	love.graphics.draw(amountText, x + 5, amountY)

	love.graphics.setColor(COLORS.white)
	love.graphics.rectangle("line", x, barY, barWidth, barHeight)
end
