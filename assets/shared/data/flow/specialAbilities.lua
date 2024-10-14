local turn = 0
isGameShow = false;
doWeed = false;
doSwitch = false;

local turn = 10
local turn2 = 20
local y = 0;
local x = 0;
local canBob = true
local Strums = 'opponentStrums'

local angleshit = 1;
local anglevar = 1;

local xx = 550; --dad
local yy = 640; 
local xx2 = 850; --bf
local yy2 = 610; 
local ofs = 25;  
local followchars = false; 
local del = 0;
local del2 = 0;
local i = 0;
local allowCountdown = false

function onCreate()

	
	makeAnimatedLuaSprite('special', 'gameshow/icons/specials', 560,200) 

	addAnimationByPrefix('special', 'health', 'health',24,false) -- done
	addAnimationByPrefix('special', 'slowdown', 'slow',24,false) -- done
	addAnimationByPrefix('special', 'speedup', 'speed',24,false) -- done
	addAnimationByPrefix('special', 'switched', 'switch',24,false) -- done
	addAnimationByPrefix('special', 'dark', 'dark',24,false) -- done
	addAnimationByPrefix('special', 'zaza', 'zaza',24,false) 

	setScrollFactor('special', 0.9, 0.9);
	addLuaSprite('special',true)
	scaleObject('special', 0.45,0.45);
	setObjectCamera('special', 'other')
	--screenCenter('special', 'x')

	setProperty('special.visible', false)

	makeLuaSprite('weedText', 'gameshow/icons/weedText', 0, 155);
	scaleObject('weedText', 3.6,3.6);
	setScrollFactor('weedText', 1, 1);
	scaleObject('weedText', '1.35','0.75');
	setObjectCamera('weedText', 'other')
	addLuaSprite('weedText', false);
	setBlendMode('weedText', 'screen')
	setProperty('weedText.alpha', 0) 

	makeLuaSprite('weedFuzz', 'gameshow/icons/weedFuzz', 0, 155);
	scaleObject('weedFuzz', '0.9','0.9');
	setScrollFactor('weedFuzz', 1, 1);
	scaleObject('weedFuzz', 5.4,3.0);
	setObjectCamera('weedFuzz', 'other')
	addLuaSprite('weedFuzz', false);
	setBlendMode('weedFuzz', 'multiply')
	setProperty('weedFuzz.alpha', 0) 

	setProperty('weedFuzz.visible', false)
	setProperty('weedText.visible', false)

	


end

randomAbilites = { --random words of encourgement
	[1] = function() --health boost
		setProperty('special.visible', true)
		objectPlayAnimation('special', 'health',false)
		runTimer('healthboost', 0.2,30)
		runTimer('fadeIcon', 7,1)
		runTimer('health', 2,1)
		
		playSound('GAMESHOW/miscSFX/healthSFX', 1)
		
	end,
	
	[2] = function() -- dark
		setProperty('special.visible', true)
		setProperty('special.alpha', 1) 
		objectPlayAnimation('special', 'dark',false)
		runTimer('dark', 2,1)
		runTimer('fadeIcon', 12,1)

		playSound('GAMESHOW/miscSFX/spinSFX', 1)
	
	end,
	[3] = function() -- speed up
		setProperty('special.visible', true)
		setProperty('special.alpha', 1) 
		objectPlayAnimation('special', 'speedup',false)
		runTimer('speed', 2,1)
		runTimer('fadeIcon', 12,1)

		playSound('GAMESHOW/miscSFX/speedSFX', 1)
	
	end,

	[4] = function() -- switched up
		setProperty('special.visible', true)
		setProperty('special.alpha', 1) 
		objectPlayAnimation('special', 'switched',false)
		runTimer('switched', 2,1)
		runTimer('resetStrum', 20,1)
		runTimer('fadeIcon', 12,1)

		playSound('GAMESHOW/miscSFX/switchSFX', 1)
		
	end,

	[5] = function() -- slow down
		setProperty('special.visible', true)
		setProperty('special.alpha', 1) 
		objectPlayAnimation('special', 'slowdown',false)
		runTimer('slow', 2,1)
		runTimer('fadeIcon', 12,1)

		playSound('GAMESHOW/miscSFX/slowSFX', 1)
	
	end,

	[6] = function() -- zaza
		setProperty('special.visible', true)
		setProperty('special.alpha', 1) 
		objectPlayAnimation('special', 'zaza',false)
		runTimer('zaza', 2,1)
		runTimer('fadeIcon', 12,1)
		
		playSound('GAMESHOW/miscSFX/zazaSFX', 1)
		
	end,

		
}

