local health = 791.5
local pos = 640.5

colorP1 = getColorFromHex('f968aa')             --- Put here the HEX code of the color that you want (for Player 1)
colorP2 = getColorFromHex('22ffdd')  

timeshit = 2
scoreColor = getColorFromHex('ffa922') 

redTeamColor = getColorFromHex('fa426a') 
bgColor = getColorFromHex('5f0679') 

local mustZoom = false;
local xx = 550; -- dad
local yy = 640; 
local xx2 = 850; --bf
local yy2 = 610; 
local ofs = 25;  
local followchars = true; 
local del = 0;
local del2 = 0;


local preIntroSounds = {
	{sound = 'GAMESHOW/PREINTRO/preintro-1'},
	{sound = 'GAMESHOW/PREINTRO/preintro-2'},
	{sound = 'GAMESHOW/PREINTRO/preintro-3'}
}

local getRandomLOL = getRandomInt(1, #preIntroSounds)
local gotSound = preIntroSounds[getRandomLOL]

function onCreatePost() 

	-- if songName == 'flow' then
	-- 	setProperty(camX, 800);
	-- 	setProperty(camY, -1500);

	-- 	--setProperty('camGame.zoom',1.1)
	-- 	setProperty('camHUD.alpha', 0)

	-- 	setProperty('glassShit.alpha', 0)
	-- 	setProperty('glassShit2.alpha', 0)
		

	-- 	runTimer('panDown', 3,1);
	-- 	runTimer('fuckingOff', 5,1);
	-- 	runTimer('getOuttaHere', 1,1);
	-- 	runTimer('intro', 7,1);
	-- 	runTimer('introGone', 9,1);
	-- 	--cutscenePrepare()
		
	-- end

end

function onCreate()

    triggerEvent('Change Scroll Speed', 0.75, 0.1)

	--cameraShit
	camX = 'camFollow.x';	
	camY = 'camFollow.y';
	setProperty('cameraSpeed', 1.5)


	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'novaDeath'); --put in mods/sounds/


	makeLuaSprite('wall', 'gameshow/WALL', -730, -1900);
	setScrollFactor('wall', 0.75, 0.9);
	addLuaSprite('wall', false);
	scaleObject('wall', 4,4);

	makeLuaSprite('wallBG', 'gameshow/WALLS', 1100, -300);
	setScrollFactor('wallBG', 0.8, 0.9);
	addLuaSprite('wallBG', false);
	scaleObject('wallBG', 2,2);
	
	makeLuaSprite('wallBG2', 'gameshow/WALLS', -700, -300);
	setScrollFactor('wallBG2', 0.8, 0.9);
	addLuaSprite('wallBG2', false);
	scaleObject('wallBG2', 2,2);
	setProperty('wallBG2.flipX', true)

	makeLuaSprite('ground', 'gameshow/GROUND', -800, -200);
	setScrollFactor('ground', 0.9, 0.9);
	addLuaSprite('ground', false);
	scaleObject('ground', 2,2);

	makeAnimatedLuaSprite('seats', 'gameshow/SEATS', -900,100)	
	scaleObject('seats', 2,2);
	addAnimationByPrefix('seats', 'sit', 'seats', 24, true)
	addLuaSprite('seats',false)
	setScrollFactor('seats', 0.9, 0.9);

	makeAnimatedLuaSprite('seats2', 'gameshow/SEATS', 1300,100)	
	scaleObject('seats2', 2,2);
	addAnimationByPrefix('seats2', 'sit', 'seats', 24, true)
	addLuaSprite('seats2',false)
	setScrollFactor('seats2', 0.9, 0.9);
	setProperty('seats2.flipX', true)

	makeAnimatedLuaSprite('lightGround', 'gameshow/groundLights', -500,700)	
	addAnimationByPrefix('lightGround', 'lighting', 'lightFloor', 24, true)
	scaleObject('lightGround', 2,2);
	addLuaSprite('lightGround',false)
	setBlendMode('lightGround', 'SCREEN')
	setScrollFactor('lightGround', 0.9, 0.9);

	makeLuaSprite('light2', 'week2/screenShit/LIGHTTEST', -500, -50);
	setScrollFactor('light2', 0.9, 0.9);
	addLuaSprite('light2', false);
	scaleObject('light2', 6,4);
	setBlendMode('light2', 'MULTIPLY')
	setObjectCamera('light2', 'hud')

	makeLuaSprite('bowLight', 'gameshow/bowlLight', -500, -100);
	setScrollFactor('bowLight', 0.9, 0.9);
	addLuaSprite('bowLight', true);
	setProperty('bowLight.color', colorP2)
	scaleObject('bowLight', 4,4);
	setBlendMode('bowLight', 'SCREEN')


	makeLuaSprite('bowl', 'gameshow/BOWL', -400, -1600);
	setScrollFactor('bowl', 1.2, 1.6);
	addLuaSprite('bowl', false);
	scaleObject('bowl', 2,2);

	makeLuaSprite('lightsShit', 'gameshow/lightBG', -200, -50); -- left
	setScrollFactor('lightsShit', 0.9, 0.9);
	addLuaSprite('lightsShit', true);
	scaleObject('lightsShit', '2','2');
	setProperty('lightsShit.angle', 60)
	setBlendMode('lightsShit', 'SCREEN')

	makeLuaSprite('lightsShit2', 'gameshow/lightBG', 1350, -50); --right
	setScrollFactor('lightsShit2', 0.9, 0.9);
	addLuaSprite('lightsShit2', true);
	scaleObject('lightsShit2', '2','2');
	setProperty('lightsShit2.flipX', true)
	setProperty('lightsShit2.angle', -60)
	setBlendMode('lightsShit2', 'SCREEN')

	makeLuaSprite('introSlide', '', 0, 0);
	setScrollFactor('introSlide', 0, 0);
	addLuaSprite('introSlide', false);
	scaleObject('introSlide', '1.5','1.5');
	makeGraphic('introSlide', screenWidth, screenHeight)
	setProperty('introSlide.color', bgColor)
	setBlendMode('introSlide', 'MULTIPLY')
	setProperty('introSlide.visible', false)

	makeLuaSprite('introHide', '', 0, 0);
	setScrollFactor('introHide', 1, 1);
	addLuaSprite('introHide', true);
	scaleObject('introHide', '1','1');
	makeGraphic('introHide', screenWidth, screenHeight, '000000')
	setObjectCamera('introHide', 'other')

	makeAnimatedLuaSprite('bop1', 'gameshow/bops/bop_1', -1100,690)	
	scaleObject('bop1', 2,2);
	addAnimationByPrefix('bop1', 'bopp1', 'bop1', 24, true)
	addLuaSprite('bop1',true)
	setScrollFactor('bop1', 1.7, 1);

	makeAnimatedLuaSprite('bop2', 'gameshow/bops/bop_2', 400,790)	
	scaleObject('bop2', 2,2);
	addAnimationByPrefix('bop2', 'bopp2', 'bop2', 24, true)
	addLuaSprite('bop2',true)
	setScrollFactor('bop2', 1.2, 1);

	makeAnimatedLuaSprite('bop3', 'gameshow/bops/bop_3', 1100,690)	
	scaleObject('bop3', 2,2);
	addAnimationByPrefix('bop3', 'bopp3', 'bop3', 24, true)
	addLuaSprite('bop3',true)
	setScrollFactor('bop3', 1.4, 1);

	makeAnimatedLuaSprite('bop4', 'gameshow/bops/bop_4', 1600,390)	
	scaleObject('bop4', 2,2);
	addAnimationByPrefix('bop4', 'bopp4', 'bop4', 24, true)
	addLuaSprite('bop4',true)
	setScrollFactor('bop4', 1.6, 1);

	makeLuaSprite('clipTop', '', 0, -100);
	setScrollFactor('clipTop', 1, 1);
	addLuaSprite('clipTop', false);
	scaleObject('clipTop', '1','1');
	makeGraphic('clipTop', 1300, 80, '000000')
	setObjectCamera('clipTop', 'camHUD')

	makeLuaSprite('clipBottom', '', 0, 750);
	setScrollFactor('clipBottom', 1, 1);
	addLuaSprite('clipBottom', false);
	scaleObject('clipBottom', '1','1');
	makeGraphic('clipBottom', 1300, 80, '000000')
	setObjectCamera('clipBottom', 'camHUD')
	
