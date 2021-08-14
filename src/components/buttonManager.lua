local assets = require 'src/common/assets'
local drawUtils = require 'src/common/drawUtils'
local globals = require 'src/common/globals'

local textButton = require 'src/components/textButton'
local imageButton = require 'src/components/imageButton'
local arrowButton = require 'src/components/arrowButton'
local checkBoxButton = require 'src/components/checkBoxButton'

local soundManager = require 'src/components/soundManager'


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


function buttonManager:newCheckBoxButton(arg)
  local newButton = checkBoxButton.new(arg)
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
  mouseX = mouseX - drawUtils.getScreenDx()
  mouseY = mouseY - drawUtils.getScreenDy()

  for _, component in pairs(self.components) do
    component.visible = component.onHeader or component.y + dy >= globals.headerHeight
    component.hot = component.visible and mouseX > component.x and mouseX < component.x + component.width and mouseY > component.y + dy and mouseY < component.y + dy + component.height

    if component.disabledFunction then
      if component.disabledFunction() then
        component.disabled = true
      else
        component.disabled = false
      end
    end

    if self.mouseJustReleased and component.hot then
      if not component.disabled then
        soundManager.playSound(assets.selectSound)
      end
      -- TODO: play disabled sound

      component.checked = not component.checked
      component.fn()
    end
  end

  self.mouseJustReleased = false
end

function buttonManager:draw()
  for _, component in pairs(self.components) do
    if component.visible then
      if component.type == 'textButton' then
        textButton.draw(component)
      elseif component.type == 'imageButton' then
        imageButton.draw(component)
      elseif component.type == 'arrowButton' then
        arrowButton.draw(component)
      elseif component.type == 'checkBoxButton' then
        checkBoxButton.draw(component)
      else
        error("buttonManager: button draw not implemented")
      end
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
