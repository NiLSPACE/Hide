--[[
Author
Made by STR_Warrior(NiLSPACE)
]]




function Initialize(a_Plugin)
	a_Plugin:SetName("Hide");
	a_Plugin:SetVersion(1);

	-- Load the InfoReg shared library:
	dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")
	
	--Bind all the commands:
	RegisterPluginInfoCommands();
	
	LOG("Initialized " .. a_Plugin:GetName() .. " v" .. a_Plugin:GetVersion())
	return true;
end





function HandleHideCommand(a_Split, a_Player)
	-- /hide [Other player]
	
	-- The player wants to hide another player
	if (a_Split[2] ~= nil) then
		if (not a_Player:HasPermission("hide.hideother")) then
			a_Player:SendMessage(cChatColor.Rose .. "You are not allowed to hide someone else")
			return true
		end
		
		local TargetPlayer = table.concat(a_Split, " ", 2)
		if (not a_Player:GetWorld():DoWithPlayer(TargetPlayer, SwitchPlayer)) then
			a_Player:SendMessage(cChatColor.Rose .. ("The player %q is not online"):format(TargetPlayer))
		else
			a_Player:SendMessage(cChatColor.LightGreen .. ("Switched player %q visible status"):format(TargetPlayer))
		end
		return true
	end
	
	-- Switch the player's own visible status.
	SwitchPlayer(a_Player)
	
	return true
end





-- Switches a player's visible status
function SwitchPlayer(a_Player)
	if (not a_Player:IsVisible()) then
		a_Player:SetVisible(true)
		a_Player:SendMessage(cChatColor.LightGreen .. "You are now visible")
	else
		a_Player:SetVisible(false)
		a_Player:SendMessage(cChatColor.Rose .. "You are now invisible")
	end
end


