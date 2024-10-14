-- local doDialogue = false
-- local allowCountdown = false
-- function onStartCountdown()

-- 	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
-- 		startVideo('encounterIntro');
-- 		allowCountdown = true;
-- 		doDialogue = true;
-- 		return Function_Stop;

-- 	elseif doDialogue and not censored then

-- 		setProperty('inCutscene', true);
-- 		startDialogue('encounterShit', 'encounterDia') 
-- 		--runTimer('startDialogue', 0.8);
-- 		doDialogue = false
-- 		return Function_Stop
	
-- 	elseif doDialogue and censored then

-- 		setProperty('inCutscene', true);
-- 		startDialogue('encounterCensored', 'encounterDia') 
-- 		--runTimer('startDialogueCensor', 0.8);
-- 		doDialogue = false
-- 		return Function_Stop
-- 	end
-- 	return Function_Continue
-- end

-- function onTimerCompleted(tag, loops, loopsLeft)
-- 	if tag == 'startDialogue' then 
-- 		startDialogue('encounterShit', 'encounterDia') 
-- 	end

-- 	if tag == 'startDialogueCensor' then 
-- 		startDialogue('encounterCensored', 'encounterDia') 
-- 	end
-- end
