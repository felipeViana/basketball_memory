local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'
local lume = require 'libs/lume'

local scene = {}
local music

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/credits')
end

function scene.load()
  Talkies.say(
    dictionary.localize('11-2.1'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('11-2.2'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('11-2.3'),
      characters.creator
  )
  Talkies.say(
    dictionary.localize('11-2.4'),
    lume.extend(
      characters.protagonist,
      {
        oncomplete = goToNextScreen,
      }
    )
  )

  music = assets.endingMusic
  music:play()
end

function scene.unload()
  Talkies.clearMessages()
end

function scene.update(dt)
  Talkies.update(dt)
end

function scene.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(assets.kobeBackground, 0, 0, 0, 1.4, 1.4)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
