Rectangle = Object:extend()

function Rectangle:new(winWidth, winHeight)
  self.color = hslToRgb(math.random(0, 360), 80, 70)
  self.width = math.random(100, 200)
  self.height = math.random(100, 200)
  self.x = math.random(0, winWidth - self.width)
  self.y = math.random(0, winHeight - self.height)
  self.speed = math.random(100, 400)
  self.delta = polarToCartesian(self.speed, math.random(0, 360))
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
  love.graphics.setColor(self.color.r, self.color.g, self.color.b, 1)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Rectangle:resetAngle()
  self.delta = polarToCartesian(self.speed, math.random(0, 360))
end
