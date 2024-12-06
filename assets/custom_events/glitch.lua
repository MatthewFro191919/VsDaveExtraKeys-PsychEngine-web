function onCreate()
    		
	makeAnimatedLuaSprite('daStat2', 'glitch/glitch', 0,0);
	luaSpriteAddAnimationByPrefix('daStat2', 'daStat2', 'glitchScreen', 24, false);
    setLuaSpriteScrollFactor('daStat2', 1, 1);
    scaleObject('daStat2', 4, 4)
    setObjectCamera('daStat2', 'other')
    addLuaSprite('daStat2', true)
end

function onEvent(name)
    if name == 'glitch' then
        setProperty('daStat2.visible', true)
        objectPlayAnimation('daStat2', 'daStat2', true)
        playSound('static', 1)
    end
end

function onUpdate()
    if getProperty('daStat2.animation.curAnim.finished') == true then
        setProperty('daStat2.visible', false)
    end
end