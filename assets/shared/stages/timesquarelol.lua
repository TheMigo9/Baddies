timeS = "timesquarelol"

local xx = 520;
local yy = 630; 
local xx2 = 950; 
local yy2 = 650; 
local ofs = 15;  
local followchars = false; 
local del = 0;
local del2 = 0;
local i = 0;

local isEnding = false;
local isStarting = false;
local doDialogue = false
local allowCountdown = false

local showDad = true
local showBF = true

local lockIntroControls = false

function onStartCountdown() -------------- FOR ENCOUNTER ---------------------------
	if curStage == timeS then
	
		if isStoryMode and songName == 'encounter' then
			
			if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
				startVideo('encounter');
				allowCountdown = true;
				doDialogue = true;
				return Function_Stop;
		
			elseif doDialogue and not censored then
				isStarting = true;
				endingScribble()
				setProperty('inCutscene', true);
				startDialogue('encounterShit', 'dialogueMusic/encounterDia') 
				doDialogue = false
				return Function_Stop
			
			elseif doDialogue and censored then
				isStarting = true;
				endingScribble()
				setProperty('inCutscene', true);
				startDialogue('encounterCensored', 'dialogueMusic/encounterDia') 
				doDialogue = false
				return Function_Stop
			end
			return Function_Continue
		end

		if songName == 'encounter' and not isStoryMode then
			if not allowCountdown then
				return Function_Stop
			end

			if allowCountdown and songName == 'encounter' and not isStoryMode  then
				return Function_Continue
			end
		end

	end

end

function onCreatePost() -------------- FOR ENCOUNTER ---------------------------

	if curStage == timeS then
		if songName == 'encounter' and not isStoryMode then
			setProperty(camX, 700);
			setProperty(camY, -2600);

			setProperty('camGame.zoom',0.6)
			setProperty('camHUD.alpha', 0)
			setProperty('cameraSpeed', 1.5)
			setProperty('glassShit.alpha', 0)
			setProperty('glassShit2.alpha', 0)

			runTimer('introShow', 1,1);
			runTimer('panDown', 2,1);
			runTimer('getOuttaHere', 3,1);
			runTimer('fuckingOff', 4,1);


			cutscenePrepare()
			

		end
		
		if isStoryMode then
			setProperty('introHide.alpha', 0)
			isStarting = true;
			endingScribble()
		end
		
	end

end

function onCreate()
    
    triggerEvent('Change Scroll Speed', 0.65, 0.1)

	if curStage == timeS then

		camX = 'camFollow.x';	
		camY = 'camFollow.y';

		setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'reloadedGameOver'); --put in mods/music/
		

		if songName == 'encounter' then
			setProperty('cameraSpeed', 0.8)
		else
			setProperty('cameraSpeed', 0.8)
			followchars = true; 
			allowCountdown = true
		end
---------- CREATING THE BACKGROUND -----------------
		if songName == 'encounter' then
			makeLuaSprite('sky', 'week2/newyork/SKY', -1000, -1250);
			setScrollFactor('sky', 0.9, 0.2);
			addLuaSprite('sky', false);
			scaleObject('sky', 5.6,4);
	
			makeLuaSprite('buildingBG', 'week2/newyork/BUILDINGSBG', -250, -1150);
			setScrollFactor('buildingBG', 0.9, 0.6);
			addLuaSprite('buildingBG', false);
			scaleObject('buildingBG', '1','1');
		end

		makeLuaSprite('wall', 'week2/newyork/BG', -900, -530);
		setScrollFactor('wall', 0.8, 0.9);
		addLuaSprite('wall', false);
		scaleObject('wall', 2.6,2.3);

		if not lowQuality then

			makeLuaSprite('sedan', 'week2/newyork/SEDAN', -800, 450);
			setScrollFactor('sedan', 0.9,0.9);
			addLuaSprite('sedan', false);
			scaleObject('sedan', '1','1');

			makeLuaSprite('sedan2', 'week2/newyork/SEDAN', -100, 450);
			setScrollFactor('sedan2', 0.9,0.9);
			addLuaSprite('sedan2', false);
			scaleObject('sedan2', '1','1');

			makeLuaSprite('suv', 'week2/newyork/SUV', 800, 410);
			setScrollFactor('suv', 0.9,0.9);
			addLuaSprite('suv', false);
			scaleObject('suv', '1','1');

			makeLuaSprite('carZoom', 'week2/newyork/SPEEDING CAR', 1200, 450);
			setScrollFactor('carZoom', 0.9,0.9);
			addLuaSprite('carZoom', false);
			scaleObject('carZoom', '1','1');
		end

		makeLuaSprite('floor', 'week2/newyork/GROUND', -650, 680);
		setScrollFactor('floor', 0.9,0.9);
		addLuaSprite('floor', false);
		scaleObject('floor', 2.2,1.8);

