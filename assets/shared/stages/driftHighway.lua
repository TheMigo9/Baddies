local xx = 440;
local yy = 600; 
local xx2 = 570; 
local yy2 = 580; 
local ofs = 45;  
local del = 0;
local i = 0;
local del2 = 0;
local doDialogue = true

local followchars = true; 
local doCopIntro = false
local showfirstStage = true

if not isStoryMode then
	local allowCountdown = false
end

local isEnding = false;
local isStarting = false;

function onCreatePost() 
    
    triggerEvent('Change Scroll Speed', 0.65, 0.1)

	if songName == 'drift' and doCopIntro and not isStoryMode then
		setProperty(camX, 800);
		setProperty(camY, -1700);

		setProperty('camGame.zoom',0.7)
		setProperty('camHUD.alpha', 0)

		setProperty('glassShit.alpha', 0)
		setProperty('glassShit2.alpha', 0)

		runTimer('panDown', 3,1);
		cutscenePrepare()

		
	end

	if songName == 'drift' and isStoryMode then
		setProperty('light2.alpha', 0)
		setProperty('policeLight.alpha', 0)
		setProperty('raindrop.alpha', 0)
		setProperty('camGame.zoom',0.7)
		followchars = true;
		setProperty(camX, 400);
	end

	isStarting = true;
	endingScribble()


	------------- INSIDE CAR --------------------
	precacheImage('week2/highway/TRANSITION/textBG')
	precacheImage('week2/highway/TRANSITION/carshit2')
	precacheImage('week2/highway/TRANSITION/MOMMY')
	precacheImage('week2/highway/TRANSITION/carshit1')
	precacheImage('week2/highway/TRANSITION/ANGELO INTRO IN CAR')
	precacheImage('week2/highway/TRANSITION/carInterior')
	------------- SECOND STAGE --------------------
	precacheImage('week2/DRIFT/skyBG')
	precacheImage('week2/DRIFT/city')
	precacheImage('week2/DRIFT/street')
	precacheImage('week2/DRIFT/bridge')
	precacheImage('week2/DRIFT/lightsAbove')
	precacheImage('week2/DRIFT/police')
	precacheImage('week2/DRIFT/car')
	precacheImage('highway/TRANSITION/COME OUT')
	------------- ENDING ------------------------
	precacheImage('week2/DRIFT/ending/sideProfileBG')
	precacheImage('week2/DRIFT/ending/bg')
	precacheImage('week2/DRIFT/ending/stephanieEnd')
	precacheImage('week2/DRIFT/ending/angeloEnd')
	precacheImage('week2/DRIFT/ending/car')
	precacheImage('week2/DRIFT/ending/end')

	addCharacterToList('nova-drift')
	
end

function onEndSong()
	if isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('conclusion');
		seenCutscene = true
		return Function_Stop;
	end
    return Function_Continue
end


function onCountdownStarted()
	if songName == 'drift' and isStoryMode then
		doTweenAlpha('comeBackLight1', 'light2', 1, 0.5, 'backIn')
		doTweenAlpha('comeBackLight2', 'policeLight', 1, 0.5, 'backIn')
		doTweenAlpha('comeBackRain', 'raindrop', 0.2, 0.5, 'backIn')
	end
end

