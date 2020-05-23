local sceneManager = require 'src/sceneManager'
local assets = require 'src/assets'
local utils = require 'src/utils'
local Talkies = require 'libs/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(1, 1, 1)

  bgImage = assets.bgImage

  Talkies.font = assets.textFont
  Talkies.talkSound = assets.typeSound

  Talkies.say(
    'Narrador',
    'Chegando no local do campeonato, um pouco atrasados, eles vêem o Criador prestes a começar o torneio e a plateia já está no local. ' ..
    'Os jogadores terão um computador para poder visualizar o jogo. Será dividido agora as chaves e cada jogador irá para seu lugar.'
  )
  Talkies.say(
    'Criador',
    'Prestem atenção, porque agora a partida está apenas começando. Este é o lugar onde a diversão começa. Que comecem os jogos!',
    utils.tableWithAddedTable(
      defaultPersonTalkingConfig,
      {
        oncomplete = goToNextScreen,
      }
    )
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/stages/stage1-1')
end

function scene.unload()
  Talkies.clearMessages()
end

function scene.update(dt)
  Talkies.update(dt)
end

function scene.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(bgImage, 0, 0, 0, 1, 1)

  Talkies.draw()

  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("cena 6", windowWidth/4, windowHeight/4)
end

function scene.keypressed(key)
  if key == 'space' then
    Talkies.onAction()
  end
end

return scene;
