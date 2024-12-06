function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'phone' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_phone'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.50) 
			setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.50)
                   	setPropertyFromGroup('unspawnNotes', i, 'offsetX', 20);
           	
		        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
				setPropertyFromGroup('unspawnNotes', i, 'offset.x', '-3')
			end
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == true then --Lets Opponent's instakill notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			else
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'phone' then
		playAnim('dad', 'throw', true)
		playAnim('boyfriend', 'hurt', true)
		setProperty('dad.specialAnim', true)
		setProperty('boyfriend.specialAnim', true)
		if noteData == 0 then
			noteTweenAlpha('bye1', 4, 0, 0.30, 'linear')
			runTimer('hi1', 2)
		elseif noteData == 1 then
			noteTweenAlpha('bye2', 5, 0, 0.30, 'linear')
			runTimer('hi2', 2)
		elseif noteData == 2 then
			noteTweenAlpha('bye3', 6, 0, 0.30, 'linear')
			runTimer('hi3', 2)
		elseif noteData == 3 then
			noteTweenAlpha('bye4', 7, 0, 0.30, 'linear')
			runTimer('hi4', 2)
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'hi1' then
		noteTweenAlpha('hi1', 4, 1, 0.30, 'linear')
	end
	if tag == 'hi2' then
		noteTweenAlpha('hi2', 5, 1, 0.30, 'linear')
	end
	if tag == 'hi3' then
		noteTweenAlpha('hi3', 6, 1, 0.30, 'linear')
	end
	if tag == 'hi4' then
		noteTweenAlpha('hi4', 7, 1, 0.30, 'linear')
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'phone' then
		playAnim('dad', 'phone', true)
		setProperty('dad.specialAnim', true)
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'phone' then
		playAnim('dad', 'throw', true)
		playAnim('boyfriend', 'dodge', true)
		setProperty('dad.specialAnim', true)
		setProperty('boyfriend.specialAnim', true)
	end
end
