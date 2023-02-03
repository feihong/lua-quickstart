function love.load()
  x = 100
  y = 50
  xDelta = 0
  yDelta = 0
  width = 200
  height = 150
  step = 200

  winWidth, winHeight = love.graphics.getDimensions()
end

function love.draw()
  love.graphics.rectangle("line", x, y, width, height)
end

function getWithinBounds(v, lower, upper)
  if v < lower then 
    return lower
  elseif v > upper then
    return upper
  else
    return v
  end
end

function love.update(dt)
  x = getWithinBounds(x + xDelta * dt, 0, winWidth - width)
  y = getWithinBounds(y + yDelta * dt, 0, winHeight - height)

  if love.keyboard.isDown('right') then
    xDelta = step
  elseif love.keyboard.isDown('left') then
    xDelta = -1 * step
  elseif love.keyboard.isDown('up') then
    yDelta = -1 * step
  elseif love.keyboard.isDown('down') then
    yDelta = step
  else
    xDelta = 0
    yDelta = 0
  end
end
