local sceneManager = require 'src/sceneManager'
local Talkies = require 'libs/talkies/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(255, 255, 255)
  font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(0, 0, 0)

  bgImage = love.graphics.newImage("assets/bg_game.jpeg")

  Talkies.font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  Talkies.talkSound = love.audio.newSource("libs/talkies/example/assets/sfx/typeSound.wav", "static")
  Talkies.optionOnSelectSound = love.audio.newSource("libs/talkies/example/assets/sfx/optionSelect.wav", "static")
  Talkies.optionSwitchSound = love.audio.newSource("libs/talkies/example/assets/sfx/optionSwitch.wav", "static")

  Talkies.say(
    'Criador',
    'Senhoras e senhores, estamos próximos de começar um excelente campeonato de jogo da memória, mas esse está relacionado ao basquete. ' ..
    'Todas as cartas e modos de jogo vão estar ligadas ao basquete, irá ocorrer uma homenagem aqui, mas vocês terão que descobrir durante o torneio ' ..
    'hehehe! O campeonato será realizado da seguinte forma: nós teremos 16 participantes e já começaremos nas oitavas de final de final.'
  )
  Talkies.say(
    'Criador',
    'Cada participante terá três chances em cada modo de jogo. ' ..
    'Os modos de jogo serão dois, o jogo de memória clássico e o que você vê por um curto período de tempo e ' ..
    'em seguida você terá que lembrar onde estão as cartas iguais. E o melhor disso tudo é que tudo vai estar relacionado ao basquete hahaha!'
  )
  Talkies.say(
    'Criador',
    'Teremos tempo no jogo e alguns critérios de pontuação para os participantes. Um deles será passar dos níveis dos modos do jogo em menos tempo, ' ..
    'passar de cada modo e seus níveis sem perder nenhuma chance, perdendo só uma chance, perdendo duas chances. Cada uma terá uma certa pontuação. ' ..
    'Mas se perder todas as três chances o jogador será desclassificado. Cada jogador tem que ir até o fim e fazer a melhor pontuação possível.'
  )
  Talkies.say(
    'Criador',
    'Dos 16 participantes irão passar 8. Em seguidas iremos paras as quartas de final, depois semifinal com 4 e a final com 2 participante e em fim ' ..
    'terminamos.'
  )
  Talkies.say(
    'Criador',
    'A premiação será: o terceiro lugar ganhará uma medalha de bronze, um jogo da memória novo, uma camisa de basquete e uma quantia ' ..
    'mínima de dinheiro (200R$). O segundo lugar irá ganhar a medalha de prata, um jogo da memória novo, uma bola de basquete e uma quantia razoável ' ..
    'em dinheiro(500R$).'
  )
  Talkies.say(
    'Criador',
    'O campeão vai ganhar um jogo da memória novinho, um troféu, uma medalha de ouro, uma bola de basquete, uma camisa de basquete, ' ..
    'um brinde bem especial e um bom dinheiro(1000R$).'
  )
  Talkies.say(
    'Criador',
     'E vocês irão assistir isso tudo em um telão! Só não vale assoprar para os participantes em, ' ..
     'eu estarei de olho, porque se não eles serão desclassificados hahahaha! Então, Quem quer se inscrever?',
    {
      oncomplete = goToNextScreen
    }
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene3')
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
  love.graphics.print("cena 2", windowWidth/4, windowHeight/4)
end

function scene.keypressed(key)
  if key == 'space' then
    Talkies.onAction()
  elseif key == 'up' then
    Talkies.prevOption()
  elseif key == 'down' then
    Talkies.prevOption()
  end
end

return scene;