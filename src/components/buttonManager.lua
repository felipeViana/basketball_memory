local textButton = require 'src/components/textButton'
local imageButton = require 'src/components/imageButton'
local arrowButton = require 'src/components/arrowButton'

local soundManager = require 'src/components/soundManager'
local assets = require 'src/common/assets'

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

function buttonManager:newArrowButton(arg)
  local newButton = arrowButton.new(arg)
  addNewButtonToTable(self, newButton)
  return newButton
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

function buttonManager:update(dt, verticalScroll)
  local dy = verticalScroll or 0
  local mouseX, mouseY = love.mouse.getPosition()

  for _, component in pairs(self.components) do
    component.hot = mouseX > component.x and mouseX < component.x + component.width and
                    mouseY > component.y + dy and mouseY < component.y + dy + component.height

    if self.mouseJustReleased and component.hot then
      soundManager.playSound(assets.selectSound)
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
    if component.type == 'arrowButton' then
      arrowButton.draw(component)
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
