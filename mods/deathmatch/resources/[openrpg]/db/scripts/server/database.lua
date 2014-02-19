local dbConnection = nil

addEventHandler("onResourceStart", getResourceRootElement (), function ()
	-- NOTE: Here you need to set your database credentials
	dbConnection =  dbConnect ("mysql", "dbname=openrpg_database;host=localhost", "username", "password", "share=0")

	if not dbConnection then
		outputDebugString ("Cannot connect to database.", 1)

		local orpgResourceHandler = getResourceFromName("orpg-resource")
		if orpgResourceHandler then
			stopResource (orpgResourceHandler)
		end
	end
end)

function query(...)
	if not dbConnection then return false end

	local query = dbQuery(dbConnect, ...)

	local resultValue = {result = nil, num_affected_rows = nil, last_insert_id = nil}

	if query then
		local queryResult, affectedRows, lastInsertId = dbPool(query, -1)
		if queryResult then
			resultValue.result = queryResult
			resultValue.num_affected_rows = affectedRows
			resultValue.last_insert_id = lastInsertId
		end
		dbFree(query)		
	end
	return resultValue
end

function execute(...)
	if not dbConnection then return false end
	return dbExecute(dbConnection, ...)
end