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
    characters.shad
  )
  Talkies.say(
    dictionary.localize('4.3'),
    characters.travis
  )
  Talkies.say(
    dictionary.localize('4.4'),
    characters.shad
  )
  Talkies.say(
    dictionary.localize('4.5'),
    characters.travis
  )
  Talkies.say(
    dictionary.localize('4.6'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('4.7'),
    characters.windy
  )
  Talkies.say(
    dictionary.localize('4.8'),
    characters.melissa
  )
  Talkies.say(
    dictionary.localize('4.9'),
    characters.windy
  )
  Talkies.say(
    dictionary.localize('4.10'),
    characters.shad
  )
  Talkies.say(
    dictionary.localize('4.11'),
    characters.windy
  )
  Talkies.say(
    dictionary.localize('4.12'),
    characters.travis
  )
  Talkies.say(
    dictionary.localize('4.13'),
    characters.melissa
  )
  Talkies.say(
    dictionary.localize('4.14'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('4.15'),
    characters.protagonist
  )
  Talkies.say(
    dictionary.localize('4.16'),
    characters.windy
  )
  Talkies.say(
    dictionary.localize('4.17'),
    characters.melissa
  )
  Talkies.say(
    dictionary.localize('4.18'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('4.19'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('4.20'),
    characters.melissa
  )
  Talkies.say(
    dictionary.localize('4.21'),
    characters.windy
  )
  Talkies.say(
    dictionary.localize('4.22'),
    characters.protagonist
  )
  Talkies.say(
    dictionary.localize('4.23'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('4.24'),
    characters.melissa
  )
  Talkies.say(
    dictionary.localize('4.25'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('4.26'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('4.27'),
    characters.protagonist
  )
  Talkies.say(
    dictionary.localize('4.28'),
    characters.windy
  )
  Talkies.say(
    dictionary.localize('4.29'),
    characters.melissa
  )
  Talkies.say(
    dictionary.localize('4.30'),
    characters.protagonist
  )
  Talkies.say(
    dictionary.localize('4.31'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('4.32'),
    characters.melissaWindy
  )
  Talkies.say(
    dictionary.localize('4.33'),
    characters.bobProtagonist
  )
  Talkies.say(
    dictionary.localize('4.34'),
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
