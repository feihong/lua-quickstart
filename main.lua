function getWithinBounds(v, lower, upper)
  if v < lower then 
    return lower
  elseif v > upper then
    return upper
  else
    return v
  end
end

directions = {'left', 'right', 'up', 'down'}

function makeRectangle()
  return { 
    x = 200, 
    y = 200, 
    speed = math.random(100, 400),
    direction = directions[math.random(1, 4)],
    width = math.random(100, 200),
    height = math.random(50, 150),
  }
end

function love.load()
  math.randomseed(os.time())

  rects = {makeRectangle()}

  winWidth, winHeight = love.graphics.getDimensions()

  fruits = {'apples'}
  extraFruits = {'bananas', 'cherry', 'durian', 'elderberry', 'fig', 'grape', 'honeydew'}
end

function love.draw()
  love.graphics.setColor(1, 1, 1, 1)
  for _, rect in ipairs(rects) do
    love.graphics.rectangle("line", rect.x, rect.y, rect.width, rect.height)
  end

  love.graphics.setColor(0.7, 0.7, 1, 1)
  love.graphics.print("Press 'x' to show more fruits", 10, 10)

  for i,fruit in ipairs(fruits) do
    love.graphics.print(fruit, 10, 30 + 20 * (i-1))
  end 
end

function love.update(dt)
  for _, rect in ipairs(rects) do
    if rect.direction == 'right' then 
      rect.x = rect.x + rect.speed * dt
    elseif rect.direction == 'left' then
      rect.x = rect.x - rect.speed * dt
    elseif rect.direction == 'up' then
      rect.y = rect.y - rect.speed * dt
    elseif rect.direction == 'down' then
      rect.y = rect.y + rect.speed * dt
    end

    rect.x = getWithinBounds(rect.x, 0, winWidth - rect.width)
    rect.y = getWithinBounds(rect.y, 0, winHeight - rect.height)
  end
end

function love.keypressed(key) 
  if key == 'f' then
    local fruit = table.remove(extraFruits, 1)
    if fruit == nil then fruit = '...' end
    table.insert(fruits, fruit)
  elseif key == 'space' then
    table.insert(rects, makeRectangle())
  elseif key == 'right' or key == 'left' or key == 'up' or key == 'down' then
    for _, rect in ipairs(rects) do
      rect.direction = key
    end
  end
end
