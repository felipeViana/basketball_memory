local card = require 'src/card'
local assets = require 'src/assets'
local initial_loads = require 'src/initial_loads'

function love.load()
  initial_loads.load_imgs()

  math.randomseed(os.time())
  love.window.setMode(1280, 720, {fullscreen = false})

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
