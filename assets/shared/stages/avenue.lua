colorP1 = getColorFromHex('f968aa')         
colorP2 = getColorFromHex('22ffdd')  

local mustZoom = false;
local xx = 650; -- dad
local yy = 620; 
local xx2 = 850; --bf
local yy2 = 620; 
local ofs = 25;  
local followchars = true; 
local del = 0;
local del2 = 0;

function onCreatePost() 

	if songName == 'flow' then
		setProperty(camX, 800);
		setProperty(camY, -1500);

		--setProperty('camGame.zoom',1.1)
		setProperty('camHUD.alpha', 0)

		setProperty('glassShit.alpha', 0)
		setProperty('glassShit2.alpha', 0)
		

		runTimer('panDown', 3,1);
		runTimer('fuckingOff', 5,1);
		runTimer('getOuttaHere', 1,1);
		runTimer('intro', 7,1);
		runTimer('introGone', 9,1);
		--cutscenePrepare()
		
	end

end

function onCreate()

	--cameraShit
	camX = 'camFollow.x';	
	camY = 'camFollow.y';

	setProperty('cameraSpeed', 1.5)

	makeLuaSprite('sky', 'week2/avenue/SKY', -230, -400);
	setScrollFactor('sky', 0.3, 0.3);
	addLuaSprite('sky', false);
	scaleObject('sky', '1','1');

	makeLuaSprite('bg2', 'week2/avenue/BGHOUSES', 310, 420);
	setScrollFactor('bg2', 0.65, 0.9);
	addLuaSprite('bg2', false);
	scaleObject('bg2', '1.15','1');

	makeLuaSprite('tree2', 'week2/avenue/TREES_2', 230, 220);
	setScrollFactor('tree2', 0.7, 0.9);
	addLuaSprite('tree2', false);
	scaleObject('tree2', '1.1','1');

	makeLuaSprite('tree1', 'week2/avenue/TREES_1', 130, 120);
	setScrollFactor('tree1', 0.7, 0.9);
	addLuaSprite('tree1', false);
	scaleObject('tree1', '1.1','1');

	makeLuaSprite('street', 'week2/avenue/STREET', -480, 620);
	setScrollFactor('street', 0.85, 0.9);
	addLuaSprite('street', false);
	scaleObject('street', '1.3','1');

	makeLuaSprite('popo', 'week2/avenue/policeCars', 420, 520);
	setScrollFactor('popo', 0.85, 0.9);
	addLuaSprite('popo', false);
	scaleObject('popo', '1','1');
	
	makeLuaSprite('bg', 'week2/avenue/BG', -480, -120);
	setScrollFactor('bg', 0.85, 0.9);
	addLuaSprite('bg', false);
	scaleObject('bg', '1.3','1');

	makeLuaSprite('pole', 'week2/avenue/trafficPole', 890, -90);
	setScrollFactor('pole', 0.9, 0.9);
	addLuaSprite('pole', false);
	scaleObject('pole', '1','1');

	makeAnimatedLuaSprite('cone', 'week2/avenue/trafficLight', 780, -70) 
	addAnimationByPrefix('cone', 'wee', 'trafficConeLOL', 24, true)
	setScrollFactor('cone', 0.9, 0.9);
	scaleObject('cone', '1','1');
	objectPlayAnimation('cone', 'wee', false)
	addLuaSprite('cone', true)

	makeLuaSprite('ground', 'week2/avenue/car', -200, 820);
	setScrollFactor('ground', 0.9, 0.9);
	addLuaSprite('ground', false);
	scaleObject('ground', '1','1');

	makeLuaSprite('light2', 'week2/newyork/screenShit/LIGHTTEST', -500, -200);
	setScrollFactor('light2', 0, 0);
	addLuaSprite('light2', true);
	scaleObject('light2', '1.5','1');
	setBlendMode('light2', 'SCREEN')
	setProperty('light2.color', colorP2)
	setProperty('light2.alpha', 0.7)




