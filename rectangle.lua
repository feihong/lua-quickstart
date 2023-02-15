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

function Rectangle:update(dt)
  self.x = self.x + self.delta.x * dt
  self.y = self.y + self.delta.y * dt

  if self.x < 0 then
    self.delta.x = math.abs(self.delta.x)
  elseif self.x > winWidth - self.width then 
    self.delta.x = - math.abs(self.delta.x)
  elseif self.y < 0 then
    self.delta.y = math.abs(self.delta.y)
  elseif self.y > winHeight - self.height then
    self.delta.y = - math.abs(self.delta.y)
  end
end

function Rectangle:draw()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Rectangle:resetAngle()
  self.delta = polarToCartesian(self.speed, math.random(0, 360))
end
