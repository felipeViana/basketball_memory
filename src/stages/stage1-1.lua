local sceneManager = require 'src/common/sceneManager'
local stageManager = (require 'src/stages/stageManager').new()

local function goToNextStage()
  sceneManager.changeScene(require 'src/stages/stage1-2')
end

local stage = {}

function stage.load(comingFromStageSelection)
  if comingFromStageSelection then
    stageManager:load(60, nil, nil)
  else
    stageManager:load(60, nil, nil, goToNextStage)
  end
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
