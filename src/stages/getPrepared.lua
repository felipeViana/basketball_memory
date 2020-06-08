local sceneManager = require 'src/common/sceneManager'

local scene = {}

local TOTAL_TIME = 3
local initalTime
local timeLeft

function scene.load()
  initialTime = love.timer.getTime()
  timeLeft = TOTAL_TIME
end

function scene.comingBack()
  initialTime = timeLeft - TOTAL_TIME + love.timer.getTime()
end

function scene.update(dt)
  timeLeft = TOTAL_TIME - (love.timer.getTime() - initialTime)
  if timeLeft < 0 then
    sceneManager.popScene()
  end
end

function scene.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(
    'fill',
    250,
    150,
    500,
    400
  )

  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle(
    'line',
    250,
    150,
    500,
    400
  )
  love.graphics.print('Get prepared ...', 400, 300)
  love.graphics.print(string.format("%.0f", timeLeft), 400, 400)
end


return scene;
