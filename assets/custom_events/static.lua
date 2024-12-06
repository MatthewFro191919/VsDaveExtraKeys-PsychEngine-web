function onCreate()
    		
	makeAnimatedLuaSprite('daStat', 'glitch/glitchSwitch', 0,0);
	luaSpriteAddAnimationByPrefix('daStat', 'daStat', 'glitchScreen', 24, false);
    setLuaSpriteScrollFactor('daStat', 1, 1);
    scaleObject('daStat', 4, 4)
    setObjectCamera('daStat', 'other')
    addLuaSprite('daStat', true)

    makeLuaSprite('simplejump', 'Jumpscare/simplejump', -250, -125);
    setScrollFactor('simplejump', 0, 0);
    scaleObject('simplejump', 1, 1);
end

function onEvent(name)
    if name == 'static' then
        setProperty('daStat.visible', true)
        objectPlayAnimation('daStat', 'daStat', true)
    end
end

function onUpdate()
    if getProperty('daStat.animation.curAnim.finished') == true then
        setProperty('daStat.visible', false)
    end
end