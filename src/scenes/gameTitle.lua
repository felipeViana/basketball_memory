local assets = require "src/common/assets"
local sceneManager = require 'src/common/sceneManager'
local drawUtils = require 'src/common/drawUtils'
local gameTitle = {};

local bgImage
local smallFont
local titleFont
local music

local GRID_X = 300

function gameTitle.load()
  smallFont = assets.textFont
  titleFont = assets.bigFont
  bgImage = assets.titleBackground

  music = assets.menuMusic
  music:play()
end

function gameTitle.unload()
  music:pause()
end

function gameTitle.draw()
  love.graphics.setColor(1, 1, 1)

  drawUtils.drawBackground(bgImage)

  drawUtils.drawTextRectangle({
    font = titleFont,
    posX = GRID_X,
    posY = 200,
    text = 'Basketball Memory Legends',
    hasBackground = true,
  })

  drawUtils.drawTextRectangle({
    font = smallFont,
    posX = GRID_X + 50,
    posY = 500,
    text = 'press any key to continue',
  })
end

function gameTitle.keypressed()
  sceneManager.changeScene(require 'src/scenes/chooseLanguage')
end


function gameTitle.mouseReleased(btn)
  sceneManager.changeScene(require 'src/scenes/chooseLanguage')
end

return gameTitle;
