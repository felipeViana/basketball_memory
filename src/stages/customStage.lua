local stageManager = (require 'src/stages/stageManager').new()

local stage = {
  name = 'stage'
}

local previousArgs = {}

function stage.load(args)
  if args == nil then
    args = previousArgs
  end
  previousArgs = args

  stageManager:load({
    totalTime = args.totalTime or 60,
    numberOfTries = args.numberOfTries or nil,
    timeToShowCardsBeforeStarting = args.timeToShowCardsBeforeStarting,
    timeGainedPerScore = args.timeGainedPerScore,
    timeLostPerError = args.timeLostPerError,

    stageName = 'custom stage',
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
