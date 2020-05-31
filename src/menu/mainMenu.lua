local sceneManager = require 'src/common/sceneManager'
local buttonManager = require 'src/components/button'

local menu = {};

local function startGame()
  sceneManager.changeScene(require 'src/scenes/chooseName')
end

local function goToSettings()
  sceneManager.changeScene(require 'src/menu/settings')
end

local function quitGame()
  love.event.quit(0)
end

function menu.load()
  buttonManager.load()
  buttonManager.new(
    'Start Game',
    startGame,
    100,
    200
  )
  buttonManager.new(
    'Settings',
    goToSettings,
    100,
    300
  )
  buttonManager.new(
    'Exit',
    quitGame,
    100,
    400
  )
end

function menu.unload()
  buttonManager.unload()
end

function menu.update(dt)
  buttonManager.update(dt)
end

function menu.draw()
  buttonManager.draw()
end

function menu.mousereleased(_, _, button)
  buttonManager.mouseReleased(button)
end

return menu;
