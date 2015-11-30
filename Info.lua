
-- Info.lua

-- Implements the g_PluginInfo standard plugin description

g_PluginInfo = 
{
	Name = "Hide",
	Version = "2",
	Date = "2015-11-30",
	SourceLocation = "https://github.com/NiLSPACE/Hide",
	Description = [[This plugin allows admins to hide themselves from their server. The server will stop broadcasting packets, so even hacked clients won't see you.]],
	Commands =
	{
		["/hide"] =
		{
			Permission = "hide.hide",
			Handler = HandleHideCommand,
			HelpString = "Toggles you or someone else's visible status",
			ParameterCombinations =
			{
				{
					Params = "Other player",
					Help = "Toggles someone else's visible status",
				},
				{
					Params = "",
					Help = "Toggles your visible status",
				},
			},
		},
	},
	
	Permissions =
	{
		["hide.hide"] =
		{
			Description = "Toggles your visible status",
			RecommendedGroups = "admins, mods",
		},
		
		["hide.hideother"] =
		{
			Description = "Toggles someone else's visible status",
			RecommendedGroups = "admins",
			CommandsAffected = { "/hide", },
		},
	},
}