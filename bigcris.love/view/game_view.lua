local game_view = { }
game_view.__index = game_view

function game_view:new(bet)
  local o = { }
  setmetatable(o, game_view)
  o.bet = bet
  o.again = false
  return o
end

function game_view:press(x, y)
  local what = nil
  if (x >= 25) and (x <= 75) and (y >= 350) then
    what = 'begin'
  elseif (x >= 100) and (x <= 150) and (y >= 350) and (self.again) then
    what = 'change'
  end
  return what
end

function game_view:draw(controller)
  -- drawing players
  local x = 0 
  local y = 0
  for i = 1, 4 do
    x = controller:get({
      what = 'position',
      player = i
    })
    local r = util.avatars[i].r/255
    local g = util.avatars[i].g/255
    local b = util.avatars[i].b/255
    love.graphics.setColor(r, g, b)
    love.graphics.rectangle("fill", x, y, 80, 80)
    y = y + 87
  end
  
  -- drawing buttons
  -- start button
  local status = controller:get({ what = 'status' })
  local color = util.colors.yellow
  if status == 'begin' then
    color = util.colors.white
  elseif status == 'win' then
    color = util.colors.green
  elseif status == 'loss' then
    color = util.colors.red
  end
  local r = color.r/255
  local g = color.g/255
  local b = color.b/255
  love.graphics.setColor(r, g, b)
  love.graphics.rectangle("fill", 25, 350, 50, 25)
  
  -- new pick button
  color = util.colors.black
  if (status == 'win') or (status == 'loss')  then
    color = util.colors.white
    self.again = true
  end
  r = color.r/255
  g = color.g/255
  b = color.b/255
  love.graphics.setColor(r, g, b)
  love.graphics.rectangle("fill", 100, 350, 50, 25)
end

return game_view
