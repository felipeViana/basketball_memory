local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local Talkies = require 'libs/talkies'
local scene = {}

local function goToNextScreen()
  sceneManager.changeScene(require 'src/stages/stage1-1')
end

function scene.load()
  Talkies.say(
    'Chegando no local do campeonato, um pouco atrasados, eles vêem o Criador prestes a começar o torneio e a plateia já está no local. ' ..
    'Os jogadores terão um computador para poder visualizar o jogo. Será dividido agora as chaves e cada jogador irá para seu lugar.',
    defaultNarratorTalkingConfig
  )
  Talkies.say(
    'Prestem atenção, porque agora a partida está apenas começando. Este é o lugar onde a diversão começa. Que comecem os jogos!',
    utils.tableWithAddedTable(
      defaultCreatorTalkingConfig,
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
  love.graphics.draw(assets.basketballCourtBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