---------- MAIN CHARACTERS FOR INSANE --------------
	
		makeAnimatedLuaSprite('bop', 'week2/newyork/bops/mandy', 770,340) 				 ----- MANDY -----
		addAnimationByPrefix('bop', 'sheStands', 'mandy0',24,true)
		addAnimationByPrefix('bop', 'getsBlown', 'mandyShot',24,false)
		addLuaSprite('bop',false)
		setScrollFactor('bop', 0.85, 0.9);
		scaleObject('bop', 2,2);
		objectPlayAnimation('bop', 'sheStands',false)
		playAnim('bop', 'sheStands',true)
		addOffset('bop','getsBlown', 5, -90)
	
		makeAnimatedLuaSprite('tank', 'week2/newyork/bops/tankmen', 520,360)
		addAnimationByPrefix('tank', 'idleTank', 'tankmanBop',24,true)	----- STEVE -----
		addAnimationByPrefix('tank', 'damn', 'damn',24,false)
		addLuaSprite('tank',false)
		setScrollFactor('tank', 0.85, 0.9);
		scaleObject('tank', 2.6,2.6);
		playAnim('tank', 'idleTank',true)
		--addOffset('tank','damn', -80, 840)
		

		if not lowQuality then
	
			makeLuaSprite('lamp', 'week2/newyork/LAMP', -370, -270);
			setScrollFactor('lamp', 0.75, 0.9);
			addLuaSprite('lamp', false);
			scaleObject('lamp', 2,2);
	
			makeLuaSprite('lamp2', 'week2/newyork/LAMP', 1300, -270);
			setScrollFactor('lamp2', 0.75, 0.9);
			addLuaSprite('lamp2', false);
			scaleObject('lamp2', 2,2);
	
			makeAnimatedLuaSprite('gen', 'week2/newyork/bops/general', -570,200)	----- MAIN PEOPLE IN BG -----
			addAnimationByPrefix('gen', 'general', 'BGPeeps',24,true)
			addAnimationByPrefix('gen', 'shook', 'peepsShook',24,false)
			addAnimationByPrefix('gen', 'move', 'peepsMove',24,false)
			addAnimationByPrefix('gen', 'splatter', 'peepsSplatter',24,false)
			addLuaSprite('gen',false)
			setScrollFactor('gen', 0.85, 0.9);
			scaleObject('gen', 2,2);
			playAnim('gen', 'general',true)
			addOffset('gen','shook', -655, -158)
	
			makeLuaSprite('rope', 'week2/newyork/ROPE', -400, 510);
			setScrollFactor('rope', 0.85,0.9);
			addLuaSprite('rope', false);
			scaleObject('rope', 2.1,2);
	
			makeAnimatedLuaSprite('rebec', 'week2/newyork/bops/rebecca', 1200,240) --right most
			addAnimationByPrefix('rebec', 'doodle', 'rebecca',24,true)
			addLuaSprite('rebec',true)
			setScrollFactor('rebec', 1.6, 1);
			scaleObject('rebec', 1.8,1.8);
			objectPlayAnimation('rebec', 'doodle',false)
	
			makeAnimatedLuaSprite('bad1', 'week2/newyork/bops/chantel', -750,500) --right most
			addAnimationByPrefix('bad1', 'left', 'chantel',24,true)
			addLuaSprite('bad1',true)
			setScrollFactor('bad1', 1.8, 1);
			scaleObject('bad1', 2.4,2.4);
			objectPlayAnimation('bad1', 'left',false)
	
			makeLuaSprite('booth', 'week2/newyork/BOOTH', -1200, 640);
			setScrollFactor('booth', 0.9,0.9);
			addLuaSprite('booth', false);
			scaleObject('booth', '1.6','1');
	
			makeLuaSprite('lampLight', 'week2/newyork/lampPostLight', -600, -200);
			setScrollFactor('lampLight', 0.9, 0.9);
			addLuaSprite('lampLight', false);
			scaleObject('lampLight', '1','1');
			setBlendMode('lampLight', 'SCREEN')
		
			makeLuaSprite('lampLight2', 'week2/newyork/lampPostLight', 1100, -200);
			setScrollFactor('lampLight2', 0.9, 0.9);
			addLuaSprite('lampLight2', false);
			scaleObject('lampLight2', '1','1');
			setBlendMode('lampLight2', 'SCREEN')

		end

		makeAnimatedLuaSprite('stephAng', 'week2/newyork/characterShit/sheMad', -18,268)
		scaleObject('stephAng', 2,2);
		addAnimationByPrefix('stephAng', 'shootout', 'together',24,false)	----- STEPHANIE GETS ANGRY SPRITE -----
		setScrollFactor('stephAng', 0.9, 0.9);
		setProperty('stephAng.visible', false)
		setObjectOrder('stephAng', 20)
		
		if songName == 'encounter' then

			makeLuaSprite('introHide', '', 0, 0);
			addLuaSprite('introHide', true);
			makeGraphic('introHide', screenWidth, screenHeight, '000000')
			setObjectCamera('introHide', 'other')
			
			makeLuaSprite('introEncounter', 'week2/newyork/screenShit/ENCOUNTER INTRO_2', 0, 0);
			addLuaSprite('introEncounter', true);
			scaleObject('introEncounter', '1','1');
			screenCenter('introEncounter')
			setObjectCamera('introEncounter', 'other')
			setProperty('introEncounter.visible', false)
			setProperty('introEncounter.alpha', 0)

			if not isStoryMode then
				makeLuaSprite('aspectRatio', 'misc/4-hudShit/introBox', 0, 0);
				addLuaSprite('aspectRatio', true);
				scaleObject('aspectRatio', '1','1');
				screenCenter('aspectRatio')
				setObjectCamera('aspectRatio', 'other')
			end

		end

		if songName == 'insane' then

			makeLuaSprite('darken', '', 0, 0);
			setScrollFactor('darken', 0, 0);
			scaleObject('darken', '1.6','1.4');
			makeGraphic('darken', screenWidth, screenHeight, '2C0425')
			setProperty('darken.visible', false)
			setProperty('darken.alpha', 0)
			addLuaSprite('darken', false);
			setBlendMode('darken', 'mulitply')
		
			makeAnimatedLuaSprite('gfInsane', 'week2/newyork/characterShit/insaneGF', 377,-175)
			addAnimationByPrefix('gfInsane', 'woag', 'floatAway',24,false)
			setScrollFactor('gfInsane', 0.9, 0.9);
			scaleObject('gfInsane', 2,2);
			objectPlayAnimation('gfInsane', 'woag',false)
			setProperty('gfInsane.visible', false)

			makeAnimatedLuaSprite('gfPortal', 'week2/newyork/characterShit/portal', 250, -265)
			addAnimationByPrefix('gfPortal', 'demon', 'portalOpen',24,false)
			setScrollFactor('gfPortal', 0.9, 0.9);
			scaleObject('gfPortal', 2,2);
			objectPlayAnimation('gfPortal', 'demon',false)
			setProperty('gfPortal.visible', false)

			makeAnimatedLuaSprite('stephanieAnger', 'week2/newyork/characterShit/STEPHANIE-ANGER', -17,388)
			addAnimationByPrefix('stephanieAnger', 'man', 'angry', 24, false)
			setScrollFactor('stephanieAnger', 0.9, 0.9);
			scaleObject('stephanieAnger', 2,2);
			objectPlayAnimation('stephanieAnger', 'man', false)
			setProperty('stephanieAnger.visible', false)

			makeAnimatedLuaSprite('bfDies', 'week2/newyork/characterShit/BF-KILLED', 687,438)
			addAnimationByPrefix('bfDies', 'noo', 'BF SHOT UP', 24, false)
			setScrollFactor('bfDies', 0.9, 0.9);
			scaleObject('bfDies', 2,2);
			objectPlayAnimation('bfDies', 'noo', false)
			setProperty('bfDies.visible', false)
	
	
		end

		if censored then
			makeLuaSprite('censoredBG', 'misc/1-censoredStuff/censoredBG', 0, 800); 
			setScrollFactor('censoredBG', 0, 0);
			scaleObject('censoredBG', 4,4);
			addLuaSprite('censoredBG', true);
			setObjectCamera('censoredBG', 'other')

			makeLuaText('censorStuff', '', '0', 0, 0) -- 495, 510
			setTextFont('censorStuff', 'GothicJoker.ttf')
			setTextAlignment('censorStuff', 'center')
			setObjectCamera('censorStuff', 'other')
			screenCenter('censorStuff', '');
			setTextSize('censorStuff','82')
			setTextString('censorStuff', "CENSORED! You can't see that...")
			addLuaText('censorStuff')
			setProperty('censorStuff.alpha', 0)

			makeAnimatedLuaSprite('jass', 'misc/1-censoredStuff/jasmineNova', 1320, 800) -- og y coord, 310
			scaleObject('jass', 2,2);
			addAnimationByPrefix('jass', 'silly', 'sillies_1',24,true)	
			setObjectCamera('jass', 'other')
			
			makeAnimatedLuaSprite('lucy', 'misc/1-censoredStuff/lucyNova', 2000,290) -- og x coords, 1320
			scaleObject('lucy', 2,2);
			addAnimationByPrefix('lucy', 'silly', 'sillies_2',32,true)	
			setObjectCamera('lucy', 'other')
		end
	
		makeLuaSprite('light2', 'week2/newyork/screenShit/LIGHTTEST', -500, -200); -- og -500, -100
		setScrollFactor('light2', 0, 0);
		addLuaSprite('light2', true);
		scaleObject('light2', 6,4);
		setBlendMode('light2', 'SCREEN')
		setObjectOrder('light2', 30)
		setProperty('boyfriend.visible', false)
	
		makeLuaSprite('test', '', 0, 0);
		setScrollFactor('test', 1, 1);
		addLuaSprite('test', false);
		scaleObject('test', '1','1');
		makeGraphic('test', screenWidth, screenHeight, '478996')
		setObjectCamera('test', 'other')
		setBlendMode('test', 'SUBTRACT')
		setProperty('test.alpha', 0)

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

	if curStage == timeS then

		if censored then
			setProperty('censorStuff.x', (screenWidth/2) - (getProperty('censorStuff.width')/2));
			setProperty('censorStuff.y', screenHeight/2);
		end

		if not showDad then
			setProperty('dad.alpha', 0)
		end

		if not showBF then
			setProperty('boyfriend.alpha', 0)
		end

		addOffset('tank', 'damn', -97, -55)

		setProperty('dad.scrollFactor.x', 0.9);
		setProperty('dad.scrollFactor.y', 0.9);

		setProperty('boyfriend.scrollFactor.x', 0.9);
		setProperty('boyfriend.scrollFactor.y', 0.9);

		setProperty('gf.scrollFactor.x', 0.9);
		setProperty('gf.scrollFactor.y', 0.9);

		key_pressed = keyJustPressed('accept')
		

		if curStep  >= 0 and curStep < 1400 and songName == 'insane' then
			if mustHitSection == false  then
				setProperty('defaultCamZoom',0.6)
				doTweenZoom('hellowee', 'camGame', '0.6', 0.5, 'bounceIn')

			elseif curStep > 701 and curStep < 756 and songName == 'insane' then
				setProperty('defaultCamZoom',0.65)
				doTweenZoom('hellowee', 'camGame', '0.65', 0.5, 'circOut')
				
			else
				setProperty('defaultCamZoom',0.65)
			end
		end
			
		------------------------- SKIPPING DA INTRO -------------------------------

		if keyJustPressed('accept') and songName == 'encounter' and not isStoryMode then 
			if not lockIntroControls then
				cancelTimer('panDown');
				cancelTimer('fuckingOff');
				cancelTimer('getOuttaHere');
				cancelTimer('introShow');
				cancelTimer('introFade');
				cancelTimer('panOut');

				doTweenAlpha('goodbyeIntro', 'introEncounter', 0, 0.5, 'backIn')
				doTweenAlpha('goodbyeIntro2', 'introHide', 0, 0.5, 'backIn')

				debugPrint('Hi Hi Hello!')
				runTimer('gameStart', 0.5,1);

				doTweenX('ratioWidens', 'aspectRatio.scale', 1.9, 0.5, 'smootherStepIn')
				doTweenY('ratioWidens2', 'aspectRatio.scale', 1.2, 0.5, 'smootherStepIn')
			end
			lockIntroControls = true
		end

		------------------------- SKIPPING DA INTRO -------------------------------
		
		daElapsed = elapsed * 30
		i = i + daElapsed

		--setProperty('dad.y', (math.sin(i/20)*75) - 650)
		--yy = (math.sin(i/20)*75) - 150


		if curStep  > 700 and curStep < 752 and songName == 'insane' then --focuses on gf getting taken away

			--setProperty('defaultCamZoom',0.55)
			setProperty('gf.alpha', 0)
			setProperty('cameraSpeed', 0.8)
			followchars = false;
			setProperty(camX, 730);
			setProperty(camY, 300);

		elseif songName == 'insane' then
			followchars = true;
			setProperty('cameraSpeed', 0.6)
			
		end

		
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
end

