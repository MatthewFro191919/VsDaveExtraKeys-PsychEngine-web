isEnabled = false
function onCreatePost()
  luaDebugMode = true
	initLuaShader("BlockedGlitchShader")

	makeLuaSprite("temporaryShader")
	makeGraphic("temporaryShader", screenWidth, screenHeight)

	setSpriteShader("temporaryShader", "BlockedGlitchShader")
  setShaderFloat("temporaryShader", "time", 1)

	addHaxeLibrary("ShaderFilter", "openfl.filters")
end
eT = 0

function onUpdate(e)
  eT = e + eT
  setShaderFloat("temporaryShader", "time", eT)
end

function onEvent(n)
	if n == 'GlitchEffect' then
		isEnabled = not isEnabled
		if isEnabled then
			runHaxeCode[[
				game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
			]]
		else
			runHaxeCode[[
				game.camHUD.setFilters([]);
			]]
		end
	end
end