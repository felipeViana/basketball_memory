local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local utils = require 'src/common/utils'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'

local scene = {}
local music

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene2')
end

function scene.load()
  Talkies.say(
    dictionary.localize('1.1'),
    utils.tableWithAddedTable(
      characters.narrator,
      {
        textSpeed='medium',
      }
    )
  )
  Talkies.say(
    dictionary.localize('1.2'),
    utils.tableWithAddedTable(
      characters.narrator,
      {
        oncomplete = goToNextScreen,
      }
    )
  )

  music = assets.scene1Music
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
  love.graphics.draw(assets.daliBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
