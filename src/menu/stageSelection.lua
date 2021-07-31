local sceneManager = require 'src/common/sceneManager'
local buttonManager = require 'src/components/buttonManager'
local dictionary = require 'src/common/dictionary'
local assets = require 'src/common/assets'
local globals = require 'src/common/globals'

local menu = {};
local music;

local verticalScroll;
local scrollAmount = 200;

local MOUSE_SPEED = 100

local FIRST_COLUMN_X = 175
local FIRST_LINE_Y = 50
local SECOND_LINE_Y = 500
local DELTA_X = 225
local DELTA_Y = 75

local MAX_Y = 350

local function reachedUpperLimit()
  return not (verticalScroll < 0);
end

local function reachedBottomLimit()
  return not (verticalScroll > - MAX_Y);
end

local function scrollUp(y)
  if not reachedUpperLimit() then
    if y then
      verticalScroll = verticalScroll + y * MOUSE_SPEED
    else
      verticalScroll = verticalScroll + scrollAmount;
    end
  end
end

local function scrollDown(y)
  if not reachedBottomLimit() then
    if y then
      verticalScroll = verticalScroll + y * MOUSE_SPEED
    else
      verticalScroll = verticalScroll - scrollAmount;
    end
  end
end

local function goToStage11()
  sceneManager.changeScene(require 'src/stages/debugStage1-1')
end

local function goToStage12()
  sceneManager.changeScene(require 'src/stages/debugStage1-2')
end

local function goToStage13()
  sceneManager.changeScene(require 'src/stages/debugStage1-3')
end

local function goToStage14()
  sceneManager.changeScene(require 'src/stages/debugStage1-4')
end

local function goToStage15()
  sceneManager.changeScene(require 'src/stages/debugStage1-5')
end

local function goToStage21()
  sceneManager.changeScene(require 'src/stages/debugStage2-1')
end

local function goToStage22()
  sceneManager.changeScene(require 'src/stages/debugStage2-2')
end

local function goToStage23()
  sceneManager.changeScene(require 'src/stages/debugStage2-3')
end

local function goToStage24()
  sceneManager.changeScene(require 'src/stages/debugStage2-4')
end

local function goToStage25()
  sceneManager.changeScene(require 'src/stages/debugStage2-5')
end

local function goToStage31()
  sceneManager.changeScene(require 'src/stages/debugStage3-1')
end

local function goToStage32()
  sceneManager.changeScene(require 'src/stages/debugStage3-2')
end

local function goToStage33()
  sceneManager.changeScene(require 'src/stages/debugStage3-3')
end

local function goToStage34()
  sceneManager.changeScene(require 'src/stages/debugStage3-4')
end

local function goToStage35()
  sceneManager.changeScene(require 'src/stages/debugStage3-5')
end

local function goBack()
  sceneManager.changeScene(require 'src/menu/mainMenu')
end

