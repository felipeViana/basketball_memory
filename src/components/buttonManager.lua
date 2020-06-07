local textButton = require 'src/components/textButton'
local imageButton = require 'src/components/imageButton'

local buttonManager = {
  components = {},
  mouseJustReleased,
}
buttonManager.meta = {
  __index = buttonManager,
}

function buttonManager.new()
  local newButtonManager = {}
  setmetatable(newButtonManager, buttonManager.meta)
  return newButtonManager
end

local function addNewButtonToTable(self, newButton)
  table.insert(
    self.components,
    newButton
  )
end

function buttonManager:newTextButton(arg)
  local newButton = textButton.new(arg)
  addNewButtonToTable(self, newButton)
  return newButton
end

function buttonManager:newImageButton(arg)
  local newButton = imageButton.new(arg)
  addNewButtonToTable(self, newButton)
  return newButton
end

function buttonManager:load()
  self.components = {}
  self.mouseJustReleased = false
end

function buttonManager:unload()
  self.components = {}
end

function buttonManager:update(dt)
  local mouseX, mouseY = love.mouse.getPosition()

  for _, component in pairs(self.components) do
    print(#self.components)
    component.hot = mouseX > component.x and mouseX < component.x + component.width and
                    mouseY > component.y and mouseY < component.y + component.height

    if self.mouseJustReleased and component.hot then
      component.fn()
    end
  end

  self.mouseJustReleased = false
end

function buttonManager:draw()
  for _, component in pairs(self.components) do
    if component.type == 'textButton' then
      textButton.draw(component)
    end
    if component.type == 'imageButton' then
      imageButton.draw(component)
    end
  end
end

function buttonManager:mouseReleased(btn)
  if btn == 1 then
    self.mouseJustReleased = true
  else
    self.mouseJustReleased = false
  end
end

return buttonManager;
