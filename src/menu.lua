local menu = {};

function menu.load()
  love.graphics.setColor(255, 255, 255)
  font = love.graphics.newFont('assets/JMH Typewriter.ttf', 28)
  love.graphics.setFont(font)
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
