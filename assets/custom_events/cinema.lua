function onCreate()
	makeLuaSprite('blackStuff', 'blackscreen', 0, 800)
	setObjectCamera('blackStuff', 'hud')
	addLuaSprite('blackStuff', true)

	makeLuaSprite('blackStuff2', 'blackscreen', 0, -800)
	setObjectCamera('blackStuff2', 'hud')
	addLuaSprite('blackStuff2', true)
end

function onEvent(name, value1, value2)
	if name == 'cinema' then
		if value1 == 'on' then
			doTweenY('blackOn1', 'blackStuff', 600, 0.30, 'linear')
			doTweenY('blackOn2', 'blackStuff2', -600, 0.30, 'linear')
		elseif value1 == 'off' then
			doTweenY('blackOn1', 'blackStuff', 800, 0.30, 'linear')
			doTweenY('blackOn2', 'blackStuff2', -800, 0.30, 'linear')
		end
	end
end