function onBeatHit()

	if curStage == timeS then
		if curBeat % 80 == 0 then
			runTimer('restart', 2,1)
			playSound('ENCOUNTER/carPass1', 0.8)
		end


		if curBeat % 4 == 0 then
			triggerEvent('Add Camera Zoom','0.005','0')
			setProperty('camZooming', true)
		end

	
	
		if songName == 'insane' and curBeat % 1 == 0 then
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
				characterPlayAnim('boyfriend','idle',true)
			end

			if getProperty('dad.animation.curAnim.name') == 'idle' then
				characterPlayAnim('dad','idle',true)
			end
		elseif curBeat % 2 == 0 then
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
				characterPlayAnim('boyfriend','idle',true)
			end

			if getProperty('dad.animation.curAnim.name') == 'idle' then
				characterPlayAnim('dad','idle',true)
			end
		end
	end

end
-------------------------------------------------- CUSTOM FUNCTIONS

function round(x, n)

  n = math.pow(10, n or 0)

  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end

function censoredInsane()

	runTimer('appearBG', 1,1);

	runTimer('sillyjass1', 4,1);
	runTimer('sillyjass2', 10,1);
end

function cutscenePrepare()
	if curStage == timeS then
		doTweenY('clip1Move', 'clipTop', 0, 1, 'smootherStepIn')
		doTweenY('clip2Move', 'clipBottom', 660, 1, 'smootherStepIn')
		doTweenAlpha('byebye', 'camHUD', 0, 0.5, 'backIn')
	end
