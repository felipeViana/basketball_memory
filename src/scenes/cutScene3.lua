local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local Talkies = require 'libs/talkies'
local scene = {}

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene4')
end

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(1, 1, 1)

  Talkies.font = assets.textFont
  Talkies.talkSound = assets.typeSound

  Talkies.say(
    'Narrador',
    playerName .. ' então vai até sua casa e quando ele pega o dinheiro, ele para e senta no sofá de sua casa e pensa se devia fazer isso ou não. ' ..
    'Ele então muito pensativo recebe a visita de seu melhor amigo (Bob) que o viu chegando às pressas em sua casa. ' ..
    'Eles conversam rapidamente e Bob diz pra ele:'
  )
  Talkies.say(
    'Bob',
    'Vamos, é preciso se atrever para ser grande.',
    {
      image=assets.bob,
      talkSound=assets.talkSound,
      typedNotTalked=false,
    }
  )
  Talkies.say(
    playerName,
    'De onde ele tirou isso?',
    utils.tableWithAddedTable(
      defaultProtagonistTalkingConfig,
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
