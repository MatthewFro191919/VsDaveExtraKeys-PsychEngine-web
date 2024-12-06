function onEvent(name, value1, value2)
	if name == 'change_icon' then
		runHaxeCode([[
			iconP1.changeIcon(value1);
			iconP2.changeIcon(value2);
			healthBarBG.color
		]])
	end
end