end

function stephanieShoots() --insane
	if curStage == timeS then
		if songName == 'insane' then

			----- SPAWN IN SPRITE AND PLAYS IT -----
			setProperty('stephAng.visible', true)
			playAnim('stephAng', 'shootout',true)
			
			addLuaSprite('stephAng',true)

			----- DELETES THE REAL STEPHANIE -----
			setProperty('dad.alpha', 0) 

			doTweenZoom('yeah', 'camGame', '0.9', 1, 'bounceOut')
			setProperty('defaultCamZoom',0.9)
			runTimer('turningRed', 1,1);  
			runTimer('takeGun', 4,1);   ----- TAKES THE GUN, PEEPS SHOOK, STEVE SHOOK -----
			runTimer('bfDies', 5.8,1);                           
			runTimer('stepBack', 8.8 ,1);                      ----- PEEPS STEP BACK WHEN GUN IS POINTED -----

			runTimer('cameraShit1', 5.7 ,1);                    ----- CAMERA SHAKE WHEN SHE SHOOTS FIRST BOUT -----
			runTimer('cameraShit2', 10 ,1); 

			runTimer('splattt', 10 ,1);                       ----- PEEPS GETS BLOOD ON THEM -----

			playSound('INSANE/insaneEnding', 1, 'emding')
			cutscenePrepare()
		end
	end

