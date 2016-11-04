function love.load()
  birdY = 200
  birdYSpeed = 0
  playingAreaWidth = 300
  playingAreaHeight = 388
  pipeSpaceHeight = 100
  pipeWidth = 54
  birdX = 62
  birdWidth = 30
  birdHeight = 25

  resetPipe()
end

function love.update(dt)
  birdYSpeed = birdYSpeed + (516 * dt)
  birdY = birdY + (birdYSpeed * dt)

  pipeX = pipeX - (60 * dt)

  if(pipeX + pipeWidth) < 0 then
    resetPipe()
  end

  if birdX < (pipeX + pipeWidth) and (birdX + birdWidth) > pipeX and (birdY < pipeSpaceY and (birdY < pipeSpaceY) or (birdY + birdHeight) > (pipeSpaceY + pipeSpaceHeight)) then
    love.load()
  end
end

function love.draw()
  love.graphics.setColor(35, 92, 118)
  love.graphics.rectangle('fill', 0, 0, playingAreaWidth, playingAreaHeight)

  love.graphics.setColor(224, 214, 68)
  love.graphics.rectangle('fill', birdX, birdY, birdWidth, birdHeight)

  love.graphics.setColor(94, 201, 72)
  love.graphics.rectangle('fill', pipeX, 0, pipeWidth, pipeSpaceY)

  love.graphics.setColor(94, 201, 72)
  love.graphics.rectangle('fill', pipeX, pipeSpaceY + pipeSpaceHeight, pipeWidth, playingAreaHeight - pipeSpaceY - pipeSpaceHeight)
end

function love.keypressed(key)
  if birdY >= 0 then
    birdYSpeed = -265
  end

end

function resetPipe()
  local pipeSpaceYMin = 54
  pipeSpaceY = love.math.random(0, playingAreaHeight - pipeSpaceHeight - pipeSpaceYMin)
  pipeX = playingAreaWidth
end
