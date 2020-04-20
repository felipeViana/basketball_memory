local sceneManager = require 'src/sceneManager'
local Talkies = require 'libs/talkies/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(1, 1, 1)
  font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(1, 1, 1)

  avatar = love.graphics.newImage("libs/talkies/example/assets/Obey_Me.png")
  Talkies.font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)

  Talkies.talkSound = love.audio.newSource("libs/talkies/example/assets/sfx/typeSound.wav", "static")
  Talkies.optionOnSelectSound = love.audio.newSource("libs/talkies/example/assets/sfx/optionSelect.wav", "static")
  Talkies.optionSwitchSound = love.audio.newSource("libs/talkies/example/assets/sfx/optionSwitch.wav", "static")

  Talkies.say(
    'Narrador',
    'Olá ' .. playerName .. '!'
  )
  Talkies.say(
    'Narrador',
    'Memória!--É o que podemos deixar de melhor ou pior quando partimos. Podemos ser inspiração ou frustração, podemos ser heróis ou vilões, podemos ser várias coisas, pois tudo é história.',
    {
      oncomplete = goToNextScreen,
      textSpeed = "slow",
      image=avatar
    }
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/cutScene1')
end

function scene.unload()
end

function scene.update(dt)
  Talkies.update(dt)
end

function scene.draw()
  Talkies.draw()

  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("press space to continue", windowWidth/4, windowHeight/4)
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
