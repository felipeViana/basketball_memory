local assets = require "src/common/assets"
local arrowButton = {}

local BUTTON_HEIGHT = 64
local BUTTON_WIDTH = 64
local BUTTON_DEFAULT_COLOR = {0, 0, 0}
local BUTTON_HOT_COLOR = {148/255, 0, 211/255}
local TEXT_COLOR = {1, 1, 0}

function arrowButton.new(arg)
  return {
    fn = arg.fn,
    x = arg.x,
    y = arg.y,
    hot = false,
    type = 'arrowButton',
    width = BUTTON_WIDTH,
    height = BUTTON_HEIGHT,
    direction = arg.direction,
  }
end

function arrowButton.draw(button)
  local buttonColor = BUTTON_DEFAULT_COLOR
  if button.hot then
    buttonColor = BUTTON_HOT_COLOR
  end

  love.graphics.setColor(buttonColor)
  love.graphics.rectangle(
    'fill',
    button.x,
    button.y,
    BUTTON_WIDTH,
    BUTTON_HEIGHT
  )
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(
    'line',
    button.x,
    button.y,
    BUTTON_WIDTH,
    BUTTON_HEIGHT
  )

  love.graphics.setColor(TEXT_COLOR)
  if button.direction == 'left' then
    love.graphics.polygon(
      'fill',
      button.x + BUTTON_WIDTH/4,
      button.y + BUTTON_HEIGHT/2,

      button.x + 3 * BUTTON_WIDTH/4,
      button.y + BUTTON_HEIGHT/4,

      button.x + 3 * BUTTON_WIDTH/4,
      button.y + 3 * BUTTON_HEIGHT/4
    )
  elseif button.direction == 'up' then
    love.graphics.polygon(
      'fill',
      button.x + BUTTON_WIDTH/2,
      button.y + BUTTON_HEIGHT/4,

      button.x + 3 * BUTTON_WIDTH/4,
      button.y + 3 * BUTTON_HEIGHT/4,

      button.x + BUTTON_WIDTH/4,
      button.y + 3 * BUTTON_HEIGHT/4
    )
  elseif button.direction == 'down' then
    love.graphics.polygon(
      'fill',
      button.x + BUTTON_WIDTH/2,
      button.y + 3 * BUTTON_HEIGHT/4,

      button.x + BUTTON_WIDTH/4,
      button.y + BUTTON_HEIGHT/4,

      button.x + 3 * BUTTON_WIDTH/4,
      button.y + BUTTON_HEIGHT/4
    )
  end
end

return arrowButton;
