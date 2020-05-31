local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local utils = require 'src/common/utils'
local Talkies = require 'libs/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(1, 1, 1)

  bgImage = assets.kobeBackground

  Talkies.font = assets.textFont
  Talkies.talkSound = assets.typeSound

  Talkies.say(
    'Criador',
    'E também com uma frase que ele mesmo disse:  Heróis vem e vão, mas lendas são para sempre',
    defaultPersonTalkingConfig
  )
  Talkies.say(
    'Narrador',
    'Em seguida a platéia vai a loucura, os participantes também e o criador olha para o vencedor e diz:'
  )
  Talkies.say(
    'Criador',
    'Haverá um campeonato maior que esse na cidade cérebro, e você como foi campeão tem o direito de participar sem ' ..
    'se inscrever porque você já está dentro dele e na fase de grupos, sem precisar passar do primeiro mata-mata.',
      defaultPersonTalkingConfig
  )
  Talkies.say(
    playerName,
    'Fico muito feliz por isso e agradeço a você e à todos que me ajudaram aqui e também quero dizer que sou fã ' ..
    'do Kobe e sua filha e muitas das frases que ele falou durante sua vida me inspiraram a estar aqui hoje. ' ..
    'Parabéns pelo seu trabalho e mais uma vez obrigado.',
    utils.tableWithAddedTable(
      defaultProtagonistTalkingConfig,
      {
        oncomplete = goToNextScreen,
      }
    )
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/credits')
end

function scene.unload()
  Talkies.clearMessages()
end

function scene.update(dt)
  Talkies.update(dt)
end

function scene.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(bgImage, 0, 0, 0, 1.4, 1.4)

  Talkies.draw()
end

function scene.keypressed(key)
  Talkies.keypressed(key)
end

return scene;
