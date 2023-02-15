
_fruits = {'apples', 'bananas', 'cherry', 'durian', 'elderberry', 'fig', 'grape', 'honeydew', 'jackfruit'}

function getRandomFruit()
  local i = math.random(1, #_fruits)
  return _fruits[i]
end

function polarToCartesian(r, theta)
  theta = math.rad(theta)
  return {x = r * math.cos(theta), y = r * math.sin(theta)}
end

function changeRectDeltas(rects, angle)
  for _, rect in ipairs(rects) do
    rect.delta = polarToCartesian(rect.speed, angle)
  end
end
