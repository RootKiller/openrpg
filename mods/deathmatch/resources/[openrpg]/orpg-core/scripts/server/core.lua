addEventHandler("onResourceStart", getResourceRootElement(),
	function()
		outputDebugString("Open RPG - Start!")
	end
)

addEventHandler("onPlayerJoin", getRootElement(), function()
	spawnPlayer(source,0,0,3)
	setCameraTarget(source,source)
	fadeCamera(source,true)
end)