---------------------- HUD shit
	makeLuaSprite('scoreSprite', 'gameshow/HUD/scoreMisses', 0, 350);
	addLuaSprite('scoreSprite', false);
	setObjectCamera('scoreSprite', 'camHUD')
	scaleObject('scoreSprite', '0.75','0.75');

	makeLuaText('scoreShit', '', '0', 50, getProperty('scoreSprite.y') + 135) -- 495, 510
	setTextFont('scoreShit', 'GothicJoker.ttf')
	setTextAlignment('scoreShit', 'left')
	setTextSize('scoreShit','46.5')
	setProperty('scoreShit.angle', -10)
	setProperty('scoreShit.color', scoreColor)
	addLuaText('scoreShit')

	makeLuaText('missShit', '', '0', 80, getProperty('scoreShit.y') + 60) -- 495, 510
	setTextFont('missShit', 'GothicJoker.ttf')
	setTextAlignment('missShit', 'left')
	setTextSize('missShit','54')
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
	-- makeLuaText('opponentNameIntro', 'BOYFRIEND', '0', -300, 340) -- 495, 510
	-- setTextFont('opponentNameIntro', 'GothicJoker.ttf')
	-- setTextAlignment('opponentNameIntro', 'right')
	-- setTextSize('opponentNameIntro','72')
	-- addLuaText('opponentNameIntro')

	-- makeLuaText('playerNameIntro', 'NOVA', '0', 2000, 340) -- 495, 510
	-- setTextFont('playerNameIntro', 'GothicJoker.ttf')
	-- setTextAlignment('playerNameIntro', 'right')
	-- setTextSize('playerNameIntro','72')
	-- addLuaText('playerNameIntro')

	-- setObjectCamera('opponentNameIntro', 'other')
	-- setObjectCamera('playerNameIntro', 'other')

	makeLuaSprite('splat', 'gameshow/HUD/logo/splat', 0, 200);
	setScrollFactor('splat', 1, 1);
	addLuaSprite('splat', true);
	scaleObject('splat', '0.3','0.3');
	setObjectCamera('splat', 'other')
	updateHitbox('splat')
	screenCenter('splat', '')
	setProperty('splat.alpha', 0)

	makeLuaSprite('free', 'gameshow/HUD/logo/freestyle', 0, -260);
	setScrollFactor('free', 1, 1);
	addLuaSprite('free', true);
	scaleObject('free', '0.3','0.3');
	setObjectCamera('free', 'other')
	updateHitbox('free')
	screenCenter('free', 'x')

	makeLuaSprite('funk', 'gameshow/HUD/logo/funkin', 0, 725);
	setScrollFactor('funk', 1, 1);
	addLuaSprite('funk', true);
	scaleObject('funk', '0.3','0.3');
	setObjectCamera('funk', 'other')
	updateHitbox('funk')
	screenCenter('funk', 'x')
	
	
	makeLuaSprite('cracktop', 'menuReload/SCREEN UI SHIT/crack', 1000,120);
	setScrollFactor('cracktop', 1, 1);
	addLuaSprite('cracktop', false);
	scaleObject('cracktop', '0.65','0.65');
	setObjectCamera('cracktop', 'other')
	setBlendMode('cracktop', 'SCREEN')
	
	makeLuaSprite('crackbottom', 'menuReload/SCREEN UI SHIT/crack', -47,523);
	setScrollFactor('crackbottom', 1, 1);
	addLuaSprite('crackbottom', false);
	setProperty('crackbottom.flipX', true)
	scaleObject('crackbottom', '0.65','0.65');
	setObjectCamera('crackbottom', 'other')
	setBlendMode('crackbottom', 'SCREEN')
	
	makeLuaSprite('clipTop1', '', 0, -20);
	setScrollFactor('clipTop1', 1, 1);
	addLuaSprite('clipTop1', false);
	scaleObject('clipTop1', '2','2.5');
	makeGraphic('clipTop1', 1300, 80, '000000')
	setObjectCamera('clipTop1', 'other')
	
	makeLuaSprite('clipBottom1', '', 0, 660);
	setScrollFactor('clipBottom1', 1, 1);
	addLuaSprite('clipBottom1', false);
	scaleObject('clipBottom1', '2','2.5');
	makeGraphic('clipBottom1', 1300, 80, '000000')
	setObjectCamera('clipBottom1', 'other')
	
	
	setObjectOrder('clipBottom1', 50)
	setObjectOrder('clipTop1', 50)
	
	
	
	runTimer('splatIn', 2,1);
	runTimer('moveLogo', 2.5,1);
	runTimer('getOuttaHere', 6,1);
	runTimer('removeLogo', 7,1);

	letterBox()

