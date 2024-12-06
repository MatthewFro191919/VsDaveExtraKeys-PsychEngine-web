function onEvent(name,value1,value2)
	if name == 'hud-alpha' then
		doTweenAlpha('hud', 'camHUD', value1, value2, 'linear')
	end
end
