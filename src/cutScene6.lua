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
    'Narrador',
    'Chegando no local do campeonato, um pouco atrasados, eles vêem o Criador prestes a começar o torneio e a plateia já está no local. ' ..
    'Os jogadores terão um computador para poder visualizar o jogo. Será dividido agora as chaves e cada jogador irá para seu lugar.'
  )
  Talkies.say(
    'Criador',
    'Prestem atenção, porque agora a partida está apenas começando. Este é o lugar onde a diversão começa. Que comecem os jogos!',
    {
      oncomplete = goToNextScreen,
    }
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/stage1-1')
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
