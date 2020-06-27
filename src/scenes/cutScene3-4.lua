local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'
local lume = require 'libs/lume'

local scene = {}
local music

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene4')
end

local function onNoAnswer( ... )
  -- body
end

function scene.load()
  Talkies.say(
    dictionary.localize('3-4.1'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('3-4.2'),
    characters.protagonist
  )
  Talkies.say(
    dictionary.localize('3-4.3'),
    lume.extend(
      characters.creator,
      {
        leftBody = assets.protagonistBody,
        rightBody = assets.creatorBody,
      }
    )
  )
  Talkies.say(
    dictionary.localize('3-4.4'),
    lume.extend(
      characters.protagonist,
      {
        rightBody = assets.creatorBody,
      }
    )
  )
  Talkies.say(
    dictionary.localize('3-4.5'),
    lume.extend(
      characters.creator,
      {
        leftBody = assets.protagonistBody,
        rightBody = assets.creatorBody,
        options = {
          {'Sim', goToNextScreen},
          {'Não', goToNextScreen},
        },
      }
    )
  )

  music = assets.scene3Music
  music:play()
end

function scene.unload()
  Talkies.clearMessages()
  music:stop()
end

function scene.update(dt)
  Talkies.update(dt)
end

function scene.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(assets.kameHouseBackground, 0, 0, 0, 0.5, 0.5)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
