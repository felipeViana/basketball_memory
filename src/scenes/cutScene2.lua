local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'
local lume = require 'libs/lume'

local scene = {}
local music

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene3')
end

function scene.load()
  Talkies.say(
    dictionary.localize('2.1'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('2.2'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('2.3'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('2.4'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('2.5'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('2.6'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('2.7'),
    lume.extend(
      characters.creator,
      {
        oncomplete = goToNextScreen
      }
    )
  )

  music = assets.scene2Music
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
  love.graphics.draw(assets.trophyBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