end

function stephanieAngry() -- insane annoyed

	if curStage == timeS then
		if songName == 'insane' then

			addLuaSprite('stephanieAnger', false);
			setProperty('stephanieAnger.visible', true)
			setProperty('boyfriend.visible', true)
			runTimer('goodbyeAngry', 4,1); 

			showDad = false
			cutscenePrepare()

		end
	end

end

function gfLeaves() --insane

	if curStage == timeS then
		if songName == 'insane' then

			setProperty('gfInsane.visible', true)
			addLuaSprite('gfInsane',false)
			setProperty('gfPortal.visible', true)
			addLuaSprite('gfPortal', true);
			cameraFlash('camGame', 'FFFFFF', 1, false)
			cameraShake('camGame', 0.002, 4)

			setProperty('darken.visible', true)
			doTweenAlpha('bgDarkens', 'darken', 0.5, 1.2, 'backIn')
			doTweenAlpha('lightDarkens', 'light2', 0, 1.2, 'backIn')
			doTweenColor('testingcolor3', 'stephanieAnger', 'A07798', 1.5, 'linear')
			doTweenColor('testingcolor', 'dad', 'A07798', 1.5, 'linear')
			doTweenColor('testingcolor2', 'boyfriend', 'A07798', 1.5, 'linear')

			triggerEvent('Play Animation', 'DAZED', 'Boyfriend')
		end
	end

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

