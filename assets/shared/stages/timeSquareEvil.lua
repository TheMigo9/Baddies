local xx = 590;
local yy = 250;
local xx2 = 650; 
local yy2 = 430; 
local xx3 = 560;
local yy3 = 170;
local ofs = 15;  
local ofs2 = 35;  
local followchars = true; 
local del = 0;
local del2 = 0;
local i = 0;
local uhohEnd = true

local mustZoomIn = true

local isEnding = false;
local isStarting = false;

local wtfIntro = true
local doIntro = false
local datStory = false
local doDialogue = false
local allowCountdown = false
local allowCountdown2 = false

local test = false
local turnon = false
local playedAlready = false


function onStartCountdown()


	if isStoryMode and songName == 'uhoh' then
		
		if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
			startVideo('insane');
			allowCountdown = true;
			doDialogue = true;
			return Function_Stop;
	
		elseif not doIntro and not allowCountdown2 and doDialogue and not censored then
			isStarting = true;
			endingScribble()

			setProperty('inCutscene', true);
			startDialogue('uhohShit', 'dialogueMusic/uhohDia') 

			doDialogue = false
			doIntro = true
			allowCountdown2 = true
			test = false
			return Function_Stop
		elseif not doIntro and not allowCountdown2 and doDialogue and censored then
			isStarting = true;
			endingScribble()

			setProperty('inCutscene', true);
			startDialogue('uhohCensored', 'dialogueMusic/uhohDia') 

			doDialogue = false
			doIntro = true
			allowCountdown2 = true
			test = false
			return Function_Stop
		elseif doIntro and allowCountdown2 and isStoryMode then
		
			if not test then
				debugPrint('did the game stop?')
				turnon = true
				runTimer('introRemove2', 1,1);
				onCreatePost()
				return Function_Stop

			elseif test then

				debugPrint('did the dialogue end and the game played?')
				return Function_Continue
			end
		
		end
	
	end

	if wtfIntro and not isStoryMode and songName == 'uhoh' then
		
		if not allowCountdown2 then
			return Function_Stop
		end

		if allowCountdown2 then
			return Function_Continue
		end
	
		isStarting = true;
		endingScribble()
	end

	
	
end

function onCreatePost() 
	if isStoryMode and turnon then

		debugPrint('this is where it begins the intro ')
		setProperty(camX, 550);
		setProperty(camY, -500);

		setProperty('cameraSpeed', 2)
		setProperty('camGame.zoom',0.8)
		setProperty('glassShit.alpha', 0)
		setProperty('glassShit2.alpha', 0)
		setProperty('light2.alpha', 0)

		runTimer('panDown', 2.5,1);
		runTimer('fuckingOff', 2.5,1);
		runTimer('screamPrep', 4.9,1);
		runTimer('introRemove', 0.5,1);

		cutscenePrepare()

	end

	if not isStoryMode and wtfIntro then

		debugPrint('this is where it begins the intro ')
		setProperty(camX, 550);
		setProperty(camY, -500);

		setProperty('cameraSpeed', 2)
		setProperty('camGame.zoom',0.8)
		setProperty('glassShit.alpha', 0)
		setProperty('glassShit2.alpha', 0)
		setProperty('light2.alpha', 0)

		runTimer('panDown', 2.5,1);
		runTimer('fuckingOff', 2.5,1);
		runTimer('screamPrep', 4.9,1);
		runTimer('introRemove', 0.5,1);

		cutscenePrepare()

	end
	--runTimer('introRemove2', 0.5,1);



	isStarting = true;
	endingScribble()

	precacheImage('week2/UHOH/ENDING/KILLNOVA')
	precacheImage('week2/UHOH/ENDING/NOVADYING')
	precacheImage('week2/UHOH/ENDING/PICOLOL')
end

function round(x, n)
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end

