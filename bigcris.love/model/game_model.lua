local game_model = { }
game_model.__index = game_model

function game_model:new()
  local o = { }
  setmetatable(o, game_model)
  return o
end

function game_model:update()
end

function game_model:get(query)
  local payload = { }
  
  if query.what == 'position' then
    payload = 0
  elseif query.what == 'status' then
    payload = { r = 255, g = 255, b = 255 }
  end
  
  return payload
end

return game_model
