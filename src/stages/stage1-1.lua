local sceneManager = require 'src/common/sceneManager'
local cardManager = require 'src/components/cardManager'
local stageHUD = require 'src/components/stageHUD'
local assets = require 'src/common/assets'

local TOTAL_TIME = 60

local stage = {}
local initialTime
local timeLeft

function stage.load()
  initialTime = love.timer.getTime()
  timeLeft = TOTAL_TIME

  cardManager.load()
  cardManager.newPairs(4, 3)
  stageHUD.load()
end

function stage.comingBack()
  initialTime = timeLeft - TOTAL_TIME + love.timer.getTime()
end

function stage.unload()
  stageHUD.unload()
  cardManager.unload()
end

function stage.update(dt)
  timeLeft = TOTAL_TIME - (love.timer.getTime() - initialTime)
  local gameComplete = cardManager.update(dt)

  if gameComplete then
    sceneManager.pushScene(require 'src/stages/winStageScreen')
  end

  local gameOver = timeLeft < 0
  if gameOver then
    sceneManager.pushScene(require 'src/stages/gameOverScreen')
  end

  stageHUD.update(dt)
end

function stage.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(assets.stageBackground)

  cardManager.draw()
  stageHUD.draw(timeLeft)
end

function stage.mousereleased(_, _, button)
  cardManager.mouseReleased(button)
  stageHUD.mouseReleased(button)
end

return stage;
