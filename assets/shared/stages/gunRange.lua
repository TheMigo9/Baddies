local xx = 550; --dad
local yy = 570; 
local xx2 = 450; --bf
local yy2 = 600; 
local ofs = 15;  
local followchars = true; 
local del = 0;
local del2 = 0;
local i = 0;
local allowCountdown = false
local doDialogue = true

local isEnding = false;
local isStarting = false;

function onCreate()
    --Change Scroll Speed
    triggerEvent('Change Scroll Speed', 0.45, 0.1)
	--cameraShit
	camX = 'camFollow.x';	
	camY = 'camFollow.y';

	makeLuaSprite('wall', 'week2/gunrange/BG2', -300, -100);
	setScrollFactor('wall', 0.4, 0.7);
	addLuaSprite('wall', false);
	scaleObject('wall', 2.2,2);

	makeAnimatedLuaSprite('brute', 'week2/gunrange/BRUTUS', -350, 170);
	scaleObject('brute', 2.0, 2.0);
	addAnimationByPrefix('brute', 'idle', 'BOP',24,true);
	setScrollFactor('brute', 0.5, 0.9);
	addLuaSprite('brute', false);

	makeLuaSprite('wallSide', 'week2/gunrange/BG1', 1150, 50);
	setScrollFactor('wallSide', 0.7,0.8);
	addLuaSprite('wallSide', false);
	scaleObject('wallSide', 2.4,2);

	makeLuaSprite('counter', 'week2/gunrange/FG', -730, -60);
	setScrollFactor('counter', 1.1, 0.9);
	addLuaSprite('counter', true);
	scaleObject('counter', 2.4,2);

	makeAnimatedLuaSprite('chloeEnd', 'week2/gunrange/CHLOE-ENDING', 90, 260);
	addAnimationByPrefix('chloeEnd', 'gang', 'FUCK YOU FULL',24,true);
	setScrollFactor('chloeEnd', 0.9, 0.9);
	addLuaSprite('chloeEnd', true);
	setProperty('chloeEnd.visible', false)
	scaleObject('chloeEnd', 2.0, 2.0);

	makeAnimatedLuaSprite('chloeListen', 'week2/gunrange/CHLOE-LISTEN', 110, 305);
	addAnimationByPrefix('chloeListen', 'listen', 'LISTEN0',24,true);
	addAnimationByPrefix('chloeListen', 'intro', 'LISTENINTRO',24,false);
	addAnimationByPrefix('chloeListen', 'end', 'LISTENEND',24,false);
	setScrollFactor('chloeListen', 0.9, 0.9);
	addLuaSprite('chloeListen', true);
	setProperty('chloeListen.visible', false)
	scaleObject('chloeListen', 2,2);
	setObjectOrder("chloeListen", 'Dad')

	addOffset('chloeListen','intro', -145, -140) -- -5, 35
	addOffset('chloeListen','listen', -145, -160) -- -5, 15

	makeLuaSprite('light2', 'week2/newyork/screenShit/LIGHTTEST', -500, -100);
	setScrollFactor('light2', 0, 0);
	addLuaSprite('light2', true);
	scaleObject('light2', 6,4);
	setBlendMode('light2', 'SCREEN')
	
	
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
	addLuaSprite('clipTop', false);
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
	
	makeLuaSprite('crackbottom', 'menuReload/SCREEN UI SHIT/crack', -47,523);
	setScrollFactor('crackbottom', 1, 1);
	addLuaSprite('crackbottom', false);
	setProperty('crackbottom.flipX', true)
	scaleObject('crackbottom', '0.65','0.65');
	setObjectCamera('crackbottom', 'other')
	setBlendMode('crackbottom', 'SCREEN')
	
	makeLuaSprite('clipBottom1', '', 0, 660);
	setScrollFactor('clipBottom1', 1, 1);
	addLuaSprite('clipBottom1', false);
	scaleObject('clipBottom1', '2','2.5');
	makeGraphic('clipBottom1', screenWidth, 80, '000000')
	setObjectCamera('clipBottom1', 'other')
	
	makeLuaSprite('TB', 'timeBarShow', 479 , 132);
	setScrollFactor('TB', 1, 1);
	addLuaSprite('TB', true);
	scaleObject('TB', '0.75','0.75');
	setObjectCamera('TB', 'hud')
	--setProperty('TB.visible', false)
	
	--setProperty('clipTop.alpha', 0)
	--setProperty('clipBottom.alpha', 0)
	
	------------------------------------------------------- TEXT SHIT --------------------------------------------------------

	makeAnimatedLuaSprite('textbg', 'misc/4-hudShit/TEXTBOXES', 50, 410);
	addAnimationByPrefix('textbg', 'chloe', 'textBoxChloe',12,true);
	addAnimationByPrefix('textbg', 'jasmine', 'textBoxJasmine',12,true);
	addAnimationByPrefix('textbg', 'lucy', 'textBoxLucy',12,true);
	objectPlayAnimation('textbg', 'jasmine',true);
	setObjectCamera('textbg', 'other')
	scaleObject('textbg', '0.6','0.6');
	screenCenter('textbg', 'x')
	addLuaSprite('textbg', false);
	setProperty('textbg.alpha', 0)

	makeLuaText('talk2', '', '750', '330', '445')
	setTextFont('talk2', 'GothicJoker.ttf')
	setTextAlignment('talk2', 'left')
	setObjectCamera('talk2', 'other')
	setTextSize('talk2','30')
	if censored then
		setTextString('talk2', 'Alright! So first, we need to train you on your firing. Hold your gun with both hands and aim at your target... And shoot that thing!')
	else
		setTextString('talk2', 'Alright! So first, we need to train you on your firing. Hold your gun with both hands and aim at your target... And shoot that shit.')
	end
	addLuaText('talk2')
	setProperty('talk2.alpha', 0)
	setTextBorder('talk2', '0', '')

