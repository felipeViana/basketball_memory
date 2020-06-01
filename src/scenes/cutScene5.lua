local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local dictionary = require 'src/common/dictionary'
local characters = require 'src/common/characters'
local Talkies = require 'libs/talkies'
local scene = {}

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene6')
end

function scene.load()
  Talkies.say(
    dictionary.localize('5.1'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('5.2'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('5.3'),
    characters.narrator
  )
  Talkies.say(
    dictionary.localize('5.4'),
    utils.tableWithAddedTable(
      characters.protagonist,
      {
        oncomplete = goToNextScreen,
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
  love.graphics.draw(assets.animeHouseBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
