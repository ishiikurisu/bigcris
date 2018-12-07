local mainmenu_view = { }
mainmenu_view.__index = mainmenu_view

function mainmenu_view:new()
  local o = { }
  setmetatable(o, mainmenu_view)
  o.option = 1
  return o
end

function mainmenu_view:press(x, y)
  local what = nil
  
  if (y >= 25) and (y < 175) then
    if (x >= 25) and (x <= 125) then
      what = 'option 1'
    elseif (x >= 175) and (x <= 275) then
      what = 'option 2'
    elseif (x >= 325) and (x <= 425) then
      what = 'option 3'
    elseif (x >= 475) and (x <= 575) then
      what = 'option 4'
    end
  elseif (y >= 250) and (y <= 350) and (x >= 50) and (x <= 550) then
    what = 'start'
  end
    
  return what
end

function mainmenu_view:set_option(option)
  self.option = option
end

function mainmenu_view:draw(controller)
  -- current option
  local x = 15 + 150*(self.option-1)
  local y = 40
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", x, y, 120, 120)
  
  -- all options
  x = 25
  y = 50 
  for i = 1, 4 do
    local r = util.avatars[i].r/255.0
    local g = util.avatars[i].g/255.0
    local b = util.avatars[i].b/255.0
    love.graphics.setColor(r, g, b)
    love.graphics.rectangle("fill", x, y, 100, 100)
    x = x + 150
  end
  
  -- start button
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", 50, 250, 500, 100)
end

return mainmenu_view
