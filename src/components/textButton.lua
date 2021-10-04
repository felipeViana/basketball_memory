local assets = require "src/common/assets"
local textButton = {}
textButton.meta = {
  __index = textButton,
}

local BUTTON_HEIGHT = 64
local BUTTON_WIDTH = 200
local TEXT_LEFT_PADDING = 20
local BUTTON_DEFAULT_COLOR = {0, 0, 0}
local BUTTON_HOT_COLOR = {148/255, 0, 211/255}
local TEXT_COLOR = {1, 1, 0}

function textButton.new(arg)
  local button = {
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
  setmetatable(button, textButton.meta)

  return button
end

function textButton:draw()
  love.graphics.setFont(self.font)

  local buttonColor = BUTTON_DEFAULT_COLOR
  if self.hot then
    buttonColor = BUTTON_HOT_COLOR
  end

  love.graphics.setColor(buttonColor)
  love.graphics.rectangle(
    'fill',
    self.x,
    self.y,
    self.width,
    self.height
  )
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(
    'line',
    self.x,
    self.y,
    self.width,
    self.height
  )

  love.graphics.setColor(TEXT_COLOR)
  local textHeight = self.font:getHeight(self.text)
  local textWidth = self.font:getWidth(self.text)

  love.graphics.print(
    self.text,
    self.font,
    self.x + self.width / 2 - textWidth / 2,
    self.y + self.height / 2 - textHeight / 2
  )
end

return textButton;
