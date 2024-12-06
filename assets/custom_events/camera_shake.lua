function onEvent(name, value1, value2)
	if name == 'camera_shake' then
		cameraShake(value1, 0.05, value2)
	end
end