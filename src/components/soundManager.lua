local soundManager = {}

function soundManager.playSound(source, pitched)
  source:seek(0)

  if pitched then
    local pitchValue = 0.8 + math.random(0, 10)/25
    source:setPitch(pitchValue)
  end

  source:play()
end

return soundManager
