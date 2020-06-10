local sceneManager = require 'src/common/sceneManager'
local cardManager = require 'src/components/cardManager'
local stageHUD = require 'src/components/stageHUD'
local assets = require 'src/common/assets'

local stageManager = {
  music,

  initialTime,
  timeLeft,
  TOTAL_TIME,
  errorsDiscountTime,
  numberOfErrors,
  limitedErrors,
}
stageManager.meta = {
  __index = stageManager,
}

function stageManager:new()
  local newStageManager = {}
  setmetatable(newStageManager, stageManager.meta)
  return newStageManager
end

function stageManager:load(totalTime, errorsDiscountTime, numberOfErrors)
  self.initialTime = love.timer.getTime()
  self.TOTAL_TIME = totalTime
  self.timeLeft = self.TOTAL_TIME
  self.errorsDiscountTime = errorsDiscountTime

  self.numberOfErrors = numberOfErrors
  self.limitedErrors = numberOfErrors ~= nil

  cardManager.load()
  cardManager.newPairs(4, 3)
  stageHUD.load()

  self.music = assets.inGameMusic
  self.music:play()
end

function stageManager:comingBack()
  self.initialTime = self.timeLeft - self.TOTAL_TIME + love.timer.getTime()
end

function stageManager:unload()
  stageHUD.unload()
  cardManager.unload()
  self.music:stop()
end

function stageManager:update(dt)
  local gameComplete, hasMissed = cardManager.update(dt)

  if self.limitedErrors and hasMissed then
    self.numberOfErrors = self.numberOfErrors - 1
  end

  if hasMissed and self.errorsDiscountTime then
    self.initialTime = self.initialTime - 5
  end

  self.timeLeft = self.TOTAL_TIME - (love.timer.getTime() - self.initialTime)

  if gameComplete then
    sceneManager.pushScene(require 'src/stages/winStageScreen')
  end

  local gameOver = self.timeLeft < 0 or (self.limitedErrors and self.numberOfErrors < 0)
  if gameOver then
    sceneManager.pushScene(require 'src/stages/gameOverScreen')
  end

  stageHUD.update(dt)
end

function stageManager:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(assets.stageBackground)

  cardManager.draw()
  stageHUD.draw(self.timeLeft, self.limitedErrors, self.numberOfErrors)
end

function stageManager:mouseReleased(button)
  cardManager.mouseReleased(button)
  stageHUD.mouseReleased(button)
end

return stageManager;
