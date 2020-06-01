local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'
local scene = {}

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene4')
end

function scene.load()
  Talkies.say(
    dictionary.localize('3.1'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('3.2'),
    characters.bob
  )
  Talkies.say(
    dictionary.localize('3.3'),
    utils.tableWithAddedTable(
      characters.protagonist,
      {
        oncomplete=goToNextScreen,
        textSpeed='medium'
      }
    )
  )
end

function scene.unload()
  Talkies.clearMessages()
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
