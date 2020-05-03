local sceneManager = require 'src/sceneManager'
local gameTitle = {};

local bgImage
local font
local titleFont

function gameTitle.load()
  love.graphics.setColor(1, 1, 1)
  font = love.graphics.newFont('assets/fonts/JMH Typewriter.ttf', 28)
  titleFont = love.graphics.newFont('assets/fonts/JMH Typewriter.ttf', 36)
  love.graphics.setFont(font)
  love.graphics.setBackgroundColor(0, 0, 0)

  bgImage = love.graphics.newImage("assets/images/bg_image.jpeg")
end

function gameTitle.update()
end

function gameTitle.draw()
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()

  love.graphics.draw(bgImage, 0, 0, 0, 1.1, 1.1)

  local titleX = windowWidth/2 - 100
  local titleY = windowHeight/2 - 40
  local title = 'Basketball memory legends'

  local buttonX = windowWidth/2-400
  local buttonY = windowHeight/2+250
  local buttonText = "press any key to continue"

  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle(
    'fill',
    titleX,
    titleY,
    titleFont:getWidth(title),
    titleFont:getHeight(title)
  )

  love.graphics.rectangle(
    'fill',
    buttonX,
    buttonY,
    font:getWidth(buttonText),
    font:getHeight(buttonText)
  )

  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(titleFont)
  love.graphics.print(title, titleX, titleY)
  love.graphics.setFont(font)
  love.graphics.print(buttonText, buttonX, buttonY)
end

function gameTitle.keypressed( ... )
  sceneManager.changeScene(require 'src/menu/main')
end

return gameTitle;
