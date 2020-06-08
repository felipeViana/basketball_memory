local sceneManager = require 'src/common/sceneManager'
local cardManager = require 'src/components/cardManager'
local stageHUD = require 'src/components/stageHUD'
local assets = require 'src/common/assets'

local stageManager = {
  initialTime,
  timeLeft,
  TOTAL_TIME,
  errorsDiscountTime,
}
stageManager.meta = {
  __index = stageManager,
}

function stageManager:new()
  local newStageManager = {}
  setmetatable(newStageManager, stageManager.meta)
  return newStageManager
end

function stageManager:load(totalTime, errorsDiscountTime)
  self.initialTime = love.timer.getTime()
  self.TOTAL_TIME = totalTime
  self.timeLeft = self.TOTAL_TIME
  self.errorsDiscountTime = errorsDiscountTime

  cardManager.load()
  cardManager.newPairs(4, 3)
  stageHUD.load()
end

function stageManager:comingBack()
  self.initialTime = self.timeLeft - self.TOTAL_TIME + love.timer.getTime()
end

function stageManager:unload()
  stageHUD.unload()
  cardManager.unload()
end

function stageManager:update(dt)
  self.timeLeft = self.TOTAL_TIME - (love.timer.getTime() - self.initialTime)
  local gameComplete = cardManager.update(dt)

  if gameComplete then
    sceneManager.pushScene(require 'src/stages/winStageScreen')
  end

  local gameOver = self.timeLeft < 0
  if gameOver then
    sceneManager.pushScene(require 'src/stages/gameOverScreen')
  end

  stageHUD.update(dt)
end

function stageManager:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(assets.stageBackground)

  cardManager.draw()
  stageHUD.draw(self.timeLeft)
end

function stageManager:mouseReleased(button)
  cardManager.mouseReleased(button)
  stageHUD.mouseReleased(button)
end

return stageManager;