function onCreate()

	
	--cameraShit
	camX = 'camFollow.x';	
	camY = 'camFollow.y';


	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'DEATH/novaDeath');
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'DEATH/reloadedGameOver'); --put in mods/music/


	
	if showfirstStage then

		makeLuaSprite('sky', 'week2/highway/SKYBOX', -500, -450);
		setScrollFactor('sky', 0.3, 0.2);
		addLuaSprite('sky', false);
		scaleObject('sky', 4.8,4);

		makeLuaSprite('buildingBG', 'week2/highway/BUILDINGS MAIN', -150, -350);
		setScrollFactor('buildingBG', 0.4, 0.6);
		addLuaSprite('buildingBG', false);
		scaleObject('buildingBG', 1.8,1.8);

		if not lowQuality then
			makeAnimatedLuaSprite('leftB', 'week2/highway/leftBuild', -570, 0) 
			addAnimationByPrefix('leftB', 'boppin', 'leftBuild', 24, true)
			setScrollFactor('leftB', 0.6, 0.9);
			scaleObject('leftB', 2,2);
			objectPlayAnimation('leftB', 'boppin', false)
			addLuaSprite('leftB', false)
			
			makeAnimatedLuaSprite('rightB', 'week2/highway/rightBuild', 970, 0) 
			addAnimationByPrefix('rightB', 'boppin', 'rightBuild', 24, true)
			setScrollFactor('rightB', 0.6, 0.9);
			scaleObject('rightB', 2,2);
			objectPlayAnimation('rightB', 'boppin', false)
			addLuaSprite('rightB', false)

			makeAnimatedLuaSprite('lightboounce', 'week2/highway/lightBounce', -470, 350) 
			addAnimationByPrefix('lightboounce', 'boppin', 'LIGHT N SMOOKE', 24, true)
			setScrollFactor('lightboounce', 0.4, 0.9);
			scaleObject('lightboounce', 4.4,4);
			objectPlayAnimation('lightboounce', 'boppin', false)
			setBlendMode('lightboounce', 'SCREEN')
			addLuaSprite('lightboounce', false)

			makeAnimatedLuaSprite('blastStreak', 'week2/highway/blasting', getProperty('dad.x'), 350) 
			addAnimationByPrefix('blastStreak', 'zoom', 'lineBoost', 24, true)
			setScrollFactor('blastStreak', 0.6, 0.7);
			scaleObject('blastStreak', 2,2);
			objectPlayAnimation('blastStreak', 'zoom', false)
			setBlendMode('blastStreak', 'SCREEN')
			addLuaSprite('blastStreak', true)
		end

		makeAnimatedLuaSprite('ground', 'week2/highway/road', -600, 700) 
		addAnimationByPrefix('ground', 'boppin', 'highWay', 24, true)
		setScrollFactor('ground', 1, 0.9);
		scaleObject('ground', 2.5,2);
		objectPlayAnimation('ground', 'boppin', false)
		addLuaSprite('ground', false)

		if not lowQuality then -- blur cars, helicopters, lucys car
			makeLuaSprite('blurCar', 'week2/highway/lolblurCars', 780, 715);
			setScrollFactor('blurCar', 0.3, 1);
			addLuaSprite('blurCar', false);
			scaleObject('blurCar', '1','1');

			makeAnimatedLuaSprite('helicopter', 'week2/highway/heli2', 650, 80) --right
			addAnimationByPrefix('helicopter', 'hover', 'HELI 2', 24, true)
			setScrollFactor('helicopter', 1.4, 0.50);
			scaleObject('helicopter', 2,2);
			objectPlayAnimation('helicopter', 'hover',false)
			addLuaSprite('helicopter',false)

			makeAnimatedLuaSprite('helicopter2', 'week2/highway/heli1', -470, -70) --left
			addAnimationByPrefix('helicopter2', 'hover', 'HELI 1', 24, true)
			setScrollFactor('helicopter2', 1.2, 0.5);
			scaleObject('helicopter2', 1.6,1.6);
			objectPlayAnimation('helicopter2', 'hover',false)
			addLuaSprite('helicopter2',false)
			
			makeAnimatedLuaSprite('policeLucy', 'week2/highway/policeCar', 320, 630) -- 900x 620y
			addAnimationByPrefix('policeLucy', 'drivee', 'policeCar', 20, true)
			setScrollFactor('policeLucy', 0.4, 1);
			scaleObject('policeLucy', 1.9,1.9);
			addLuaSprite('policeLucy', false)
			playAnim('policeLucy', 'drivee',true)
		end

		makeAnimatedLuaSprite('parents', 'week2/highway/parentsCar', 947, 630) ------------- PARENTS CAR
		addAnimationByPrefix('parents', 'fly', 'CAR FLY0', 24, false)
		addAnimationByPrefix('parents', 'idle', 'PARENTS CAR0', 24, true)
		addAnimationByPrefix('parents', 'station', 'STATIONARY', 24, true)
		setScrollFactor('parents', 1.4, 1);
		scaleObject('parents', 2,2);
		addLuaSprite('parents', false)
		addOffset('parents','fly', 85, 245) -- x 295, y 315
		addOffset('parents','idle', -141, -95)
		setProperty('parents.visible', false)
		playAnim('parents', 'idle',true)

		if not lowQuality then

			makeLuaSprite('light2', 'week2/newyork/screenShit/LIGHTTEST', -500, -100);
			setScrollFactor('light2', 0, 0);
			addLuaSprite('light2', true);
			scaleObject('light2', 6,4);
			setBlendMode('light2', 'SCREEN')

			makeLuaSprite('comic', 'week2/highway/TRANSITION/DINGG', -300, 0);
			setScrollFactor('comic', 0.2, 0);
			addLuaSprite('comic', false);
			scaleObject('comic', 4.8,4);
			setProperty('comic.visible', false)
		end

		makeAnimatedLuaSprite('SMACKLOL', 'week2/highway/TRANSITION/SMACK', -250, 400) -- 900x 620y
		addAnimationByPrefix('SMACKLOL', 'damn', 'SMACKCAM', 24, false)
		setScrollFactor('SMACKLOL', 0.9, 0.7);
		scaleObject('SMACKLOL', 1.2,1.2);
		addLuaSprite('SMACKLOL', true)
		setProperty('SMACKLOL.visible', false)

		makeAnimatedLuaSprite('angeloPrep', 'week2/highway/TRANSITION/ANGELO INTRO', 340, 110) -- 900x 620y
		addAnimationByPrefix('angeloPrep', 'yup', 'ANGELO INTRO', 24, false)
		setScrollFactor('angeloPrep', 1.4, 0.9);
		scaleObject('angeloPrep', 1.8,1.8);
		addLuaSprite('angeloPrep', false)
		setProperty('angeloPrep.visible', false)

		if not lowQuality then
			makeLuaSprite('raindrop', 'week2/DRIFT/hud/RAINDROPS', 0, 0);
			addLuaSprite('raindrop', true);
			scaleObject('raindrop', 4,4);
			setBlendMode('raindrop', 'SCREEN')
			setObjectCamera('raindrop', 'other')
			setProperty('raindrop.alpha', 0.2)

			makeLuaSprite('policeLight', 'week2/DRIFT/hud/copOverlay', 0, 0);
			addLuaSprite('policeLight', true);
			scaleObject('policeLight', 4,4);
			setBlendMode('policeLight', 'SCREEN')
			setObjectCamera('policeLight', 'camHUD')
			setProperty('policeLight.alpha', 1)
		end
		
	end

	if not lowQuality then
		makeLuaSprite('textshart', 'week2/highway/TRANSITION/textBG', 0, 400);
		addLuaSprite('textshart', true);
		scaleObject('textshart', 2.2,2);
		setObjectCamera('textshart', 'other')
		setProperty('textshart.visible', false)
		screenCenter('textshart', 'x')

		makeLuaText('subtitles', '', '0', '595', '590') -- 495, 510
		setTextFont('subtitles', 'GothicJoker.ttf')
		setTextAlignment('subtitles', 'center')
		setObjectCamera('subtitles', 'other')
		setTextSize('subtitles','40')
		setTextString('subtitles', 'Uhh... sir, we seem have a uh white woman and cinnamon toast crunch on the highway...I think you need to send in the big guns')
		addLuaText('subtitles')
		setTextBorder('subtitles', '0', '')
		setProperty('subtitles.visible', false)
		screenCenter('subtitles', 'x')
	end

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
	
	makeLuaSprite('clipTop', '', -30 , -60);
	setScrollFactor('clipTop', 1, 1);
	addLuaSprite('clipTop', true);
	scaleObject('clipTop', '2','2');
	makeGraphic('clipTop', screenWidth, 120, '000000')
	setObjectCamera('clipTop', 'other')
	
	makeLuaSprite('cracktop', 'menuReload/SCREEN UI SHIT/crack', 1000,120);
	setScrollFactor('cracktop', 1, 1);
	addLuaSprite('cracktop', false);
	scaleObject('cracktop', '0.65','0.65');
	setObjectCamera('cracktop', 'other')
	setBlendMode('cracktop', 'SCREEN')
	
	makeLuaSprite('clipBottom', '', 0, 660);
	setScrollFactor('clipBottom', 1, 1);
	addLuaSprite('clipBottom', true);
	scaleObject('clipBottom', '2','2.5');
	makeGraphic('clipBottom', screenWidth, 80, '000000')
	setObjectCamera('clipBottom', 'other')
	
	makeLuaSprite('crackbottom', 'menuReload/SCREEN UI SHIT/crack', -47,523);
	setScrollFactor('crackbottom', 1, 1);
	addLuaSprite('crackbottom', false);
	setProperty('crackbottom.flipX', true)
	scaleObject('crackbottom', '0.65','0.65');
	setObjectCamera('crackbottom', 'other')
	setBlendMode('crackbottom', 'SCREEN')
	

	setObjectOrder('clipTop', 70)
	setObjectOrder('clipBottom', 70)
	--daEnding()
	--secondStage()

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
    
    
	--windowShake()
	setProperty('leftB2.color', 000000 )

	setObjectOrder('clipTop', 55)
	setObjectOrder('clipBottom', 55)

	setProperty('light2.color', white)
	white = getColorFromHex('FFFFFF')
	setProperty('light2.flipY', true)
	

	setProperty('gf.alpha', 0)

	stephaniesX = getProperty('dad.x')
	stephaniesY = getProperty('dad.y')
	setProperty('blastStreak.x', stephaniesX - 50)
	setProperty('blastStreak.y', stephaniesY - 100)
	
	setProperty('dad.scrollFactor.x', 0.6);
	setProperty('dad.scrollFactor.y', 0.7);

	setProperty('boyfriend.scrollFactor.x', 1.4);
	setProperty('boyfriend.scrollFactor.y', 0.9);


	key_pressed = keyJustPressed('accept')

	if curStep  >= 0 and curStep < 194 then
		if mustHitSection == false  then
			doTweenX('dadscaleX', 'boyfriend.scale', 1.8, 1.0, 'linear');
			doTweenY('dadscaleY', 'boyfriend.scale', 1.8, 1.0, 'linear');
			
			setProperty('defaultCamZoom',1.2)
		else
            setProperty('defaultCamZoom',1.1)
			doTweenX('dadscaleX', 'boyfriend.scale', 2, 1.0, 'linear');
			doTweenY('dadscaleY', 'boyfriend.scale', 2, 1.0, 'linear');
		
        end
	end

	if curStep  >= 194 and curStep < 1400 then
		if mustHitSection == false  then
			setProperty('defaultCamZoom',0.8)
		else
            setProperty('defaultCamZoom',0.7)
        end
	end

	if curStep > 1966 then
		setProperty('boyfriend.alpha', 0)
		setProperty('dad.alpha', 0)
	end


	daElapsed = elapsed * 30
	i = i + daElapsed
		
	
	if curStep  > 0 and curStep < 997 and  songName == 'drift' then

		setProperty('helicopter2.x', (math.sin(i/15)*50) - 450) -- left
		setProperty('helicopter2.y', (math.sin(i/5)*10) - 50)
		setProperty('helicopter.x', (math.sin(i/6)*19) + 650) -- right
		setProperty('helicopter.y', (math.sin(i/9)*17) + 100)

		setProperty('dad.y', (math.sin(i/20)*50) + 400)
		yy = (math.sin(i/20)*50) + 600

	elseif curStep > 1040 and songName == 'drift' then

		setProperty('dad.y', (math.sin(i/20)*30) + 400)
		yy = (math.sin(i/20)*30) + 600

	end

	if curStep  >= 912 and curStep < 920 and  songName == 'drift' then -- 8 steps hits
		setProperty('defaultCamZoom',0.8)
		setProperty('cameraSpeed', 1)
		setProperty(camX, 600);
		setProperty(camY, 300);
		followchars = false
	elseif curStep >= 920 and curStep < 936 and songName == 'drift' then  -- 16 hits i believe this is where the parents drop
		setProperty('defaultCamZoom',1.1)
		setProperty(camX, 800);
		setProperty(camY, 700);

	elseif curStep > 936 and songName == 'drift' then
		followchars = true
	end

	if curStep > 996 and curStep < 1000 then 
		cameraShake('camGame', 0.03, 0.5)
	elseif curStep > 1020 and curStep < 1022 then 
		cameraShake('camGame', 0.01, 0.5)
	elseif curStep > 1042 then
		cameraShake('camGame', 0.002, 0.5) --regular shake
	end


	if curStep  >= 1005 and curStep < 1040 and songName == 'drift' then 
		setProperty('defaultCamZoom',1.2)
		setProperty('cameraSpeed', 0.4)
		followchars = false
		setProperty(camX, 800);
		setProperty(camY, 650);

	elseif curStep >= 1040 and curStep < 2000 and songName == 'drift' then
		followchars = true
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
------------------------------------------------- STAGES

