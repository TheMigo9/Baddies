local allowCountdown = false
local showResults = false
local missionCompleteScreen = true


function onUpdate(elapsed)

	setTextString('scoreShit', getProperty("songScore"))
	setTextString('ranktexts', getProperty("ratingName"))

	if score > 24000 then
		setTextString('lastWords', '"Now that’s what I’m talking about!"') -- A
	elseif score > 14400 and score < 24000 then
		setTextString('lastWords', '"Hey! That’s not bad at all, you’re pretty good at this!"') -- B
	elseif score > 9600 and score < 14400 then
		setTextString('lastWords', '"You could’ve done a bit better but you got it done at least."') -- C
	elseif score > 4800 and score < 9600 then
		setTextString('lastWords', '"Okay, this is kinda embarrassing to witness..."') -- D
	elseif score < 4800 then
		setTextString('lastWords', '"How did you manage to fuck up that bad??"')-- E
	end 
    
end

function onCustomSubstateUpdate(name)
	key_pressed = keyJustPressed('accept')



	setTextString('scoreShit', getProperty("songScore"))
	setTextString('ranktexts', getProperty("ratingName"))

	if score > 24000 then
		setTextString('lastWords', '"Now that’s what I’m talking about!"') -- A
	elseif score > 14400 and score < 24000 then
		setTextString('lastWords', '"Hey! That’s not bad at all, you’re pretty good at this!"') -- B
	elseif score > 9600 and score < 14400 then
		setTextString('lastWords', '"You could’ve done a bit better but you got it done at least."') -- C
	elseif score > 4800 and score < 9600 then
		setTextString('lastWords', '"Okay, this is kinda embarrassing to witness..."') -- D
	elseif score < 4800 then
		setTextString('lastWords', '"How did you manage to fuck up that bad??"')-- E
	end 
	
	if key_pressed == true then 
		
		--closeCustomSubstate()
		endSong()
		soundFadeOut('erm',1, 0)
		debugPrint('CLOSE IT DAMN IT')
		
	end
	
end

function onEndSong()
	if showResults then
		openCustomSubstate('resultTest', false)
		showResults = false
		return Function_Stop
	end
	return Function_Continue
end

function onCustomSubstateCreate(resultTest)
	playSound('missionComplete', 0, 'erm')
	soundFadeIn('erm',3, 0, 0.8)

		--makeAnimatedLuaSprite('transitionScreen', 'hudShit/transitionBrush', 0, 0); -- PAINT BRUSH
	    --addAnimationByPrefix('transitionScreen', 'idle', 'blank',0,false);
	    --addAnimationByPrefix('transitionScreen', 'brushing', 'brush0',24,false);
	    --objectPlayAnimation('transitionScreen', 'brushing',true);
	    --scaleObject('transitionScreen', '1.7','1.55');
	    --screenCenter('transitionScreen', '');
	    --setProperty('transitionScreen.visible', true)
		--setObjectCamera('transitionScreen', 'other');
		--addLuaSprite('transitionScreen', true);

    makeLuaSprite('endArt', 'gunrange/endScreen/CHLOE BG', 0, 0 );
    setObjectCamera('endArt', 'other');
    screenCenter('endArt', '');
    addLuaSprite('endArt', true);
    scaleObject('endArt', '1','1');

	
   	makeAnimatedLuaSprite('chibi', 'gunrange/endScreen/chloe', -850, 70); -- JASMINE AND CHLOE
    addAnimationByPrefix('chibi', 'idle', 'chloeJas0',24,true);
    addAnimationByPrefix('chibi', 'woo', 'chloeJasWin0',24,true);
    addAnimationByPrefix('chibi', 'aww', 'chloeJasLose0',24,true);
    addLuaSprite('chibi', true);
	--resultTest.instance.add(game.getLuaObject('chibi'));
    setProperty('chibi.visible', true)
    setObjectCamera('chibi', 'other');
    playAnim('chibi', 'idle',false)
    addOffset('chibi','aww', 25, -165)

	runHaxeCode([[
			CustomSubstate.instance.add(game.getLuaObject('luaObj'));
	]])
    missionCompleteTexts()

    setProperty('mission.visible', false)
	setProperty('endArt.visible', false)
	setProperty('line1.visible', false)
	setProperty('line2.visible', false)
	setProperty('title.visible', false)

    makeAnimatedLuaSprite('transitionScreen', 'hudShit/transitionBrush', 0, 0); -- PAINT BRUSH
	addAnimationByPrefix('transitionScreen', 'idle', 'blank',0,false);
	addAnimationByPrefix('transitionScreen', 'brushing', 'brush0',24,false);
	objectPlayAnimation('transitionScreen', 'brushing',true);
	scaleObject('transitionScreen', '1.7','1.55');
	screenCenter('transitionScreen', '');
	setProperty('transitionScreen.visible', true)
	setObjectCamera('transitionScreen', 'other');
	--addLuaSprite('transitionScreen', true);
       
    runTimer('resultsBegin', 3,1);
       

end