zazaSound = { 
	[1] = function() 
		playSound('GAMESHOW/ZAZA/zaza-1', 1)
		
	end,
	[2] = function()
		playSound('GAMESHOW/ZAZA/zaza-3', 1)

	end,
	[3] = function()
		playSound('GAMESHOW/ZAZA/zaza-3', 1)
		
	end
		
}

speedSound = { 
	[1] = function() 
		playSound('GAMESHOW/SPEED/speed-1', 1)
		
	end,
	[2] = function()
		playSound('GAMESHOW/SPEED/speed-2', 1)

	end
	
}

slowSound = { 
	[1] = function() 
		playSound('GAMESHOW/SLOW/slow-1', 1)
		
	end,
	[2] = function()
		playSound('GAMESHOW/SLOW/slow-2', 1)

	end
		
}

healthSound = { 
	[1] = function() 
		playSound('GAMESHOW/HEALTH/health-3', 1)
		
	end,
	[2] = function()
		playSound('GAMESHOW/HEALTH/health-2', 1)

	end,
	[3] = function()
		playSound('GAMESHOW/HEALTH/health-1', 1)
		
	end
		
}

darkSound = { 
	[1] = function() 
		playSound('GAMESHOW/DARK/dark-1', 1)
		
	end,
	[2] = function()
		playSound('GAMESHOW/DARK/dark-2', 1)

	end,
	[3] = function()
		playSound('GAMESHOW/DARK/dark-3', 1)
		
	end
		
}

switchedSound = { 
	[1] = function() 
		playSound('GAMESHOW/SWITCHED/switched-1', 1)
		
	end,
	[2] = function()
		playSound('GAMESHOW/SWITCHED/switched-2', 1)

	end,
	[3] = function()
		playSound('GAMESHOW/SWITCHED/switched-3', 1)
		
	end
		
}
stepHitFuncs = { 

	[5] = function() 
		
		--debugPrint(ability)

		--doWeed = true;
		--debugPrint(getRandomInt(1, 5, true))
	end,




}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end
function onUpdate(elapsed)

	if doWeed then
		cameraShake('other', 0.001, 10)
		yy2 = (math.sin(i/35)*75) + 600
		xx2 = (math.sin(i/35)*75) + 800
		daElapsed = elapsed * 30
		i = i + daElapsed
	else
		xx2 = 850; --bf
		yy2 = 600; 
	end

	--debugPrint(getRandomInt(1, 5, true))

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
           
        else
               
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
	  		if getProperty('boyfriend.animation.curAnim.name') == 'LEFTshoot' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'RIGHTshoot' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'UPshoot' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	   		if getProperty('boyfriend.animation.curAnim.name') == 'DOWNshoot' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    	if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- self explanatory
    end
    
end

function onPause()
	cameraShake('other', 0, 1)
	return Function_Continue;
end

