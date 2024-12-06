function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'phone-alt' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_phone'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.50) 
			setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.50)
                        setPropertyFromGroup('unspawnNotes', i, 'offsetX', 20);
			
			setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-alt')	
	              
	                if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
				setPropertyFromGroup('unspawnNotes', i, 'offset.x', '-3s')
			end

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then --Lets Opponent's instakill notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			else
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'phone-alt' then
		setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-alt')
	end
end

