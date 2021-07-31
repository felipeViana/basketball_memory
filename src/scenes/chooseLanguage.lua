local assets = require "src/common/assets"
local sceneManager = require 'src/common/sceneManager'
local dictionary = require 'src/common/dictionary'
local buttonManager = (require 'src/components/buttonManager').new()
local drawUtils = require 'src/common/drawUtils'
local globals = require 'src/common/globals'

local screen = {};
local fromSettings = false;
local titleFont
local music

local function goToNextScreen()
  if fromSettings then
    sceneManager.changeScene(require 'src/menu/settings')
  else
    sceneManager.changeScene(require 'src/menu/mainMenu')
  end
end

local function chooseEnglish()
  globals.language = 'english'
  goToNextScreen()
end

local function choosePortuguese()
  globals.language = 'portugues'
  goToNextScreen()
end

function screen.load(comingFromSettings)
  fromSettings = comingFromSettings
  titleFont = assets.bigFont

  buttonManager:load()
  buttonManager:newImageButton({
    fn = chooseEnglish,
    x = 200,
    y = 250,
    image = assets.flagUK,
    imageWidth = 1024,
    imageHeight = 512,
    scaleX = 0.25,
    scaleY = 0.25,
  })
  buttonManager:newImageButton({
    fn = choosePortuguese,
    x = 550,
    y = 250,
    image = assets.flagBR,
    imageWidth = 1024,
    imageHeight = 716,
    scaleX = 0.25,
    scaleY = 0.18,
  })

  music = assets.menuMusic
  music:play()
end

function screen.unload()
  buttonManager:unload()
  music:pause()
end

function screen.update(dt)
  buttonManager:update(dt)
end

function screen.draw()
  love.graphics.setColor(1, 1, 1)

  drawUtils.drawTextRectangle({
    font = titleFont,
    posX = 300,
    posY = 50,
    text = dictionary.localize('Choose your language'),
  })

  buttonManager:draw()
end

function screen.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return screen;
