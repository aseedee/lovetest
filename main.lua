require('input')

local bodies = {}
local world = {}

local n = 0

love.load = function()
  bodies = require('bodies')
  world = require('world')
end

love.draw = function()
  love.graphics.print('getPowerInfo: ' .. love.system.getPowerInfo(), 0, 0)
  love.graphics.print('getProcessorCount: ' .. love.system.getProcessorCount(), 0, 15)
  love.graphics.print('getOS: ' .. love.system.getOS(), 0, 30)

  love.graphics.print(tostring(n), n, 300)
  n = (n + 1) % love.window.getMode() -- first returned value is window width

  for _,d in ipairs(bodies) do
    love.graphics.polygon("line", d.body:getWorldPoints(d.shape:getPoints()))
  end
end

Paused = false

love.update = function(dt)
  if not Paused then
    world:update(dt)
  end
end

love.focus = function(focused)
  if not focused then
    Paused = true
  end
end
