local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'
local drawUtils = require 'src/common/drawUtils'

local menu = {};

local music
local time = 0

local GRID_Y = 150
local DELTA_Y = 75
local GRID_X = 400

local function startGame()
  sceneManager.changeScene(require 'src/scenes/chooseName')
end

local function goToStageSelection()
  sceneManager.changeScene(require 'src/menu/stageSelection')
end

local function goToSettings()
  sceneManager.changeScene(require 'src/menu/settings')
end

local function quitGame()
  love.event.quit(0)
end

function menu.load()
  buttonManager:load()
  buttonManager:newTextButton({
    text = dictionary.localize('StartGame'),
    fn = startGame,
    x = GRID_X,
    y = GRID_Y,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('StageSelection'),
    fn = goToStageSelection,
    x = GRID_X,
    y = GRID_Y + DELTA_Y,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('Settings'),
    fn = goToSettings,
    x = GRID_X,
    y = GRID_Y + 2 * DELTA_Y,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('ExitGame'),
    fn = quitGame,
    x = GRID_X,
    y = GRID_Y + 3 * DELTA_Y,
  })

  music = assets.menuMusic
  music:play()
end

function menu.unload()
  buttonManager:unload()
  music:pause()
end

function menu.update(dt)
  buttonManager:update(dt)
  time = time + dt
end

function menu.draw()
  buttonManager:draw()

  drawUtils.drawRainbowCosText(100, 50, 'BASKETBALL MEMORY LEGENDS', assets.frostbiteFont, time)
end

function menu.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return menu;
