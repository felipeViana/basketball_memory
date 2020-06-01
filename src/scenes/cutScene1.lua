local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local dictionary = require 'src/common/dictionary'
local Talkies = require 'libs/talkies'

local scene = {}

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene2')
end

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(1, 1, 1)

  Talkies.font = assets.textFont
  Talkies.talkSound = assets.typeSound

  Talkies.say(
    'Narrador',
    dictionary.localize('1.1') .. playerName .. '!',
    {
      textSpeed='medium',
    }
  )
  Talkies.say(
    'Narrador',
    dictionary.localize('1.2'),
    {
      oncomplete = goToNextScreen,
    }
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
  love.graphics.draw(assets.daliBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
