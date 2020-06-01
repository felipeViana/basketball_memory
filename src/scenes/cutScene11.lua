local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local Talkies = require 'libs/talkies'
local scene = {}

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene11-2')
end

function scene.load()
  Talkies.say(
    'Meu povo, hehe, o final do campeonato chegou, finalmente conhecemos o campeão, agora vamos para a cerimônia de premiação. ' ..
    'Mas antes quero revelar a vocês a homenagem que fiz aqui e olha que me surpreendi, pois andando por aí eu escutei algumas frases ' ..
    'da pessoa que estou homenageando aqui, nao tinha como ser mais incrivel esse campeonato. Dêem uma salva de palmas pra todos agora por favor!',
    defaultCreatorTalkingConfig
  )
  Talkies.say(
    'Agora sim vou divulgar o segredo desse campeonato! Lá vai. ' ..
    'Esse jogo foi realizado não só para meu ganho pessoal, mas para homenagear uma lenda do basquete juntamente com sua filha, ' ..
    'pois eles morreram muito cedo e está muito recente também. Eu sou fã dos dois e encerro essa premiação mostrando essa imagem para vocês:',
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
  love.graphics.draw(assets.podiumBackground, 0, 0, 0, 0.8, 0.8)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
