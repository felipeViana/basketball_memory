local menu = {};

function menu.load()
  love.graphics.setColor(0, 0, 0)
  font = love.graphics.newFont(14)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(223/255, 255/255, 249/255)
end

function menu.update()
end

function menu.draw()
  -- love.graphics.print({"Left: ", lives}, 80, 30, 0, 2, 2)
  love.graphics.print("olá", 100, 100)
  -- love.graphics.printf("olá", 100, 100)
end

function menu.mousereleased(x, y, button, istouch)
end

return menu;
