specialIcons = true

local bfname = getProperty('boyfriend.curCharacter')
local dadname = getProperty('dad.curCharacter')

evilStage1 = 'timeSquareEvil'
evilStage2 = 'driftHighway'


function onCreatePost()


	if curStage == evilStage or evilStage2 then
	
		if specialIcons == true then 
			loadImages()
		end
	
	end

	
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
    setProperty('health', getProperty('health')+0.07);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)

	if curStep > 1248 then
		
		health = getProperty('health')
		if getProperty('health') > 0.2 then
			setProperty('health', health- 0.095);
		end
	else
		health = getProperty('health')
		if getProperty('health') > 0.2 then
			setProperty('health', health- 0.045);
		end
	end
end

function loadImages()

	
	if curStage == evilStage or evilStage2 then

		makeAnimatedLuaSprite('move', 'misc/3-healthShit/STEPHANIE DRIFT', getProperty('iconP2.x'),getProperty('iconP2.y'))
		addAnimationByPrefix('move', 'idle', 'stephDriftIcon',24,false)
		addAnimationByPrefix('move', 'win', 'stephDriftWinIntro',24,false)
		addAnimationByPrefix('move', 'lose', 'stephDriftLoseIntro',24,false)

		makeAnimatedLuaSprite('move2', 'misc/3-healthShit/nova-animated', getProperty('iconP1.x'),getProperty('iconP1.y'))
		addAnimationByPrefix('move2', 'idle', 'idle', 24,false)
		addAnimationByPrefix('move2', 'win', 'win', 24,false)
		addAnimationByPrefix('move2', 'lose', 'lose', 24,false)

		setObjectCamera('move', 'hud')
		setObjectCamera('move2', 'hud')
			
		objectPlayAnimation('move','idle',true);
		objectPlayAnimation('move2','idle',true);

		addLuaSprite('move', true);
		addLuaSprite('move2', true);
		
		setProperty('move.visible', false)
		setProperty('move2.visible', false)
		

	end
	
	makeLuaSprite('HB', 'HealthBarReload', 360 , 495);
	setScrollFactor('HB', 1, 1);
	addLuaSprite('HB', true);
	scaleObject('HB', '0.75','0.75');
	setObjectCamera('HB', 'hud')
	setProperty('HB.visible', false)
	setProperty('healthBar.visible', false)
	
	makeLuaSprite('TB', 'timeBarShow', 479 , 132);
	setScrollFactor('TB', 1, 1);
	addLuaSprite('TB', true);
	scaleObject('TB', '0.75','0.75');
	setObjectCamera('TB', 'hud')
	setProperty('TB.visible', false)


end

function onUpdate(elapsed)

	if specialIcons then 
		if curStep >= 1 then
		    
		    setProperty('move.visible', true)
		    setProperty('move2.visible', true)
		    setProperty('HB.visible', true)
		    setProperty('healthBar.visible', true)
		    setProperty('TB.visible', true)

			health = getProperty('health')

			if getProperty('health') < 1.6 then
				runTimer('LOSE2',0.1,1)
			elseif getProperty('health') >= 1.4 then
				runTimer('WIN2',0.1,1)
			elseif getProperty('health') == 1 then
				objectPlayAnimation('move2','idle',true);
			end
			if getProperty('health') == 1 then
				objectPlayAnimation('move','idle',true);
			elseif getProperty('health') < 0.4 then
				runTimer('WIN1',0.1,1)
			elseif getProperty('health') > 0.5 then
				runTimer('LOSE1',0.1,1)
			end

		end

	
		setProperty('iconP2.alpha', 0)
		setProperty('iconP2.y', 570)
		setProperty('move.flipX', false)
		--setProperty('move.y', getProperty('iconP2.y') -70)
		setProperty('move.x', getProperty('iconP2.x') +230)
		setProperty('move.scale.y', 0.75)
		setProperty('move.scale.x', 0.75)
		setProperty('move.antialiasing',true)
		setObjectOrder('move', getObjectOrder('iconP2') + 1)
		
		
		setProperty('iconP1.alpha', 0)
		setProperty('iconP1.y', 570)
		setProperty('move2.flipX', true)
		--setProperty('move2.y', getProperty('iconP1.y') - 70)
		setProperty('move2.x', getProperty('iconP1.x')+ 220)
		setProperty('move2.scale.y', 0.75)
		setProperty('move2.scale.x', 0.75)
		setProperty('move2.antialiasing',true)
		setObjectOrder('move2', getObjectOrder('iconP1') + 1)
		
		
		setProperty('healthBar.y', 542)
		setProperty('healthBar.x', 174)
		scaleObject('healthBar', '1','0.75')
		
		
		setObjectOrder('iconP1', 50)
		setObjectOrder('iconP2', 50)
		
		setTextFont('timeTxt', 'GothicJoker.ttf')
		setProperty('timeTxt.x', 475)
		scaleObject('timeTxt', '0.75','0.75');
		setObjectOrder('timeTxt', 50)
		
		if not downscroll then
		    setProperty('healthBar.y', 542)
		    setProperty('HB.y', 495)
		    setProperty('TB.y', 132)
		    setProperty('move.y', getProperty('iconP2.y') - 75)
		    setProperty('move2.y', getProperty('iconP1.y') - 70)
		    setProperty('timeTxt.y', 139)
		    
		    
		end
		if downscroll then
		    setProperty('healthBar.y', 171)
		    setProperty('HB.y', 124)
		    setProperty('TB.y', 565)
		    setProperty('move.y', getProperty('iconP2.y') - 446)
		    setProperty('move2.y', getProperty('iconP1.y') - 441)
		    setProperty('timeTxt.y', 572)
		    
		end
		
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if specialIcons then
		if tag == 'LOSE2' then
			
			--objectPlayAnimation('move','lose',true);
			playAnim('move', 'lose',true)
		
		end

		if tag == 'WIN2' then
			
		--	objectPlayAnimation('move','win',true);
			playAnim('move', 'win',true)
			
		end

		if tag == 'LOSE1' then
			
			--objectPlayAnimation('move2','lose',true);
			playAnim('move2', 'lose',true)
		
		end

		if tag == 'WIN1' then
			
			--objectPlayAnimation('move2','win',true);
			playAnim('move2', 'win',true)

		end

	end

end
