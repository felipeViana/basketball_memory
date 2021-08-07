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

local GRID_X = 200
local GRID_Y = 150

local WIDTH = 650
local HEIGHT = 300

local DELTA_X = 50
local DELTA_Y = 50

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
    text = dictionary.localize('Go'),
    fn = goToCustomStage,
    x = globals.baseScreenWidth / 2 - 100,
    y = 475,
  })
end

function menu.unload()
  buttonManager:unload()
end

function menu.update(dt)
  buttonManager:update(dt)
end

function menu.draw()
  -- container rectangle
  love.graphics.setColor(colors.white)
  love.graphics.rectangle(
    'line',
    GRID_X,
    GRID_Y,
    WIDTH,
    HEIGHT
  )

  love.graphics.setColor(colors.black)
  love.graphics.print("total time:", GRID_X + DELTA_X, GRID_Y + DELTA_Y)
  love.graphics.print("number of tries:", GRID_X + DELTA_X, GRID_Y + 2 * DELTA_Y)
  love.graphics.print("errors discount time ?:", GRID_X + DELTA_X, GRID_Y + 3 * DELTA_Y)
  love.graphics.print("show cards before starting ?:", GRID_X + DELTA_X, GRID_Y + 4 * DELTA_Y)

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

  -- buttons
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
