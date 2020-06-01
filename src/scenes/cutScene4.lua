local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local Talkies = require 'libs/talkies'
local scene = {}

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene5')
end

function scene.load()
  Talkies.say(
    'Quando Bob e ' .. playerName .. ' saem do local do campeonato, dois caras aparecem e os humilham dizendo coisas ruins para eles.',
    defaultNarratorTalkingConfig
  )
  Talkies.say(
    'Vocês não vão vencer, vão ser humilhados, nós vamos acabar com vocês, como é que pode um campeonato ' ..
    'desse deixar dois zé ninguém participar, vocês não são de nada, vão perder feio hahahaha',
    defaultShadTravisTalkingConfig
  )
  Talkies.say(
    'Ambos ficam com muita raiva e tentam partir para cima, mas duas garotas aparecem e os salvam dos dois babacas que estavam humilhando eles. ' ..
    'Elas os levam até a casa de ' .. playerName .. ' e conversam com eles. Uma delas (Melissa) diz:',
    defaultNarratorTalkingConfig
  )
  Talkies.say(
    'Tudo de negativo, pressão, desafios, é uma oportunidade para que eu me levante.',
    defaultMelissaTalkingConfig
  )
  Talkies.say(
    'Os dois ficam abismados com isso e agradecem todo cuidado que elas tiveram e então se conhecem.',
    defaultNarratorTalkingConfig
  )
  Talkies.say(
    'Quem são vocês, como são seus nomes?',
    defaultBobProtagonistTalkingConfig
  )
  Talkies.say(
    'Eu sou Melissa.',
    defaultMelissaTalkingConfig
  )
  Talkies.say(
    'Eu sou Windy e vocês?',
    defaultWindyTalkingConfig
  )
  Talkies.say(
    'Eu sou Bob',
    defaultBobTalkingConfig
  )
  Talkies.say(
    'Eu sou ' .. playerName,
    defaultProtagonistTalkingConfig
  )
  Talkies.say(
    'Após conversar um pouco elas vão embora',
    defaultNarratorTalkingConfig
  )
  Talkies.say(
    'Até logo!',
    defaultMelissaWindyTalkingConfig
  )
  Talkies.say(
    'Bob vai para sua casa e ' .. playerName .. ' vai dormir.',
    utils.tableWithAddedTable(
      defaultNarratorTalkingConfig,
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
  love.graphics.draw(assets.streetBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
