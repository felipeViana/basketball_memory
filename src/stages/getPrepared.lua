local sceneManager = require 'src/common/sceneManager'
local globals = require 'src/common/globals'
local dictionary = require 'src/common/dictionary'

local scene = {}

local TOTAL_TIME = 3
local initalTime
local timeLeft

local GRID_X = 100
local GRID_Y = 100
local WIDTH = 600
local HEIGHT = 400

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
  love.graphics.setColor(0, 0, 0, 0.75)
  love.graphics.rectangle(
    'fill',
    0,
    0,
    globals.baseScreenWidth,
    globals.baseScreenHeight
  )

  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle(
    'fill',
    GRID_X,
    GRID_Y,
    WIDTH,
    HEIGHT
  )

  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle(
    'line',
    GRID_X,
    GRID_Y,
    WIDTH,
    HEIGHT
  )
  love.graphics.print(dictionary.localize('Get prepared') .. ' ...', GRID_X + WIDTH / 3, GRID_Y + 50)
  love.graphics.print(string.format("%.0f", timeLeft), GRID_X + WIDTH / 2 - 25, GRID_Y + HEIGHT / 2)
end


return scene;
