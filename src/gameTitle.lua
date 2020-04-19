local gameTitle = {};

function gameTitle.load()
  love.graphics.setColor(255, 255, 255)
  font = love.graphics.newFont(14)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(0, 0, 0)
end

function gameTitle.update()
end

function gameTitle.draw()
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()

  love.graphics.print("Basketball memory game", windowWidth/2, windowHeight/2)


  love.graphics.print("press any key to continue", windowWidth/2, windowHeight/2+200)
end

function gameTitle.mousereleased(x, y, button, istouch)
end

function gameTitle.keypressed( ... )
  sceneManager.changeScene(require 'src/menu.lua')
end

return gameTitle;
