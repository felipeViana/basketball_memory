local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'
local lume = require 'libs/lume'

local scene = {}
local music

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene3-3')
end

function scene.load()
  Talkies.say(
    dictionary.localize('3-2.1'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.2'),
    characters.protagonist
  )
  Talkies.say(
    dictionary.localize('3-2.3'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.4'),
    characters.protagonist
  )
  Talkies.say(
    dictionary.localize('3-2.5'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.6'),
    characters.protagonist
  )
  Talkies.say(
    dictionary.localize('3-2.7'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('3-2.8'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.9'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('3-2.10'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.11'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('3-2.12'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.13'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('3-2.14'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.15'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('3-2.16'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.17'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('3-2.18'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.19'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('3-2.20'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('3-2.21'),
    lume.extend(
      characters.bob,
      {
        oncomplete=goToNextScreen,
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
