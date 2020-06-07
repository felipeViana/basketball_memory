local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'

local menu = {};

local function startGame()
  sceneManager.changeScene(require 'src/scenes/chooseName')
end

local function goToStageSelection()
  sceneManager.changeScene(require 'src/menu/stageSelection')
end

local function goToSettings()
  sceneManager.changeScene(require 'src/menu/settings')
end

local function quitGame()
  love.event.quit(0)
end

function menu.load()
  buttonManager:load()
  buttonManager:newTextButton({
    text = dictionary.localize('StartGame'),
    fn = startGame,
    x = 100,
    y = 200,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('StageSelection'),
    fn = goToStageSelection,
    x = 100,
    y = 300,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('Settings'),
    fn = goToSettings,
    x = 100,
    y = 400,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('Exit'),
    fn = quitGame,
    x = 100,
    y = 500,
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
