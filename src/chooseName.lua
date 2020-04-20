local sceneManager = require 'src/sceneManager'
local scene={};

local utf8 = require('utf8')

local name = ''
local shouldGoToNextScreen = false

function scene.load()
  love.graphics.setColor(255, 255, 255)
  font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(0, 0, 0)

  love.keyboard.setKeyRepeat(true)
end

function scene.unload()
  name = ''
  shouldGoToNextScreen = false
end

function scene.update(dt)
  if shouldGoToNextScreen then
    sceneManager.changeScene(require 'src/intro')
  end
end

function scene.draw()
  love.graphics.print('choose your name:', 100, 300)

  love.graphics.printf(name, 400, 300, love.graphics.getWidth())
end

function scene.textinput(t)
  name = name .. t
end

function scene.keypressed(key)
  if key == 'backspace' then
    local byteOffset = utf8.offset(name, -1)

    if byteOffset then
      name = string.sub(name, 1, byteOffset - 1)
    end
  end

  if key == 'return' then
    shouldGoToNextScreen = true
  end
end

return scene;
