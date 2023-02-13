_fruits = {'apples', 'bananas', 'cherry', 'durian', 'elderberry', 'fig', 'grape', 'honeydew', 'jackfruit'}

function getRandomFruit()
  local i = math.random(1, #_fruits)
  return _fruits[i]
end


function polarToCartesian(r, theta)
  theta = math.rad(theta)
  return {x = r * math.cos(theta), y = r * math.sin(theta)}
end

function changeRectDeltas(angle)
  for _, rect in ipairs(rects) do
    rect.delta = polarToCartesian(rect.speed, angle)
  end
end

function makeRectangle(winWidth, winHeight)
  local width = math.random(100, 200)
  local height = math.random(100, 200)
  local speed = math.random(100, 400)
  local delta = polarToCartesian(speed, math.random(0, 360))

  return { 
    x = math.random(0, winWidth - width), 
    y = math.random(0, winHeight - height), 
    speed = speed,
    delta = delta,
    width = width,
    height = height,
  }
end