end

function onUpdate(elapsed)

	--for i = 0,3 do 
	--	setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
	--end
	setProperty('scoreTxt.visible', false)
	 
	for i = 0,7 do
	    if not downscroll then
	        setPropertyFromGroup('strumLineNotes', i, 'y', 135);
	    end
	    if downscroll then
	        setPropertyFromGroup('strumLineNotes', i, 'y', 490);
	    end
	end
		for i = 0,3 do 
		setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.45)
		setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.45)
		setPropertyFromGroup('strumLineNotes', 0, 'x', 135)
		setPropertyFromGroup('strumLineNotes', 1, 'x', 208)
		setPropertyFromGroup('strumLineNotes', 2, 'x', 282)
		setPropertyFromGroup('strumLineNotes', 3, 'x', 357)
		--setPropertyFromGroup('strumLineNotes', i, 'y', 135);
		setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.95);
end
	
	for i = 4,7 do
		setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.45)
		setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.45)
		setPropertyFromGroup('strumLineNotes', 4, 'x', 775)
		setPropertyFromGroup('strumLineNotes', 5, 'x', 848)
		setPropertyFromGroup('strumLineNotes', 6, 'x', 922)
		setPropertyFromGroup('strumLineNotes', 7, 'x', 997)
		--setPropertyFromGroup('strumLineNotes', i, 'y', 135);
		setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.95);
		setPropertyFromGroup('notes', i, 'scale.x', 0.45)
		setPropertyFromGroup('notes', i, 'scale.x', 0.45)
