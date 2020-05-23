local sceneManager = require 'src/sceneManager'
local menu = {};

local BUTTON_HEIGHT = 64

local buttons = {}

local font

local mouseX
local mouseY
local mouseReleased

function newButton(text, fn)
  return {
    text = text,
    fn = fn,
    hot = false
  }
end

function goToSettings( ... )
  sceneManager.changeScene(require 'src/menu/settings')
end

function menu.unload( ... )
  buttons = {}
end

function startGame()
  sceneManager.changeScene(require 'src/scenes/chooseName')
end

function quitGame( ... )
  love.event.quit(0)
end

function menu.load()
  mouseReleased = false
  love.graphics.setColor(255, 255, 255)
  font = love.graphics.newFont('assets/fonts/Square.ttf', 28)
  love.graphics.setFont(font)

  table.insert(buttons, newButton(
    "Start Game",
    startGame
  ))

  table.insert(buttons, newButton(
    "Settings",
    goToSettings
  ))

  table.insert(buttons, newButton(
    "Exit",
    quitGame
  ))
end

function menu.update(dt)
  for i, button in ipairs(buttons) do
    if mouseReleased and button.hot then
      button.fn()
    end
  end

  mouseReleased = false
end

function menu.draw()
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()
  local mouseX, mouseY = love.mouse.getPosition()

  local buttonWidth = windowWidth / 3
  local margin = 16
  local totalHeight = (BUTTON_HEIGHT + margin) * #buttons
  local cursor_y = 0

  for i, button in ipairs(buttons) do
    local buttonX = windowWidth/2 - buttonWidth/2
    local buttonY = windowHeight/2 - totalHeight/2 + cursor_y

    local buttonColor = {0.4, 0.4, 0.5}

    button.hot = mouseX > buttonX and mouseX < buttonX + buttonWidth and
                mouseY > buttonY and mouseY < buttonY + BUTTON_HEIGHT

    if button.hot then
      buttonColor = {0.8, 0.8, 0.9}
    end

    love.graphics.setColor(unpack(buttonColor))

    love.graphics.rectangle(
      'fill',
      buttonX,
      buttonY,
      buttonWidth,
      BUTTON_HEIGHT
    )

    love.graphics.setColor(0, 0, 0)
    local textWidth = font:getWidth(button.text)
    local textHeight = font:getHeight(button.text)

    love.graphics.print(
      button.text,
      font,
      buttonX + buttonWidth /2 - textWidth/2,
      buttonY + BUTTON_HEIGHT/2 - textHeight/2
    )

    cursor_y = cursor_y + (BUTTON_HEIGHT + margin)
  end
end

function menu.mousereleased(x, y, button, istouch)
  if button == 1 then
    mouseX = x
    mouseY = y
    mouseReleased = true
  else
    mouseReleased = false
  end
end

return menu;
