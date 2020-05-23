local sceneManager = require 'src/sceneManager'
local assets = require 'src/assets'
local Talkies = require 'libs/talkies'
local scene = {}

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(1, 1, 1)

  Talkies.font = assets.textFont
  Talkies.talkSound = assets.typeSound

  Talkies.say(
    'Narrador',
    'Olá ' .. playerName .. '!'
  )
  Talkies.say(
    'Narrador',
    'Memória!--É o que podemos deixar de melhor ou pior quando partimos. Podemos ser inspiração ou frustração, podemos ser heróis ou vilões, podemos ser várias coisas, pois tudo é história.',
    {
      oncomplete = goToNextScreen,
    }
  )
end

function goToNextScreen()
  sceneManager.changeScene(require 'src/scenes/cutScene2')
end

function scene.unload()
  Talkies.clearMessages()
end

function scene.update(dt)
  Talkies.update(dt)
end

function scene.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(assets.bgImage, 0, 0, 0, 1, 1)

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
