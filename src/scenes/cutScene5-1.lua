local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'
local lume = require 'libs/lume'

local scene = {}
local music

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene5-2')
end

function scene.load()
  Talkies.say(
    dictionary.localize('5-1.1'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('5-1.2'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('5-1.3'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('5-1.4'),
    lume.extend(
      characters.protagonist,
      {
        oncomplete = goToNextScreen,
      }
    )
  )

  music = assets.scene5Music
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
  love.graphics.draw(assets.animeHouseBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;