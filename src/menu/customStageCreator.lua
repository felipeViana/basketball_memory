-- ============
-- = Requires =
-- ============

local globals = require 'src/common/globals'
local colors = require 'src/common/colors'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'

local buttonManager = (require 'src/components/buttonManager').new()

local sceneManager = require 'src/common/sceneManager'

-- ========
-- = Data =
-- ========

local menu = {}

-- ===================
-- = Local Functions =
-- ===================

local function goBack()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

local function goToCustomStage()
  local args = {
    time = 45,
    showCardsBeforeStarting = true
  }

  sceneManager.changeScene(require 'src/stages/customStage', args)
end

-- ==================
-- = Love Callbacks =
-- ==================

function menu.load()
  buttonManager:load()

  buttonManager:newArrowButton({
    fn = goBack,
    x = 25,
    y = 25,
    direction = 'left',
    onHeader = true,
  })

  buttonManager:newTextButton({
    text = 'GO',
    fn = goToCustomStage,
    x = 400,
    y = 400,
  })
end

function menu.unload()
  buttonManager:unload()
end

function menu.update(dt)
  buttonManager:update(dt)
end

function menu.draw()
  love.graphics.print("I was here")


  -- header
  love.graphics.setColor(colors.lightgray)
  love.graphics.rectangle(
    'fill',
    0,
    0,
    globals.baseScreenWidth,
    globals.headerHeight
  )


  local textFont = assets.squareFont
  love.graphics.setFont(textFont)
  love.graphics.setColor(colors.black)

  local titleText = dictionary.localize('CustomStage')

  local textWidth = textFont:getWidth(titleText)
  local textHeight = textFont:getHeight(titleText)

  love.graphics.print(titleText, globals.baseScreenWidth / 2 - textWidth / 2, 50 - textHeight / 2)

  buttonManager:draw()
end

-- ==========
-- = Inputs =
-- ==========

-- mouse buttons
function menu.mousereleased(x, y, button, istouch)
  buttonManager:mouseReleased(button)
end

-- mouse wheel
function menu.wheelmoved(x, y)
end

-- keyboard
function menu.keypressed(key)
end

-- text field
function menu.textinput(text)
end

return menu;
