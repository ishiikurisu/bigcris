local mainmenu_view = { }
mainmenu_view.__index = mainmenu_view

function mainmenu_view:new()
  local o = { }
  setmetatable(o, mainmenu_view)
  o.option = 1
  o.avatars = {
    { -- 3517-CP -- red
      r = 197,
      g = 28,
      b = 31
    }, { -- 3553 CP -- blue
      r = 0,
      g = 111,
      b = 173
    }, { -- 3539 CP -- green
      r = 54,
      g = 152,
      b = 44
    }, { -- 108 CP -- yellow
      r = 249,
      g = 218,
      b = 0
    }
  }
  return o
end

function mainmenu_view:press(x, y)
  local what = nil
  
  if (y >= 25) and y < 175 then
    if (x >= 25) and (x <= 125) then
      what = 'option 1'
    elseif (x >= 175) and (x <= 275) then
      what = 'option 2'
    elseif (x >= 325) and (x <= 425) then
      what = 'option 3'
    elseif (x >= 475) and (x <= 575) then
      what = 'option 4'
    end
  else
    -- TODO implement start button
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
  love.graphics.setColor(1, 1, 1) -- white
  love.graphics.rectangle("fill", x, y, 120, 120)
  
  -- all options
  x = 25
  y = 50 
  for i = 1, 4 do
    local r = self.avatars[i].r/255.0
    local g = self.avatars[i].g/255.0
    local b = self.avatars[i].b/255.0
    love.graphics.setColor(r, g, b)
    love.graphics.rectangle("fill", x, y, 100, 100)
    x = x + 150
  end
  
  -- start button
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", 250, 50, 500, 100)
end

return mainmenu_view
