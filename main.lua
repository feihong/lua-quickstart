Object = require "classic"
require 'util'
require 'rectangle'
tick = require "tick"


function love.load()
  math.randomseed(os.time())

  winWidth, winHeight = love.graphics.getDimensions()

  rects = {Rectangle(winWidth, winHeight)}

  fruits = {}
end

function love.draw()
  love.graphics.setColor(1, 1, 1, 1)
  for _, rect in ipairs(rects) do
    rect:draw()
  end

  love.graphics.setColor(0.7, 0.7, 1, 1)
  love.graphics.print("Press 'f' to add a fruit", 10, 10)

  for i,fruit in ipairs(fruits) do
    love.graphics.print(fruit, 10, 30 + 20 * (i-1))
  end 
end

function love.update(dt)
  tick.update(dt)

  for _, rect in ipairs(rects) do
    rect:update(dt)
  end
end

function updateFruitSlowly(index, fruit, counter)
  if counter == nil then
    fruits[index] = ''
    counter = 1
  end

  if counter < #fruit then
    fruits[index] = fruits[index] .. '.'
    tick.delay(function () updateFruitSlowly(index, fruit, counter + 1) end, 0.5)
  else
    fruits[index] = fruit
  end
end

function love.keypressed(key) 
  if key == 'f' then
    updateFruitSlowly(#fruits + 1, getRandomFruit())
  elseif key == 'x' then
    for _, rect in ipairs(rects) do
      rect:resetAngle()
    end
  elseif key == 'space' then
    table.insert(rects, Rectangle(winWidth, winHeight))
  elseif key == 'right' then
    changeRectDeltas(rects, 0)
  elseif key == 'left' then
    changeRectDeltas(rects, 180)
  elseif key == 'up' then
    changeRectDeltas(rects, 270)
  elseif key == 'down' then
    changeRectDeltas(rects, 90)
  end
end
