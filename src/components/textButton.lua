local assets = require "src/common/assets"
local textButton = {}

local BUTTON_HEIGHT = 64
local BUTTON_WIDTH = 200
local TEXT_LEFT_PADDING = 20
local BUTTON_DEFAULT_COLOR = {0, 0, 0}
local BUTTON_HOT_COLOR = {148/255, 0, 211/255}
local TEXT_COLOR = {1, 1, 0}

function textButton.new(arg)
  return {
    text = arg.text,
    fn = arg.fn,
    x = arg.x,
    y = arg.y,
    hot = false,
    type = 'textButton',
    font = assets.squareFont,
    width = arg.width or BUTTON_WIDTH,
    height = arg.height or BUTTON_HEIGHT,
  }
end

function textButton.draw(button)
  love.graphics.setFont(button.font)

  local buttonColor = BUTTON_DEFAULT_COLOR
  if button.hot then
    buttonColor = BUTTON_HOT_COLOR
  end

  love.graphics.setColor(buttonColor)
  love.graphics.rectangle(
    'fill',
    button.x,
    button.y,
    button.width,
    button.height
  )
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(
    'line',
    button.x,
    button.y,
    button.width,
    button.height
  )

  love.graphics.setColor(TEXT_COLOR)
  local textHeight = button.font:getHeight(button.text)
  local textWidth = button.font:getWidth(button.text)

  love.graphics.print(
    button.text,
    button.font,
    button.x + button.width / 2 - textWidth / 2,
    button.y + button.height / 2 - textHeight / 2
  )
end

return textButton;
