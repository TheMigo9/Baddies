local gunlevel = true
local healthlevel = false
local doTools = false
function onCreate()

end

function onStartCountdown()
	toolTipsShart()
end

function toolTipsShart()
	if doTools then
		makeLuaSprite('tipbg', 'hudShit/toolTipBG', 40, 30);
		addLuaSprite('tipbg', true);
		setObjectCamera('tipbg', 'camHUD')
		scaleObject('tipbg', '1','0.6');

		makeLuaText('tooltipText', '', '0', getProperty('tipbg.x') + 30, getProperty('tipbg.y') + 40) -- 495, 510
		setTextFont('tooltipText', 'GothicJoker.ttf')
		setTextAlignment('tooltipText', 'left')
		setObjectCamera('tooltipText', 'camHUD')
		setTextWidth('tooltipText', getProperty('tipbg.width') - 80)
		setTextSize('tooltipText','26')
		setTextString('tooltipText', 'testing shit, adding words to see if things fit nicely in here i dunno lol')
		addLuaText('tooltipText')

		makeLuaSprite('tipbg2', 'hudShit/toolTipBG2', 40, getProperty('tipbg.height') + 50);
		addLuaSprite('tipbg2', true);
		setObjectCamera('tipbg2', 'camHUD')
		scaleObject('tipbg2', '1.1','1');

		if gunlevel then
			makeLuaSprite('gunIcon', 'hudShit/GUN', getProperty('tipbg2.x') + 20, getProperty('tipbg2.y') + 15);
			addLuaSprite('gunIcon', true);
			setObjectCamera('gunIcon', 'camHUD')
			scaleObject('gunIcon', '1','1');
		elseif healthlevel then
			makeLuaSprite('healthIcon', 'hudShit/HEART', getProperty('tipbg2.x') + 20, getProperty('tipbg2.y') + 10);
			addLuaSprite('healthIcon', true);
			setObjectCamera('healthIcon', 'camHUD')
			scaleObject('healthIcon', '1','1');
		end

		if gunlevel then
			makeLuaText('stageLevelText', 'GUN LEVEL - moderate damage', getProperty('tipbg2.width') - 150, getProperty('gunIcon.width') + 80, getProperty('gunIcon.y') - 5) -- 495, 510
			setTextFont('stageLevelText', 'GothicJoker.ttf')
			setTextAlignment('stageLevelText', 'left')
			setObjectCamera('stageLevelText', 'camHUD')
			setTextSize('stageLevelText','34')
			addLuaText('stageLevelText')
		elseif healthlevel then
			makeLuaText('stageLevelText', 'HEALTH LEVEL - moderate drain', getProperty('tipbg2.width') - 150, getProperty('healthIcon.width') + 80, getProperty('healthIcon.y') - 5)
			setTextFont('stageLevelText', 'GothicJoker.ttf')
			setTextAlignment('stageLevelText', 'left')
			setObjectCamera('stageLevelText', 'camHUD')
			setTextSize('stageLevelText','34')
			addLuaText('stageLevelText')
		end

		makeLuaText('tooltipText', '', '0', getProperty('tipbg.x') + 30, getProperty('tipbg.y') + 40) -- 495, 510
		setTextFont('tooltipText', 'GothicJoker.ttf')
		setTextAlignment('tooltipText', 'left')
		setObjectCamera('tooltipText', 'camHUD')
		setTextWidth('tooltipText', getProperty('tipbg.width') - 80)
		setTextSize('tooltipText','26')
		setTextString('tooltipText', 'testing shit, adding words to see if things fit nicely in here i dunno lol')
		addLuaText('tooltipText')

		runTimer('fadeOut',1.2, 3)
		runTimer('fadeAll',6, 1)
	end
end

function onTweenCompleted(tag, loops, loopsLeft)


	if tag == 'fadeIconOut' then
		if gunlevel and not healthlevel then
			doTweenAlpha('fadeIconIn', 'gunIcon' , 1, 0.5, 'smootherStepOut');
		elseif healthlevel and not gunlevel then
			doTweenAlpha('fadeIconIn', 'healthIcon' , 1, 0.5, 'smootherStepOut');
		else
		end
	end

	if tag == 'tool1' then
		removeLuaSprite('tipbg', true)
		removeLuaSprite('tipbg2', true)
		removeLuaSprite('tooltipText', true)
		removeLuaSprite('stageLevelText', true)
		removeLuaSprite('healthIcon', true)
		removeLuaSprite('gunIcon', true)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'fadeOut' then
		debugPrint('it should fade')
		if gunlevel and not healthlevel then
			doTweenAlpha('fadeIconOut', 'gunIcon' , 0, 0.5, 'smootherStepOut');
		elseif healthlevel and not gunlevel then
			doTweenAlpha('fadeIconOut', 'healthIcon' , 0, 0.5, 'smootherStepOut');
		else
		end
	end

	if tag == 'fadeAll' then
		debugPrint('tooltips should disappear now')

		doTweenAlpha('tool1', 'tipbg' , 0, 1, 'smootherStepOut');
		doTweenAlpha('tool2', 'tooltipText' , 0, 1, 'smootherStepOut');
		doTweenAlpha('tool3', 'tipbg2' , 0, 1, 'smootherStepOut');
		doTweenAlpha('tool4', 'stageLevelText' , 0, 1, 'smootherStepOut');
		doTweenAlpha('tool5', 'healthIcon' , 0, 0.5, 'smootherStepOut');
		doTweenAlpha('tool6', 'gunIcon' , 0, 0.5, 'smootherStepOut');
		
		if gunlevel and not healthlevel then
			doTweenAlpha('fadeIconOut', 'gunIcon' , 0, 1, 'smootherStepOut');
		elseif healthlevel and not gunlevel  then
			doTweenAlpha('fadeIconOut', 'healthIcon' , 0, 1, 'smootherStepOut');
		else
		end
	end

end

function onUpdate(elapsed)
end

