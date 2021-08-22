local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local drawUtils = require 'src/common/drawUtils'

local cardManager = require 'src/components/cardManager'
local stageHUD = require 'src/components/stageHUD'
local soundManager = require 'src/components/soundManager'

local stageManager = {
  music,

  initialTime,
  timeLeft,
  TOTAL_TIME,
  errorsDiscountTime,
  numberOfTries,
  limitedTries,

  stageName,
  goToNextStage,

  showCardsBeforeStarting,
}
stageManager.meta = {
  __index = stageManager,
}

function stageManager:new()
  local newStageManager = {}
  setmetatable(newStageManager, stageManager.meta)
  return newStageManager
end

function stageManager:load(arg)
  self.initialTime = love.timer.getTime()
  self.TOTAL_TIME = arg.totalTime
  self.timeLeft = self.TOTAL_TIME
  self.errorsDiscountTime = arg.errorsDiscountTime

  self.timeGainedPerScore = arg.timeGainedPerScore
  self.scoresGainTime = arg.timeGainedPerScore ~= nil and arg.timeGainedPerScore > 0

  self.numberOfTries = arg.numberOfTries
  self.limitedTries = arg.numberOfTries ~= nil

  self.goToNextStage = arg.goToNextStage
  self.stageName = arg.stageName

  self.timeToShowCardsBeforeStarting = arg.timeToShowCardsBeforeStarting
  self.showCardsBeforeStarting = arg.timeToShowCardsBeforeStarting ~= nil and arg.timeToShowCardsBeforeStarting > 0

  cardManager.load(self.showCardsBeforeStarting, self.timeToShowCardsBeforeStarting)
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

local function removeTry(self)
  if self.limitedTries then
    self.numberOfTries = self.numberOfTries - 1
  end
end

local function gainTime(self)
  if self.scoresGainTime then
    self.initialTime = self.initialTime + self.timeGainedPerScore
  end
end

local function discountTime(self)
  if self.errorsDiscountTime then
    self.initialTime = self.initialTime - 5
  end
end

local function updateTime(self)
  self.timeLeft = self.TOTAL_TIME - (love.timer.getTime() - self.initialTime)
end

local function winGame(self)
  sceneManager.pushScene(require 'src/stages/winStageScreen', self.goToNextStage)
  soundManager.playSound(assets.winningSound)
end

local function gameOver()
  sceneManager.pushScene(require 'src/stages/gameOverScreen')
  soundManager.playSound(assets.losingSound)
end

function stageManager:update(dt)
  local gameComplete, hasMissed, hasScored = cardManager.update(dt)

  if hasMissed then
    removeTry(self)
    discountTime(self)
  end

  if hasScored then
    gainTime(self)
  end

  updateTime(self)

  if gameComplete then
    winGame(self)
  end

  if self.timeLeft < 0 or (self.limitedTries and self.numberOfTries < 0) then
    gameOver()
  end

  stageHUD.update(dt, hasMissed, hasScored)
end

function stageManager:draw()
  love.graphics.setColor(1, 1, 1)

  drawUtils.drawBackground(assets.stageBackground)

  cardManager.draw()
  stageHUD.draw(self.timeLeft, self.limitedTries, self.numberOfTries, self.stageName, self.errorsDiscountTime, self.scoresGainTime, self.timeGainedPerScore)
end

function stageManager:mouseReleased(button)
  cardManager.mouseReleased(button)
end

return stageManager;
