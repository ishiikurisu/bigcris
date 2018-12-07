local game_view = require "/view/game_view"
local game_model = require "/model/game_model"
local game_controller = { }
game_controller.__index = game_controller

function game_controller:new()
  local o = { }
  setmetatable(o, game_controller)
  o.actions = { }
  o.view = game_view:new()
  return o
end

function game_controller:push(x, y)
  local what = self.view:press(x, y)
  if what ~= nil then
    table.insert(self.actions, what)
  end
end

function game_controller:update(dt)
  local controller = self
  return controller
end

function game_controller:get(query)
  return game_model:get(query)
end

function game_controller:draw()
  self.view:draw(self)
end

return game_controller
