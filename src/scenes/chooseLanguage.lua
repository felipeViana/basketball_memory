local assets = require "src/common/assets"
local sceneManager = require 'src/common/sceneManager'
local dictionary = require 'src/common/dictionary'
local buttonManager = require 'src/components/buttonManager'
local drawUtils = require 'src/common/drawUtils'

local gameTitle = {};
local fromSettings = false;
local titleFont

local function goToNextScreen()
  if fromSettings then
    sceneManager.changeScene(require 'src/menu/settings')
  else
    sceneManager.changeScene(require 'src/menu/mainMenu')
  end
end

local function chooseEnglish()
  language = 'english'
  goToNextScreen()
end

local function choosePortuguese()
  language = 'portugues'
  goToNextScreen()
end

function gameTitle.load(comingFromSettings)
  fromSettings = comingFromSettings
  titleFont = assets.bigFont

  buttonManager.load()
  buttonManager.newImageButton({
    fn = chooseEnglish,
    x = 100,
    y = 300,
    image = assets.flagUK,
    imageWidth = 1024,
    imageHeight = 512,
    scaleX = 0.5,
    scaleY = 0.5,
  })
  buttonManager.newImageButton({
    fn = choosePortuguese,
    x = 700,
    y = 300,
    image = assets.flagBR,
    imageWidth = 1024,
    imageHeight = 716,
    scaleX = 0.5,
    scaleY = 0.36,
  })
end

function gameTitle.unload()
  buttonManager.unload()
end

function gameTitle.update(dt)
  buttonManager.update(dt)
end

function gameTitle.draw()
  love.graphics.setColor(1, 1, 1)

  drawUtils.drawTextRectangle({
    font=titleFont,
    posX=440,
    posY=100,
    text=dictionary.localize('Choose your language'),
  })

  buttonManager.draw()
end

function gameTitle.mousereleased(_, _, button)
  buttonManager.mouseReleased(button)
end

return gameTitle;
