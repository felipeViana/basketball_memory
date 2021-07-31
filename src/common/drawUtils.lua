local colors = require 'src/common/colors'
local globals = require 'src/common/globals'

local drawUtils = {};

local defaultTextBackgroundColor = {0, 0, 0}
local defaultTextForegroundColor = {1, 1, 1}

local MAX_WINDOW_WIDTH = 1920
local MAX_WINDOW_HEIGHT = 1080

local function _drawTextRectangle(arg)
  love.graphics.setColor(arg.textBackgroundColor)
  love.graphics.rectangle(
    'fill',
    arg.posX,
    arg.posY,
    arg.font:getWidth(arg.text),
    arg.font:getHeight(arg.text)
  )
  love.graphics.setColor(arg.textForegroundColor)
  love.graphics.setFont(arg.font)
  love.graphics.print(arg.text, arg.posX, arg.posY)
end

function drawUtils.drawTextRectangle(arg)
  if arg.font:type() ~= 'Font' then
    error('no font')
  elseif type(arg.posX) ~= 'number' then
    error('no posX')
  elseif type(arg.posY) ~= 'number' then
    error('no posY')
  elseif type(arg.text) ~= 'string' then
    error('no text')
  end

  _drawTextRectangle({
    text=arg.text,
    font=arg.font,
    posX=arg.posX,
    posY=arg.posY,
    textBackgroundColor=arg.textBackgroundColor or defaultTextBackgroundColor,
    textForegroundColor=arg.textForegroundColor or defaultTextForegroundColor,
  })
end

function drawUtils.drawRainbowCosText(startX, startY, text, font, time)
  for i=1, #text do
    for j=1, #colors.getRainbowColors() do
      local t1 = time + i*4 - j*2
      local y = startY + math.cos(t1*3)*20

      love.graphics.setColor(colors.getRainbowColors()[j])
      love.graphics.setFont(font)
      love.graphics.print(text:sub(i, i), startX + i * 30, y)
    end
  end
end

function drawUtils.getScreenDx()
  if love.graphics.getWidth() > MAX_WINDOW_WIDTH then
    return (love.graphics.getWidth() - MAX_WINDOW_WIDTH) / 2
  else
    return (love.graphics.getWidth() - globals.baseScreenWidth) / 2
  end
end

function drawUtils.getScreenDy()
  if love.graphics.getHeight() > MAX_WINDOW_HEIGHT then
    return (love.graphics.getHeight() - MAX_WINDOW_HEIGHT) / 2
  else
    return (love.graphics.getHeight() - globals.baseScreenHeight) / 2
  end
end

function drawUtils.drawBackground(image)
  local dx = 0
  local dy = 0
  if love.graphics.getWidth() > MAX_WINDOW_WIDTH then
    dx = (love.graphics.getWidth() - MAX_WINDOW_WIDTH) / 2
  end

  if love.graphics.getHeight() > MAX_WINDOW_HEIGHT then
    dy = (love.graphics.getHeight() - MAX_WINDOW_HEIGHT) / 2
  end

  -- always draw bgs at 0, 0
  love.graphics.translate(
    - drawUtils.getScreenDx() + dx / 2,
    - drawUtils.getScreenDy() + dy
  )

  love.graphics.draw(image)

  -- translate it back
  love.graphics.translate(
    drawUtils.getScreenDx() - dx / 2,
    drawUtils.getScreenDy() - dy
  )
end

return drawUtils;
