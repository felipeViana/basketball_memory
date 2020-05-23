local sceneManager = require 'src/sceneManager'
local assets = require 'src/assets'
local utils = require 'src/utils'
local Talkies = require 'libs/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(1, 1, 1)

  bgImage = assets.genericBackground

  Talkies.font = assets.textFont
  Talkies.talkSound = assets.talkSound

  Talkies.say(
    'Criador',
    'Meu povo, hehe, o final do campeonato chegou, finalmente conhecemos o campeão, agora vamos para a cerimônia de premiação. ' ..
    'Mas antes quero revelar a vocês a homenagem que fiz aqui e olha que me surpreendi, pois andando por aí eu escutei algumas frases ' ..
    'da pessoa que estou homenageando aqui, nao tinha como ser mais incrivel esse campeonato. Dêem uma salva de palmas pra todos agora por favor!',
    defaultPersonTalkingConfig
  )
  Talkies.say(
    'Criador',
    'Agora sim vou divulgar o segredo desse campeonato! Lá vai. ' ..
    'Esse jogo foi realizado não só para meu ganho pessoal, mas para homenagear uma lenda do basquete juntamente com sua filha, ' ..
    'pois eles morreram muito cedo e está muito recente também. Eu sou fã dos dois e encerro essa premiação mostrando essa imagem para vocês:',
    utils.tableWithAddedTable(
      defaultPersonTalkingConfig,
      {
        oncomplete = goToNextScreen,
      }
    )
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene11-2')
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
end

function scene.keypressed(key)
  if key == 'space' then
    Talkies.onAction()
  end
end

return scene;
