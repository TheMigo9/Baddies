specialIcons = true

local bfname = getProperty('boyfriend.curCharacter')
local dadname = getProperty('dad.curCharacter')

local gameShowStage = 'gameShow'

GMcolor = 'f84e9b'

function onCreatePost()


	if curStage == gameShowStage then

		if specialIcons == true then 
			loadImages()
		end

	end

end
function loadImages()

	

	bfname = getProperty('boyfriend.curCharacter')
	dadname = getProperty('dad.curCharacter')

	if dadname == 'black-boyfriend' then
		makeAnimatedLuaSprite('move', 'gameshow/icons/player-icons/black-team-boyfriend-animated', 100,440)
		addAnimationByPrefix('move', 'idle', 'idle',24,false)
		addAnimationByPrefix('move', 'win', 'win',24,false)
		addAnimationByPrefix('move', 'lose', 'lose',24,false)
	end

	if boyfriendName == 'red-nova' then
		makeAnimatedLuaSprite('move2', 'gameshow/icons/player-icons/red-team-nova-animated', 950,440)
		addAnimationByPrefix('move2', 'idle', 'idle', 24,false)
		addAnimationByPrefix('move2', 'win', 'win', 24,false)
		addAnimationByPrefix('move2', 'lose', 'lose', 24,false)
	end
				
			
	setObjectCamera('move', 'HUD')
	setObjectCamera('move2', 'HUD')
				

	playAnim('move', 'idle',true)
	playAnim('move2', 'idle',true)
	

	addLuaSprite('move', true);
	addLuaSprite('move2', true);

	addOffset('move2','lose', 0, 3)
	addOffset('move2','win', 3, 3)
	scaleObject('move', '1.4','1.4');
	scaleObject('move2', '1.4','1.4');

	makeLuaText('opponentName', '', '0', getProperty('gameShowHealthBar.x') + 220, getProperty('gameShowHealthBar.y') + 33) -- 495, 510
	setTextFont('opponentName', 'GothicJoker.ttf')
	setTextAlignment('opponentName', 'left')
	setObjectCamera('opponentName', 'hud')
	setTextSize('opponentName','42')
	setTextString('opponentName', 'stephanie')
	setTextColor('opponentName', GMcolor)
	addLuaText('opponentName')

	makeLuaText('playerName', 'RED-NOVA', '0', 100, 450)  --495, 510
	setTextFont('playerName', 'GothicJoker.ttf')
	setTextAlignment('playerName', 'right')
	setObjectCamera('playerName', 'hud')
	setTextSize('playerName','42')
	setTextString('playerName', 'chloe')
	setTextColor('playerName', GMcolor)
	addLuaText('playerName')
	

	

end

function onUpdate(elapsed)

	if specialIcons then 
		if curStep >= 1 then

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
		
	makeLuaSprite('SHB', 'gameShowHealthBar', 121 , 436);
	setScrollFactor('SHB', 1, 1);
	addLuaSprite('SHB', true);
	setProperty('SHB.flipY', true)
	scaleObject('SHB', '0.65','0.65');
	setObjectCamera('SHB', 'hud')
		

		setProperty('move.flipX', false)
		setProperty('move.visible', true)
		--setProperty('move.y', getProperty('iconP2.y') + 14)
		--setProperty('move.x', getProperty('iconP2.x') -20)
		setProperty('move.scale.y', 0.75)
		setProperty('move.scale.x', 0.75)
		setProperty('move.antialiasing',true)

		setObjectOrder('move', getObjectOrder('iconP2') + 1)
		setProperty('iconP2.alpha', 0) 

		setProperty('move2.flipX', true)
		setProperty('move2.visible', true)
		--setProperty('move2.y', getProperty('iconP1.y') + 14)
		--setProperty('move2.x', getProperty('iconP1.x'))
		setProperty('move2.scale.y', 0.75)
		setProperty('move2.scale.x', 0.75)
		setProperty('move2.antialiasing',true)


		setObjectOrder('move2', getObjectOrder('iconP1') + 1)
		setProperty('iconP1.alpha', 0) 
		
		setProperty('iconP1.x', 1000)
		setProperty('iconP1.y', 450)
		
		setProperty('healthBar.y', 526)
		setProperty('healthBar.x', -60)
		scaleObject('healthBar', '2','1.95')
		
		setObjectOrder('move', 50)
		setObjectOrder('move2', 50)
		
		setTextFont('timeTxt', 'GothicJoker.ttf')
		setProperty('timeTxt.x', 475)
		scaleObject('timeTxt', '0.75','0.75');
		setObjectOrder('timeTxt', 50)
		
		if not downscroll then
		    setProperty('move.y', 440)
		    setProperty('move2.y', 440)
		    setProperty('timeTxt.y', 139)
		    
		    
		end
		if downscroll then
		    setProperty('healthBar.y', 140)
		    setProperty('SHB.flipY', false)
		    setProperty('SHB.y', 140)
		    setProperty('move.y', 140)
		    setProperty('move2.y', 140)
		    setProperty('timeTxt.y', 572)
		    
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if specialIcons then
		if tag == 'LOSE2' then

			playAnim('move', 'lose',true)
		
		end

		if tag == 'WIN2' then

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
