-- function module.textureQuad(image, x, y, qx, qy, qw, qh)
--   -- TODO: bug in playdate SDK where draw offset affect source rect
--   -- https://devforum.play.date/t/image-drawoffset-affects-sourcerect-instead-of-location/3778/6
--   local ox, oy = playdate.graphics.getDrawOffset()
--   playdate.graphics.setDrawOffset(0, 0)
--   image.data:draw(ox + x, oy + y, playdate.graphics.kImageUnflipped, qx, qy, qw, qh )
--   playdate.graphics.setDrawOffset(ox, oy)
-- end

-- function module.meta:resetLoop()
--   !if LOVE2D then
--     self.timer = self.delay
--     self.paused = false
--     self.frame = self.startFrame
--   !elseif PLAYDATE then
--     self.data.paused = false
--     self.data.valid = false
--     self.data.frame = self.data.startFrame
--   !end
--   end