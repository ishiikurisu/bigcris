local mainmenu_view = require "/view/mainmenu_view"
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
  for _, action in pairs(self.actions) do
    if action == 'option 1' then
      self.view:set_option(1)
    elseif action == 'option 2' then
      self.view:set_option(2)
    elseif action == 'option 3' then
      self.view:set_option(3)
    elseif action == 'option 4' then
      self.view:set_option(4)
    end
  end
  return self
end

function mainmenu_controller:draw()
  self.view:draw(self)
end

return mainmenu_controller
