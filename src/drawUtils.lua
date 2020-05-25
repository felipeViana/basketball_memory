local drawUtils = {};

local defaultTextBackgroundColor = {0, 0, 0}
local defaultTextForegroundColor = {1, 1, 1}

function _drawTextRectangle(arg)
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

return drawUtils;
