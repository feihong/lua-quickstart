require('util')

function love.load()
  math.randomseed(os.time())

  winWidth, winHeight = love.graphics.getDimensions()

  rects = {makeRectangle(winWidth, winHeight)}

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
    rect.x = rect.x + rect.delta.x * dt
    rect.y = rect.y + rect.delta.y * dt

    if rect.x < 0 then
      rect.delta.x = math.abs(rect.delta.x)
    elseif rect.x > winWidth - rect.width then 
      rect.delta.x = - math.abs(rect.delta.x)
    elseif rect.y < 0 then
      rect.delta.y = math.abs(rect.delta.y)
    elseif rect.y > winHeight - rect.height then
      rect.delta.y = - math.abs(rect.delta.y)
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
      rect.delta = polarToCartesian(rect.speed, math.random(0, 360))
    end
  elseif key == 'space' then
    table.insert(rects, makeRectangle(winWidth, winHeight))
  elseif key == 'right' then
    changeRectDeltas(0)
  elseif key == 'left' then
    changeRectDeltas(180)
  elseif key == 'up' then
    changeRectDeltas(270)
  elseif key == 'down' then
    changeRectDeltas(90)
  end
end
