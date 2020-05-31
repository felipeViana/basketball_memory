local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local Talkies = require 'libs/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(1, 1, 1)

  bgImage = assets.genericBackground

  Talkies.font = assets.textFont
  Talkies.talkSound = assets.typeSound

  Talkies.say(
    'Narrador',
    'Quando Bob e ' .. playerName .. ' saem do local do campeonato, dois caras aparecem e os humilham dizendo coisas ruins para eles.'
  )
  Talkies.say(
    'Shad e Travis',
    'Vocês não vão vencer, vão ser humilhados, nós vamos acabar com vocês, como é que pode um campeonato ' ..
    'desse deixar dois zé ninguém participar, vocês não são de nada, vão perder feio hahahaha',
    defaultPersonTalkingConfig
  )
  Talkies.say(
    'Narrador',
    'Ambos ficam com muita raiva e tentam partir para cima, mas duas garotas aparecem e os salvam dos dois babacas que estavam humilhando eles. ' ..
    'Elas os levam até a casa de ' .. playerName .. ' e conversam com eles. Uma delas (Melissa) diz:'
  )
  Talkies.say(
    'Melissa',
    'Tudo de negativo, pressão, desafios, é uma oportunidade para que eu me levante.',
    defaultPersonTalkingConfig
  )
  Talkies.say(
    'Narrador',
    'Os dois ficam abismados com isso e agradecem todo cuidado que elas tiveram e então se conhecem.'
  )
  Talkies.say(
    playerName .. ' e Bob',
    'Quem são vocês, como são seus nomes?',
    defaultPersonTalkingConfig
  )
  Talkies.say(
    'Melissa',
    'Eu sou Melissa.',
    defaultPersonTalkingConfig
  )
  Talkies.say(
    'Windy',
    'Eu sou Windy e vocês?',
    defaultPersonTalkingConfig
  )

  Talkies.say(
    'Bob',
    'Eu sou Bob',
    defaultBobTalkingConfig
  )
  Talkies.say(
    playerName,
    'Eu sou ' .. playerName,
    defaultPersonTalkingConfig
  )
  Talkies.say(
    'Narrador',
    'Após conversar um pouco elas vão embora'
  )
  Talkies.say(
    'Melissa e Windy',
    'Até logo!',
    defaultPersonTalkingConfig
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
  sceneManager.changeScene(require 'src/scenes/cutScene5')
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
  love.graphics.print("cena 4", windowWidth/4, windowHeight/4)
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
