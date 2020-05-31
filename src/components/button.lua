local assets = require "src/assets"

local components = {}
local button = {}
local font

local BUTTON_HEIGHT = 64
local BUTTON_WIDTH = 300
local BUTTON_DEFAULT_COLOR = {0, 0, 0}
local BUTTON_HOT_COLOR = {148/255, 0, 211/255}
local TEXT_COLOR = {1, 1, 0}
local TEXT_LEFT_PADDING = 20
local mouseReleased

local function makeNew(text, fn, x, y)
  return {
    text = text,
    fn = fn,
    x = x,
    y = y,
    hot = false
  }
end

function button.new(text, fn, x, y)
  local newButton = makeNew(text, fn, x, y)
  table.insert(
    components,
    newButton
  )

  return newButton
end

function button.load()
  mouseReleased = false
  font = assets.squareFont
  love.graphics.setFont(font)
end

function button.unload()
  components = {}
end

function button.update(dt)
  for _, component in pairs(components) do
    if mouseReleased and component.hot then
      component.fn()
    end
  end

  mouseReleased = false
end

function button.draw()
  local mouseX, mouseY = love.mouse.getPosition()

  for _, component in pairs(components) do
    component.hot = mouseX > component.x and mouseX < component.x + BUTTON_WIDTH and
                mouseY > component.y and mouseY < component.y + BUTTON_HEIGHT

    local buttonColor = BUTTON_DEFAULT_COLOR
    if component.hot then
      buttonColor = BUTTON_HOT_COLOR
    end

    love.graphics.setColor(buttonColor)
    love.graphics.rectangle(
      'fill',
      component.x,
      component.y,
      BUTTON_WIDTH,
      BUTTON_HEIGHT
    )

    love.graphics.setColor(TEXT_COLOR)
    local textHeight = font:getHeight(component.text)
    love.graphics.print(
      component.text,
      font,
      component.x + TEXT_LEFT_PADDING,
      component.y + BUTTON_HEIGHT/2 - textHeight/2
    )
  end
end

function button.mouseReleased(btn)
  if btn == 1 then
    mouseReleased = true
  else
    mouseReleased = false
  end
end

return button;
