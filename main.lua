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
  pipe1X = playingAreaWidth
  pipe1SpaceY = newPipeSpaceY()

  score = 0

  pipe2X = playingAreaWidth + ((playingAreaWidth + pipeWidth) / 2)
  pipe2SpaceY = newPipeSpaceY()
end

function love.update(dt)
  birdYSpeed = birdYSpeed + (516 * dt)
  birdY = birdY + (birdYSpeed * dt)

  pipe1X, pipe1SpaceY = movePipe(pipe1X, pipe1SpaceY, dt)
  pipe2X, pipe2SpaceY = movePipe(pipe2X, pipe2SpaceY, dt)

  if isBirdCollidingWithPipe(pipe1X, pipe1SpaceY) or isBirdCollidingWithPipe(pipe2X, pipe2SpaceY) or birdY > playingAreaHeight then
    love.load()
  end
end

function love.draw()
  love.graphics.setColor(35, 92, 118)
  love.graphics.rectangle('fill', 0, 0, playingAreaWidth, playingAreaHeight)

  love.graphics.setColor(224, 214, 68)
  love.graphics.rectangle('fill', birdX, birdY, birdWidth, birdHeight)

  drawPipe(pipe1X, pipe1SpaceY)
  drawPipe(pipe2X, pipe2SpaceY)

  love.graphics.setColor(255, 255, 255)
  love.graphics.print(score, 15, 15)
end

function love.keypressed(key)
  if birdY >= 0 then
    birdYSpeed = -265
  end
end

function newPipeSpaceY()
  local pipeSpaceYMin = 54
  local pipeSpaceY = love.math.random(pipeSpaceYMin, playingAreaHeight - pipeSpaceHeight - pipeSpaceYMin)

  return pipeSpaceY
end

function drawPipe(pipeX, pipeSpaceY)
  love.graphics.setColor(94, 201, 72)
  love.graphics.rectangle('fill', pipeX, 0, pipeWidth, pipeSpaceY)

  love.graphics.setColor(94, 201, 72)
  love.graphics.rectangle('fill', pipeX, pipeSpaceY + pipeSpaceHeight, pipeWidth, playingAreaHeight - pipeSpaceY - pipeSpaceHeight)
end

function movePipe(pipeX, pipeSpaceY, dt)
  pipeX = pipeX - (60 * dt)

  if(pipeX + pipeWidth) < 0 then
    pipeX = playingAreaWidth
    pipeSpaceY = newPipeSpaceY()
  end

  return pipeX, pipeSpaceY
end

function isBirdCollidingWithPipe(pipeX, pipeSpaceY)
  return
    birdX < (pipeX + pipeWidth)
    and
    (birdX + birdWidth) >pipeX
    and (
      birdY < pipeSpaceY
      or
      (birdY + birdHeight) > (pipeSpaceY + pipeSpaceHeight)
    )
end