function round(x, n)
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end

function secondStage()

	makeLuaSprite('sky', 'week2/DRIFT/skyBG', -550, 150);
	setScrollFactor('sky', 0.7, 0.8);
	addLuaSprite('sky', false);
	scaleObject('sky', 4,4);
	
	makeLuaSprite('cityshart', 'week2/DRIFT/city', -600, 150);
	setScrollFactor('cityshart', 0.8, 0.7);
	addLuaSprite('cityshart', false);
	scaleObject('cityshart', 4,4);

	makeAnimatedLuaSprite('road', 'week2/DRIFT/street', -670,690)
	addAnimationByPrefix('road', 'moving', 'streetMove',24,true)
	setScrollFactor('road', 0.9, 0.9);
	addLuaSprite('road',false)
	scaleObject('road', 2.2,2);
	objectPlayAnimation('road', 'moving',false)

	makeAnimatedLuaSprite('bridgeLOL', 'week2/DRIFT/bridge', -700,0)
	addAnimationByPrefix('bridgeLOL', 'chuga', 'layer1BG',24,true)
	setScrollFactor('bridgeLOL', 0.9, 0.9);
	addLuaSprite('bridgeLOL',false)
	scaleObject('bridgeLOL', 2.2,2);
	objectPlayAnimation('bridgeLOL', 'chuga',false)
	
	if not lowQuality then
		makeAnimatedLuaSprite('lights', 'week2/DRIFT/lightsAbove', 200,0)
		addAnimationByPrefix('lights', 'wee', 'lightsmove',24,true)
		setScrollFactor('lights', 0.9, 0.9);
		addLuaSprite('lights',false)
		scaleObject('lights', 2.2,2);
		objectPlayAnimation('lights', 'wee',false)

		makeAnimatedLuaSprite('car2', 'week2/DRIFT/police', 590,630)
		addAnimationByPrefix('car2', 'omglucy', 'policeCarMoving',28,true)
		setScrollFactor('car2', 0.9, 0.9);
		addLuaSprite('car2',false)
		scaleObject('car2', 0.7,0.7);
		objectPlayAnimation('car', 'omglucy',false)

		makeAnimatedLuaSprite('car', 'week2/DRIFT/police', 340,530)
		addAnimationByPrefix('car', 'omglucy', 'policeCarMoving',24,true)
		setScrollFactor('car', 0.9, 0.9);
		addLuaSprite('car',false)
		scaleObject('car', 1.8,1.8);
		objectPlayAnimation('car', 'omglucy',false)
	end

	makeLuaSprite('parentsCar', 'week2/DRIFT/car', 590, 180);
	setScrollFactor('parentsCar', 0.9, 0.9);
	addLuaSprite('parentsCar', false);
	scaleObject('parentsCar', '1.2','1');

	makeAnimatedLuaSprite('OUTRO', 'week2/highway/TRANSITION/COME OUT', 620, 20) -- 900x 620y
	addAnimationByPrefix('OUTRO', 'ready', 'intro', 24, false)
	setScrollFactor('OUTRO', 0.9, 0.9);
	scaleObject('OUTRO', 2,2);
	addLuaSprite('OUTRO', true)
	setProperty('OUTRO.visible', false)

	if not lowQuality then
		makeLuaSprite('lightthingy', 'week2/DRIFT/lightOverlay', 0, 0);
		addLuaSprite('lightthingy', true);
		scaleObject('lightthingy', 4.8,4);
		setBlendMode('lightthingy', 'SCREEN')
		setObjectCamera('lightthingy', 'other')
	end

	setObjectOrder('clipTop', 70)
	setObjectOrder('clipBottom', 70)

	addLuaSprite('clipBottom', true);
	addLuaSprite('clipTop', true);

