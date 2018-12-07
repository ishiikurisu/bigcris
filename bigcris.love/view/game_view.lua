local game_view = { }
game_view.__index = game_view

function game_view:new(bet)
  local o = { }
  setmetatable(o, game_view)
  o.bet = bet
  return o
end

function game_view:press(x, y)
  local what = nil
  return nil
end

function game_view:draw(controller)
  
end

return game_view
