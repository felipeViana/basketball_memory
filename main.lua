local CARD_WIDTH = 124
local CARD_HEIGHT = 178

local card = require 'card'

function love.load()
  love.window.setMode(1280, 720, {fullscreen = false})

  image1 = love.graphics.newImage("1-1.png")
  image2 = love.graphics.newImage("1-2.png")
  image3 = love.graphics.newImage("1-3.png")

  imageCardBack = love.graphics.newImage("card-back.png")

  -- love.graphics.setNewFont(12)
  -- love.graphics.setColor(255,255,255)
  love.graphics.setBackgroundColor(223/255, 255/255, 249/255)

  gameIsPaused = false

  card.createCards()
end

function love.update(dt)
  if gameIsPaused then
    return
  end

  card.updateCards(mouseX, mouseY, mouseReleased)
end

function love.draw()
  card.drawCards()

end

function love.mousereleased(x, y, button, istouch)
  if button == 1 then
    mouseX = x
    mouseY = y
    mouseReleased = true
  else
    mouseReleased = false
  end
end

function love.focus(f)
  gameIsPaused = not f
end

function love.quit()
  print("Thanks for playing!")
end
