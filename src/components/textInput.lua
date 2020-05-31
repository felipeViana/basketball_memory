local components = {}
local textInput = {}
local utf8 = require('utf8')

local function makeNew(arg)
  return {
    name = '',
    flashing = false,
    loopCounter = 0,

    posX = arg.posX,
    posY = arg.posY,
    font = arg.font,
    maxSize = arg.maxSize or 20,
  }
end

function textInput.new(arg)
  local newTextInput = makeNew(arg)
  table.insert(
    components,
    newTextInput
  )

  return newTextInput;
end

function textInput.load()
  love.keyboard.setKeyRepeat(true)
end

function textInput.unload()
  components = {}
end

function textInput.update(dt)
  for _, component in pairs(components) do
    if component.loopCounter > 0.20 then
      component.flashing = not component.flashing
      component.loopCounter = 0
    end

    component.loopCounter = component.loopCounter + dt
  end
end

function textInput.draw()
  for _, component in pairs(components) do
    love.graphics.print(component.name, component.posX, component.posY)

    if component.flashing then
      love.graphics.print('|', component.posX + component.font:getWidth(component.name), component.posY)
    end
  end
end

function textInput.onChange(t)
  for _, component in pairs(components) do
    if string.len(component.name) < component.maxSize then
      component.name = component.name .. t
    end
  end
end

function textInput.keyPressed(key)
  for _, component in pairs(components) do
    if key == 'backspace' then
      local byteOffset = utf8.offset(component.name, -1)

      if byteOffset then
        component.name = string.sub(component.name, 1, byteOffset - 1)
      end
    end
  end
end

return textInput;