end

function insideCar()

	makeLuaSprite('carBG', 'week2/highway/TRANSITION/carInterior', 0, 0);
	addLuaSprite('carBG', false);
	scaleObject('carBG', 2,2);
	setObjectCamera('carBG', 'other')
	setProperty('carBG.visible', true)

	makeAnimatedLuaSprite('swoopIn', 'week2/highway/TRANSITION/ANGELO INTRO IN CAR', -100, -200) -- 900x 620y
	addAnimationByPrefix('swoopIn', 'wee', 'angeloJumpIn', 24, false)
	scaleObject('swoopIn', 1.8,1.8);
	addLuaSprite('swoopIn', false)
	setObjectCamera('swoopIn', 'other')
	setProperty('swoopIn.visible', false)

	makeLuaSprite('frontCarBG', 'week2/highway/TRANSITION/carshit1', 0, 0);
	addLuaSprite('frontCarBG', false);
	scaleObject('frontCarBG', 2,2);
	setObjectCamera('frontCarBG', 'other')
	setProperty('frontCarBG.visible', false)

	makeAnimatedLuaSprite('moms', 'week2/highway/TRANSITION/MOMMY', 800, -150) -- 900x 620y
	addAnimationByPrefix('moms', 'blah', 'MOMMY TALK', 24, false)
	scaleObject('moms', 2,2);
	setObjectCamera('moms', 'other')
	setProperty('moms.visible', false)
	addLuaSprite('moms', false)

	makeLuaSprite('seats', 'week2/highway/TRANSITION/carshit2', 0, 0);
	addLuaSprite('seats', false);
	scaleObject('seats', 2,2);
	setObjectCamera('seats', 'other')
	setProperty('seats.visible', false)

	makeLuaSprite('textshart', 'week2/highway/TRANSITION/textBG', 0, 480);
	addLuaSprite('textshart', true);
	scaleObject('textshart', 1.6,1.6);
	setObjectCamera('textshart', 'other')
	setProperty('textshart.visible', false)
	screenCenter('textshart', 'x')

	makeLuaText('mommytalks', '', '0', '595', '500') -- 495, 510
	setTextFont('mommytalks', 'GothicJoker.ttf')
	setTextAlignment('mommytalks', 'center')
	setObjectCamera('mommytalks', 'other')
	setTextSize('mommytalks','30')
	setTextString('mommytalks', '???: Hey sweetie, underneath you is an AK. Look don’t ask, i made some pretty bad decisions. Just finish the job will you?')
	addLuaText('mommytalks')
	setTextBorder('mommytalks', '0', '')
	setProperty('mommytalks.visible', false)
	screenCenter('mommytalks', 'x')


	runTimer('jumpin', 0.5,1); -- angelo shows up and jumps in
	runTimer('setparents', 1.5,1); -- shows the parents in their seat
	runTimer('talks', 2,1); -- when mm starts talking
	runTimer('deleteparents', 4.5,1); -- get rid of parents and shows angelo again

	runTimer('spawnNextStage', 8.6,1); -- get rid of parents and shows angelo again
