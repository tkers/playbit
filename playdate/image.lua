local module = {}
playdate.graphics.image = module

local meta = {}
meta.__index = meta
module.__index = meta

-- don't want to deal with these, so just reuse one
module.quad = love.graphics.newQuad(0, 0, 1, 1, 1, 1)

function module.new(path)
  local img = setmetatable({}, meta)
  img.data = love.graphics.newImage(path..".png")
  return img
end

function meta:getSize()
  return self.data:getWidth(), self.data:getHeight()
end

function meta:draw(x, y, flip, qx, qy, qw, qh)
  -- always render pure white so its not tinted
  local r, g, b = love.graphics.getColor()
  love.graphics.setColor(1, 1, 1, 1)

  @@ASSERT(not flip or flip == 0, "flip not implemented!")
  
  if qx and qy and qw and qh then
    local w, h = self:getSize()
    module.quad:setViewport(qx, qy, qw, qh, w, h)
    love.graphics.draw(self.data, module.quad, x, y)
  else
    love.graphics.draw(self.data, x, y)
  end

  love.graphics.setColor(r, g, b, 1)
end

function meta:drawRotated(x, y, angle)
  -- always render pure white so its not tinted
  local r, g, b = love.graphics.getColor()
  love.graphics.setColor(1, 1, 1, 1)

  -- playdate.image.drawRotated() draws the texture centered, so emulate that
  love.graphics.push()
  local w = self.data:getWidth() * 0.5
  local h = self.data:getHeight() * 0.5
  love.graphics.translate(x, y)
  love.graphics.rotate(math.rad(angle))
  love.graphics.draw(self.data, -w, -h)
  love.graphics.pop()

  love.graphics.setColor(r, g, b, 1)
end