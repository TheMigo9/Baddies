function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Slash_Note' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/Slash_Note'); 
			

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); 
			end
		end
	end
end

local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Slash_Note' then
		playSound('slash', 1);
	
		cameraShake('camGame', 0.003, 0.2)
		setProperty('health', getProperty('health')-0.25);
		runTimer('bleed', 0.2, 30); 

		if songName == 'uhoh' then
			triggerEvent('Play Animation', 'SLASH', 'Boyfriend') 
		end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.010);
	end
end

-- function noteMiss(id, i, noteType, isSustainNote)
-- 	if noteType == 'Slash_Note' then
-- 		--characterPlayAnim('boyfriend', 'hurt', false);
-- 	end	
-- end
