local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'

local menu = {};

local function goToStage11()
  sceneManager.changeScene(require 'src/stages/stage1-1')
end

local function goToStage12()
  sceneManager.changeScene(require 'src/stages/stage1-2')
end

local function goToStage13()
  sceneManager.changeScene(require 'src/stages/stage1-3')
end

local function goToStage14()
  sceneManager.changeScene(require 'src/stages/stage1-4')
end

local function goToStage15()
  sceneManager.changeScene(require 'src/stages/stage1-5')
end

local function goToStage21()
  sceneManager.changeScene(require 'src/stages/stage2-1')
end

local function goBack()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

function menu.load()
  buttonManager:load()
  buttonManager:newTextButton({
    text = 'Stage 1-1',
    fn = goToStage11,
    x = 100,
    y = 50,
  })
  buttonManager:newTextButton({
    text = 'Stage 1-2',
    fn = goToStage12,
    x = 100,
    y = 150,
  })
  buttonManager:newTextButton({
    text = 'Stage 1-3',
    fn = goToStage13,
    x = 100,
    y = 250,
  })
  buttonManager:newTextButton({
    text = 'Stage 1-4',
    fn = goToStage14,
    x = 100,
    y = 350,
  })
  buttonManager:newTextButton({
    text = 'Stage 1-5',
    fn = goToStage15,
    x = 100,
    y = 450,
  })

  buttonManager:newTextButton({
    text = 'Stage 2-1',
    fn = goToStage21,
    x = 450,
    y = 50,
  })

  buttonManager:newTextButton({
    text = dictionary.localize('GoBack'),
    fn = goBack,
    x = 100,
    y = 600,
  })
end

function menu.unload()
  buttonManager:unload()
end

function menu.update(dt)
  buttonManager:update(dt)
end

function menu.draw()
  buttonManager:draw()
end

function menu.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return menu;