function missionCompleteTexts()

    makeLuaSprite('mission', 'gunrange/endScreen/missionComplete', 690, 50 ); 
	setObjectCamera('mission', 'other');
	scaleObject('mission', '1.6','1.6');
	addLuaSprite('mission', true);

	makeLuaSprite('line1', '', 940, 270);
	setScrollFactor('line1', 1, 1);
	addLuaSprite('line1', true);
	scaleObject('line1', '1','1');
	makeGraphic('line1', 620, 5, 'FFFFFF')
	setObjectCamera('line1', 'other')

	makeLuaSprite('line2', '', 940, 370);
	setScrollFactor('line2', 1, 1);
	addLuaSprite('line2', true);
	scaleObject('line2', '1','1');
	makeGraphic('line2', 620, 5, 'FFFFFF')
	setObjectCamera('line2', 'other')

	makeLuaText('title', 'Chloes Rehearsal', '1700', '400', '273')
	setTextFont('title', 'GothicJoker.ttf')
	setTextAlignment('title', 'center')
	setObjectCamera('title', 'other')
	setTextSize('title','90')
	setProperty('title.alpha', 1)
	setTextBorder('title', '0', '')
	addLuaText('title')

    makeLuaText('rank', 'RANK: ', '0', '50', '50')
	setTextFont('rank', 'GothicJoker.ttf')
	setTextAlignment('rank', 'left')
	setObjectCamera('rank', 'other')
	setTextSize('rank','70')
	setProperty('rank.alpha', 1)
	addLuaText('rank')

	makeLuaText('score', 'SCORE: ', '0', '940', '540') 
	setTextFont('score', 'GothicJoker.ttf')
	setTextAlignment('score', 'left')
	setObjectCamera('score', 'other')
	setTextSize('score','70')
	setProperty('score.alpha', 0)
	addLuaText('score')

	makeLuaText('ranktexts', '', '0', '1530', '380')
	setTextFont('ranktexts', 'GothicJoker.ttf')
	setTextAlignment('ranktexts', 'right')
	setObjectCamera('ranktexts', 'other')
	setTextSize('ranktexts','70')
	setProperty('ranktexts.alpha', 0)
	addLuaText('ranktexts')

	makeLuaText('scoreShit', '', '0', '1530', '440')
	setTextFont('scoreShit', 'GothicJoker.ttf')
	setTextAlignment('scoreShit', 'right')
	setObjectCamera('scoreShit', 'other')
	setTextSize('scoreShit','70')
	setProperty('scoreShit.alpha', 0)
	addLuaText('scoreShit')

	makeLuaText('lastWords', '', '700', '900', '550')
	setTextFont('lastWords', 'GothicJoker.ttf')
	setTextAlignment('lastWords', 'center')
	setObjectCamera('lastWords', 'other')
	setTextSize('lastWords','70')
	setProperty('lastWords.alpha', 1)
	addLuaText('lastWords')
	setProperty('lastWords.visible', false)


end


function onTweenCompleted(tag, loops, loopsLeft)

	if tag == 'missionX' then
		doTweenX('movein', 'chibi', 70, 1, 'circOut');
	end

	if tag == 'movein' then
		doTweenY('rankup', 'rankh', 380, 0.5, 'circOut');
		doTweenAlpha('rankA', 'rankh', 1, 0.5, 'backIn')
	end

	if tag == 'rankup' then
		doTweenY('scoreup', 'score', 440, 0.5, 'circOut');
		doTweenAlpha('scoreA', 'score', 1, 0.5, 'backIn')
	end
	
	if tag == 'scoreA' then
		doTweenAlpha('scoreScore', 'scoreShit', 1, 0.5, 'backIn')
		doTweenAlpha('rankName', 'ranktexts', 1, 0.5, 'backIn')
	end

	if tag == 'rankName' then
		doTweenZoom('ohshit', 'other', '1.1', 2, 'circInOut')
		runTimer('shedance', 1,1);
		
	end
	

end


function onTimerCompleted(tag, loops, loopsLeft)

	----------------------------------- MISSION RESULT SHITS ---------------------------------------------------

	if tag == 'resultsBegin' then
		setProperty('mission.visible', true)
		setProperty('endArt.visible', true)
		setProperty('line1.visible', true)
		setProperty('line2.visible', true)
		setProperty('title.visible', true)
		runTimer('resultsStarts', 1,1); -- the brushing starts

	end

	if tag == 'resultsStarts' then
	
		doTweenX('missionX', 'mission.scale', 1, 0.8, 'bounceOut'); -- the mission complete plops down
		doTweenY('missionY', 'mission.scale', 1, 0.8, 'bounceOut');
		
	end

	if tag == 'shedance' then
		cameraFlash('other', 'FFFFFF', 1, false)
		setProperty('lastWords.visible', true)

		if score > 24000 then
			playAnim('chibi', 'woo',true)
		elseif score > 14400 and score < 24000 then
			playAnim('chibi', 'woo',true)
		elseif score > 9600 and score < 14400 then
			playAnim('chibi', 'woo',true)
		elseif score > 4800 and score < 9600 then
			playAnim('chibi', 'aww',true)
		elseif score < 4800 then
			playAnim('chibi', 'aww',true)
			doTweenY('scoreFall2', 'scoreShit', 455, 1, 'linear')
			doTweenAngle('scoreFall', 'scoreShit', 45, 1.5, 'bounceOut')
		end 

		
	end




end

