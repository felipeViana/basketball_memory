local sceneManager = require 'src/common/sceneManager'
local stageManager = (require 'src/stages/stageManager').new()

local function goToNextStage()
  sceneManager.changeScene(require 'src/stages/stage1-3')
end

local stage = {}

function stage.load()
  stageManager:load({
    totalTime = 30,
    stageName = 'stage 1-2',
    goToNextStage = goToNextStage,
  })
end

function stage.comingBack()
  stageManager:comingBack()
end

function stage.unload()
  stageManager:unload()
end

function stage.update(dt)
  stageManager:update(dt)
end

function stage.draw()
  stageManager:draw()
end

function stage.mousereleased(_, _, button)
  stageManager:mouseReleased(button)
end

return stage;
