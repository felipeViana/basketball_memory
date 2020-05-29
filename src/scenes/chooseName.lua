local assets = require "src/assets"
local sceneManager = require 'src/sceneManager'
local textInputComponent = require 'src/textInput'
local scene = {};

local textInput = textInputComponent;

function scene.load()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(assets.textFont)
  love.graphics.setBackgroundColor(0, 0, 0)

  textInput.load({
    posX=400,
    posY=400,
    font=assets.textFont,
  })
end

function scene.unload()
  textInput.unload()
end

function scene.update(dt)
  textInput.update(dt)
end

function scene.draw()
  love.graphics.print('type your name', 100, 100)
  love.graphics.print('press enter to continue', 100, 150)
  love.graphics.print('choose your name:', 100, 400)

  textInput.draw()
end

function scene.textinput(t)
  textInput.onChange(t)
end

function scene.keypressed(key)
  textInput.keyPressed(key)

  if key == 'return' and string.len(textInput.getName()) > 0 then
    playerName = textInput.getName()
    sceneManager.changeScene(require 'src/scenes/cutScene1')
  end
end

return scene;