function onCreate()

	triggerEvent('Change Scroll Speed', 0.75, 0.1)
	
	
	--cameraShit
	
	camX = 'camFollow.x';	
	camY = 'camFollow.y';

	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'uhoh-nova-death'); --Character json file for the death 
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'DEATH/novaDeath'); --put in mods/sounds/
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'reloadedGameOver'); --put in mods/music/

	makeLuaSprite('wall', 'week2/UHOH/BG', -700, 250);
	setScrollFactor('wall', 0.55, 0.7);
	addLuaSprite('wall', false);
	scaleObject('wall', 4.8,4.8);
------------------------------------------- AD BILLBOARDS 

	makeAnimatedLuaSprite('backAdvert2', 'week2/UHOH/BILL TOGETHER', -650,-500)	
	addAnimationByPrefix('backAdvert2', 'full', 'billTogether',0,true)
	addAnimationByPrefix('backAdvert2', 'broke', 'billTogether',24,false)
	addLuaSprite('backAdvert2',false)
	setScrollFactor('backAdvert2', 0.55, 0.7);
	objectPlayAnimation('backAdvert2', 'full',true)
	scaleObject('backAdvert2', 2,2);

	makeAnimatedLuaSprite('advert', 'week2/UHOH/TWO BILL', -550,-160)
	scaleObject('advert', 2,2);
	addAnimationByPrefix('advert', 'full', 'twoBill',0,true)
	addAnimationByPrefix('advert', 'broke', 'twoBill',24,false)
	addLuaSprite('advert',false)
	setScrollFactor('advert', 0.55, 0.7);
	objectPlayAnimation('advert', 'full',true)
	
	makeAnimatedLuaSprite('backAdvert', 'week2/UHOH/CIRCLE BILL', 350,-500)	
	scaleObject('backAdvert', 2,2);
	addAnimationByPrefix('backAdvert', 'full', 'circleBill',0,true)
	addAnimationByPrefix('backAdvert', 'broke', 'circleBill',24,false)
	addLuaSprite('backAdvert',false)
	setScrollFactor('backAdvert', 0.55, 0.7);
	objectPlayAnimation('backAdvert', 'full',true)

	makeAnimatedLuaSprite('advertside', 'week2/UHOH/BILL 5', 900,-400)	
	scaleObject('advertside', 2,2);
	addAnimationByPrefix('advertside', 'full', 'bill5',0,true)
	addAnimationByPrefix('advertside', 'broke', 'bill5',24,false)
	addLuaSprite('advertside',false)
	setScrollFactor('advertside', 0.55, 0.7);
	objectPlayAnimation('advertside', 'full',true)

	makeAnimatedLuaSprite('advert3', 'week2/UHOH/CURVED BILL', 1000,-100)	
	scaleObject('advert3', 2,2);
	addAnimationByPrefix('advert3', 'full', 'curvedBill',0,true)
	addAnimationByPrefix('advert3', 'broke', 'curvedBill',24,false)
	addLuaSprite('advert3',false)
	setScrollFactor('advert3', 0.55, 0.7);
	objectPlayAnimation('advert3', 'full',true)

	makeAnimatedLuaSprite('advert2', 'week2/UHOH/MIDDLE BILL', 250,-150)	
	scaleObject('advert2', 2,2);
	addAnimationByPrefix('advert2', 'full', 'middleBill',0,true)
	addAnimationByPrefix('advert2', 'broke', 'middleBill',24,false)
	addLuaSprite('advert2',false)
	setScrollFactor('advert2', 0.55, 0.7);
	objectPlayAnimation('advert2', 'full',true)

	setProperty('advert2.x', getProperty('advert2.x') + 200)
	setProperty('advert3.x', getProperty('advert3.x') + 200)
	setProperty('advertside.x', getProperty('advertside.x') + 200)
	setProperty('backAdvert.x', getProperty('backAdvert.x') + 200)
	setProperty('advert.x', getProperty('advert.x') + 200)
	setProperty('backAdvert2.x', getProperty('backAdvert2.x') + 200)
