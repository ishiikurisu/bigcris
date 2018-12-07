local mainmenu_view = require "/view/mainmenu_view"
local game_controller = require "/controller/game_controller"
local mainmenu_controller = { }
mainmenu_controller.__index = mainmenu_controller

function mainmenu_controller:new()
  local o = { }
  setmetatable(o, mainmenu_controller)
  o.actions = { }
  o.view = mainmenu_view:new()
  return o
end

function mainmenu_controller:push(x, y)
  local what = self.view:press(x, y)
  table.insert(self.actions, what)
end

function mainmenu_controller:update(dt)
  local controller = self
  
  for _, action in pairs(self.actions) do
    if action == 'option 1' then
      self.view:set_option(1)
    elseif action == 'option 2' then
      self.view:set_option(2)
    elseif action == 'option 3' then
      self.view:set_option(3)
    elseif action == 'option 4' then
      self.view:set_option(4)
    elseif action == 'start' then
      controller = game_controller:new(self.view.option)
    end
  end
  
  return controller
end

function mainmenu_controller:draw()
  self.view:draw(self)
end

return mainmenu_controller
