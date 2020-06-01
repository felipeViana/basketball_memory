local sceneManager = require 'src/common/sceneManager'
local buttonManager = require 'src/components/buttonManager'

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
  buttonManager.newTextButton({
    text = 'Start Game',
    fn = startGame,
    x = 100,
    y = 200,
  })
  buttonManager.newTextButton({
    text = 'Settings',
    fn = goToSettings,
    x = 100,
    y = 300,
  })
  buttonManager.newTextButton({
    text = 'Exit',
    fn = quitGame,
    x = 100,
    y = 400,
  })
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
