local shaderName = "rainbow"


function onEvent(name, value1, value2)
    if name == 'Toggle_Eyesores' then
        if value1 == "1" then

        setShaderFloat("shaderImage", "iTime", os.clock())

        luaDebugMode = true
        initLuaShader("rainbow")
    
    
        makeLuaSprite("shaderImage")
        makeGraphic("shaderImage", screenWidth, screenHeight)
    
        setSpriteShader("shaderImage", "rainbow")
    

        addHaxeLibrary("ShaderFilter", "openfl.filters")
        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
        ]])
        elseif value1 == "0" then
            runHaxeCode([[
                trace(ShaderFilter);
                game.camGame.setFilters([]);
            ]])
        end
    end
end

function onUpdate()
    setShaderFloat('shaderImage','iTime',os.clock())
end