---------------------- HUD shit
	makeLuaSprite('scoreSprite', 'gameshow/HUD/scoreMisses', 0, 380);
	addLuaSprite('scoreSprite', false);
	setObjectCamera('scoreSprite', 'camHUD')
	scaleObject('scoreSprite', '1','1');

	makeLuaText('scoreShit', '', '0', 70, getProperty('scoreSprite.y') + 170) -- 495, 510
	setTextFont('scoreShit', 'GothicJoker.ttf')
	setTextAlignment('scoreShit', 'left')
	setTextSize('scoreShit','62')
	setProperty('scoreShit.angle', -10)
	setProperty('scoreShit.color', scoreColor)
	addLuaText('scoreShit')

	makeLuaText('missShit', '', '0', 100, getProperty('scoreShit.y') + 100) -- 495, 510
	setTextFont('missShit', 'GothicJoker.ttf')
	setTextAlignment('missShit', 'left')
	setTextSize('missShit','72')
	setProperty('missShit.angle', -10)
	setProperty('missShit.color', scoreColor)
	addLuaText('missShit')

	makeLuaText('opponentName', '', '0', 100, 0) -- 495, 510
	setTextFont('opponentName', 'GothicJoker.ttf')
	setTextAlignment('opponentName', 'left')
	setTextSize('opponentName','42')
	setProperty('opponentName.color', colorP1)
	addLuaText('opponentName')

	makeLuaText('playerName', '', '0', 100, 0) -- 495, 510
	setTextFont('playerName', 'GothicJoker.ttf')
	setTextAlignment('playerName', 'right')
	setTextSize('playerName','42')
	setProperty('playerName.color', colorP1)
	addLuaText('playerName')
	
---------------------INTRO NAMES 
	makeLuaText('opponentNameIntro', 'BOYFRIEND', '0', -300, 340) -- 495, 510
	setTextFont('opponentNameIntro', 'GothicJoker.ttf')
	setTextAlignment('opponentNameIntro', 'right')
	setTextSize('opponentNameIntro','72')
	addLuaText('opponentNameIntro')

	makeLuaText('playerNameIntro', 'NOVA', '0', 2000, 340) -- 495, 510
	setTextFont('playerNameIntro', 'GothicJoker.ttf')
	setTextAlignment('playerNameIntro', 'right')
	setTextSize('playerNameIntro','72')
	addLuaText('playerNameIntro')

	setObjectCamera('opponentNameIntro', 'other')
	setObjectCamera('playerNameIntro', 'other')
	

	--endingScreen()
	letterBox()

end
function onUpdate(elapsed)

	--for i = 0,3 do 
	--	setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
	--end

	setTextString('missShit', misses)

	setProperty('blackStreaks.alpha', 0)
	setProperty('ratingTxt.alpha', 0)
	setProperty('scoreTxt.alpha', 0)
	setProperty('missesTxt.alpha', 0)

	if curStep  > 0 and  curStep < 1131  and mustZoom then
		if mustHitSection == false  then
			setProperty('defaultCamZoom',0.8)
			doTweenZoom('hellowee', 'camGame', '0.8', 1, 'bounceIn') -- 1
		else
            setProperty('defaultCamZoom',0.95)
        end
	end


	-- setProperty('dad.y',500)
	-- setProperty('dad.x',100)
	
	setProperty('gf.alpha', 0)


	setProperty('dad.scrollFactor.x', 0.9);
	setProperty('dad.scrollFactor.y', 0.9);

	setProperty('boyfriend.scrollFactor.x', 0.9);
	setProperty('boyfriend.scrollFactor.y', 0.9);

	setProperty('gf.scrollFactor.x', 0.9);
	setProperty('gf.scrollFactor.y', 0.9);

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