--------------------------------------------------------------------------------------------------------------

	makeAnimatedLuaSprite('pico', 'week2/UHOH/ENDING/PICOLOL', 150,170)	
	scaleObject('pico', 2,2);
	addAnimationByPrefix('pico', 'pullup', 'PICO0',22,false)
	setScrollFactor('pico', 0.9, 0.9);
	setProperty('pico.visible', false)
	addLuaSprite('pico',false)
	
	makeLuaSprite('floor', 'week2/UHOH/GROUND', -750, 180);
	setScrollFactor('floor', 0.9,0.9);
	addLuaSprite('floor', false);
	scaleObject('floor', 2.6,2.2);

	if not lowQuality then

		makeLuaSprite('deadBody', 'week2/UHOH/JAYLADEAD', 950, 650);
		setScrollFactor('deadBody', 1,0.9);
		addLuaSprite('deadBody', false);
		scaleObject('deadBody', '1','1');

		makeLuaSprite('deadBody2', 'week2/UHOH/MANDYDEAD', -450, 700);
		setScrollFactor('deadBody2', 1,0.9);
		addLuaSprite('deadBody2', false);
		scaleObject('deadBody2', '1','1');

		makeLuaSprite('groundLight', 'week2/UHOH/lights', 200, 100);
		setScrollFactor('groundLight', 0.9, 0.9);
		addLuaSprite('groundLight', false);
		scaleObject('groundLight', '1','1');
		setBlendMode('groundLight', 'SCREEN')
		setObjectOrder('groundLight', 13)

		setProperty('floor.x', getProperty('floor.x') + 100)
		setProperty('deadBody.x', getProperty('deadBody.x') + 100)
		setProperty('deadBody2.x', getProperty('deadBody2.x') + 100)
		setProperty('groundLight.x', getProperty('groundLight.x') + 100)

		makeLuaSprite('rubble', 'week2/UHOH/FG RUBBLE', -950, 700);
		setScrollFactor('rubble', 1,1.7);
		addLuaSprite('rubble', true);
		scaleObject('rubble', 2,2);

		makeLuaSprite('rubble2', 'week2/UHOH/FG RUBBLE', 1050, 700);
		setScrollFactor('rubble2', 1,1.7);
		addLuaSprite('rubble2', true);
		scaleObject('rubble2', 2,2);
	end


	
	makeLuaSprite('screamVin', 'week2/UHOH/bloody', 0, 155);
	setScrollFactor('screamVin', 0.9, 0.9);
	addLuaSprite('screamVin', false);
	scaleObject('screamVin', '1.35','0.75');
	setProperty('screamVin.alpha', 0)
	setObjectCamera('screamVin', 'other')
	setObjectOrder('screamVin', 1)

	makeLuaSprite('blackStreaks', 'blackStreaks', 1068, 490);
	setScrollFactor('blackStreaks', 1, 1);
	addLuaSprite('blackStreaks', false);
	scaleObject('blackStreaks', '0.9','0.8');
	setObjectCamera('blackStreaks', 'hud')
	
	makeLuaText('rank', 'RATING:','0', '1085', '487')
	setTextFont('rank', 'GothicJoker.ttf')
	setTextColor('rank', 3, 'D3A200')
	setTextAlignment('rank', 'left')
	setObjectCamera('rank', 'hud')
	scaleObject('rank', '0.7','1');
	setTextSize('rank','28')
	setProperty('rank.alpha', 1)
	addLuaText('rank')
	doTweenColor('rankcolor','rank','CCA300',0.25)
	
	makeLuaText('ranktexts', '', '0', '1128', '487')
	setTextFont('ranktexts', 'GothicJoker.ttf')
	setTextAlignment('ranktexts', 'left')
	setObjectCamera('ranktexts', 'hud')
	setTextSize('ranktexts','28')
	scaleObject('ranktexts', '0.7','1');
	setProperty('ranktexts.alpha', 1)
	addLuaText('ranktexts')
	doTweenColor('ranktextscolor','ranktexts','CCA300',0.25)
	
	makeLuaText('misses', 'MISSES: ', '0', '1083', '519')
	setTextFont('misses', 'GothicJoker.ttf')
	setTextColor('misses', 3, 'D3A200')
	scaleObject('misses', '0.7','1');
	setTextAlignment('misses', 'left')
	setObjectCamera('misses', 'hud')
	setTextSize('misses','28')
	setProperty('misses.alpha', 1)
	addLuaText('misses')
	doTweenColor('missescolor','misses','CCA300',0.25)
	
	makeLuaText('MissesText', '', '0', '1128', '519')
    setTextFont('MissesText', 'GothicJoker.ttf')
	setTextAlignment('MissesText', 'left')
	setObjectCamera('MissesText', 'hud')
	setTextSize('MissesText','28')
	setProperty('MissesTest.alpha', 1)
	scaleObject('MissesText', '0.7','1');
	addLuaText('MissesText')
	doTweenColor('MissesTextcolor','MissesText','CCA300',0.25)
	
	makeLuaText('score', 'SCORE: ', '0', '1085', '551')
	setTextFont('score', 'GothicJoker.ttf')
	setTextColor('score', 3, 'D3A200')
	scaleObject('score', '0.7','1');
	setTextAlignment('score', 'left')
	setObjectCamera('score', 'hud')
	setTextSize('score','28')
	setProperty('score.alpha', 1)
	addLuaText('score')
	doTweenColor('scorecolor','score','CCA300',0.25)
	
	makeLuaText('ScoreText', '', '0', '1128', '551')
    setTextFont('ScoreText', 'GothicJoker.ttf')
	setTextAlignment('ScoreText', 'left')
	setObjectCamera('ScoreText', 'hud')
	setTextSize('ScoreText','28')
	setProperty('ScoreText.alpha', 1)
	scaleObject('ScoreText', '0.7','1');
	addLuaText('ScoreText')
	doTweenColor('ScoreTextcolor','ScoreText','CCA300',0.25)
	
	makeLuaSprite('clipTop', '', -30, 0);
	setScrollFactor('clipTop', 1, 1);
	addLuaSprite('clipTop', true);
	scaleObject('clipTop', '2','2');
	makeGraphic('clipTop', screenWidth, 80, '000000')
	setObjectCamera('clipTop', 'other')
	
	makeLuaSprite('cracktop', 'menuReload/SCREEN UI SHIT/crack', 1000,120);
	setScrollFactor('cracktop', 1, 1);
	addLuaSprite('cracktop', false);
	scaleObject('cracktop', '0.65','0.65');
	setObjectCamera('cracktop', 'other')
	setBlendMode('cracktop', 'SCREEN')
	
	makeLuaSprite('clipBottom', '', 0, 660);
	setScrollFactor('clipBottom', 1, 1);
	addLuaSprite('clipBottom', false);
	scaleObject('clipBottom', '2','2.5');
	makeGraphic('clipBottom', screenWidth, 80, '000000')
	setObjectCamera('clipBottom', 'other')
	
	makeLuaSprite('crackbottom', 'menuReload/SCREEN UI SHIT/crack', -45,523);
	setScrollFactor('crackbottom', 1, 1);
	addLuaSprite('crackbottom', false);
	setProperty('crackbottom.flipX', true)
	scaleObject('crackbottom', '0.65','0.65');
	setObjectCamera('crackbottom', 'other')
	setBlendMode('crackbottom', 'SCREEN')
	
	makeLuaSprite('clipBottom1', '', 0, 658);
	setScrollFactor('clipBottom1', 1, 1);
	addLuaSprite('clipBottom1', false);
	scaleObject('clipBottom1', '2','2.5');
	makeGraphic('clipBottom1', screenWidth, 80, '000000')
	setObjectCamera('clipBottom1', 'other')

	makeLuaSprite('dark', '', 0, 0); -- for the ending
	setScrollFactor('dark', 1, 1);
	addLuaSprite('dark', false);
	scaleObject('dark', '1','1');
	makeGraphic('dark', screenWidth, screenHeight, '000000')
	setObjectCamera('dark', 'other')
	setProperty('dark.alpha', 0)

	makeLuaSprite('light2', 'week2/UHOH/LIGHTTEST', -500, -100);
	setScrollFactor('light2', 0, 0);
	addLuaSprite('light2', true);
	scaleObject('light2', 6,4);
	setBlendMode('light2', 'SCREEN')
	setObjectOrder('light2', 20)

	if songName == 'uhoh' and doIntro == true and not isStoryMode then

		makeLuaSprite('introHide', '', 0, 0);
		setScrollFactor('introHide', 1, 1);
		addLuaSprite('introHide', true);
		scaleObject('introHide', '1','1');
		makeGraphic('introHide', screenWidth, screenHeight, '000000')
		setObjectCamera('introHide', 'other')
		setObjectOrder('introHide', 2)

	end
	
	makeLuaSprite('introHide2', '', 9999990, 0);
	setScrollFactor('introHide2', 0, 0);
	addLuaSprite('introHide2', false);
	scaleObject('introHide2', '1','1');
	makeGraphic('introHide2', screenWidth, screenHeight, '000000')
	setObjectCamera('introHide2', 'camGame')
	--setObjectOrder('introHide2', 200)