function menu.load()
  verticalScroll = 0;

  scrollableButtonManager = buttonManager.new()
  scrollableButtonManager:load()

  fixedButtonManager = buttonManager.new()
  fixedButtonManager:load()

  scrollableButtonManager:newTextButton({
    text = 'Stage 1-1',
    fn = goToStage11,
    x = FIRST_COLUMN_X,
    y = FIRST_LINE_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 1-2',
    fn = goToStage12,
    x = FIRST_COLUMN_X,
    y = FIRST_LINE_Y + DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 1-3',
    fn = goToStage13,
    x = FIRST_COLUMN_X,
    y = FIRST_LINE_Y + 2 * DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 1-4',
    fn = goToStage14,
    x = FIRST_COLUMN_X,
    y = FIRST_LINE_Y + 3 * DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 1-5',
    fn = goToStage15,
    x = FIRST_COLUMN_X,
    y = FIRST_LINE_Y + 4 * DELTA_Y,
  })

  scrollableButtonManager:newTextButton({
    text = 'Stage 2-1',
    fn = goToStage21,
    x = FIRST_COLUMN_X + DELTA_X,
    y = FIRST_LINE_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 2-2',
    fn = goToStage22,
    x = FIRST_COLUMN_X + DELTA_X,
    y = FIRST_LINE_Y + DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 2-3',
    fn = goToStage23,
    x = FIRST_COLUMN_X + DELTA_X,
    y = FIRST_LINE_Y + 2 * DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 2-4',
    fn = goToStage24,
    x = FIRST_COLUMN_X + DELTA_X,
    y = FIRST_LINE_Y + 3 * DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 2-5',
    fn = goToStage25,
    x = FIRST_COLUMN_X + DELTA_X,
    y = FIRST_LINE_Y + 4 * DELTA_Y,
  })

  scrollableButtonManager:newTextButton({
    text = 'Stage 3-1',
    fn = goToStage31,
    x = FIRST_COLUMN_X + 2 * DELTA_X,
    y = FIRST_LINE_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-2',
    fn = goToStage32,
    x = FIRST_COLUMN_X + 2 * DELTA_X,
    y = FIRST_LINE_Y + DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-3',
    fn = goToStage33,
    x = FIRST_COLUMN_X + 2 * DELTA_X,
    y = FIRST_LINE_Y + 2 * DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-4',
    fn = goToStage34,
    x = FIRST_COLUMN_X + 2 * DELTA_X,
    y = FIRST_LINE_Y + 3 * DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 3-5',
    fn = goToStage35,
    x = FIRST_COLUMN_X + 2 * DELTA_X,
    y = FIRST_LINE_Y + 4 * DELTA_Y,
  })

  scrollableButtonManager:newTextButton({
    text = 'Stage 4-1',
    fn = goToStage35,
    x = FIRST_COLUMN_X,
    y = SECOND_LINE_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 4-2',
    fn = goToStage35,
    x = FIRST_COLUMN_X,
    y = SECOND_LINE_Y + DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 4-3',
    fn = goToStage35,
    x = FIRST_COLUMN_X,
    y = SECOND_LINE_Y + 2 * DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 4-4',
    fn = goToStage35,
    x = FIRST_COLUMN_X,
    y = SECOND_LINE_Y + 3 * DELTA_Y,
  })
  scrollableButtonManager:newTextButton({
    text = 'Stage 4-5',
    fn = goToStage35,
    x = FIRST_COLUMN_X,
    y = SECOND_LINE_Y + 4 * DELTA_Y,
  })

  fixedButtonManager:newArrowButton({
    fn = goBack,
    x = 25,
    y = 25,
    direction = 'left',
  })
  fixedButtonManager:newArrowButton({
    fn = scrollUp,
    x = globals.baseScreenWidth - 100,
    y = 300,
    direction = 'up',
    disabledFunction = reachedUpperLimit,
    disabled = true,
  })
  fixedButtonManager:newArrowButton({
    fn = scrollDown,
    x = globals.baseScreenWidth - 100,
    y = 400,
    direction = 'down',
    disabledFunction = reachedBottomLimit,
  })

  music = assets.menuMusic
  music:play()
end

function menu.unload()
  scrollableButtonManager:unload()
  fixedButtonManager:unload()
  music:pause()
end

function menu.update(dt)
  scrollableButtonManager:update(dt, verticalScroll)
  fixedButtonManager:update(dt)
end

function menu.draw()
  love.graphics.setBackgroundColor(0.1, 0.1, 0.1)

  love.graphics.push()
  love.graphics.translate(0, verticalScroll)
  scrollableButtonManager:draw()
  love.graphics.pop()

  fixedButtonManager:draw()
end

function menu.mousereleased(_, _, button)
  scrollableButtonManager:mouseReleased(button)
  fixedButtonManager:mouseReleased(button)
end

function menu.wheelmoved(x, y)
  if y < 0 then
    scrollDown(y)
  elseif y > 0 then
    scrollUp(y)
  end
end

function menu.keypressed(key)
  if key == 'up' then
    scrollUp()
  elseif key == 'down' then
    scrollDown()
  end
end

return menu;
