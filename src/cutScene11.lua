local sceneManager = require 'src/sceneManager'
local Talkies = require 'libs/talkies/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(1, 1, 1)
  font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(1, 1, 1)

  bgImage = love.graphics.newImage("assets/bg_game.jpeg")

  Talkies.font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  Talkies.talkSound = love.audio.newSource("libs/talkies/example/assets/sfx/typeSound.wav", "static")
  Talkies.optionOnSelectSound = love.audio.newSource("libs/talkies/example/assets/sfx/optionSelect.wav", "static")
  Talkies.optionSwitchSound = love.audio.newSource("libs/talkies/example/assets/sfx/optionSwitch.wav", "static")

  Talkies.say(
    'Criador',
    'Meu povo, hehe, o final do campeonato chegou, finalmente conhecemos o campeão, agora vamos para a cerimônia de premiação. ' ..
    'Mas antes quero revelar a vocês a homenagem que fiz aqui e olha que me surpreendi, pois andando por aí eu escutei algumas frases ' ..
    'da pessoa que estou homenageando aqui, nao tinha como ser mais incrivel esse campeonato. Dêem uma salva de palmas pra todos agora por favor!'
  )
  Talkies.say(
    'Criador',
    'Agora sim vou divulgar o segredo desse campeonato! Lá vai. ' ..
    'Esse jogo foi realizado não só para meu ganho pessoal, mas para homenagear uma lenda do basquete juntamente com sua filha, ' ..
    'pois eles morreram muito cedo e está muito recente também. Eu sou fã dos dois e encerro essa premiação mostrando essa imagem para vocês:',
    {
      oncomplete = goToNextScreen,
    }
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/cutScene11-2')
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
  elseif key == 'up' then
    Talkies.prevOption()
  elseif key == 'down' then
    Talkies.prevOption()
  end
end

return scene;
