local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'
local scene = {}

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
    utils.tableWithAddedTable(
      characters.creator,
      {
        oncomplete = goToNextScreen
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
  love.graphics.draw(assets.trophyBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
