local game_view = require "/view/game_view"
local game_model = require "/model/game_model"
local game_controller = { }
game_controller.__index = game_controller

function game_controller:new(bet)
  local o = { }
  setmetatable(o, game_controller)
  o.actions = { }
  o.view = game_view:new(bet)
  o.model = game_model:new(bet)
  return o
end

function game_controller:push(x, y)
  local what = self.view:press(x, y)
  if (what ~= nil) and (not self.model.running) then
    table.insert(self.actions, what)
  end
end

function game_controller:update(dt)
  local controller = self
  
  self.model:update()
  
  if not self.model.running then
    for _, action in pairs(self.actions) do
      if action == 'begin' then
        self.model:race()
      end
    end
    self.actions = { }
  end
  
  return controller
end

function game_controller:get(query)
  return self.model:get(query)
end

function game_controller:draw()
  self.view:draw(self)
end

return game_controller
