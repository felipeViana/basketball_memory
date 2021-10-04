local assets = require "src/common/assets"
local arrowButton = {}
arrowButton.meta = {
  __index = arrowButton
}

local BUTTON_HEIGHT = 50
local BUTTON_WIDTH = 50
local BUTTON_DEFAULT_COLOR = {0, 0, 0}
local BUTTON_HOT_COLOR = {148/255, 0, 211/255}
local TEXT_COLOR = {1, 1, 0}
local DISABLED_TEXT_COLOR = {1, 1, 0, 0.3}

function arrowButton.new(arg)
  local button = {
    fn = arg.fn,
    x = arg.x,
    y = arg.y,
    disabledFunction = arg.disabledFunction,
    disabled = arg.disabled or false,
    hot = false,
    type = 'arrowButton',
    width = BUTTON_WIDTH,
    height = BUTTON_HEIGHT,
    direction = arg.direction,
    onHeader = arg.onHeader,
  }
  setmetatable(button, arrowButton.meta)

  return button
end

function arrowButton:draw()
  local buttonColor = BUTTON_DEFAULT_COLOR
  if self.hot and not self.disabled then
    buttonColor = BUTTON_HOT_COLOR
  end

  love.graphics.setColor(buttonColor)
  love.graphics.rectangle(
    'fill',
    self.x,
    self.y,
    BUTTON_WIDTH,
    BUTTON_HEIGHT
  )
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(
    'line',
    self.x,
    self.y,
    BUTTON_WIDTH,
    BUTTON_HEIGHT
  )

  if self.disabled then
    love.graphics.setColor(DISABLED_TEXT_COLOR)
  else
    love.graphics.setColor(TEXT_COLOR)
  end

  if self.direction == 'left' then
    love.graphics.polygon(
      'fill',
      self.x + BUTTON_WIDTH/4,
      self.y + BUTTON_HEIGHT/2,

      self.x + 3 * BUTTON_WIDTH/4,
      self.y + BUTTON_HEIGHT/4,

      self.x + 3 * BUTTON_WIDTH/4,
      self.y + 3 * BUTTON_HEIGHT/4
    )
  elseif self.direction == 'up' then
    love.graphics.polygon(
      'fill',
      self.x + BUTTON_WIDTH/2,
      self.y + BUTTON_HEIGHT/4,

      self.x + 3 * BUTTON_WIDTH/4,
      self.y + 3 * BUTTON_HEIGHT/4,

      self.x + BUTTON_WIDTH/4,
      self.y + 3 * BUTTON_HEIGHT/4
    )
  elseif self.direction == 'down' then
    love.graphics.polygon(
      'fill',
      self.x + BUTTON_WIDTH/2,
      self.y + 3 * BUTTON_HEIGHT/4,

      self.x + BUTTON_WIDTH/4,
      self.y + BUTTON_HEIGHT/4,

      self.x + 3 * BUTTON_WIDTH/4,
      self.y + BUTTON_HEIGHT/4
    )
  end
end

return arrowButton;