function endingScreen()

	makeLuaSprite('clipBottom2', '', 0, 750);
	setScrollFactor('clipBottom2', 1, 1);
	addLuaSprite('clipBottom2', false);
	scaleObject('clipBottom2', '1','1');
	makeGraphic('clipBottom2', screenWidth, 80, '000000')
	setObjectCamera('clipBottom2', 'camHUD')

	makeLuaSprite('clipTop2', '', 0, -100);
	setScrollFactor('clipTop2', 1, 1);
	addLuaSprite('clipTop2', false);
	scaleObject('clipTop2', '1','1');
	makeGraphic('clipTop2', screenWidth, 80, '000000')
	setObjectCamera('clipTop2', 'camHUD')

	makeLuaSprite('endingBG', '', 0, 0);
	setScrollFactor('endingBG', 1, 1);
	addLuaSprite('endingBG', true);
	scaleObject('endingBG', '1','1');
	makeGraphic('endingBG', screenWidth, screenHeight)
	setProperty('endingBG.color', redTeamColor)
	setObjectCamera('endingBG', 'camHUD')

	makeLuaSprite('endingSprite', 'gameshow/endingShot', -1400, 0);
	addLuaSprite('endingSprite', true);
	screenCenter('endingSprite', 'y')
	setObjectCamera('endingSprite', 'camHUD')
	scaleObject('endingSprite', '1','1');

	makeLuaText('winner', 'WINNER', '0', 550, -550) -- 495, 510
	setTextFont('winner', 'GothicJoker.ttf')
	setTextAlignment('winner', 'center')
	setProperty('winner.alpha', 0.5)
	setTextSize('winner','250')
	scaleObject('winner', '1.7','1');
	setObjectCamera('winner', 'camHUD')
	--setProperty('winner.color', colorP1)
	addLuaText('winner')

	doTweenY('moveTag', 'winner', 450, 1, 'circIn')
	runTimer('moveTagOut', 5,1);
	doTweenX('moveSpr', 'endingSprite', 100, 5, 'elasticOut')

	cameraFlash('camHUD', '000000', 1, false)
	letterBox2()
end

function noteMiss(id, direction, noteType, isSustainNote)

	scaleObject('missShit', '1.3','1.3');
	doTweenX('missShitX', 'missShit.scale', 1, 0.5, 'circOut')
	doTweenY('missShitY', 'missShit.scale', 1, 0.5, 'circOut')
	
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	scaleObject('scoreShit', '1.2','1.2');
	doTweenX('scoreShitX', 'scoreShit.scale', 1, 0.5, 'circOut')
	doTweenY('scoreShitY', 'scoreShit.scale', 1, 0.5, 'circOut')

	setProperty('health', getProperty('health')+0.035);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)

	if getProperty('health') > 0.2 then
		setProperty('health', getProperty('health')-0.045);
	end

end

function onBeatHit()

	if curBeat % 2 == 0 then
		triggerEvent('Add Camera Zoom','0.035','0')

		setProperty('camZooming', true)
	end

end

function letterBox() 

	doTweenY('clip1Move', 'clipTop', -20, 2, 'smootherStepIn')
	doTweenY('clip2Move', 'clipBottom', 660, 2, 'smootherStepIn')
	--doTweenAlpha('byebye', 'camHUD', 0, 0.5, 'backIn')
	
end

function letterBox2() 

	doTweenY('clip1Move2', 'clipTop2', -20, 2, 'smootherStepIn')
	doTweenY('clip2Move2', 'clipBottom2', 660, 2, 'smootherStepIn')
	--doTweenAlpha('byebye', 'camHUD', 0, 0.5, 'backIn')
	
end


stepHitFuncs = { 

	
	[5] = function() --testing space
		 doTweenAngle('lightshitR', 'lightsShit2', '30', timeshit, 'smootherStepIn')
		 doTweenAngle('lightshiL', 'lightsShit', '-30', timeshit, 'smootherStepIn')
		 doTweenX('lightshitR3', 'lightsShit2', 1400, timeshit, 'smootherStepIn')
		 doTweenX('lightshitL3', 'lightsShit', -170, timeshit, 'smootherStepIn')
		
		
		
		--  runTimer('introShow', 2,1);
		--  runTimer('introTxtGone', 4,1);
		--  triggerEvent('Play Animation', 'INTRO', 'BF')
		--  triggerEvent('Play Animation', 'INTRO', 'Dad')
	end,

	[16] = function() --testing space

		
	end,

	[901] = function() --testing space
		triggerEvent('Play Animation', 'NICE', 'BF')
		triggerEvent('Play Animation', 'NICE', 'Dad')
		--setProperty(camY, 700);
		setProperty(camX, 600);
		doTweenZoom('nice', 'camGame', '0.8', 1, 'circOut')
	end,

}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end

