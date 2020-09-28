local sceneManager = require 'src/common/sceneManager'
local assets = require 'src/common/assets'
local colors = require 'src/common/colors'

local hud = {}

local STRETCHING_TIME = 0.3
local stretching = STRETCHING_TIME
local bigFont = true

local JUST_MISSED_TIME = 1
local showingJustMissed = false
local justMissedRemainingTime = JUST_MISSED_TIME

-- TODO: refactor stretching font

-- TODO: refactor showingJustMissed, create timer associated with variable factory

function hud.load()
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

function hud.update(dt)
  calculateFontStretching(dt)
  if stretching < 0 then
    bigFont = not bigFont
  end

  if showingJustMissed then
    justMissedRemainingTime = justMissedRemainingTime - dt
  end
  if justMissedRemainingTime < 0 then
    showingJustMissed = false
  end
end

function hud.draw(timeLeft, limitedErrors, numberOfErrors, stageName, justMissed, errorsDiscountTime)
  local x = 200
  local y = 25

  if bigFont and timeLeft < 5 then
    love.graphics.setFont(assets.timerFont2)
    x = 198
    y = 23
  else
    love.graphics.setFont(assets.timerFont)
  end

  love.graphics.setColor(colors.white)
  if timeLeft < 5 then
    love.graphics.setColor(colors.red)
  elseif timeLeft < 10 then
    love.graphics.setColor(colors.orange)
  elseif timeLeft < 15 then
    love.graphics.setColor(colors.yellow)
  end
  love.graphics.print(string.format("tempo restante: %.2f", timeLeft), x, y)

  if justMissed and errorsDiscountTime then
    showingJustMissed = true
    justMissedRemainingTime = JUST_MISSED_TIME
  end

  love.graphics.setColor(colors.red)
  if showingJustMissed then
    love.graphics.print(string.format("- 5.00", timeLeft), x + 200, y + 30)
  end


  love.graphics.setColor(colors.white)
  love.graphics.setFont(assets.timerFont)
  love.graphics.print(stageName, 600, 25)

  love.graphics.setColor(colors.white)
  love.graphics.setFont(assets.squareFont)
  if not limitedErrors then
    love.graphics.print("infinitas tentativas", 650, 150)
  else
    love.graphics.print(numberOfErrors .. " erros permitidos", 650, 150)
  end
end

return hud;
