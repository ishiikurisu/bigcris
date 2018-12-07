start = require "/controller/mainmenu_controller"
util = require "util"

function love.load()
  current_controller = start:new()
end

function love.mousepressed(x, y, button, istouch)
  current_controller:push(x, y)
end

function love.update(dt)
  current_controller = current_controller:update(dt)
end

function love.draw()
  current_controller:draw()
end