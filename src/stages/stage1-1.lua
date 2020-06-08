local sceneManager = require 'src/common/sceneManager'
local cardManager = require 'src/components/cardManager'
local stageHUD = require 'src/components/stageHUD'
local assets = require 'src/common/assets'

local TOTAL_TIME = 20

local stage = {}
local initialTime
local timeLeft

local function exitStage()
  sceneManager.changeScene(require 'src/menu/stageSelection')
end

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
    exitStage()
  end

  local gameOver = timeLeft < 0
  if gameOver then
    exitStage()
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
