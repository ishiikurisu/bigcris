local game_model = { }
game_model.__index = game_model

function game_model:new(bet)
  local o = { }
  setmetatable(o, game_model)
  o.bet = bet
  o.running = false
  o.positions = {
    0, 0, 0, 0
  }
  o.status = 'begin'
  return o
end

function game_model:update()
  if self.running then
    -- updating positions
    for i = 1, 4 do
      self.positions[i] = self.positions[i] + love.math.random(1, 5)
    end
    
    -- checking for ending
    local ended = false
    local win = false
    for i = 1, 4 do
      local this_ended = (self.positions[i] + 80) >= 600
      ended = ended or this_ended
      if (this_ended) and (i == self.bet) then
        win = true 
      end
    end
      
    if ended then 
      self.running = false 
      if win then
        self.status = 'win'
      else
        self.status = 'loss'
      end
    end
    
  end
end

function game_model:race()
  if not self.running then
    self.positions = { 0, 0, 0, 0 }
    self.running = true
    self.status = 'running'
  end
end

function game_model:get(query)
  local payload = { }
  
  if query.what == 'position' then
    payload = self.positions[query.player]
  elseif query.what == 'status' then
    payload = self.status
  end
  
  return payload
end

return game_model
