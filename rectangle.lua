Rectangle = Object:extend()

function Rectangle:new(winWidth, winHeight)
  local width = math.random(100, 200)
  local height = math.random(100, 200)
  local speed = math.random(100, 400)
  local delta = polarToCartesian(speed, math.random(0, 360))

  self.x = math.random(0, winWidth - width)
  self.y = math.random(0, winHeight - height)
  self.speed = speed
  self.delta = delta
  self.width = width
  self.height = height
end
