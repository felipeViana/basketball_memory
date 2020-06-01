local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local Talkies = require 'libs/talkies'
local scene = {}

local function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene6')
end

function scene.load()
  Talkies.say(
    'No dia seguinte ' .. playerName .. ' acorda e vai até a casa do Bob. ' ..
    'Eles já estão um pouco atrasados, mas ele precisava pesquisar algo sobre dor no computador e só podia ' ..
    'fazer isso na casa do Bob porque não tinha um em casa. Lá ele faz a pesquisa sobre dor e acaba encontrando a seguinte frase:',
    defaultNarratorTalkingConfig
  )
  Talkies.say(
    'A dor não diz quando você deve parar. A dor é a vozinha em sua cabeça que tenta impedi-lo, pois sabe que, se você continuar, você irá mudar.',
    defaultNarratorTalkingConfig
  )
  Talkies.say(
    playerName .. ' então ele ergue a cabeça e diz para Bob:',
    defaultNarratorTalkingConfig
  )
  Talkies.say(
    'Vamo vencer esse campeonato meu rival!',
    utils.tableWithAddedTable(
      defaultProtagonistTalkingConfig,
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
  love.graphics.draw(assets.animeHouseBackground)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
