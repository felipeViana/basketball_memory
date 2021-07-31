local sceneManager = require 'src/common/sceneManager'
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'
local colors = require 'src/common/colors'

local buttonManager = (require 'src/components/buttonManager').new()

local menu = {
  name = 'pauseMenu'
};

local GRID_X = 380
local GRID_Y = 25

local WIDTH = 420
local HEIGHT = 500

local BUTTON_WIDTH = 200

local function goBack()
  sceneManager.popScene()
end

local function goToMenu()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

local function quitGame()
  love.event.quit(0)
end

function menu.load()
  buttonManager:load()
  buttonManager:newTextButton({
    text = dictionary.localize('GoBack'),
    fn = goBack,
    x = GRID_X + WIDTH / 2 - BUTTON_WIDTH / 2,
    y = GRID_Y + 125,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('ExitToMenu'),
    fn = goToMenu,
    x = GRID_X + WIDTH / 2 - BUTTON_WIDTH / 2,
    y = GRID_Y + 200,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('ExitGame'),
    fn = quitGame,
    x = GRID_X + WIDTH / 2 - BUTTON_WIDTH / 2,
    y = GRID_Y + HEIGHT - 100,
  })
end

function menu.unload()
  buttonManager:unload()
end

function menu.update(dt)
  buttonManager:update(dt)
end

function menu.draw()
  love.graphics.setColor(colors.lightgray)
  love.graphics.rectangle(
    'fill',
    GRID_X,
    GRID_Y,
    WIDTH,
    HEIGHT
  )

  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(
    'line',
    GRID_X,
    GRID_Y,
    WIDTH,
    HEIGHT
  )
  love.graphics.setFont(assets.squareFont)
  love.graphics.print('paused', GRID_X + WIDTH / 2 - 50, 70)
  buttonManager:draw()
end

function menu.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return menu;