end

function daEnding()
	makeLuaSprite('bgCity', 'week2/DRIFT/ending/sideProfileBG', 0, 0);
	addLuaSprite('bgCity', false);
	scaleObject('bgCity', 4,4);
	setProperty('bgCity.visible', true)
	setObjectCamera('bgCity', 'other')

	makeAnimatedLuaSprite('stephanieShotBG', 'week2/DRIFT/ending/bg', -50, -50)
	addAnimationByPrefix('stephanieShotBG', 'bgrunning', 'bgMoving', 24, false)
	scaleObject('stephanieShotBG', 2,2);
	setObjectCamera('stephanieShotBG', 'other')
	addLuaSprite('stephanieShotBG', false)
	setProperty('stephanieShotBG.visible', true)
	objectPlayAnimation('stephanieShotBG', 'bgrunning',false)

	makeAnimatedLuaSprite('stephanieShot', 'week2/DRIFT/ending/stephanieEnd', 0, 0)
	addAnimationByPrefix('stephanieShot', 'sheshot', 'stephanieEnding', 24, false)
	scaleObject('stephanieShot', 1.8,1.8);
	setObjectCamera('stephanieShot', 'other')
	addLuaSprite('stephanieShot', false)
	setProperty('stephanieShot.visible', true)
	objectPlayAnimation('stephanieShot', 'sheshot',false)

	makeLuaSprite('carBehind', 'week2/DRIFT/ending/car', -200, 100);
	addLuaSprite('carBehind', false);
	scaleObject('carBehind', '1','1');
	setProperty('carBehind.visible', false)
	setObjectCamera('carBehind', 'other')

	makeAnimatedLuaSprite('angeloShoot', 'week2/DRIFT/ending/angeloEnd', 300, 0)
	scaleObject('angeloShoot', 1.8,1.8);
	setObjectCamera('angeloShoot', 'other')
	setProperty('angeloShoot.visible', false)
	addLuaSprite('angeloShoot', false)

	makeLuaSprite('endScreenShart', 'week2/DRIFT/ending/end', 0, 0);
	addLuaSprite('endScreenShart', true);
	scaleObject('endScreenShart', 2,2);
	setObjectCamera('endScreenShart', 'other')
	setProperty('endScreenShart.visible', false)

	runTimer('flashandshake', 0.5,1)


	cutscenePrepare()