end

function onGameOver()
	return Function_Stop;
end


function onUpdate(elapsed)

    setTextString('ScoreText', getProperty("songScore"))
    setTextString('MissesText', getProperty('songMisses'))
    setProperty('scoreTxt.visible', false)
    setProperty('timeTxt.y', 139)
	setTextFont('timeTxt', 'GothicJoker.ttf')
	setProperty('timeTxt.x', 475)
	scaleObject('timeTxt', '0.75','0.75');
	setObjectOrder('timeTxt', 50)
	setProperty('TB.y', 132)
    
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
	    setProperty('timeTxt.y', 572)
	    setProperty('TB.y', 565)
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
		setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
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
	
	setProperty('gf.alpha', 0)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.alpha', 0)
	setProperty('healthBarBG.alpha', 0)

	setObjectOrder('chloeListen', 12)
	setObjectOrder('chloeEnd', 12)
	setObjectOrder('light2', 20)

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

function round(x, n)
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end

function onStartCountdown()
	if doDialogue and not seenCutscene and isStoryMode and not censored then
		startDialogue('tutorialShit', 'dialogueMusic/rehearsalDia') 
		doDialogue = false

		setProperty('glassShit.alpha', 0)
		setProperty('glassShit2.alpha', 0)
		setProperty('glassShitBar.alpha', 0)
		return Function_Stop
	else
		doTweenAlpha('wassup', 'glassShit', 1, 1, 'backIn')
		doTweenAlpha('wassup1', 'glassShit2', 1, 1, 'backIn')
	end

	if doDialogue and not seenCutscene and isStoryMode and censored then
		startDialogue('tutorialCensored', 'latenight') 
		doDialogue = false

		setProperty('glassShit.alpha', 0)
		setProperty('glassShit2.alpha', 0)
		setProperty('glassShitBar.alpha', 0)
		return Function_Stop
	else
		doTweenAlpha('wassup', 'glassShit', 1, 1, 'backIn')
		doTweenAlpha('wassup1', 'glassShit2', 1, 1, 'backIn')
	end
	return Function_Continue
end

function letterBox() 

	doTweenY('clip1Move', 'clipTop', 40, 0.5, 'smootherStepIn')
	doTweenY('clip2Move', 'clipBottom', 600, 0.5, 'smootherStepIn')
	doTweenAlpha('byebye', 'camHUD', 0, 0.5, 'backIn')
	
end

------------------------------ TALKING FUNCTIONS -------------------------------------

function letterBoxJasmineTalk() 

	doTweenY('clip1Move', 'clipTop', 40, 1, 'smootherStepIn')
	doTweenY('clip2Move', 'clipBottom', 600, 1, 'smootherStepIn')
	doTweenAlpha('byebye', 'camHUD', 0, 0.5, 'backIn')
	followchars = false

	triggerEvent('Play Animation', 'talking', 'Dad')

	setProperty('boyfriend.alpha', 0)
	setProperty('chloeListen.visible', true)
	playAnim('chloeListen', 'intro',true)
	
	runTimer('playListen', 1.4,1);


end

function letterBoxOutJasmineEnds() 

	doTweenY('clip1Move', 'clipTop', 0, 1, 'smootherStepIn')
	doTweenY('clip2Move', 'clipBottom', 660, 1, 'smootherStepIn')
	doTweenAlpha('welcomeBack', 'camHUD', 1, 1.5, 'backIn')
	
	triggerEvent('Play Animation', 'talkingends', 'Dad')

	playAnim('chloeListen', 'intro',true, true)
	runTimer('endListen', 1.1,1);


	followchars = true
end

function talkingUI()
	doTweenAlpha('textboxAppear', 'textbg', 1, 1, 'backIn')
	doTweenAlpha('textAppear', 'talk2', 1, 1.5, 'backIn')
end

