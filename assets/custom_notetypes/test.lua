function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length') do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'test' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'HURTNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-alt')

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then --Lets Opponent's instakill notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			else
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
end