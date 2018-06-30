function executeClean()
	doCleanMap()
	doBroadcastMessage("Map cleaned.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("Map Clean within 60 seconds.")
	addEvent(executeClean, 60000)
	return true
end
