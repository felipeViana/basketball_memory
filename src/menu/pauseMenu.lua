local sceneManager = require 'src/common/sceneManager'
local btnManager = require 'src/components/buttonManager'
local dictionary = require 'src/common/dictionary'
local utils = require 'src/common/utils'
local assets = require 'src/common/assets'

local menu = {
  name = 'pauseMenu'
};

local buttonManager = utils.copyTable(btnManager)

local function goBack()
  menu.unload()
  sceneManager.popScene()
end

local function quitGame()
  love.event.quit(0)
end

function menu.load()
  buttonManager.load()
  buttonManager.newTextButton({
    text = dictionary.localize('GoBack'),
    fn = goBack,
    x = 450,
    y = 200,
  })
  buttonManager.newTextButton({
    text = dictionary.localize('Exit'),
    fn = quitGame,
    x = 450,
    y = 500,
  })
end

function menu.unload()
  buttonManager.unload()
end

function menu.update(dt)
  buttonManager.update(dt)
end

function menu.draw()
  love.graphics.setColor(128/255, 128/255, 0)
  love.graphics.rectangle(
    'fill',
    400,
    50,
    400,
    600
  )

  love.graphics.setColor(0, 0, 0)
  love.graphics.print('paused', 450, 70)
  buttonManager.draw()
end

function menu.mousereleased(_, _, button)
  buttonManager.mouseReleased(button)
end

return menu;
