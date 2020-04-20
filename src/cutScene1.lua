local sceneManager = require 'src/sceneManager'
local Talkies = require 'libs/talkies/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(255, 255, 255)
  font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(0, 0, 0)

  Talkies.font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)

  Talkies.talkSound = love.audio.newSource("libs/talkies/example/assets/sfx/typeSound.wav", "static")
  Talkies.optionOnSelectSound = love.audio.newSource("libs/talkies/example/assets/sfx/optionSelect.wav", "static")
  Talkies.optionSwitchSound = love.audio.newSource("libs/talkies/example/assets/sfx/optionSwitch.wav", "static")

  Talkies.say(
    'Narrador',
    '(Começa o jogo com o criador explicando para a cidade como será o campeonato. Ele comentará que esse jogo vai homenagear alguém, mas não dirá quem é e então falará dos prêmios que serão. camisa, bolas, medalhas, troféus, dinheiro e uma carta especial. Tudo será dito por eles apenas superficialmente.)',
    {
      oncomplete = goToNextScreen
    }
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/card')
end

function scene.unload()
end

function scene.update(dt)
  Talkies.update(dt)
end

function scene.draw()
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
