local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local globals = require 'src/common/globals'
local colors = require 'src/common/colors'

local buttonManager = (require 'src/components/buttonManager').new()

local settings = {};
local music

local GRID_X = 400
local GRID_Y = 200
local DELTA_Y = 75

local function toggleFullScreen()
  love.window.setFullscreen(not love.window.getFullscreen())
end

local function goToChooseLanguage()
  sceneManager.changeScene(require 'src/scenes/chooseLanguage', true)
end

local function goBack()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

function settings.load()
  buttonManager:load()

  buttonManager:newArrowButton({
    fn = goBack,
    x = 25,
    y = 25,
    direction = 'left',
    onHeader = true,
  })

  buttonManager:newTextButton({
    text = dictionary.localize('ToggleFullscreen'),
    fn = toggleFullScreen,
    x = GRID_X,
    y = GRID_Y,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('ChooseLanguage'),
    fn = goToChooseLanguage,
    x = GRID_X,
    y = GRID_Y + DELTA_Y,
  })

  music = assets.menuMusic
  music:play()
end

function settings.unload()
  buttonManager:unload()
  music:pause()
end

function settings.update(dt)
  buttonManager:update(dt)
end

function settings.draw()
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

  local titleText = dictionary.localize('Settings')

  local textWidth = textFont:getWidth(titleText)
  local textHeight = textFont:getHeight(titleText)

  love.graphics.print(titleText, globals.baseScreenWidth / 2 - textWidth / 2, 50 - textHeight / 2)

  buttonManager:draw()
end

function settings.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return settings;