end

------------------------------------------------- CUSTOM FUNCTIONS
function removeShits()

	removeLuaSprite('sky', true)
	removeLuaSprite('buildingBG', true)
	removeLuaSprite('leftB', true)
	removeLuaSprite('rightB', true)
	removeLuaSprite('ground', true)
	removeLuaSprite('lightboounce', true)
	removeLuaSprite('blurCar', true)
	removeLuaSprite('helicopter', true)
	removeLuaSprite('helicopter2', true)
	removeLuaSprite('policeLucy', true)
	removeLuaSprite('parents', true)
	removeLuaSprite('light2', true)
	removeLuaSprite('comic', true)
	removeLuaSprite('SMACKLOL', true)
	removeLuaSprite('angeloPrep', true)
	removeLuaSprite('raindrop', true)

end

function removeShits2()

	removeLuaSprite('carBG', true)
	removeLuaSprite('swoopIn', true)
	removeLuaSprite('frontCarBG', true)
	removeLuaSprite('moms', true)
	removeLuaSprite('seats', true)
	removeLuaSprite('textshart', true)
	removeLuaText('mommytalks', true)
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

function cutscenePrepare()
	doTweenY('clip1Move', 'clipTop', -10, 0.5, 'smootherStepIn')
	doTweenY('clip2Move', 'clipBottom', 590, 0.5, 'smootherStepIn')
	doTweenAlpha('byebye', 'camHUD', 0, 0.5, 'backIn')
	setObjectOrder('clipTop', 70)
	setObjectOrder('clipBottom', 70)
	--setProperty('defaultCamZoom',0.7)
