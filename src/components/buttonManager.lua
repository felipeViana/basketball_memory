local textButton = require 'src/components/textButton'
local imageButton = require 'src/components/imageButton'

local components = {}
local button = {}

local mouseReleased

local function addNewButtonToTable(newButton)
  table.insert(
    components,
    newButton
  )
end

function button.newTextButton(arg)
  local newButton = textButton.new(arg)
  addNewButtonToTable(newButton)
  return newButton
end

function button.newImageButton(arg)
  local newButton = imageButton.new(arg)
  addNewButtonToTable(newButton)
  return newButton
end

function button.load()
  mouseReleased = false
end

function button.unload()
  components = {}
end

function button.update(dt)
  local mouseX, mouseY = love.mouse.getPosition()

  for _, component in pairs(components) do
    component.hot = mouseX > component.x and mouseX < component.x + component.width and
                    mouseY > component.y and mouseY < component.y + component.height

    if mouseReleased and component.hot then
      component.fn()
    end
  end

  mouseReleased = false
end

function button.draw()
  for _, component in pairs(components) do
    if component.type == 'textButton' then
      textButton.draw(component)
    end
    if component.type == 'imageButton' then
      imageButton.draw(component)
    end
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