end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	
	health = getProperty('health')
	if getProperty('health') > 0.2 then
		setProperty('health', getProperty('health')-0.025);
	end
end


function onUpdate(elapsed)

    setTextString('ScoreText', getProperty("songScore"))
    setTextString('MissesText', getProperty('songMisses'))
    setProperty('scoreTxt.visible', false)
    
    if score >= 1 then
        setProperty('ranktexts.x', 1107)
        setProperty('ScoreText.x', 1125)
        setProperty('ranktexts.text', getProperty("ratingName")..' ('..round((getProperty('ratingPercent')*100),2).. '%'..')'..' - '..getProperty("ratingFC"))
end

	if downscroll then
	    setProperty('blackStreaks.y', 153)
	    setProperty('rank.y', 150)
	    setProperty('ranktexts.y', 150)
	    setProperty('misses.y', 182)
	    setProperty('MissesText.y', 182)
	    setProperty('score.y', 214)
	    setProperty('ScoreText.y', 214)
	end   

	setProperty('gf.alpha', 0)
------------------------------------- CAMERA ZOOMS IN AND SHIT ---------------------------------------

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



	if curStep  > 0 and  curStep < 1131 and songName == 'uhoh' and mustZoomIn then
		if mustHitSection == false  then
			setProperty('defaultCamZoom',0.77)
			doTweenZoom('hellowee', 'camGame', '0.77', 0.5, 'bounceIn') -- 1
		else
            setProperty('defaultCamZoom',0.6)
        end
	end

	if curStep  >= 1131  and curStep  < 1186 then -- add 55
		setProperty('stephKill.y', (math.sin(i/55)*75) - 50)
	end

	if curStep  >= 1131 and curStep  < 1196 then -- add 65
	
		setProperty('cameraSpeed', 0.25)
		
	elseif curStep  >= 1196  then -- pico
		setProperty(camX, 260);
		setProperty(camY, 500);

		setProperty('cameraSpeed', 0.8)
		
	else
	end