------------------------------------------------- STEP HITS SHITS 

stepHitFuncs = { 

	[10] = function() 
	
	end,

	[670] = function() --testing space
		if curStage == timeS then
			stephanieAngry()
		end
	end,

	[701] = function() --this despawns gf and adds in the float away animation
		if curStage == timeS and songName == 'insane' then
			gfLeaves()
		end
	end,

	[749] = function() 
		if curStage == timeS and songName == 'insane' then
			
			doTweenY('clip1Move', 'clipTop', 0, 2, 'smootherStepIn')
			doTweenY('clip2Move', 'clipBottom', 660, 2, 'smootherStepIn')
			doTweenAlpha('byebye', 'camHUD', 1, 2, 'backIn')
			followchars = true;

			doTweenAlpha('bgDarkens', 'darken', 0, 0.8, 'backIn')
			doTweenAlpha('lightDarkens', 'light2', 1, 0.8, 'backIn')

			doTweenColor('testingcolor', 'dad', '', 1, 'linear')
			doTweenColor('testingcolor2', 'boyfriend', '', 1, 'linear')

			
		end
	end,

	[1152] = function() --testing space
		
		if curStage == timeS and songName == 'insane' then
			doTweenZoom('goHard', 'camGame', '1.05', 6, 'smootherStepIn')
		end 
	end,

	[1216] = function() --testing space
		if curStage == timeS and songName == 'insane' then
			doTweenZoom('goHard', 'camGame', '1.05', 6, 'smootherStepIn')
		end 
	end,

	[1422] = function() --------- START OF SHOOTOUT, SHE GETS MAD ------------
		if curStage == timeS and songName == 'insane' then
			stephanieShoots()
		end
	end,

	[1536] = function() --ending for encounter
		if curStage == timeS and songName == 'encounter' then
			playSound('ENCOUNTER/stephWin', 0.5, 'shewins')
			triggerEvent('Play Animation', 'yay', 'Dad')  
			doTweenAlpha('endGame', 'camHUD' , 0, 2, 'smootherStepOut');

			runTimer('scribble', 3.5,1);
		end 
	end,
 

}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end
------------------------------------------------- TWEENS AND TIMERS SHITS

