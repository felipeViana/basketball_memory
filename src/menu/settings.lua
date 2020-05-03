local sceneManager = require 'src/sceneManager'
local settings = {};

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

function goBack( ... )
  print("going back")
  sceneManager.changeScene(require 'src/menu/main')
end

function toggleFullScreen( ... )
  print("changing fullscreen")

  local fullScreen = love.window.getFullscreen()
  if fullScreen then
    love.window.setFullscreen(false)
  else
    love.window.setFullscreen(true)
  end
end

function settings.unload( ... )
  buttons = {}
end

function settings.load()
  mouseReleased = false
  love.graphics.setColor(255, 255, 255)
  font = love.graphics.newFont('assets/fonts/Square.ttf', 28)
  love.graphics.setFont(font)

  table.insert(buttons, newButton(
    "Fullscreen ?",
    toggleFullScreen
  ))

  table.insert(buttons, newButton(
    "Go back",
    goBack
  ))
end

function settings.update()
  for i, button in ipairs(buttons) do
    if mouseReleased and button.hot then
      button.fn()
    end
  end

  mouseReleased = false
end

function settings.draw()
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()

  local buttonWidth = windowWidth / 3
  local margin = 16
  local totalHeight = (BUTTON_HEIGHT + margin) * #buttons
  local cursor_y = 0

  for i, button in ipairs(buttons) do
    local buttonX = windowWidth/2 - buttonWidth/2
    local buttonY = windowHeight/2 - totalHeight/2 + cursor_y

    local buttonColor = {0.4, 0.4, 0.5}

    local mouseX, mouseY = love.mouse.getPosition()

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

function settings.mousereleased(x, y, button, istouch)
  if button == 1 then
    mouseX = x
    mouseY = y
    mouseReleased = true
  else
    mouseReleased = false
  end
end

return settings;