end

function cutsceneGoaway()
	doTweenY('clip1Move', 'clipTop', -60, 1, 'smootherStepIn')
	doTweenY('clip2Move', 'clipBottom', 660, 1, 'smootherStepIn')
	doTweenAlpha('byebye', 'camHUD', 1, 0.5, 'backIn')
	setProperty('defaultCamZoom',0.7)
end

function setUpTrans()
	runTimer('comicAppear', 2,1);
	setProperty('boyfriend.alpha', 0)
	playAnim('angeloPrep', 'yup',true)
	setProperty('angeloPrep.visible', true)

	cutscenePrepare()
end
------------------------------------------------- HEALTH SHITS


stepHitFuncs = { 

	[912] = function() -- parents drop in
		doTweenZoom('goIn', 'camGame', '0.75', 0.5, 'bounceOut')
		playAnim('parents', 'fly', false)
		runTimer('shake', 0.9,1);
		runTimer('regularMotion', 1.7,1);
		setProperty('parents.visible', true)
		--cutscenePrepare()
		followchars = false;
		
		playSound('DRIFT/driftParents', 1) -- police 
		playSound('DRIFT/parentsDrop', 0.5) -- sfx
	end,
	

	[975] = function() 
		setUpTrans()
	end,


	[1966] = function() 
		--cutscenePrepare()
		daEnding()
	end,

}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end

------------------------------------------------- TWEENS AND TIMERS SHITS AND MISC