function endingScribble()
	makeAnimatedLuaSprite('paint', 'hudShit/transitionBrush', -20,-20) 				 
	scaleObject('paint', '1.6','1.55');
	setObjectCamera('paint', 'other')
	setObjectOrder('paint', 2000)
	addLuaSprite('paint',true)

	addAnimationByPrefix('paint', 'painting', 'brush0',24,false)
	playAnim('paint', 'painting',true)	
	playSound('scribble', 1)

end

function introText()
	doTweenX('moveTxt1', 'playerNameIntro', 1500, 1, 'elasticInOut')
	doTweenX('moveTxt2', 'opponentNameIntro', 200, 1, 'elasticInOut')
	doTweenZoom('introZoom', 'camGame', '1', 0.5, 'smootherStepIn')
	setProperty('defaultCamZoom',1)
	cameraFlash('other', 'ffffff', 1, false)
	setProperty('introSlide.visible', true)
end

function introFinished()
	doTweenY('txtGone', 'playerNameIntro', 800, 1, 'circIn')
	doTweenY('txtGone2', 'opponentNameIntro', 800, 1, 'circIn')

	doTweenAlpha('deleteShit', 'introSlide', 0, 1, 'smootherStepOut')
	doTweenZoom('introZoom', 'camGame', '0.8', 2, 'smootherStepOut')
	setProperty('defaultCamZoom',0.8)
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'getOuttaHere' then
		doTweenAlpha('delete', 'introHide', 0, 2, 'backIn')
	end

	if tag == 'introShow' then
		introText()
	end

	if tag == 'introTxtGone' then
		introFinished()
	end

	if tag == 'moveTagOut' then
		doTweenY('moveTag2', 'winner', 850, 0.6, 'circIn')
	end

	if tag == 'panDown' then
		runTimer('gameStart', 9,1);

		debugPrint('no easter egg here, go away')
	end

	if tag == 'gameStart' then
		
		doTweenZoom('begin2', 'camGame', '1.2', 1, 'bounceIn')
		doTweenAlpha('hello', 'camHUD', 1, 0.5, 'backIn')
		setProperty('cameraSpeed', 1)
		mustZoom = true;
		followchars = true; 
		--followchars = true;
		--setProperty('defaultCamZoom',0.9)
		

		--doTweenAlpha('hello1', 'glassShit', 1, 0.5, 'backIn')
		--doTweenAlpha('hello2', 'glassShit2', 1, 0.5, 'backIn')

		--cutsceneGoaway()
		
	end

	if tag == 'fuckingOff' then
		triggerEvent('Play Animation', 'INTRO', 'BF')
		triggerEvent('Play Animation', 'INTRO', 'Dad')

		runTimer('introShow', 2,1);
		runTimer('introTxtGone', 4,1);
	
	end

	if tag == 'intro' then
		cameraFlash('other', 'ffffff', 1, false)
		setProperty('introSlide.visible', true)
		doTweenZoom('yup', 'camGame', '1.2', 1, 'circOut')
		setProperty('defaultCamZoom',1.2)
	end

	if tag == 'introGone' then
		setProperty('introSlide.visible', false)
		--doTweenZoom('yup', 'camGame', '0.8', 0.7, 'circOut')
	
	end

end

function onTweenCompleted(tag, loops, loopsLeft)
	
	-- if tag == 'moveTxt2' then
	-- 	cameraFlash('camHUD', 'ffffff', 1, false)
	-- end
	if tag == 'lightshitR' then
		doTweenAngle('lightshitR2', 'lightsShit2', '-60', timeshit, 'smootherStepOut')
		doTweenAngle('lightshiL2', 'lightsShit', '60', timeshit, 'smootherStepOut')
		doTweenX('lightshitR3', 'lightsShit2', 1350, timeshit, 'smootherStepIn')
		doTweenX('lightshitL3', 'lightsShit', -200, timeshit, 'smootherStepIn')
	end

	if tag == 'lightshitR2' then
		doTweenAngle('lightshitR', 'lightsShit2', '30', timeshit, 'smootherStepIn')
		doTweenAngle('lightshiL', 'lightsShit', '-30', timeshit, 'smootherStepIn')
		doTweenX('lightshitR3', 'lightsShit2', 1400, timeshit, 'smootherStepIn')
		doTweenX('lightshitL3', 'lightsShit', -170, timeshit, 'smootherStepIn')
	end

	if tag == 'moveTag2' then
		endingScribble()
	end

end

