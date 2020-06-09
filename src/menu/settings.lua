local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'

local settings = {};
local music

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
    x = 400,
    y = 200,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('ChooseLanguage'),
    fn = goToChooseLanguage,
    x = 400,
    y = 300,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('GoBack'),
    fn = goBack,
    x = 400,
    y = 500,
  })

  music = assets.menuMusic
  music:setLooping(true)
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
