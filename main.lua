function love.load()
  love.graphics.setColor(100, 200, 255)
  pirate = love.graphics.newImage("Pirate.png")
  hellox = 300
  helloy = 300
end

function love.draw()
  love.graphics.draw(pirate, hellox, helloy)
end

function love.update(dt)
  if(love.keyboard.isDown("up")) then
    helloy = helloy - 100 * dt
  end

  if(love.keyboard.isDown("down")) then
    helloy = helloy + 100 * dt
  end

  if(love.keyboard.isDown("right")) then
    hellox = hellox + 100 * dt
  end

  if(love.keyboard.isDown("left")) then
    hellox = hellox - 100 * dt
  end
end
