local stageManager = (require 'src/stages/stageManager').new()

local stage = {
  name = 'stage'
}

function stage.load()
  stageManager:load({
    totalTime = 120,
    numberOfTries = 20,
    stageName = 'debug stage 3-1',
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
