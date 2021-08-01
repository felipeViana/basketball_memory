local sceneManager = require 'src/common/sceneManager'
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'
local colors = require 'src/common/colors'
local globals = require 'src/common/globals'

local buttonManager = (require 'src/components/buttonManager').new()

local menu = {
  name = 'pauseMenu'
};

local GRID_X = 300
local GRID_Y = 25

local WIDTH = 400
local HEIGHT = 500

local BUTTON_WIDTH = 200

local function goBack()
  sceneManager.popScene()
end

local function goToMenu()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

function menu.load(originScene)
  buttonManager:load()
  buttonManager:newTextButton({
    text = dictionary.localize('GoBack'),
    fn = goBack,
    x = GRID_X + WIDTH / 2 - BUTTON_WIDTH / 2,
    y = GRID_Y + 125,
  })

  if originScene.name ~= 'mainMenu' then
    buttonManager:newTextButton({
      text = dictionary.localize('ExitToMenu'),
      fn = goToMenu,
      x = GRID_X + WIDTH / 2 - BUTTON_WIDTH / 2,
      y = GRID_Y + HEIGHT - 100,
    })
  end
end

function menu.unload()
  buttonManager:unload()
end

function menu.update(dt)
  buttonManager:update(dt)
end

function menu.draw()
  love.graphics.setColor(0, 0, 0, 0.75)
  love.graphics.rectangle(
    'fill',
    0,
    0,
    globals.baseScreenWidth,
    globals.baseScreenHeight
  )

  love.graphics.setColor(colors.orange)
  love.graphics.rectangle(
    'fill',
    GRID_X,
    GRID_Y,
    WIDTH,
    HEIGHT
  )

  love.graphics.setColor(colors.black)
  love.graphics.rectangle(
    'line',
    GRID_X,
    GRID_Y,
    WIDTH,
    HEIGHT
  )

  local textFont = assets.squareFont
  love.graphics.setFont(textFont)

  local titleText = dictionary.localize('Paused')
  local textWidth = textFont:getWidth(titleText)
  love.graphics.print(titleText, GRID_X + WIDTH / 2 - textWidth / 2, 50)
  buttonManager:draw()
end

function menu.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return menu;
