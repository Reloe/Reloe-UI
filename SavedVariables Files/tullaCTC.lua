
tullaCTCDB = {
["profileKeys"] = {
["Relod - Blackhand"] = "Reloe",
["Relodh - Blackhand"] = "Reloe",
["Relovoker - Blackhand"] = "Reloe",
["Relod - Xal'atath's Endgame"] = "Default",
["Relowindi - Xal'atath's Endgame"] = "Reloe",
["Relow - Blackhand"] = "Reloe",
["Relodr - Illidan"] = "Reloe",
["Reloe - Blackhand"] = "Reloe",
["Relodr - Xal'atath's Endgame"] = "Reloe",
["Reloh - Blackhand"] = "Reloe",
["Reloe - Illidan"] = "Reloe",
["Relowindi - Lor'themar"] = "Reloe",
["Relokun - Lor'themar"] = "Default",
["Relowindi - Blackhand"] = "Reloe",
["Roleol - Lor'themar"] = "Reloe",
["Relohorde - Xal'atath's Endgame"] = "Reloe",
["Reloenh - Illidan"] = "Default",
["Relotest - Lor'themar"] = "Default",
["Reloend - Lor'themar"] = "Default",
["Relop - Blackhand"] = "Reloe",
},
["profiles"] = {
["Default"] = {
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
["themes"] = {
["default"] = {
["font"] = "Expressway",
["fontFlags"] = "THICKOUTLINE",
},
},
},
["Reloe"] = {
["rules"] = {
["action"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["grid2"] = {
["theme"] = "custom_Grid2",
["enabled"] = true,
},
["blizzard_extrabar"] = {
["enabled"] = true,
},
["blizzard_container"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["action_charge"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["everything"] = {
["enabled"] = true,
["theme"] = "custom_ArcUI",
},
["blizzard_nameplates"] = {
["theme"] = "custom_Plater",
["enabled"] = true,
},
["blizzard_cdm_utility"] = {
["theme"] = "custom_ActionBars",
["enabled"] = false,
},
["action_loc"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["blizzard_stancebar"] = {
["theme"] = "custom_ActionBars",
["enabled"] = true,
},
["blizzard_cdm_buff_icons"] = {
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
},
["themes"] = {
["custom_Plater"] = {
["fontSize"] = 20,
["abbrevThreshold"] = 60,
["themeCooldown"] = true,
["base"] = "custom_ActionBars",
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
["abbrevThreshold"] = 60,
["themeCooldown"] = true,
["defaultTextColor"] = "FFFFFFFF",
["drawBling"] = "never",
["font"] = "Expressway",
["textColors"] = {
{
["color"] = "FF0000FF",
},
},
["shadowColor"] = "000000FF",
["minDuration"] = 1,
},
["custom_Recharge"] = {
["fontSize"] = 20,
["abbrevThreshold"] = 60,
["base"] = "custom_ActionBars",
["swipeColor"] = "00000099",
["displayName"] = "Recharge",
["font"] = "Expressway",
["shadowColor"] = "000000FF",
["drawText"] = "always",
},
["custom_ActionBars"] = {
["fontSize"] = 22,
["abbrevThreshold"] = 60,
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
},
["custom_ArcUI"] = {
["themeText"] = false,
["themeCooldown"] = true,
["base"] = "custom_Disabled",
["enabled"] = false,
["defaultTextColor"] = "FFFF40FF",
["displayName"] = "ArcUI",
["drawText"] = "never",
},
["custom_Grid2"] = {
["fontSize"] = 18,
["abbrevThreshold"] = 60,
["themeCooldown"] = true,
["base"] = "custom_ActionBars",
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
},
},
},
}