function onTweenCompleted(tag, loops, loopsLeft)
	
	if tag == 'weedinout' then
		doTweenAlpha('weedinout2', 'weedText', 0, 1, 'smootherStepOut');
	end

	if tag == 'weedinout2' then
		doTweenAlpha('weedinout', 'weedText', 0.6, 1, 'smootherStepOut');
	end

	
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'healthboost' then
		if loopsLeft >= 1 then
		setProperty('health', getProperty('health')+0.015);
		end
	end

	if tag == 'health' then
		sound = getRandomInt(1, 3, true)
		healthSound[sound]();
	end

	if tag == 'dark' then
		doTweenAlpha('darkArrows', 'camHUD', 0.2, 0.5, 'smootherStepOut')
		sound = getRandomInt(1, 3, true)
		darkSound[sound]();
	end

	if tag == 'speed' then
		triggerEvent('Change Scroll Speed', '1', '1') 
		speedsoundlol = getRandomInt(1, 2, true)
		speedSound[speedsoundlol]();
	end

	if tag == 'slow' then
		triggerEvent('Change Scroll Speed', '0.3', '1') 
		slowsoundlol = getRandomInt(1, 2, true)
		slowSound[slowsoundlol]();
	end

	if tag == 'zaza' then
		doWeed = true;
		if doWeed then
			setProperty('weedFuzz.visible', true)
			setProperty('weedText.visible', true)
		end
		doTweenAlpha('weedinout', 'weedText', 0.6, 1, 'smootherStepOut');
		doTweenAlpha('weedbgt', 'weedFuzz', 0.9, 1, 'smootherStepOut');

		sound = getRandomInt(1, 3, true)
		zazaSound[sound]();
	end

	if tag == 'switched' then
		
		doSwitch = true;
		sound = getRandomInt(1, 3, true)
		switchedSound[sound]();

	end
	if tag == 'backtonormal' then
		doWeed = false;
		doSwitch = false;
	end
	
	if tag == 'fadeIcon' then
		doTweenAlpha('cya', 'special', 0, 0.5, 'smootherStepOut')
		doTweenAlpha('darkArrows', 'camHUD', 1, 0.5, 'smootherStepOut')
		triggerEvent('Change Scroll Speed', '0.75', '1') 
		cancelTween('weedinout')
		cancelTween('weedinout2')
		doTweenAlpha('weedbgdisappear', 'weedText', 0, 1, 'cubeOut');
		doTweenAlpha('weedbgdisappear2', 'weedFuzz', 0, 1, 'cubeOut');

		doTweenAngle('back', 'camHUD', 0, 1, 'cubeOut')
		doTweenAngle('back2', 'camGame', 0, 1, 'cubeOut')
		doWeed = false;
		doSwitch = false;
	end

	if tag == 'resetStrum' then
		doTweenAlpha('cya', 'special', 0, 0.5, 'smootherStepOut')
		turn = turn + 2075
		noteTweenAngle('swoosh0', 0, 0, 3, 'cubeInOut')
		noteTweenAngle('swoosh1', 1, 0, 3, 'cubeInOut')
		noteTweenAngle('swoosh2', 2, 0, 3, 'cubeInOut')
		noteTweenAngle('swoosh3', 3, 0, 3, 'cubeInOut')
		noteTweenAngle('swoosh4', 4, 0, 3, 'cubeInOut')
		noteTweenAngle('swoosh5', 5, 0, 3, 'cubeInOut')
		noteTweenAngle('swoosh6', 6, 0, 3, 'cubeInOut')
		noteTweenAngle('swoosh7', 7, 0, 3, 'cubeInOut')

		noteTweenX('swoosh22', 0, defaultOpponentStrumX0, 3, 'cubeOut')
		noteTweenX('swoosh33', 1, defaultOpponentStrumX1, 3, 'cubeOut')
		noteTweenX('swoosh11', 2, defaultOpponentStrumX2, 3, 'cubeOut')
		noteTweenX('swoosh41', 3, defaultOpponentStrumX3, 3, 'cubeOut')

		noteTweenX('swoosh44', 4, defaultPlayerStrumX0, 3, 'cubeOut')
		noteTweenX('swoosh55', 5, defaultPlayerStrumX1, 3, 'cubeOut')
		noteTweenX('swoosh66', 6, defaultPlayerStrumX2, 3, 'cubeOut')
		noteTweenX('swoosh77', 7, defaultPlayerStrumX3, 3, 'cubeOut')
		doSwitch = false;
	end
end

function onBeatHit()
	if doSwitch then
		if curBeat == 1 then 
			y = defaultOpponentStrumY1;
			noteTweenAlpha("vanish0",0,0.5,crochet*0.004,"sineInOut")
			noteTweenAlpha("vanish1",1,0.5,crochet*0.0045,"sineInOut")
			noteTweenAlpha("vanish2",2,0.5,crochet*0.005,"sineInOut")
			noteTweenAlpha("vanish3",3,0.5,crochet*0.0055,"sineInOut")
		end
		if curBeat == 240 then
		turn = turn * 4
		end
		if curBeat % 2 == 0 and canBob then 
			turn2 = turn2 * -1
			for i = 0,7 do
				local uhhh = curBeat % 8 * (i + i)
				local swag = i % 4 * 2.5 - uhhh
				if i > 3 then
					x =  getPropertyFromGroup('opponentStrums', i-4, 'x');
				else
					x =  getPropertyFromGroup('playerStrums', i, 'x');
				end
				--noteTweenY("wheeeup"..i,i,y + turn,crochet*0.002,"sineInOut")
				noteTweenX("wheeeleft"..i,i,x + turn2,crochet*0.002,"sineInOut")
			end
		end
	end

	if doWeed then
		if curBeat % 3 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end


		doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
		doTweenX('ttrn', 'camGame', -angleshit*10, crochet*0.001, 'linear')

		doTweenAngle('tuin2', 'camHUD', -angleshit*0.5, crochet*0.001, 'linear')
		doTweenAngle('ttrn2', 'camGame', -angleshit*0.9, crochet*0.001, 'linear')
	end

	if curBpm > 160 then
		if curBeat % 100 == 0 then
			ability = getRandomInt(1, 6, true)
			randomAbilites[ability]();
		end
	else
		if curBeat % 50 == 0 then
			ability = getRandomInt(1, 6, true)
			randomAbilites[ability]();
		end
	end
	--elseif curBeat % 50 == 0 then
	--	ability = getRandomInt(1, 6, true)
	--	randomAbilites[ability]();
	--end
end 