-----------------------------------------------------------------------------------------------------
-------------------------------------------- FLYING STEPHANIE ---------------------------------------
	if curStep >= 0 and curStep < 1131 then

		songPos = getSongPosition()

	 	setProperty('dad.y', (math.sin(i/35)*75) + 100)
		yy = (math.sin(i/35)*75) + 100
	   
	  
  	end


	setObjectOrder('light2', 50)
	setProperty('dad.scrollFactor.x', 0.9);
	setProperty('dad.scrollFactor.y', 0.9);

	setProperty('boyfriend.scrollFactor.x', 0.9);
	setProperty('boyfriend.scrollFactor.y', 0.9);

	setProperty('gf.scrollFactor.x', 0.9);
	setProperty('gf.scrollFactor.y', 0.9);

	daElapsed = elapsed * 30
	i = i + daElapsed


	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false and curStep > 0 and curStep < 1131 then
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
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
	  if getProperty('boyfriend.animation.curAnim.name') == 'LEFTshoot' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
	 if getProperty('boyfriend.animation.curAnim.name') == 'RIGHTshoot' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
	if getProperty('boyfriend.animation.curAnim.name') == 'UPshoot' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
	   if getProperty('boyfriend.animation.curAnim.name') == 'DOWNshoot' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- self explanatory
    end

	if followchars == true and curStep >= 1131 and curStep < 1196 then
		triggerEvent('Camera Follow Pos',xx3,yy3)
	end

	------------------------------------------stephanie annoyed timed event--------------------------------
	if curStep  >= 784 and curStep  < 799 then -- add 65
	
		setProperty(camX, 550); -- angelo chuckles
		setProperty(camY, 400);
		
	elseif curStep  >= 867 and curStep  < 900 then -- 
		setProperty(camX, 530);
		setProperty(camY, 100);
		--doTweenZoom('ohbrotherthisguy', 'camGame', '1', 1, 'circIn')

		--setProperty('cameraSpeed', 0.8)
	elseif curStep  >= 978 and curStep  < 1024 then 
		setProperty(camX, 530);
		setProperty(camY, 100);
		--doTweenZoom('ohbrotherthisguy', 'camGame', '1', 1, 'circIn')
	else
	end
    
