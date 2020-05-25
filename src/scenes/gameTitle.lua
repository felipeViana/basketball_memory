local assets = require "src/assets"
local sceneManager = require 'src/sceneManager'
local drawUtils = require 'src/drawUtils'
local gameTitle = {};

local bgImage
local smallFont
local titleFont

function gameTitle.load()
  smallFont = assets.textFont
  titleFont = assets.bigFont
  bgImage = assets.titleBackground
end

function gameTitle.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(bgImage, 0, 0, 0, 1.1, 1.1)

  drawUtils.drawTextRectangle({
    font=titleFont,
    posX=540,
    posY=320,
    text='Basketball Memory Legends',
  })

  drawUtils.drawTextRectangle({
    font=smallFont,
    posX=240,
    posY=610,
    text='press any key to continue',
  })
end

function gameTitle.keypressed()
  sceneManager.changeScene(require 'src/menu/main')
end

return gameTitle;
