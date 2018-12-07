local mainmenu_controller = { }
mainmenu_controller.__index = mainmenu_controller

function mainmenu_controller:new()
  local c = { }
  setmetatable(c, mainmenu_controller)
  c.actions = { }
  return c
end

function mainmenu_controller:push(action)
  table.insert(self.actions, action)
  return self
end

function mainmenu_controller:update(dt)
  for _, action in pairs(self.actions) do
    love.event.quit()
  end
  return self
end

function mainmenu_controller:draw()
end

return mainmenu_controller
