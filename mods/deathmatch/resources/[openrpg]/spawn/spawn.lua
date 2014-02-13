function joinHandler() 
	spawnPlayer(source, 1485, -1738, 13) 
	fadeCamera(source, true) 
	setCameraTarget(source, source) 
	outputChatBox("Witaj na serwerze RPG!", source) 
end 
addEventHandler("onPlayerJoin", getRootElement(), joinHandler) 