function onTweenCompleted(tag, loops, loopsLeft)
	if curStage == timeS then

		if tag == 'ratioWidens' then
			setProperty('aspectRatio.visible', false)
		end
		
		if tag == 'drive' then
			setProperty('carZoom.x', 1200)
		end

		if tag == 'delete' then
			removeLuaSprite('introHide', true)
		end

		if tag == 'gunAppear' then
			setProperty('defaultCamZoom',0.8)
		end

		if tag == 'pointAt' then
			setProperty('defaultCamZoom',1)
		end


		if tag == 'bgMove' then
			doTweenAlpha('textstuff', 'censorStuff', 1, 1, 'smootherStepOut');
		end
		
		if tag == 'silliesMove2' then
			addLuaSprite('lucy',true)
			playAnim('lucy', 'silly',true)
			doTweenX('silliesMove2', 'lucy', 0 - (getProperty('lucy.width')), 5, 'linear')

			setTextString('censorStuff', "we promise you aren't missing anything...")
		end

		
	end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if curStage == timeS then

		if tag == 'goodbyeAngry' then
			setProperty('stephanieAnger.visible', false)
			showDad = true
		end

		if tag == 'scribble' then
			isStarting = false;
			isEnding = true;
			endingScribble()
		end
		if tag == 'appearBG' then
			doTweenY('bgMove', 'censoredBG', 0, 3, 'smootherStepOut')
		end

		if tag == 'sillyjass1' then
			addLuaSprite('jass',true)
			playAnim('jass', 'silly',true)
			doTweenY('silliesMove', 'jass', 310, 2, 'circOut')
		end

		if tag == 'sillyjass2' then
			doTweenY('silliesMove2', 'jass', 800, 1, 'circIn')
		end


		if tag == 'caption' then
			setProperty('caption.visible', true);
			doTweenAlpha('gameover', 'caption', 1, 2, 'smootherStepOut');
		end

		if tag == 'restart' then
			doTweenX('drive', 'carZoom', -1690, 0.6, 'linear')
		end

		if tag == 'restartSound' then
			citySounds()
		end

		if tag == 'objLeave' then
			objectPlayAnimation('objective', 'popout',false)
		end

		if tag == 'turningRed' then
			setProperty(camY, 630);
			setProperty(camX, 490);
			cameraFlash('cameGame', 'FFFFFF', 1, false)
			censoredInsane()
			doTweenAlpha('ohshit', 'test', 0.4, 5, 'smootherStepOut');
			
		end

		if tag == 'takeGun' then
			playAnim('tank', 'damn',false)
			playAnim('gen', 'shook',true)

			doTweenAlpha('ohshit', 'test', 0, 0.5, 'smootherStepOut');
			doTweenZoom('gunAppear', 'camGame', '0.65', 1, 'bounceOut')
			
		end

		if tag == 'bfDies' then
		
			setProperty('bfDies.visible', true)
			addLuaSprite('bfDies', false);
			showBF = false
			
		end

		if tag == 'stepBack' then -- pointing the gun at steve
			setProperty(camY, 590);
			setProperty(camX, 700);
			objectPlayAnimation('gen', 'move',false)
			doTweenZoom('pointAt', 'camGame', '0.6', 0.5, 'circOut')
			setProperty('defaultCamZoom',0.6)
		end

		if tag == 'cameraShit1' then -- bf gets shot
			setProperty(camY, 630);
			setProperty(camX, 800);
			triggerEvent('Play Animation', 'shotup', 'BF')  
			cameraShake('camGame', 0.004, 2.5)
		end

		if tag == 'cameraShit2' then
			setProperty(camX, 810);
			cameraShake('camGame', 0.006, 0.3)

			runTimer('scribble', 1.5,1);
			runTimer('endgame', 2.5,1);
			
		end

		if tag == 'endgame' then
			
			endSong()
			
		end

		if tag == 'splattt' then -- mandy gets shot lol
			if censored then
				setProperty('censorBarTank.visible', true)
			end
			objectPlayAnimation('gen', 'splatter',false)
			playAnim('bop', 'getsBlown',false)

			cameraShake('camGame', 0.006, 0.3)
		end


		if tag == 'getOuttaHere' then
			doTweenAlpha('delete', 'introHide', 0, 1, 'backIn')

			doTweenZoom('begin', 'camGame', '0.7', 3, 'smootherStepIn')
			
		end

		if tag == 'panOut' then
			doTweenX('ratioWidens', 'aspectRatio.scale', 1.9, 3, 'smootherStepIn')
			
		end

		if tag == 'panDown' then
			if songName == 'encounter' then
				setProperty(camY, 600);
				setProperty(camX, 600);
				setProperty('cameraSpeed', 0.2)
				setProperty('defaultCamZoom',0.6)
				
				playSound('ENCOUNTER/cityAmbi', 0.6)

				runTimer('gameStart', 8,1);
				runTimer('panOut', 5,1);

				
			end

		end

		if tag == 'introShow' then
			setProperty('introEncounter.visible', true)
			playSound('ENCOUNTER/encounterIntro', 0.7)

			doTweenAlpha('introPopFade', 'introEncounter', 1, 0.4, 'circ')
			-- doTweenX('introPop', 'introEncounter.scale', 0.45, 0.5, 'bounceOut')
			-- doTweenY('introPop2', 'introEncounter.scale', 0.45, 0.5, 'bounceOut')

			runTimer('introFade', 3,1);

		end

		if tag == 'introFade' then
			doTweenAlpha('goodbyeIntro', 'introEncounter', 0, 1, 'backIn')
		end

		if tag == 'fuckingOff' then
			triggerEvent('Play Animation', 'intro', 'GF')
			triggerEvent('Play Animation', 'intro', 'Dad')
			playSound('ENCOUNTER/stephIntro', 0.8)
			playSound('ENCOUNTER/gfIntro', 0.8)
		
		end

		if tag == 'gameStart' then
			allowCountdown = true

			doTweenZoom('begin', 'camGame', '0.6', 1, 'smootherStepIn')
			doTweenAlpha('hello', 'camHUD', 1, 0.5, 'backIn')
			setProperty('cameraSpeed', 0.8)
			setProperty('defaultCamZoom',0.6)
			doTweenY('clip1Move', 'clipTop', 0, 1, 'smootherStepIn')
			doTweenY('clip2Move', 'clipBottom', 660, 1, 'smootherStepIn')

			doTweenAlpha('hello1', 'glassShit', 1, 0.5, 'backIn')
			doTweenAlpha('hello2', 'glassShit2', 1, 0.5, 'backIn')
			

			startCountdown()
		end

		if tag == 'cameraBack' then

			setProperty('defaultCamZoom',0.6)

		end

		if tag == 'goBack' then

			setProperty('defaultCamZoom',0.6)
			doTweenY('clip1Move', 'clipTop', 590, 1, 'smootherStepIn')
			doTweenY('clip2Move', 'clipBottom', 590, 1, 'smootherStepIn')
			doTweenAlpha('hello', 'camHUD', 1, 0.5, 'backIn')

		end

	end
end

function onPause()
	pauseSound('ending')
	pauseSound('shewins')
	return Function_Continue;
end

function onResume()
	resumeSound('ending')
	resumeSound('shewins')
end