function fuckyou() -- ending

	
	setProperty('boyfriend.visible', false)
	triggerEvent('Play Animation', 'end', 'Dad')
	objectPlayAnimation('chloeEnd', 'gang',true);

	doTweenAngle('intenseRotate', 'camGame', '6', 0.5, 'circOut')
	doTweenZoom('begin', 'camGame', '0.7', 0.5, 'CircOut')

	setProperty('chloeEnd.visible', true)

	runTimer('resetNshake', 1.8,1);

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

	
	[5] = function() --testing space

		
	end,

	[16] = function() --testing space

		if songName == 'rehearsal' then
		letterBoxJasmineTalk();
		talkingUI();

		runTimer('chloeText', 10,1);
		runTimer('jasmineText', 15,1);
		
		setProperty(camX, 745);
		setProperty(camY, 520);
		end
		
	end,

	[72] = function() --testing space
		if songName == 'rehearsal' then
			setProperty(camX, 450);
			setProperty(camY, 590);
			
		end
	end,

	[99] = function() --testing space
		if songName == 'rehearsal' then
			setProperty(camX, 745);
			setProperty(camY, 520);
		end
	end,

	[136] = function() --testing space
		if songName == 'rehearsal' then
			letterBoxOutJasmineEnds();
			runTimer('resetUI', 0.5,1);
		end
	end,

	[272] = function() --testing space
		if songName == 'rehearsal' then
			letterBoxJasmineTalk();
			talkingUI();

			setProperty(camX, 745);
			setProperty(camY, 520);

			if misses > 6 then
				setTextString('talk2', 'I don’t even know what to say. Did you even try? Let’s uhh... try shooting and singing. Can you handle that?')
			elseif misses > 3 then 
				setTextString('talk2', 'Oh Jesus, I know you grew up in the burbs... it’s okay, now we’re gonna try shooting and singing!')
			elseif misses > 1 then 
				setTextString('talk2', 'Not bad girl. Your aim was a bit off, but you got the hang of it. Now let’s shoot and singing!')
			else
				setTextString('talk2', 'Damn girl, you’re a natural! You’re doing perfect! Now we’re gonna use your voice AND shoot at the same time!')
			end
			objectPlayAnimation('textbg', 'jasmine',true);

			runTimer('chloeText2', 6.5,1);
		end
		
	end,

	[304] = function() ------------------------------ END OF TALKING -------------------------------------
		if songName == 'rehearsal' then
			setProperty(camY, 450);
			setProperty(camX, 590);

			runTimer('resetUI', 3,1);
			runTimer('chloespeaks', 3,1);
		end
	end,

	[473] = function() ------------------------------ GANGSTA ---------------------------------------------
		if songName == 'rehearsal' then
			playSound('REHEARSAL/fuckYou', 1, 'ending')
		end

	end,

	[472] = function() ------------------------------ GANGSTA ---------------------------------------------
		if songName == 'rehearsal' then
			fuckyou()
			letterBox()
		end

	end,


}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'playListen' then
		
		playAnim('chloeListen', 'listen',true)
	
	end
	if tag == 'endListen' then
		setProperty('boyfriend.alpha', 1)
		setProperty('chloeListen.visible', false)

	end

	if tag == 'chloeText' then
		setTextString('talk2', 'Uhh..okay I got it. I think I’m ready... Wait, where’s YOUR protection??')
		objectPlayAnimation('textbg', 'chloe',true);

		 --72 is the curStep
	end

	if tag == 'jasmineText' then
		setTextString('talk2', 'Girl I grew up in the ghetto parts of Brooklyn, these gunshots are practically lullabies to me.')
		objectPlayAnimation('textbg', 'jasmine',true);
	end

	if tag == 'chloeText2' then

		if misses > 6 then
			setTextString('talk2', 'Yes! Yes! I can! I was just dozing off there, heh... get it together chloe...')
		elseif misses > 3 then
			setTextString('talk2', 'What the freak? How did you know? I gotta do better, let’s do this.')
		elseif misses > 1 then
			setTextString('talk2', 'Oof, I’m getting there. C’mon, let’s do this.')
		else
			setTextString('talk2', 'Yeaah! This feels pretty cool! C’mon, let’s do this.')
		end

		objectPlayAnimation('textbg', 'chloe',true);

	end

	
	if tag == 'chloespeaks' then

		letterBoxOutJasmineEnds();
	end
	------------------------------------------ TALKING HAPPENS HERE -----------------------------------------------------

	if tag == 'resetUI' then
		doTweenAlpha('textboxAppear', 'textbg', 0, 1.5, 'backIn')
		doTweenAlpha('textAppear', 'talk2', 0, 1, 'backIn')
	end
	

	if tag == 'panDown' then
		setProperty(camY, 600);
		setProperty(camX, 550);
		setProperty('cameraSpeed', 0.2)
		setProperty('defaultCamZoom',1)
		

		runTimer('gameStart', 3,1);

	end
	------------------------------------------ ENDING WHEN SHE POPS OFF -----------------------------------------------------
	if tag == 'resetNshake' then
		doTweenAngle('backToNormal', 'camGame', '0', 4, 'smootherStepInOut')
		doTweenZoom('begin', 'camGame', '0.6', 4, 'smootherStepInOut')
		cameraShake('camGame', 0.003, 3)

		setProperty(camX, 430);
		setProperty(camY, 570);
		followchars = false
	end

end

function onPause()
	pauseSound('ending')
	return Function_Continue;
end

function onResume()
	resumeSound('ending')
end
