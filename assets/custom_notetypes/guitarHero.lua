function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'guitarHero' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', '')
			setPropertyFromGroup('unspawnNotes', i, 'antialiasing', false)
			end
		end
	end
end