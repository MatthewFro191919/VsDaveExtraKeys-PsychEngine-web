isEnabled = false
function onCreatePost()
	initLuaShader("eyesore")

	makeLuaSprite("temporaryShader")
	makeGraphic("temporaryShader", screenWidth, screenHeight)

	setSpriteShader("temporaryShader", "eyesore")
  setShaderFloat("temporaryShader", "uSpeed", 1)
  setShaderFloat("temporaryShader", "uFrequency", 2)
  setShaderFloat("temporaryShader", "uWaveAmplitude", 1)

	addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
	]])
  if songName:lower() == 'polygonized' then
    addCharacterToList('bf-3d')
    addCharacterToList('gf-3d')
  end
end
function enableEyeSores(thing)
  setShaderBool("temporaryShader", "uEnabled", thing)
end
function onEvent(n)
  if n == 'eyesores' then
    isEnabled = not isEnabled
    enableEyeSores(isEnabled)
    if songName:lower() == 'polygonized' or boyfriendName == 'bf' then
      triggerEvent('Change Character', '', isEnabled and 'bf-3d' or 'bf')
      triggerEvent('Change Character', 2, isEnabled and 'gf-3d' or 'gf')
    end
    if songName:lower() == 'polygonized' or boyfriendName == 'shaggy' then
      triggerEvent('Change Character', '', isEnabled and 'shaggy' or 'shaggy')
    end
    if songName:lower() == 'polygonized' or boyfriendName == 'supershaggy' then
      triggerEvent('Change Character', '', isEnabled and 'supershaggy' or 'supershaggy')
    end
    if songName:lower() == 'polygonized' or boyfriendName == 'godshaggy' then
      triggerEvent('Change Character', '', isEnabled and 'godshaggy' or 'godshaggy')
    end
    if songName:lower() == 'polygonized' or boyfriendName == 'redshaggy' then
      triggerEvent('Change Character', '', isEnabled and 'redshaggy' or 'redshaggy')
    end
  end
end
function onUpdate()
  songPos = getSongPosition()
  currentBeat = (songPos/5000)*(curBpm/60)
	setShaderFloat("temporaryShader", "uTime", currentBeat)

  -- if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.G') then
  --   enableEyeSores(true)
  -- end
  -- if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H') then
  --   enableEyeSores(false)
  -- end

  if getShaderBool("temporaryShader", "uEnabled") then
    setShaderFloat("temporaryShader", "uampmul", 0.5)
		playAnim('gf', 'scared', false)
  else
    setShaderFloat("temporaryShader", "uampmul", getShaderFloat("temporaryShader", "uampmul") - 0.01)
  end
end
