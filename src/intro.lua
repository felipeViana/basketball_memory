local scene = {}

function scene.load()
  love.graphics.setColor(255, 255, 255)
  font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(0, 0, 0)
end

function scene.unload()
end

function scene.update(dt)
end

function scene.draw()
  love.graphics.print('olá', 100, 300)
  love.graphics.printf(playerName, 170, 300, love.graphics.getWidth())
end

function scene.keypressed(key)
  -- if key == 'return' then
  --   sceneManager.changeScene(require 'src/intro')
  -- end
end

return scene;
