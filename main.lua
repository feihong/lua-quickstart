directions = {'left', 'right', 'up', 'down'}

function getRandomDirection()
  return directions[math.random(1, 4)]
end

function makeRectangle()
  local width = math.random(100, 200)
  local height = math.random(100, 200)
  return { 
    x = math.random(0, winWidth - width), 
    y = math.random(0, winHeight - height), 
    speed = math.random(100, 400),
    direction = getRandomDirection(),
    width = width,
    height = height,
  }
end

function love.load()
  math.randomseed(os.time())

  winWidth, winHeight = love.graphics.getDimensions()

  rects = {makeRectangle()}

  fruits = {'apples'}
  extraFruits = {'bananas', 'cherry', 'durian', 'elderberry', 'fig', 'grape', 'honeydew'}
end

function love.draw()
  love.graphics.setColor(1, 1, 1, 1)
  for _, rect in ipairs(rects) do
    love.graphics.rectangle("line", rect.x, rect.y, rect.width, rect.height)
  end

  love.graphics.setColor(0.7, 0.7, 1, 1)
  love.graphics.print("Press 'f' to show more fruits", 10, 10)

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

    if rect.x < 0 then 
      rect.direction = 'right'
    elseif rect.x > winWidth - rect.width then 
      rect.direction = 'left'
    elseif rect.y < 0 then 
      rect.direction = 'down'
    elseif rect.y > winHeight - rect.height then
      rect.direction = 'up'
    end
  end
end

function love.keypressed(key) 
  if key == 'f' then
    local fruit = table.remove(extraFruits, 1)
    if fruit == nil then fruit = '...' end
    table.insert(fruits, fruit)
  elseif key == 'x' then
    for _, rect in ipairs(rects) do
      rect.direction = getRandomDirection()
    end
  elseif key == 'space' then
    table.insert(rects, makeRectangle())
  elseif key == 'right' or key == 'left' or key == 'up' or key == 'down' then
    for _, rect in ipairs(rects) do
      rect.direction = key
    end
  end
end