end

function onCountdownStarted()
	if songName == 'uhoh' and isStoryMode then
		doTweenAlpha('comeBackLight1', 'light2', 1, 0.5, 'backIn')
	end
end


function cutscenePrepare()
	doTweenY('clip1Move', 'clipTop', 39, 0.5, 'smootherStepIn')
	doTweenY('clip2Move', 'clipBottom', 619, 0.5, 'smootherStepIn')
	doTweenAlpha('byebye', 'camHUD', 0, 0.5, 'backIn')
	doTweenAlpha('cracktopbye', 'cracktop', 0, 0.5, 'backIn')
	doTweenAlpha('crackbottombye', 'crackbottom', 0, 0.5, 'backIn')
end

function cutsceneFinished()
	doTweenY('clip1Move', 'clipTop', 0, 0.5, 'smootherStepIn')
	doTweenY('clip2Move', 'clipBottom', 658, 0.5, 'smootherStepIn')
	doTweenAlpha('byebye', 'camHUD', 1, 0.5, 'backIn')
	doTweenAlpha('cracktopbye', 'cracktop', 1, 0.5, 'backIn')
	doTweenAlpha('crackbottombye', 'crackbottom', 1, 0.5, 'backIn')
end

function endingShit()

	cameraFlash('camGame', 'FFFFFF', 1, false)

	makeAnimatedLuaSprite('stephKill', 'week2/UHOH/ENDING/KILLNOVA', 110,-100)	
	scaleObject('stephKill', 2,2);
	addAnimationByPrefix('stephKill', 'die', 'CHOKE0',22,false)
	setScrollFactor('stephKill', 0.9, 0.9);

	makeAnimatedLuaSprite('angelo', 'week2/UHOH/ENDING/NOVADYING', 500,130)	
	addAnimationByPrefix('angelo', 'ohno', 'angeloCHOKE0',22,false)
	scaleObject('angelo', 2.6,2.6);
	setScrollFactor('angelo', 0.9, 0.9);
	setObjectOrder('angelo', 18)

	setProperty('dad.alpha', 0)
	setProperty('boyfriend.alpha', 0)

	playAnim('stephKill', 'die',true, false, 1)
	playAnim('angelo', 'ohno',true, false, 1)

	addLuaSprite('stephKill',false)
	addLuaSprite('angelo',false)
	

	doTweenZoom('ohbrotherthisguy', 'camGame', '0.8', 0.5, 'circInOut')
	doTweenColor('shartDark', 'screamVin', '000000', 5, 'smootherStepIn')
	doTweenAlpha('view', 'screamVin', 1, 5, 'smootherStepIn')
	doTweenAlpha('view2', 'dark', 0.7, 5, 'smootherStepIn')

	doTweenY('raise', 'angelo', -50, 4, 'smootherStepInOut')
	
	runTimer('darkAway', 5.1,1);
	runTimer('zoomslow', 1,1);
	--followchars = false;
	cutscenePrepare()


