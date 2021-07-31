local soundManager = {}

function soundManager.playSound(source, pitched, pitchValue)
  source:seek(0)

  if pitched then
    source:setPitch(0.8 + math.random(0, 10)/25)
  end

  if pitchValue then
    source:setPitch(pitchValue)
  end

  source:play()
end

return soundManager
