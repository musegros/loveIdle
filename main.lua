require("keys")
require("resource")
require("resman2")
require("colors")
require("spell")

RESMAN = resourceManager

function love.load(arg)
	if arg[#arg] == "-debug" then
		require("mobdebug").start()
	end
	global = {}
	global.textSize = 18
	love.window.setMode(1280, 768)
	global.font = love.graphics.newFont("font.ttf", global.textSize)
end

function love.update(dt)
	RESMAN:update(dt)
end

function love.draw()
	RESMAN:draw()
	local keysText = love.graphics.newText(global.font, { COLORS.white, KEYS.buy .. " - Increase mana regen" })
	love.graphics.draw(keysText, 900, 32)
end

function love.keypressed(key)
	if key == KEYS.quit then
		love.event.quit()
	end
	if key == KEYS.buy then
		SPELLBOOK.makeTrash:cast()
	end
end
