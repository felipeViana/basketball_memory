local sceneManager = require 'src/common/sceneManager'
local buttonManager = (require 'src/components/buttonManager').new()
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'

local menu = {};

local music
local time = 0

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
    x = 100,
    y = 200,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('StageSelection'),
    fn = goToStageSelection,
    x = 100,
    y = 300,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('Settings'),
    fn = goToSettings,
    x = 100,
    y = 400,
  })
  buttonManager:newTextButton({
    text = dictionary.localize('Exit'),
    fn = quitGame,
    x = 100,
    y = 500,
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

local function stringToTable(name)
  local letters = {}
  for i = 1, #name do
    table.insert(letters, name:sub(i, i))
  end

  return letters
end

function menu.draw()
  buttonManager:draw()

  -- love.graphics.set
  local letters = stringToTable('basketball memory legends')

  -- love.graphics.print('hello world', 500, 100)
  for i=1, #letters do               -- for each letter
    -- for j=0,7 do              -- for each rainbow trail part
      -- local t1 = t + i*4 - j*2      -- adjusted time
      local t1 = time + i*4
      local y = 45 + math.cos(t1*5)*5 -- vertical position
      -- local y = 100
      -- pal(7, 14-j)            -- remap colour from white
      -- spr(16+i, 8+i*8, y)     -- draw letter sprite
      love.graphics.print(letters[i], 500+i*30, y)
    -- end
  end
end

function menu.mousereleased(_, _, button)
  buttonManager:mouseReleased(button)
end

return menu;
