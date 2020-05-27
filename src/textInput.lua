local textInput = {}
local utf8 = require('utf8')

function textInput.load(arg)
  love.keyboard.setKeyRepeat(true)
  textInput.name = ''
  textInput.flashing = false
  textInput.loopCounter = 0

  textInput.posX = arg.posX
  textInput.posY = arg.posY
  textInput.maxSize = arg.maxSize or 20
end

function textInput.unload()
  textInput.flashing = false
  textInput.loopCounter = 0
end

function textInput.update()
  if textInput.loopCounter == 14 then
    textInput.flashing = not textInput.flashing
    textInput.loopCounter = 0
  end

  textInput.loopCounter = textInput.loopCounter + 1
end

function textInput.draw()
  if string.len(textInput.getName()) == 0 and textInput.flashing then
    love.graphics.print('|', textInput.posX, textInput.posY)
  end

  love.graphics.print(textInput.getName(), textInput.posX, textInput.posY)
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
