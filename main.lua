function love.load()
  x = 100
  delta = 100
end

function love.draw()
  love.graphics.rectangle("line", x, 50, 200, 150)
end

function love.update(dt)
  x = x + delta * dt

  if x <= 0 then 
    delta = 100
  elseif x >= 600 then
    delta = -100
  end
end