end


function endingScribble()
	makeAnimatedLuaSprite('paint', 'misc/4-hudShit/transitionBrush', -20,-20) 			 
	scaleObject('paint', 6.4,6.2);
	setObjectCamera('paint', 'other')
	setObjectOrder('paint', 2000)
	addLuaSprite('paint',true)

	addAnimationByPrefix('paint', 'painting', 'brush0',24,false)

	if isStarting then
		playAnim('paint', 'painting',true, true)	
	elseif isEnding then
		playAnim('paint', 'painting',true)
	end	
	playSound('scribble', 1)

end

stepHitFuncs = { 

	[784] = function() -- angelo chuckle
		doTweenZoom('ohbrotherthisguy', 'camGame', '0.65', 1, 'circIn')
		triggerEvent('Play Animation', 'LOL', 'BF')
	end,

	[865] = function() -- confused animation
		triggerEvent('Play Animation', 'CONFUSED', 'Dad')
		setProperty('defaultCamZoom',0.77)
		doTweenZoom('ohbrotherthisguy2', 'camGame', '0.77', 1, 'circInOut')
		mustZoomIn = false;
		runTimer('zoomEnable', 4,1);
	end,

	[976] = function() -- sir yap a lot
		triggerEvent('Play Animation', 'ANNOYED', 'Dad')
		setProperty('defaultCamZoom',0.8)
		doTweenZoom('ohbrotherthisguy2', 'camGame', '0.8', 1, 'circInOut')
		mustZoomIn = false;
		runTimer('zoomEnable', 4,1);
	end,
 
	[1131] = function() --testing space
		setProperty('cameraSpeed', 0.25)
		endingShit()
		playSound('UHOH/uhohEnd', 1, 'ending')
	end,

	[1196] = function() --pico
		--setProperty(camX, 260);
		--setProperty(camY, 500);
		doTweenX('moveSte', 'stephKill', 900, 1.5, 'smootherStepInOut')
		doTweenY('moveSte2', 'stephKill', -300, 1.5, 'smootherStepInOut')
		setProperty('cameraSpeed', 1)
		setProperty('defaultCamZoom',0.9)
		doTweenZoom('ohbrotherthisguy', 'camGame', '0.9', 0.5, 'circIn')
	end,

	[1253] = function() --ending
		runTimer('scribble', 2,1);
	end,
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end

function windowShake()
    windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
    windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
    setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-4,4)) -- -4, 4

    setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-8,8)) --8, 8
end



