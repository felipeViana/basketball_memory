local sceneManager = require 'src/common/sceneManager'
local btnManager = require 'src/components/buttonManager'
local dictionary = require 'src/common/dictionary'
local utils = require 'src/common/utils'

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
    x = 100,
    y = 200,
  })
  buttonManager.newTextButton({
    text = dictionary.localize('Exit'),
    fn = quitGame,
    x = 100,
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
  love.graphics.print('paused', 600, 300)
  buttonManager.draw()
end

function menu.mousereleased(_, _, button)
  buttonManager.mouseReleased(button)
end

return menu;
