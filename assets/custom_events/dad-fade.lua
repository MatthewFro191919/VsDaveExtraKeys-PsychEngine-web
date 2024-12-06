function onEvent(name,value1,value2)
	if name == 'dad-fade' then
		doTweenAlpha('hud', 'dad', value1, value2, 'linear')
	end
end
