local sceneManager = require 'src/common/sceneManager'
local cardManager = require 'src/components/cardManager'
local assets = require 'src/common/assets'
local gridUtils = require 'src/common/gridUtils'

local TOTAL_TIME = 5

local stage = {}
local initialTime
local timeLeft

function stage.load()
  initialTime = love.timer.getTime()
  timeLeft = TOTAL_TIME - initialTime

  cardManager.load()
  local cards = cardManager.newPairs(6)

  local grid = gridUtils.makeGrid(6, 2)
  for i = 1, #cards do
    cards[i].x = grid[i][1]
    cards[i].y = grid[i][2]
  end
end

function stage.update(dt)
  local gameComplete = cardManager.update(dt)

  if gameComplete then
    sceneManager.changeScene(require 'src/scenes/cutScene11')
  end

  local gameOver
  -- gameOver =
  -- if gameOver then
  -- end
end

function stage.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(assets.stageBackground)

  local passedTime = love.timer.getTime() - initialTime
  love.graphics.print(string.format("tempo restante: %.2f", 5 - passedTime))


  cardManager.draw()
end

function stage.mousereleased(x, y, button)
  cardManager.mouseReleased(x, y, button)
end


return stage;