function onTweenCompleted(tag, loops, loopsLeft)
	if tag == 'impactshot' then
		doTweenZoom('moveBack', 'camOther', '1', 1, 'circOut')
		
	end

	if tag == 'moveBack' then
		setProperty('stephanieShot.visible', false)
		setProperty('bgCity.visible', false)
		setProperty('stephanieShotBG.visible', false)
		setProperty('car.visible', false)
		setProperty('car2.visible', false)
		setProperty('parentsCar.visible', false)

		addAnimationByPrefix('angeloShoot', 'heshot', 'novaBase', 24, false)
		setProperty('angeloShoot.visible', true)
		setProperty('carBehind.visible', true)
		objectPlayAnimation('angeloShoot', 'heshot',false)

		setProperty('lights.flipX', true)
		setProperty('bridgeLOL.flipX', true)
		setProperty('road.flipX', true)
		setProperty('cityshart.flipX', true)
		setObjectCamera('bridgeLOL', 'other')
		setObjectCamera('road', 'other')
		setObjectCamera('cityshart', 'other')
		setObjectCamera('lights', 'other')

		setProperty('road.x', -100)
		setProperty('road.y', 380)
		setProperty('bridgeLOL.x',-200)
		setProperty('bridgeLOL.y', -300)
		setProperty('lights.x', 100)
		setProperty('lights.y', -250)
		setProperty('cityshart.x', 200)
		setProperty('cityshart.y', -100)
		
		setObjectOrder('lightthingy', 50)
		setObjectOrder('clipTop', 70)
		setObjectOrder('clipBottom', 70)

		setProperty('lights.angle', -10)
		setProperty('cityshart.angle', -10)
		setProperty('road.angle', -10)
		setProperty('bridgeLOL.angle', -10)
	
		cameraShake('camHUD', 0.001, 4)

		--runTimer('endingScreen', 1.5,1);

		runTimer('scribble', 1,1);
	end

	--if tag == 'finale' then
	--	cameraFade('other', '000000', 1, false)
	--end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'scribble' then
		isStarting = false;
		isEnding = true;
		endingScribble()
	end
	if tag == 'endingScreen' then
		doTweenZoom('finale', 'camOther', '1.1', 0.4, 'circInOut')
	end

	if tag == 'comicAppear' then
	
		setProperty('comic.visible', true)
		doTweenX('comicmove', 'comic', -450, 1, 'smootherStepOut')
		setProperty('dad.alpha', 0)
		playAnim('SMACKLOL', 'damn',true)
		setProperty('SMACKLOL.visible', true)
		playAnim('parents', 'station',true)

		setProperty('blastStreak.alpha', 0)
		
		doTweenZoom('impact', 'camGame', '0.8', 0.4, 'circOut')
		cameraFlash('other', 'ffffff', 0.5, false)
		setProperty('cameraSpeed', 0.1)
	
		runTimer('comicbye', 0.7,1);
		runTimer('cameramove', 1.2,1);

		--debugPrint('ZOOM IN!')

		followchars = false
	end
	if tag == 'cameramove' then
		
		setProperty(camX, 800);
		setProperty(camY, 650);
		
	end
	if tag == 'flashandshake' then -- when stephanie gets shot in the end
		cameraShake('camHUD', 0.01, 0.5)
		doTweenZoom('impactshot', 'camOther', '1.1', 0.5, 'circOut')
		cameraFlash('other', 'ffffff', 1, false)
	end
	if tag == 'comicbye' then
		
		doTweenAlpha('comicbyebye', 'comic', 0, 0.5, 'smootherStepOut')
		doTweenX('stepbye', 'SMACKLOL', -100, 0.5, 'backOut')
		setProperty('SMACKLOL.visible', false)
		runTimer('delete', 2.8,1);
		
	end
	if tag == 'delete' then -- he enters the car and all the assets are removed
	
		removeShits()
		insideCar()
		
	end
	if tag == 'jumpin' then
	
		setProperty('swoopIn.visible', true)
		playAnim('swoopIn', 'wee',true)
		
	end
	if tag == 'setparents' then
	
		setProperty('frontCarBG.visible', true)
		setProperty('moms.visible', true)
		setProperty('seats.visible', true)
		setProperty('swoopIn.visible', false)
		
		playAnim('moms', 'blah',true)

	end
	if tag == 'deleteparents' then
	
		setProperty('frontCarBG.visible', false)
		setProperty('moms.visible', false)
		setProperty('seats.visible', false)
		setProperty('swoopIn.visible', true)
		
	end
	if tag == 'talks' then
	
		setProperty('textshart.visible', true)
		setProperty('mommytalks.visible', true)
		
	end
	if tag == 'spawnNextStage' then  ------------ THIS SPAWNS IN THE SECOND STAGE ---------------
	
		triggerEvent('Change Character', 0, 'nova-drift');
		setProperty('boyfriend.y', 400)
		doTweenZoom('hiii', 'camGame', '0.7', 1, 'bounceIn')
		removeShits2()
		secondStage()
		setProperty('dad.alpha', 1)
		setProperty('OUTRO.visible', true)
		playAnim('OUTRO', 'ready',true)
		runTimer('appearIdle', 1,1);
		setProperty('blastStreak.alpha', 1)
		followchars = false
		
	end
	if tag == 'appearIdle' then
		setProperty('boyfriend.alpha', 1)
		setProperty('OUTRO.visible', false)
		cutsceneGoaway()
	end
	if tag == 'regularMotion' then
	
		playAnim('parents', 'idle', true)

	end
	if tag == 'shake' then
		cameraShake('camGame', 0.006, 0.5)
	
	end
	if tag == 'panDown' then
		if not lowQuality then 
			playSound('DRIFT/driftPoliceIntro', 1, 'lol')
			setProperty('subtitles.visible', true)
			setProperty('textshart.visible', true)
		end
		followchars = true;
		setProperty('cameraSpeed', 0.2)
		runTimer('gameStart', 8,1);

	end
	if tag == 'gameStart' then
		
		doTweenZoom('begin', 'camGame', '0.7', 1, 'bounceIn')
		doTweenAlpha('hello', 'camHUD', 1, 0.5, 'backIn')
		setProperty('cameraSpeed', 1)
		--setProperty('defaultCamZoom',0.9)
		
		setProperty('subtitles.visible', false)
		setProperty('textshart.visible', false)

		doTweenAlpha('hello1', 'glassShit', 1, 0.5, 'backIn')
		doTweenAlpha('hello2', 'glassShit2', 1, 0.5, 'backIn')

		cutsceneGoaway()
		
	end

end

function onPause()
	pauseSound('lol')
	pauseSound('intro')
	cameraShake('camHUD', 0, 1)
	return Function_Continue;
end

function onResume()
	resumeSound('lol')
	resumeSound('intro')
	--cameraShake('other', 0, 1)
end


