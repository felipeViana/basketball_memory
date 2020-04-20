local sceneManager = require 'src/sceneManager'
local scene={};

local utf8 = require('utf8')

local name = ''

function scene.load()
  love.graphics.setColor(255, 255, 255)
  font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(0, 0, 0)

  love.keyboard.setKeyRepeat(true)
end

function scene.unload()
  name = ''
end

function scene.update(dt)

end

function scene.draw()
  love.graphics.print('type your name', 100, 100)
  love.graphics.print('press enter to continue', 100, 150)

  love.graphics.print('choose your name:', 100, 400)

  love.graphics.printf(name, 400, 400, love.graphics.getWidth())
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

  if key == 'return' and string.len(name) > 0 then
    playerName = name
    sceneManager.changeScene(require 'src/intro')
  end
end

return scene;