end
	
	for i= 0, getProperty('notes.length')-1 do
	    if not getPropertyFromGroup('notes',i,'isSustainNote') then
	        setPropertyFromGroup('notes', i, 'scale.x', 0.45)
	        setPropertyFromGroup('notes', i, 'scale.y', 0.45)
    end
end

    for i = 0, getProperty('grpNoteSplashes.length') - 1 do
        setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -45)
        setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -45)
        setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', 0.75)
        setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', 0.75)
        setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0.6);
end

	setTextString('missShit', misses)

	setProperty('blackStreaks.alpha', 0)
	setProperty('ratingTxt.alpha', 0)
	setProperty('scoreTxt.alpha', 0)
	setProperty('missesTxt.alpha', 0)

	if curStep  > 0 and  curStep < 1131  and mustZoom then
		if mustHitSection == false  then
			setProperty('defaultCamZoom',0.6)
			doTweenZoom('hellowee', 'camGame', '0.6', 1, 'bounceIn') -- 1
		else
            setProperty('defaultCamZoom',0.65)
        end
	end

	if curStep  < 15 then
		setProperty('cameraSpeed', 1.3)
		--setProperty(camX, 680);
		--setProperty(camY, 640);
	
	elseif curStep  > 15 and curStep < 115 then
		
	 	setProperty(camX, 680);
		setProperty(camY, 640);
		setProperty('cameraSpeed', 0.34)

	else
		setProperty('cameraSpeed', 1.2)
	end
	-- elseif  curStep > 116 then
	-- 	setProperty('cameraSpeed', 1.2)
	-- end

	setProperty('dad.y',600)
	setProperty('dad.x',200)
	
	setProperty('gf.alpha', 0)

	
	setProperty('opponentName.x', getProperty('gameShowHealthBar.x') + 210)
	setTextString('opponentName', getProperty('dad.curCharacter'))
	setObjectOrder('opponentName', getObjectOrder('iconP1') + 1)

	if downscroll then 
		setProperty('opponentName.y', getProperty('gameShowHealthBar.y') + 33)
		setProperty('playerName.y', getProperty('gameShowHealthBar.y') + 33)
	else
		setProperty('playerName.y', getProperty('gameShowHealthBar.y') + 132)
		setProperty('opponentName.y', getProperty('gameShowHealthBar.y') + 132)
	end
	setProperty('playerName.x', getProperty('gameShowHealthBar.width') - 280)
	setTextString('playerName', getProperty('boyfriend.curCharacter'))
	setObjectOrder('playerName', getObjectOrder('iconP1') + 1)

	setProperty('missShit.x', 110)
	setProperty('missShit.y', getProperty('scoreShit.y') + 80)
	updateHitbox('missShit')
	updateHitbox('scoreShit')
	--setProperty('bar.y', getProperty('healthBar.y')+ 50)


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

-- function endingScreen()

-- 	makeLuaSprite('clipBottom2', '', 0, 750);
-- 	setScrollFactor('clipBottom2', 1, 1);
-- 	addLuaSprite('clipBottom2', false);
-- 	scaleObject('clipBottom2', '1','1');
-- 	makeGraphic('clipBottom2', screenWidth, 80, '000000')
-- 	setObjectCamera('clipBottom2', 'camHUD')

-- 	makeLuaSprite('clipTop2', '', 0, -100);
-- 	setScrollFactor('clipTop2', 1, 1);
-- 	addLuaSprite('clipTop2', false);
-- 	scaleObject('clipTop2', '1','1');
-- 	makeGraphic('clipTop2', screenWidth, 80, '000000')
-- 	setObjectCamera('clipTop2', 'camHUD')

