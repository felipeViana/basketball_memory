local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local basicCutscene = require 'src/scenes/basicCutscene'
local messagesCreator = require 'src/common/messagesCreator'

local scene = {}

local music = assets.scene6Music
local background = assets.basketballCourtBackground

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene13-2')
end

function scene.load()
  local messages = messagesCreator.getMessage('13-1', goToNextScreen)
  basicCutscene.load(messages, music)
end

function scene.unload()
  basicCutscene.unload()
end

function scene.update(dt)
  basicCutscene.update(dt)
end

function scene.draw()
  basicCutscene.draw(background)
end

function scene.keypressed(key)
  basicCutscene.keypressed(key)
end

function scene.mousereleased()
  basicCutscene.mousereleased()
end

return scene;
