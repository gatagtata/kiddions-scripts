menu.add_int_range("Set Level (Correction)", 1, 0, 8000, function()
	local mpIndex = globals.get_int(1574907)
	if mpIndex > 1 or mpIndex < 0 then
		return
	end
	
	local currentRP = 0
	
	if mpIndex == 0 then
		currentRP = stats.get_int("MP0_CHAR_SET_RP_GIFT_ADMIN")
	else
		currentRP = stats.get_int("MP1_CHAR_SET_RP_GIFT_ADMIN")
	end
	
	if currentRP <= 0 then
		currentRP = globals.get_int(1655629 + mpIndex)
	end
 
	local rpLevel = 0
	for i = 0,8000 do
		if currentRP < globals.get_int(294329 + i) then
			break
		else
			rpLevel = i
		end
	end
	
	return rpLevel
end, function(value)
	local mpIndex = globals.get_int(1574907)
	if mpIndex > 1 or mpIndex < 0 then
		return
	end
	
	local newRP = globals.get_int(294329 + value) + 100
	
	if mpIndex == 0 then
		stats.set_int("MP0_CHAR_SET_RP_GIFT_ADMIN", newRP)
	else
		stats.set_int("MP1_CHAR_SET_RP_GIFT_ADMIN", newRP)
	end
end)