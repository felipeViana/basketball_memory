local assets = require "src/common/assets"
local sceneManager = require 'src/common/sceneManager'
local dictionary = require 'src/common/dictionary'
local globals = require 'src/common/globals'

local textInputComponent = require 'src/components/textInput'
local soundManager = require 'src/components/soundManager'

local scene = {};
local textInput;

function scene.load()
  textInput = textInputComponent.new({
    posX = 400,
    posY = 400,
    font = assets.textFont,
  })
  textInputComponent.load()
end

function scene.unload()
  textInputComponent.unload()
end

function scene.update(dt)
  textInputComponent.update(dt)
end

function scene.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.setFont(assets.textFont)
  love.graphics.print(dictionary.localize('type your name'), 100, 100)
  love.graphics.print(dictionary.localize('press enter to continue'), 100, 150)
  love.graphics.print(dictionary.localize('choose your name:'), 100, 400)

  textInputComponent.draw()
end

function scene.textinput(t)
  textInputComponent.onChange(t)
  
  soundManager.playSound(assets.typeSound)
end

function scene.keypressed(key)
  textInputComponent.keyPressed(key)
  
  if key == 'backspace' then
    soundManager.playSound(assets.typeSound)
  end

  if key == 'return' and string.len(textInput.name) > 0 then
    globals.playerName = textInput.name
    sceneManager.changeScene(require 'src/scenes/cutScene1')
  end
end

return scene;
