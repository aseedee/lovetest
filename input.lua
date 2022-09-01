function Pause()
  Paused = not Paused
end

local keyboard_handlers = {
  q = love.event.quit,
  space = Pause,
  escape = Pause,
  w = function()
    local triangle = require('bodies')[1]
    local _, y_velocity = triangle.body:getLinearVelocity() -- returns x, y
    triangle.body:setLinearVelocity(0, y_velocity - 100) -- negative y is up
  end
}

love.keypressed = function(key)
  if keyboard_handlers[key] then
    keyboard_handlers[key]()
  end
end
