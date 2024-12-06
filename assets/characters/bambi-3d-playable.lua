function onCreate()
  setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death/fnf_loss_sfx-bambi')
  setPropertyFromClass('GameOverSubstate', 'characterName', 'bambi-3d-playable')
end
elapsedTime = 1
function onUpdate(elapsed)
  if inGameOver and elapsedTime >= 0 then
    elapsedTime = elapsedTime - elapsed
    setProperty('boyfriend.angle', getProperty('boyfriend.angle') + 1)
    setProperty('boyfriend.angle', getProperty('boyfriend.angle') + 1)
    setProperty('boyfriend.scale.x', elapsedTime)
    setProperty('boyfriend.scale.y', elapsedTime)
    setProperty('boyfriend.alpha', elapsedTime)
  end
end