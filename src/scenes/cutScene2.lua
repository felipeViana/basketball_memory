local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local Talkies = require 'libs/talkies'
local scene = {}

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene3')
end

function scene.load()
  Talkies.say(
    'Senhoras e senhores, estamos próximos de começar um excelente campeonato de jogo da memória, mas esse está relacionado ao basquete. ' ..
    'Todas as cartas e modos de jogo vão estar ligadas ao basquete, irá ocorrer uma homenagem aqui, mas vocês terão que descobrir durante o torneio ' ..
    'hehehe! O campeonato será realizado da seguinte forma: nós teremos 16 participantes e já começaremos nas oitavas de final de final.',
    defaultCreatorTalkingConfig
  )
  Talkies.say(
    'Cada participante terá três chances em cada modo de jogo. ' ..
    'Os modos de jogo serão dois, o jogo de memória clássico e o que você vê por um curto período de tempo e ' ..
    'em seguida você terá que lembrar onde estão as cartas iguais. E o melhor disso tudo é que tudo vai estar relacionado ao basquete hahaha!',
    defaultCreatorTalkingConfig
  )
  Talkies.say(
    'Teremos tempo no jogo e alguns critérios de pontuação para os participantes. Um deles será passar dos níveis dos modos do jogo em menos tempo, ' ..
    'passar de cada modo e seus níveis sem perder nenhuma chance, perdendo só uma chance, perdendo duas chances. Cada uma terá uma certa pontuação. ' ..
    'Mas se perder todas as três chances o jogador será desclassificado. Cada jogador tem que ir até o fim e fazer a melhor pontuação possível.',
    defaultCreatorTalkingConfig
  )
  Talkies.say(
    'Dos 16 participantes irão passar 8. Em seguidas iremos paras as quartas de final, depois semifinal com 4 e a final com 2 participante e em fim ' ..
    'terminamos.',
    defaultCreatorTalkingConfig
  )
  Talkies.say(
    'A premiação será: o terceiro lugar ganhará uma medalha de bronze, um jogo da memória novo, uma camisa de basquete e uma quantia ' ..
    'mínima de dinheiro (200R$). O segundo lugar irá ganhar a medalha de prata, um jogo da memória novo, uma bola de basquete e uma quantia razoável ' ..
    'em dinheiro(500R$).',
    defaultCreatorTalkingConfig
  )
  Talkies.say(
    'O campeão vai ganhar um jogo da memória novinho, um troféu, uma medalha de ouro, uma bola de basquete, uma camisa de basquete, ' ..
    'um brinde bem especial e um bom dinheiro(1000R$).',
    defaultCreatorTalkingConfig
  )
  Talkies.say(
     'E vocês irão assistir isso tudo em um telão! Só não vale assoprar para os participantes em, ' ..
     'eu estarei de olho, porque se não eles serão desclassificados hahahaha! Então, Quem quer se inscrever?',
     utils.tableWithAddedTable(
      defaultCreatorTalkingConfig,
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
