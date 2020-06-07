local sceneManager = require 'src/common/sceneManager'
local buttonManager = require 'src/components/buttonManager'
local dictionary = require 'src/common/dictionary'

local menu = {};

local function goToStage11()
  sceneManager.changeScene(require 'src/stages/stage1-1')
end

local function goBack()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

function menu.load()
  buttonManager.load()
  buttonManager.newTextButton({
    text = 'Stage 1-1',
    fn = goToStage11,
    x = 100,
    y = 200,
  })
  buttonManager.newTextButton({
    text = dictionary.localize('GoBack'),
    fn = goBack,
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
  buttonManager.draw()
end

function menu.mousereleased(_, _, button)
  buttonManager.mouseReleased(button)
end

return menu;
