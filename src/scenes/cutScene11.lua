local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'

local scene = {}
local music

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene11-2')
end

function scene.load()
  Talkies.say(
    dictionary.localize('11.1'),
    characters.creator
  )
  Talkies.say(
    dictionary.localize('11.2'),
    utils.tableWithAddedTable(
      characters.creator,
      {
        oncomplete = goToNextScreen,
      }
    )
  )

  music = assets.scene11Music
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
  love.graphics.draw(assets.podiumBackground, 0, 0, 0, 0.8, 0.8)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