-- 	makeLuaSprite('endingBG', '', 0, 0);
-- 	setScrollFactor('endingBG', 1, 1);
-- 	addLuaSprite('endingBG', true);
-- 	scaleObject('endingBG', '1','1');
-- 	makeGraphic('endingBG', screenWidth, screenHeight)
-- 	setProperty('endingBG.color', redTeamColor)
-- 	setObjectCamera('endingBG', 'camHUD')

-- 	makeLuaSprite('endingSprite', 'gameshow/endingShot', -1400, 0);
-- 	addLuaSprite('endingSprite', true);
-- 	screenCenter('endingSprite', 'y')
-- 	setObjectCamera('endingSprite', 'camHUD')
-- 	scaleObject('endingSprite', '1','1');

-- 	makeLuaText('winner', 'WINNER', '0', 550, -550) -- 495, 510
-- 	setTextFont('winner', 'GothicJoker.ttf')
-- 	setTextAlignment('winner', 'center')
-- 	setProperty('winner.alpha', 0.5)
-- 	setTextSize('winner','250')
-- 	scaleObject('winner', '1.7','1');
-- 	setObjectCamera('winner', 'camHUD')
-- 	--setProperty('winner.color', colorP1)
-- 	addLuaText('winner')

-- 	doTweenY('moveTag', 'winner', 450, 1, 'circIn')
-- 	runTimer('moveTagOut', 5,1);
-- 	doTweenX('moveSpr', 'endingSprite', 100, 5, 'elasticOut')

-- 	cameraFlash('camHUD', '000000', 1, false)
-- 	letterBox2()
-- end

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

	doTweenY('clip1Move', 'clipTop', 80, 2, 'smootherStepIn')
	doTweenY('clip2Move', 'clipBottom', 567, 2, 'smootherStepIn')
	--doTweenAlpha('byebye', 'camHUD', 0, 0.5, 'backIn')
	
end

function letterBox2() 

	doTweenY('clip1Move2', 'clipTop2', 80, 2, 'smootherStepIn')
	doTweenY('clip2Move2', 'clipBottom2', 567, 2, 'smootherStepIn')
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
	scaleObject('paint', 6.4,6.2);
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
	doTweenZoom('introZoom', 'camGame', '0.8', 0.5, 'smootherStepIn')
	setProperty('defaultCamZoom',0.8)
	cameraFlash('other', 'ffffff', 1, false)
	setProperty('introSlide.visible', true)
end

function introFinished()
	doTweenY('txtGone', 'playerNameIntro', 800, 1, 'circIn')
	doTweenY('txtGone2', 'opponentNameIntro', 800, 1, 'circIn')

	doTweenAlpha('deleteShit', 'introSlide', 0, 1, 'smootherStepOut')
	doTweenZoom('introZoom', 'camGame', '0.6', 2, 'smootherStepOut')
	setProperty('defaultCamZoom',0.6)
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
		
		doTweenZoom('begin2', 'camGame', '0.8', 1, 'bounceIn')
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
		doTweenZoom('yup', 'camGame', '0.8', 1, 'circOut')
		setProperty('defaultCamZoom',0.8)
	end

	if tag == 'introGone' then
		setProperty('introSlide.visible', false)
	
	end

	if tag == 'splatIn' then
		doTweenAlpha('splatter', 'splat', 1, 0.5, 'backIn')
		playSound('GAMESHOW/INTRO/intro-2', 1)
	
	
	end

	if tag == 'moveLogo' then
		doTweenY('movein1', 'free', 260, 2, 'bounceOut')
		doTweenY('movein2', 'funk', 325, 2, 'bounceOut')
	
	end

	if tag == 'removeLogo' then
		doTweenAlpha('gone1', 'splat', 0, 0.5, 'sineOut')
		doTweenAlpha('gone2', 'funk', 0, 0.5, 'sineOut')
		doTweenAlpha('gone3', 'free', 0, 0.5, 'sineOut')

		sound = getRandomInt(1, 3, true)
		randomPreIntro[sound]();
	
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

randomPreIntro = { 
	[1] = function() 
		playSound('GAMESHOW/PREINTRO/preintro-1', 1)
		
	end,
	[2] = function()
		playSound('GAMESHOW/PREINTRO/preintro-2', 1)

	end,
	[3] = function()
		playSound('GAMESHOW/PREINTRO/preintro-3', 1)
		
	end
		
}

