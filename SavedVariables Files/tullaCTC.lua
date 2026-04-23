
tullaCTCDB = {
["profileKeys"] = {
["Relod - Blackhand"] = "Reloe",
["Relodh - Blackhand"] = "Reloe",
["Relovoker - Blackhand"] = "Reloe",
["Relod - Xal'atath's Endgame"] = "Default",
["Relowindi - Xal'atath's Endgame"] = "Reloe",
["Relokaz - Kazzak"] = "Default",
["Relow - Blackhand"] = "Reloe",
["Relodr - Xal'atath's Endgame"] = "Reloe",
["Reloboe - Tarren Mill"] = "Default",
["Reloe - Blackhand"] = "Reloe",
["Relop - Blackhand"] = "Reloe",
["Reloh - Blackhand"] = "Reloe",
["Roleol - Lor'themar"] = "Reloe",
["Reloenh - Illidan"] = "Default",
["Relohorde - Xal'atath's Endgame"] = "Reloe",
["Relowindi - Blackhand"] = "Reloe",
["Reloe - Illidan"] = "Reloe",
["Relowindi - Lor'themar"] = "Reloe",
["Relokun - Lor'themar"] = "Default",
["Relotest - Lor'themar"] = "Default",
["Reloend - Lor'themar"] = "Default",
["Relodr - Illidan"] = "Reloe",
},
["profiles"] = {
["Default"] = {
["themes"] = {
["default"] = {
["fontFlags"] = "THICKOUTLINE",
["font"] = "Expressway",
},
},
["rules"] = {
["action_charge"] = {
["enabled"] = false,
},
["blizzard_cdm_buff_icons"] = {
["enabled"] = false,
},
["action"] = {
["enabled"] = false,
},
["blizzard_nameplates"] = {
["enabled"] = false,
},
["blizzard_cdm_utility"] = {
["enabled"] = false,
},
["action_loc"] = {
["enabled"] = false,
},
["blizzard_extrabar"] = {
["enabled"] = false,
},
["blizzard_cdm_essential"] = {
["enabled"] = false,
},
["everything"] = {
["enabled"] = false,
},
},
},
["Reloe"] = {
["themes"] = {
["custom_Grid2"] = {
["fontSize"] = 18,
["abbrevThreshold"] = 61,
["themeCooldown"] = true,
["base"] = "custom_ActionBars",
["roundingMode"] = "Up",
["drawBling"] = "never",
["displayName"] = "Grid2",
["font"] = "Expressway",
["textColors"] = {
{
["threshold"] = 5,
["color"] = "FF0000FF",
},
{
["threshold"] = 60,
["color"] = "FFFF00FF",
},
},
["shadowColor"] = "000000FF",
},
["custom_Plater"] = {
["fontSize"] = 20,
["abbrevThreshold"] = 61,
["themeCooldown"] = true,
["base"] = "custom_ActionBars",
["roundingMode"] = "Up",
["themeSwipeColor"] = true,
["swipeColor"] = "00000099",
["displayName"] = "Plater",
["font"] = "Expressway",
["textColors"] = {
{
["threshold"] = 4.5,
["color"] = "FF0000FF",
},
{
["threshold"] = 60,
["color"] = "FFFF00FF",
},
},
["shadowColor"] = "000000FF",
["drawText"] = "always",
},
["default"] = {
["fontSize"] = 36,
["abbrevThreshold"] = 61,
["themeCooldown"] = true,
["roundingMode"] = "Up",
["drawBling"] = "never",
["font"] = "Expressway",
["textColors"] = {
{
["color"] = "FF0000FF",
},
},
["shadowColor"] = "000000FF",
["defaultTextColor"] = "FFFFFFFF",
},
["omnicc"] = {
["roundingMode"] = "Up",
},
["custom_ActionBars"] = {
["fontSize"] = 22,
["abbrevThreshold"] = 61,
["roundingMode"] = "Down",
["swipeColor"] = "00000099",
["displayName"] = "ActionBars",
["font"] = "Expressway",
["textColors"] = {
{
["threshold"] = 4.5,
["color"] = "FF0000FF",
},
{
["threshold"] = 60,
["color"] = "FFFF00FF",
},
},
["shadowColor"] = "000000FF",
["drawText"] = "always",
["minDuration"] = 2,
},
["custom_ArcUI"] = {
["themeText"] = false,
["themeCooldown"] = true,
["base"] = "custom_Disabled",
["enabled"] = false,
["defaultTextColor"] = "FFFF40FF",
["displayName"] = "ArcUI",
["drawText"] = "never",
["roundingMode"] = "Up",
},
["custom_Recharge"] = {
["fontSize"] = 20,
["abbrevThreshold"] = 61,
["base"] = "custom_ActionBars",
["roundingMode"] = "Up",
["swipeColor"] = "00000099",
["displayName"] = "Recharge",
["font"] = "Expressway",
["shadowColor"] = "000000FF",
["drawText"] = "always",
},
["none"] = {
["roundingMode"] = "Up",
},
},
["rules"] = {
["action_charge"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["blizzard_cdm_buff_icons"] = {
["theme"] = "custom_ActionBars",
["enabled"] = false,
},
["action"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["blizzard_nameplates"] = {
["theme"] = "custom_Plater",
["enabled"] = true,
},
["grid2"] = {
["theme"] = "custom_Grid2",
["enabled"] = true,
},
["action_loc"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["blizzard_extrabar"] = {
["enabled"] = true,
},
["blizzard_stancebar"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["blizzard_container"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["blizzard_cdm_utility"] = {
["theme"] = "custom_ActionBars",
["enabled"] = false,
},
["blizzard_cdm_essential"] = {
["theme"] = "custom_ActionBars",
["enabled"] = false,
},
["arcui"] = {
["theme"] = "custom_ArcUI",
["enabled"] = false,
},
["everything"] = {
["enabled"] = true,
["theme"] = "custom_ArcUI",
},
},
},
},
}
