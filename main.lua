function love.load()
  birdY = 200
  birdYSpeed = 0
end

function love.update(dt)
  birdYSpeed = birdYSpeed + (516 * dt)
  birdY = birdY + (birdYSpeed * dt)
end

function love.draw()
  love.graphics.setColor(35, 92, 118)
  love.graphics.rectangle('fill', 0, 0, 300, 388)

  love.graphics.setColor(224, 214, 68)
  love.graphics.rectangle('fill', 62, birdY, 30, 25)
end
