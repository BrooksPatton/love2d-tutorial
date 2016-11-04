function love.load()
  birdY = 200
  birdYSpeed = 0
  playingAreaWidth = 300
  playingAreaHeight = 388
end

function love.update(dt)
  birdYSpeed = birdYSpeed + (516 * dt)
  birdY = birdY + (birdYSpeed * dt)
end

function love.draw()
  love.graphics.setColor(35, 92, 118)
  love.graphics.rectangle('fill', 0, 0, playingAreaWidth, playingAreaHeight)

  love.graphics.setColor(224, 214, 68)
  love.graphics.rectangle('fill', 62, birdY, 30, 25)

  love.graphics.setColor(94, 201, 72)
  love.graphics.rectangle('fill', playingAreaWidth, 0, 54, playingAreaHeight)
end

function love.keypressed(key)
  if birdY >= 0 then
    birdYSpeed = -265
  end
end
