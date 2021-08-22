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

local totalTime = 45
local numberOfTries = 10
local errorsDiscountTime = false
local timeToShowCardsBeforeStarting = 0
local scoresGainTime = false

local texts = {}

local menu = {}

-- ===================
-- = Local Functions =
-- ===================

local function goBack()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

local function goToCustomStage()
  local args = {
    totalTime = totalTime,
    numberOfTries = numberOfTries,
    timeToShowCardsBeforeStarting = timeToShowCardsBeforeStarting,
    errorsDiscountTime = errorsDiscountTime,
    scoresGainTime = scoresGainTime
  }

  sceneManager.changeScene(require 'src/stages/customStage', args)
end

local function lessTime()
  if totalTime > 5 then
    totalTime = totalTime - 5
  end
end
local function moreTime()
  if totalTime < 250 then
    totalTime = totalTime + 5
  end
end

local function lessTries()
  if numberOfTries > 1 then
    numberOfTries = numberOfTries - 1
  end
end
local function moreTries()
  if numberOfTries < 50 then
    numberOfTries = numberOfTries + 1
  end
end

local function lessShowTime()
  if timeToShowCardsBeforeStarting > 0 then
    timeToShowCardsBeforeStarting = timeToShowCardsBeforeStarting - 1
  end
end
local function moreShowTime()
  if timeToShowCardsBeforeStarting < 5 then
    timeToShowCardsBeforeStarting = timeToShowCardsBeforeStarting + 1
  end
end

local function toggleErrorsDiscountTime()
  errorsDiscountTime = not errorsDiscountTime
end

local function toggleScoresGainTime()
  scoresGainTime = not scoresGainTime
end
-- ==================
-- = Love Callbacks =
-- ==================

function menu.load()
  love.graphics.setBackgroundColor(colors.gray)

  totalTime = 45
  numberOfTries = 10
  errorsDiscountTime = false
  timeToShowCardsBeforeStarting = 0
  scoresGainTime = false

  texts = {
    dictionary.localize("total time:"),
    dictionary.localize("number of tries:"),
    dictionary.localize("errors discount time ?:"),
    dictionary.localize("show cards for how long ?:"),
    dictionary.localize("scores gain time ?:")
  }

  local textFont = assets.squareFont

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

  buttonManager:newTextButton({
    text = '-',
    fn = lessTime,
    x = GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[1]),
    y = GRID_Y + DELTA_Y,
    width = 25,
    height = 35,
  })
  buttonManager:newTextButton({
    text = '+',
    fn = moreTime,
    x = GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[1]) + 85,
    y = GRID_Y + DELTA_Y,
    width = 25,
    height = 35,
  })

  buttonManager:newTextButton({
    text = '-',
    fn = lessTries,
    x = GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[2]),
    y = GRID_Y + 2 * DELTA_Y,
    width = 25,
    height = 35,
  })
  buttonManager:newTextButton({
    text = '+',
    fn = moreTries,
    x = GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[2]) + 75,
    y = GRID_Y + 2 * DELTA_Y,
    width = 25,
    height = 35,
  })

  buttonManager:newCheckBoxButton({
    fn = toggleErrorsDiscountTime,
    x = GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[3]),
    y = GRID_Y + 3 * DELTA_Y,
  })

  buttonManager:newTextButton({
    text = '-',
    fn = lessShowTime,
    x = GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[4]),
    y = GRID_Y + 4 * DELTA_Y,
    width = 25,
    height = 35,
  })
  buttonManager:newTextButton({
    text = '+',
    fn = moreShowTime,
    x = GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[4]) + 75,
    y = GRID_Y + 4 * DELTA_Y,
    width = 25,
    height = 35,
  })


  buttonManager:newCheckBoxButton({
    fn = toggleScoresGainTime,
    x = GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[5]),
    y = GRID_Y + 5 * DELTA_Y,
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
  love.graphics.print(texts[1], GRID_X + DELTA_X, GRID_Y + DELTA_Y)
  love.graphics.print(texts[2], GRID_X + DELTA_X, GRID_Y + 2 * DELTA_Y)
  love.graphics.print(texts[3], GRID_X + DELTA_X, GRID_Y + 3 * DELTA_Y)
  love.graphics.print(texts[4], GRID_X + DELTA_X, GRID_Y + 4 * DELTA_Y)
  love.graphics.print(texts[5], GRID_X + DELTA_X, GRID_Y + 5 * DELTA_Y)

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

  love.graphics.print(totalTime, GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[1]) + 35, GRID_Y + DELTA_Y)
  love.graphics.print(numberOfTries, GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[2]) + 35, GRID_Y + 2 * DELTA_Y)
  love.graphics.print(timeToShowCardsBeforeStarting, GRID_X + 1.5 * DELTA_X + textFont:getWidth(texts[4]) + 35, GRID_Y + 4 * DELTA_Y)

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
