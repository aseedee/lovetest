local function begin_contact_callback(fixture_a, fixture_b, contact)
  print(fixture_a, fixture_b, contact, 'beginning contact')
end

local function end_contact_callback(fixture_a, fixture_b, contact)
  print(fixture_a, fixture_b, contact, 'endning contact')
end

local function pre_solve_callback(fixture_a, fixture_b, contact)
  print(fixture_a, fixture_b, contact, 'about to resolve contact')
end

local function post_solve_callback(fixture_a, fixture_b, contact)
  print(fixture_a, fixture_b, contact, 'just resolved a contact')
end

local world = love.physics.newWorld(0, 100)

world:setCallbacks(
  begin_contact_callback,
  end_contact_callback,
  pre_solve_callback,
  post_solve_callback
)

return world
