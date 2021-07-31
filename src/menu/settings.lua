local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'

local settings = {};
local music

local GRID_X = 400
local GRID_Y = 100
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
  buttonManager:newTextButton({
    text = dictionary.localize('GoBack'),
    fn = goBack,
    x = GRID_X,
    y = GRID_Y + 5 * DELTA_Y,
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
  buttonManager:draw()
end

function settings.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return settings;
