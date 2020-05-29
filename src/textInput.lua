local textInput = {}
local utf8 = require('utf8')

function textInput.load(arg)
  love.keyboard.setKeyRepeat(true)
  textInput.name = ''
  textInput.flashing = false
  textInput.loopCounter = 0

  textInput.posX = arg.posX
  textInput.posY = arg.posY
  textInput.font = arg.font
  textInput.maxSize = arg.maxSize or 20
end

function textInput.unload()
  textInput.flashing = false
  textInput.loopCounter = 0
end

function textInput.update(dt)
  if textInput.loopCounter > 0.14 then
    textInput.flashing = not textInput.flashing
    textInput.loopCounter = 0
  end

  textInput.loopCounter = textInput.loopCounter + dt
end

function textInput.draw()
  love.graphics.print(textInput.getName(), textInput.posX, textInput.posY)

  if textInput.flashing then
    love.graphics.print('|', textInput.posX + textInput.font:getWidth(textInput.getName()), textInput.posY)
  end
end

function textInput.getName()
  return textInput.name
end

function textInput.onChange(t)
  if string.len(textInput.getName()) < textInput.maxSize then
    textInput.name = textInput.getName() .. t
  end
end

function textInput.keyPressed(key)
  if key == 'backspace' then
    local byteOffset = utf8.offset(textInput.getName(), -1)

    if byteOffset then
      textInput.name = string.sub(textInput.getName(), 1, byteOffset - 1)
    end
  end
end

return textInput;
