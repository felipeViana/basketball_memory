local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local colors = require 'src/common/colors'
local dictionary = require 'src/common/dictionary'

local hud = {}

local STRETCHING_TIME = 0.3
local stretching = STRETCHING_TIME
local bigFont = true

local JUST_MISSED_TIME = 1
local showingJustMissed = false
local justMissedRemainingTime = 0

local JUST_SCORED_TIME = 1
local showingJustScored = false
local justScoredRemainingTime = 0

local GRID_X = 550
local DELTA_X = 75
local GRID_Y = 100
local DELTA_Y = 75
local REMAINING_TIME_POSITION = {['x'] = GRID_X, ['y'] = GRID_Y + 3 * DELTA_Y}
local JUST_MISSED_TIME_POSITION = {['x'] = GRID_X + 200, ['y'] = GRID_Y + 3 * DELTA_Y + 30}
local JUST_SCORED_TIME_POSITION = {['x'] = GRID_X + 200, ['y'] = GRID_Y + 3 * DELTA_Y + 50}

function hud.load()
  justMissedRemainingTime = 0
  justScoredRemainingTime = 0

  sceneManager.pushScene(require 'src/stages/getPrepared')
end

function hud.unload()
end

local function calculateFontStretching(dt)
  if stretching > 0 then
    stretching = stretching - dt
  elseif stretching < 0 then
    stretching = STRETCHING_TIME
  end
end

local function updateFontStretching(dt)
  calculateFontStretching(dt)
  if stretching < 0 then
    bigFont = not bigFont
  end
end

local function updateShowingJustMissed(dt)
  if showingJustMissed then
    justMissedRemainingTime = justMissedRemainingTime - dt
  end
  if justMissedRemainingTime < 0 then
    showingJustMissed = false
  end
end

local function updateShowingJustScored(dt)
  if showingJustScored then
    justScoredRemainingTime = justScoredRemainingTime - dt
  end
  if justScoredRemainingTime < 0 then
    showingJustScored = false
  end
end

local function updateTimers(dt)
  updateFontStretching(dt)
  updateShowingJustMissed(dt)
  updateShowingJustScored(dt)
end

function hud.update(dt, justMissed, justScored)
  updateTimers(dt)

  if justMissed then
    showingJustMissed = true
    justMissedRemainingTime = JUST_MISSED_TIME
  end


  if justScored then
    showingJustScored = true
    justScoredRemainingTime = JUST_SCORED_TIME
  end
end

local function drawRemainingTime(timeLeft, errorsDiscountTime)
  local function adjustColor(timeLeft)
    love.graphics.setColor(colors.white)
    if timeLeft < 5 then
      love.graphics.setColor(colors.red)
    elseif timeLeft < 10 then
      love.graphics.setColor(colors.orange)
    elseif timeLeft < 15 then
      love.graphics.setColor(colors.yellow)
    end
  end

  local function adjustFontSize(bigFont, timeLeft)
    if bigFont and timeLeft < 5 then
      love.graphics.setFont(assets.timerFont2)
    else
      love.graphics.setFont(assets.timerFont)
    end
  end

  adjustFontSize(bigFont, timeLeft)
  adjustColor(timeLeft)

  love.graphics.print(
    string.format(dictionary.localize("Time left") .. ": %.2f", timeLeft),
    REMAINING_TIME_POSITION.x,
    REMAINING_TIME_POSITION.y
  )
end

local function drawJustMissedTime(errorsDiscountTime)
  if errorsDiscountTime and showingJustMissed then
    love.graphics.setColor(colors.red)
    love.graphics.print(
      string.format("- 5.00"),
      JUST_MISSED_TIME_POSITION.x,
      JUST_MISSED_TIME_POSITION.y
    )
  end
end

local function drawJustScoredTime(scoresGainTime, timeGainedPerScore)
  if scoresGainTime and showingJustScored then
    love.graphics.setColor(0, 1, 0)
    love.graphics.print(
      string.format("+ %d.00", timeGainedPerScore),
      JUST_SCORED_TIME_POSITION.x,
      JUST_SCORED_TIME_POSITION.y
    )
  end
end

local function drawStageName(stageName)
  love.graphics.setColor(colors.white)
  love.graphics.setFont(assets.timerFont)
  love.graphics.print(stageName, GRID_X + DELTA_X, 25)
end

local function drawRemainingTries(limitedTries, numberOfTries)
  local function adjustColor(limitedTries, numberOfTries)
    if not limitedTries then
      love.graphics.setColor(colors.white)
    elseif numberOfTries < 2 then
      love.graphics.setColor(colors.red)
    elseif numberOfTries < 4 then
      love.graphics.setColor(colors.orange)
    elseif numberOfTries < 6 then
      love.graphics.setColor(colors.yellow)
    else
      love.graphics.setColor(colors.white)
    end
  end

  adjustColor(limitedTries, numberOfTries)
  love.graphics.setFont(assets.squareFont)

  if not limitedTries then
    love.graphics.print(dictionary.localize("Infinite tries"), GRID_X, GRID_Y + DELTA_Y)
  else
    love.graphics.print(numberOfTries .. " " .. dictionary.localize("Tries left"), GRID_X, GRID_Y + DELTA_Y)
  end
end

function hud.draw(timeLeft, limitedTries, numberOfTries, stageName, errorsDiscountTime, scoresGainTime, timeGainedPerScore)
  drawRemainingTime(timeLeft, errorsDiscountTime)
  drawJustMissedTime(errorsDiscountTime)
  drawJustScoredTime(scoresGainTime, timeGainedPerScore)
  drawStageName(stageName)
  drawRemainingTries(limitedTries, numberOfTries)
end

return hud;
