-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'tilt' then
		if value1 == "true" then
			doTweenAngle('circ2', 'camHUD', 40, 4, 'smoothstepOut')
			doTweenAngle('circ', 'camGame', 40, 4, 'smoothstepOut')
			runTimer('back', 1)
		end
		if value1 == "false" then
			cancelTween('circ')
			cancelTimer('backagain')
			cancelTimer('back')
			doTweenAngle('a2', 'camHUD', 0, 0.00001, 'smoothstepOut')
			doTweenAngle('a', 'camGame', 0, 0.00001, 'smoothstepOut')
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'back' then
		doTweenAngle('circ', 'camGame', -40, 4, 'smoothstepOut')
		doTweenAngle('circ2', 'camHUD', -40, 4, 'smoothstepOut')
		runTimer('backagain', 1)
	end
	if tag == 'backagain' then
		doTweenAngle('circ', 'camGame', 40, 4, 'smoothstepOut')
		doTweenAngle('circ2', 'camHUD', 40, 4, 'smoothstepOut')
		runTimer('back', 1)
	end
end