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
    'Quando Bob e ' .. playerName .. ' saem do local do campeonato, dois caras aparecem e os humilham dizendo coisas ruins para eles.'
  )
  Talkies.say(
    'Shad e Travis',
    'Vocês não vão vencer, vão ser humilhados, nós vamos acabar com vocês, como é que pode um campeonato ' ..
    'desse deixar dois zé ninguém participar, vocês não são de nada, vão perder feio hahahaha'
  )
  Talkies.say(
    'Narrador',
    'Ambos ficam com muita raiva e tentam partir para cima, mas duas garotas aparecem e os salvam dos dois babacas que estavam humilhando eles. ' ..
    'Elas os levam até a casa do jovem garoto e conversam com eles. Uma delas (Melissa) diz:'
  )
  Talkies.say(
    'Melissa',
    'Tudo de negativo, pressão, desafios, é uma oportunidade para que eu me levante.'
  )
  Talkies.say(
    'Narrador',
    'Os dois ficam abismados com isso e agradecem todo cuidado que elas tiveram e então se conhecem.'
  )
  Talkies.say(
    playerName .. ' e Bob',
    'Quem são vocês, como são seus nomes?'
  )
  Talkies.say(
    'Melissa',
    'Eu sou Melissa.'
  )
  Talkies.say(
    'Windy',
    'Eu sou Windy e vocês?'
  )

  Talkies.say(
    'Bob',
    'Eu sou Bob'
  )
  Talkies.say(
    playerName,
    'Eu sou ' .. playerName
  )
  Talkies.say(
    'Narrador',
    'Após conversar um pouco elas vão embora'
  )
  Talkies.say(
    'Melissa e Windy',
    'Até logo!'
  )
  Talkies.say(
    'Narrador',
    'Bob vai para sua casa e ' .. playerName .. ' vai dormir.',
    {
      oncomplete = goToNextScreen,
    }
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/cutScene5')
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