function onTweenCompleted(tag, loops, loopsLeft)
	if tag == 'screamRotate' then
		doTweenAngle('backToNormal', 'camGame', '0', 1, 'circOut')
		doTweenAlpha('screamVinLeave', 'screamVin', 0, 2, 'smootherStepOut')
	end
	if tag == 'screamVinLeave' then
		removeLuaSprite('screamVin', true)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'zoomEnable' then
		mustZoomIn = true;
	end

	if tag == 'scribble' then
		isStarting = false;
		isEnding = true;
		endingScribble()
	end
	if tag == 'darkAway' then
		doTweenAlpha('view', 'dark', 0, 0.3, 'smootherStepIn')
		doTweenAlpha('view2', 'screamVin', 0, 0.3, 'smootherStepIn')
		doTweenZoom('zoominslow', 'camGame', '0.7', 0.3, 'backOut')

		setProperty('pico.visible', true)
		playAnim('pico', 'pullup',true, false, 90)
	end
	if tag == 'zoomslow' then
		doTweenZoom('zoominslow', 'camGame', '0.7', 4, 'smootherStepIn')
	end
	if tag == 'panDown' then
		--followchars = true
		setProperty('cameraSpeed', 0.25)
		setProperty('defaultCamZoom',0.7)
		runTimer('gameStart', 5.5,1);

		setProperty(camY, 170);

	end
	if tag == 'fuckingOff' then
		triggerEvent('Play Animation', 'SCREAM', 'Dad')
		doTweenZoom('ohshit', 'camGame', '0.7', 2.5, 'circIn')
	end
	if tag == 'putback' then
		--followchars = true
	end
	if tag == 'shakeWindow' then
		if loopsLeft >= 1 then
			windowShake()
		end
	end
	if tag == 'screamPrep' then
		doTweenZoom('ohshit2', 'camGame', '0.7', 1, 'circOut')
		cameraShake('camGame', 0.006, 1)
		doTweenAngle('screamRotate', 'camGame', '15', 1, 'circOut')
		doTweenAlpha('screamVinShow', 'screamVin', 1, 0.5, 'backOut')
		runTimer('shakeWindow', 0.05,20);
	

		objectPlayAnimation('backAdvert2', 'broke',true)
		objectPlayAnimation('advert', 'broke',true)
		objectPlayAnimation('backAdvert', 'broke',true)
		objectPlayAnimation('advert3', 'broke',true)
		objectPlayAnimation('advert2', 'broke',true)
		objectPlayAnimation('advertside', 'broke',true)

	end
	if tag == 'gameStart' then
		if isStoryMode then
			test = true
		end

		if wtfIntro then
			allowCountdown2 = true
		end


		doTweenZoom('begin', 'camGame', '0.7', 1, 'bounceIn')
		doTweenAlpha('backin', 'camGame', 1, 0.5, 'backIn')
		doTweenAlpha('hello2', 'glassShit', 1, 0.5, 'backIn')
		doTweenAlpha('hello3', 'glassShit2', 1, 0.5, 'backIn')
		setProperty('cameraSpeed', 0.9)
		setProperty('defaultCamZoom',1.1)
		cutsceneFinished()


		startCountdown()
	end
	if tag == 'introRemove' then

		doTweenAlpha('getyoass', 'introHide', 0, 0.5, 'backIn')
		
		playSound('UHOH/uhohIntro', 0.9)
		doTweenAlpha('lightcomeback', 'light2', 1, 2, 'backIn')

	end

	if tag == 'introRemove2' then

		doTweenAlpha('getyoass2', 'introHide2', 0, 1, 'backIn')
	end
	if tag == 'cameraBack' then

		setProperty('defaultCamZoom',0.6)

	end
	if tag == 'goBack' then

		setProperty('defaultCamZoom',0.9)
		doTweenY('clip1Move', 'clipTop', -100, 1, 'smootherStepIn')
		doTweenY('clip2Move', 'clipBottom', 750, 1, 'smootherStepIn')
		doTweenAlpha('hello', 'camHUD', 1, 0.5, 'backIn')

	end


	if tag == 'caption' then
		setProperty('caption.visible', true);
		doTweenAlpha('gameover', 'caption', 1, 2, 'smootherStepOut');
	end

end

function onPause()
	pauseSound('ending')
	return Function_Continue;
end

function onResume()
	resumeSound('ending')
end
