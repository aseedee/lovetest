local world = require('world')

local triangle = {}
triangle.body = love.physics.newBody(world, 100, 100, "dynamic")
triangle.body:setMass(32)

triangle.shape = love.physics.newPolygonShape(100, 100, 200, 100, 200, 200)
triangle.fixture = love.physics.newFixture(triangle.body, triangle.shape)
triangle.fixture:setRestitution(0.2)

local ground = {}
ground.body = love.physics.newBody(world, 0, 500, "static")
ground.shape = love.physics.newPolygonShape(0, 0, 0, 20, 400, 20, 400, 0)
ground.fixture = love.physics.newFixture(ground.body, ground.shape)

local bodies = {
  triangle,
  ground,
}

return bodies
