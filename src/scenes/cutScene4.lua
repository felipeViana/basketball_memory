local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'
local lume = require 'libs/lume'

local scene = {}
local music

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene5')
end

function scene.load()
  Talkies.say(
    dictionary.localize('4.1'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('4.2'),
    characters.shadTravis
  )
  Talkies.say(
    dictionary.localize('4.3'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('4.4'),
    characters.melissa
  )
  Talkies.say(
    dictionary.localize('4.5'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('4.6'),
    characters.bobProtagonist
  )
  Talkies.say(
    dictionary.localize('4.7'),
    characters.melissa
  )
  Talkies.say(
    dictionary.localize('4.8'),
    characters.windy
  )
  Talkies.say(
    dictionary.localize('4.9'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('4.10'),
    characters.protagonist
  )
  Talkies.say(
    dictionary.localize('4.11'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('4.12'),
    characters.melissaWindy
  )
  Talkies.say(
    dictionary.localize('4.13'),
    lume.extend(
      characters.narrator,
      {
        oncomplete = goToNextScreen,
      }
    )
  )

  music = assets.streetMusic
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
  love.graphics.draw(assets.streetBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
