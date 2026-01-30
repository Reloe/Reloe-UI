
WeakAurasSaved = {
["dynamicIconCache"] = {
},
["editor_tab_spaces"] = 4,
["editor_font_size"] = 16,
["features"] = {
},
["login_squelch_time"] = 10,
["lastArchiveClear"] = 1767652642,
["minimap"] = {
["minimapPos"] = 168.3142289231742,
["hide"] = false,
},
["lastUpgrade"] = 1769651474,
["dbVersion"] = 88,
["migrationCutoff"] = 730,
["registered"] = {
},
["displays"] = {
["Raid Util » Loot Boss Reminder"] = {
["outline"] = "OUTLINE",
["wagoID"] = "_YQvexEpx",
["authorOptions"] = {
},
["displayText_format_p_time_dynamic_threshold"] = 60,
["customText"] = "function()\n    return \"|T5872057:12|t\"\nend\n\n\n\n\n\n\n\n\n\n\n\n",
["yOffset"] = 251,
["anchorPoint"] = "CENTER",
["displayText_format_p_time_format"] = 0,
["customTextUpdate"] = "event",
["automaticWidth"] = "Auto",
["actions"] = {
["start"] = {
["do_glow"] = false,
["glow_action"] = "show",
["sound"] = "Interface\\Addons\\OptionsMedia\\sound\\TTS\\LootBoss.ogg",
["do_sound"] = false,
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["names"] = {
},
["custom"] = "function(allstates, event, _, _, _, _, success)\n    \n    -- Trigger WA on encounter ending & boss killed\n    if event == \"ENCOUNTER_END\" and success == 1 then\n        allstates[\"\"] = {\n            show = true,\n            changed = true,\n            expirationTime = GetTime() + 20,\n            duration = 20,\n            autoHide = true\n        }\n        return true\n        \n        -- Untrigger WA when loot window gets opened or you loot something.    \n    elseif event == \"LOOT_OPENED\" or event == \"CHAT_MSG_MONEY\" then\n        if allstates[\"\"] then\n            allstates[\"\"].changed = true\n            allstates[\"\"].show = false\n            return true\n        end\n    end\nend",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["check"] = "event",
["custom_type"] = "stateupdate",
["events"] = "ENCOUNTER_END, LOOT_OPENED, CHAT_MSG_MONEY",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["displayText_format_p_time_mod_rate"] = true,
["internalVersion"] = 88,
["wordWrap"] = "WordWrap",
["font"] = "Expressway",
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["load"] = {
["ingroup"] = {
["single"] = "raid",
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["difficulty"] = {
},
["role"] = {
},
["use_ingroup"] = true,
["spec"] = {
["multi"] = {
},
},
["instance_type"] = {
["multi"] = {
true,
true,
true,
true,
true,
true,
true,
nil,
true,
nil,
true,
true,
[15] = true,
[205] = true,
[16] = true,
[17] = true,
[167] = true,
[38] = true,
[39] = true,
[40] = true,
[23] = true,
[24] = true,
[33] = true,
[147] = true,
[149] = true,
[14] = true,
[208] = true,
[216] = true,
[220] = true,
[152] = true,
},
},
["use_size"] = false,
["size"] = {
["multi"] = {
["flexible"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["twenty"] = true,
},
},
},
["fontSize"] = 45,
["source"] = "import",
["uid"] = "7nRYCjiRHQy",
["shadowXOffset"] = 0,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "fade",
["duration_type"] = "seconds",
},
["main"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "bounce",
["duration_type"] = "seconds",
},
["finish"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "fade",
["duration_type"] = "seconds",
},
},
["selfPoint"] = "CENTER",
["regionType"] = "text",
["fixedWidth"] = 200,
["displayText_format_p_time_legacy_floor"] = false,
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["displayText_format_p_time_precision"] = 1,
["parent"] = "Raid Util",
["shadowYOffset"] = 0,
["justify"] = "CENTER",
["semver"] = "1.0.10",
["tocversion"] = 110205,
["id"] = "Raid Util » Loot Boss Reminder",
["xOffset"] = 0,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["displayText"] = "%c Loot The Boss %c",
["config"] = {
},
["url"] = "https://wago.io/_YQvexEpx/11",
["displayText_format_p_format"] = "timed",
["shadowColor"] = {
0,
0,
0,
1,
},
["conditions"] = {
},
["information"] = {
["ignoreOptionsEventErrors"] = true,
},
["displayText_format_c_format"] = "none",
},
["DmgBuffs List Midnight"] = {
["grow"] = "RIGHT",
["controlledChildren"] = {
"DmgBuffs Midnight",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = -499,
["preferToUpdate"] = true,
["yOffset"] = 166.00036621094,
["sortHybridTable"] = {
["Speedbuffs Midnight"] = false,
},
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = -1,
["url"] = "",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["unit"] = "player",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["internalVersion"] = 88,
["useLimit"] = true,
["align"] = "CENTER",
["alpha"] = 1,
["regionType"] = "dynamicgroup",
["selfPoint"] = "LEFT",
["stagger"] = 0,
["rotation"] = 0,
["rowSpace"] = 1,
["subRegions"] = {
},
["anchorPoint"] = "CENTER",
["radius"] = 200,
["load"] = {
["size"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
},
["arcLength"] = 360,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["borderInset"] = 1,
["animate"] = false,
["groupIcon"] = 135939,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 5,
["parent"] = "Classes",
["frameStrata"] = 1,
["constantFactor"] = "RADIUS",
["authorOptions"] = {
},
["borderOffset"] = 4,
["config"] = {
},
["tocversion"] = 110205,
["id"] = "DmgBuffs List Midnight",
["sort"] = "none",
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["uid"] = "TBljI7F0nkA",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["fullCircle"] = true,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
},
["gridType"] = "RD",
},
["Raid Util"] = {
["controlledChildren"] = {
"Raid Util » Holding Tradeable Item",
"Raid Util » Loot Boss Reminder",
"Raid Util » Reset Boss For Lust",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "_YQvexEpx",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["url"] = "https://wago.io/_YQvexEpx/11",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["internalVersion"] = 88,
["selfPoint"] = "CENTER",
["version"] = 11,
["subRegions"] = {
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["scale"] = 1,
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "group",
["borderSize"] = 2,
["groupIcon"] = 341221,
["parent"] = "Raid Utils",
["borderOffset"] = 4,
["semver"] = "1.0.10",
["tocversion"] = 110205,
["id"] = "Raid Util",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "JZZKAGMH8gC",
["config"] = {
},
["borderInset"] = 1,
["conditions"] = {
},
["information"] = {
},
["xOffset"] = 0,
},
["Vivacious Vivification"] = {
["iconSource"] = -1,
["parent"] = "Monk Midnight",
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = -342,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "stateupdate",
["customVariables"] = "{\n    expirationTime = true,\n}",
["event"] = "Health",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    if spellID == 121253 then\n        local state = {\n            progressType = \"timed\",\n            duration = 20,\n            expirationTime = GetTime()+20,\n            autoHide = true,\n        }\n        s:Update(\"\", state)\n    elseif spellID == 116670 then\n        s:RemoveAll()\n    end\nend\n\n\n",
["names"] = {
},
["check"] = "event",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
},
["internalVersion"] = 88,
["keepAspectRatio"] = false,
["animation"] = {
["start"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["stickyDuration"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_text_format_tooltip1_format"] = "BigNumber",
["text_color"] = {
1,
1,
0.25098040699959,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 50,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "ceil",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_shadowXOffset"] = 0,
["text_text_format_p_money_format"] = "AbbreviateNumbers",
["text_text_format_p_time_precision"] = 1,
["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",
["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
["anchor_point"] = "CENTER",
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_money_precision"] = 3,
["text_fontType"] = "OUTLINE",
},
{
["type"] = "subborder",
["border_offset"] = 0,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
},
["height"] = 84,
["authorOptions"] = {
},
["load"] = {
["talent2"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[101445] = true,
[124851] = true,
},
},
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MONK",
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
true,
nil,
true,
true,
},
},
["role"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["difficulty"] = {
["multi"] = {
},
},
["ingroup"] = {
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 268,
["multi"] = {
[268] = true,
},
},
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "aura_env.spells = {119582, 1241059, 115203, 115399, 322507} -- Purifying, Fort, Celestial Inf/Brew, BoB\n    \n    ",
["do_custom"] = true,
},
["finish"] = {
},
},
["source"] = "import",
["useTooltip"] = false,
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
{
["check"] = {
["op"] = "<=",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "5",
["op"] = "<=",
},
},
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "4",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.text_color",
},
{
["value"] = 70,
["property"] = "sub.2.text_fontSize",
},
},
},
},
["alpha"] = 1,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["url"] = "",
["config"] = {
},
["desaturate"] = false,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["cooldownTextDisabled"] = true,
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Vivacious Vivification",
["progressSource"] = {
-1,
"",
},
["frameStrata"] = 3,
["width"] = 84,
["color"] = {
1,
1,
1,
1,
},
["uid"] = "hdJ1uC4Z6pz",
["inverse"] = false,
["xOffset"] = -547,
["displayIcon"] = 1360980,
["cooldown"] = true,
["adjustedMax"] = "",
},
["DK"] = {
["controlledChildren"] = {
"Runes",
},
["borderBackdrop"] = "Blizzard Tooltip",
["parent"] = "Classes",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["event"] = "Health",
["names"] = {
},
},
["untrigger"] = {
},
},
},
["internalVersion"] = 88,
["selfPoint"] = "CENTER",
["subRegions"] = {
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["scale"] = 1,
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "group",
["borderSize"] = 2,
["borderOffset"] = 4,
["borderInset"] = 1,
["config"] = {
},
["id"] = "DK",
["authorOptions"] = {
},
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "Fmy)nqpRlhi",
["groupIcon"] = 135770,
["xOffset"] = 0,
["conditions"] = {
},
["information"] = {
},
["frameStrata"] = 1,
},
["Sell Grey Items"] = {
["iconSource"] = 0,
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["do_custom"] = false,
["do_sound"] = false,
},
["finish"] = {
["do_custom"] = false,
},
["init"] = {
["custom"] = "\n\n",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "event",
["duration"] = "1",
["event"] = "Health",
["names"] = {
},
["custom_hide"] = "timed",
["events"] = "MERCHANT_SHOW",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["custom"] = "function (e, ...)\n    if e ~= \"OPTIONS\" then\n        local caSlots,caLink,caQuality;\n        local i=0\n        local j=0\n        repeat\n            if not(C_Container.GetContainerNumSlots(i)==nil)then\n                caSlots=C_Container.GetContainerNumSlots(i);\n                j=1;\n                repeat\n                    caLink=C_Container.GetContainerItemLink(i,j);\n                    if not(caLink==nil)then                        \n                        caQuality= select(3, C_Item.GetItemInfo(caLink));\n                        if(caQuality==0)then\n                            C_Container.UseContainerItem(i,j);\n                        end\n                    end\n                    j=j+1;\n                until(j>=caSlots+1)\n            end\n            i=i+1;\n        until(i>=5)\n    end\nend",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["stickyDuration"] = false,
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_visible"] = false,
},
},
["height"] = 1,
["color"] = {
1,
1,
1,
0,
},
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["icon"] = true,
["source"] = "import",
["xOffset"] = 0,
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["frameStrata"] = 1,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["url"] = "",
["uid"] = "(fYpcYICivH",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["auto"] = false,
["zoom"] = 0.1,
["semver"] = "1.0.0",
["tocversion"] = 110205,
["id"] = "Sell Grey Items",
["animation"] = {
["start"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["useCooldownModRate"] = true,
["width"] = 1,
["parent"] = "Raid Utils",
["config"] = {
},
["inverse"] = false,
["keepAspectRatio"] = false,
["displayIcon"] = 133785,
["cooldown"] = true,
["desaturate"] = false,
},
["Pretense of Instability Midnight"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = -342.00009155273,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["custom"] = "aura_env.spells = {119582, 1241059, 115203, 115399, 322507} -- Purifying, Fort, Celestial Inf/Brew, BoB\n    \n    ",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "stateupdate",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["unit"] = "player",
["subeventSuffix"] = "_CAST_START",
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    if tContains(aura_env.spells, spellID) then\n        local state = {\n            progressType = \"timed\",\n            duration = 5,\n            expirationTime = GetTime()+5,\n            autoHide = true,\n        }\n        s:Update(\"\", state)\n    end\nend",
["spellIds"] = {
},
["names"] = {
},
["check"] = "event",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["subeventPrefix"] = "SPELL",
["customVariables"] = "{\n    expirationTime = true,\n}",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
["text_text_format_p_money_format"] = "AbbreviateNumbers",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_text_format_tooltip1_format"] = "BigNumber",
["text_color"] = {
1,
1,
0.25098040699959,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 50,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "ceil",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_fontType"] = "OUTLINE",
["text_text_format_p_money_precision"] = 3,
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",
["text_text"] = "%p",
["anchor_point"] = "CENTER",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 2,
},
{
["border_offset"] = 0,
["border_size"] = 1,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
},
["height"] = 84,
["progressSource"] = {
-1,
"",
},
["load"] = {
["talent2"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[101445] = true,
[124851] = true,
},
},
["zoneIds"] = "",
["spec"] = {
["single"] = 3,
["multi"] = {
true,
nil,
true,
true,
},
},
["class_and_spec"] = {
["single"] = 268,
["multi"] = {
[268] = true,
},
},
["ingroup"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
["multi"] = {
},
},
["difficulty"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["role"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MONK",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["stickyDuration"] = false,
["source"] = "import",
["xOffset"] = -464.00018310547,
["cooldown"] = true,
["displayIcon"] = 516667,
["frameStrata"] = 3,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["url"] = "",
["uid"] = "La)8i30w8et",
["authorOptions"] = {
},
["width"] = 84,
["internalVersion"] = 88,
["zoom"] = 0.1,
["cooldownTextDisabled"] = true,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Pretense of Instability Midnight",
["selfPoint"] = "CENTER",
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["icon"] = true,
["config"] = {
},
["inverse"] = false,
["parent"] = "Monk Midnight",
["conditions"] = {
{
["check"] = {
["op"] = "<=",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "5",
},
},
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "4",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.text_color",
},
{
["value"] = 70,
["property"] = "sub.2.text_fontSize",
},
},
},
},
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["Taunts Midnight"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["unit"] = "player",
["custom_type"] = "stateupdate",
["spellIds"] = {
},
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    local spell = aura_env.spells[spellID]\n    if spell then\n        local iconID = spell.iconID or C_Spell.GetSpellInfo(spellID).iconID\n        local state = {\n            progressType = \"timed\",\n            duration = spell.dur,\n            expirationTime = GetTime()+spell.dur,\n            icon = iconID,\n            autoHide = true,\n        }\n        s:Update(spellID, state)\n    end\nend\n\n\n",
["names"] = {
},
["check"] = "event",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["subeventPrefix"] = "SPELL",
["customVariables"] = "{\n    expirationTime = true,\n}",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
},
["internalVersion"] = 88,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_format"] = 0,
["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
["text_text_format_p_money_format"] = "AbbreviateNumbers",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_text_format_tooltip1_format"] = "BigNumber",
["text_color"] = {
1,
1,
0.25098040699959,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 40,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "ceil",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_money_precision"] = 3,
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_time_mod_rate"] = true,
["text_text"] = "%p",
["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",
["text_shadowXOffset"] = 0,
["anchor_point"] = "CENTER",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_format"] = "Number",
["text_shadowColor"] = {
0,
0,
0,
1,
},
},
{
["type"] = "subborder",
["border_size"] = 1,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_offset"] = 0,
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowType"] = "Pixel",
["glowThickness"] = 4,
["glowDuration"] = 1,
["glowXOffset"] = 0,
["type"] = "subglow",
["glowLines"] = 8,
["glowBorder"] = true,
},
},
["height"] = 100,
["animation"] = {
["start"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["load"] = {
["ingroup"] = {
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 268,
["multi"] = {
[268] = true,
},
},
["talent"] = {
["multi"] = {
[101445] = true,
[124851] = true,
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "MONK",
["multi"] = {
},
},
["use_never"] = false,
["talent2"] = {
["multi"] = {
},
},
["use_class"] = true,
["role"] = {
["multi"] = {
},
},
["difficulty"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["race"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
true,
nil,
true,
true,
},
},
["size"] = {
["multi"] = {
},
},
},
["xOffset"] = 0,
["useAdjustededMax"] = false,
["parent"] = "Taunts Midnight List",
["source"] = "import",
["cooldown"] = true,
["displayIcon"] = 136080,
["adjustedMax"] = "",
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "8spHpyyBSLf",
["useTooltip"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["frameStrata"] = 3,
["zoom"] = 0.1,
["cooldownTextDisabled"] = true,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Taunts Midnight",
["url"] = "",
["alpha"] = 1,
["width"] = 100,
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["inverse"] = false,
["stickyDuration"] = false,
["conditions"] = {
{
["check"] = {
["op"] = "<=",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "5",
["op"] = "<=",
},
},
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "4",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.text_color",
},
{
["value"] = 60,
["property"] = "sub.2.text_fontSize",
},
},
},
},
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["custom"] = "aura_env.spells = {\n    [115546] = {dur = 6}, -- Provoke\n    [56222] = {dur = 6}, -- Dark Command\n}",
["do_custom"] = true,
},
},
},
["Classes"] = {
["backdropColor"] = {
1,
1,
1,
0.5,
},
["controlledChildren"] = {
"DK",
"Monk Midnight",
"Taunts Midnight List",
"Defensives List Midnight",
"SpeedBuffs List Midnight",
"DmgBuffs List Midnight",
},
["borderBackdrop"] = "Blizzard Tooltip",
["scale"] = 1,
["groupIcon"] = "135724",
["border"] = false,
["borderEdge"] = "Square Full White",
["anchorPoint"] = "CENTER",
["borderSize"] = 2,
["authorOptions"] = {
},
["borderColor"] = {
0,
0,
0,
1,
},
["config"] = {
},
["yOffset"] = 0,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["event"] = "Health",
["names"] = {
},
},
["untrigger"] = {
},
},
},
["regionType"] = "group",
["internalVersion"] = 88,
["xOffset"] = 0,
["selfPoint"] = "CENTER",
["id"] = "Classes",
["borderOffset"] = 4,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["borderInset"] = 1,
["frameStrata"] = 1,
["subRegions"] = {
},
["uid"] = "7r)c8EH)9sn",
["conditions"] = {
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["information"] = {
},
},
["ExternalDefensives"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"ExternalDefensive Icon",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 432.00036621094,
["preferToUpdate"] = false,
["groupIcon"] = 135966,
["sortHybridTable"] = {
["ExternalDefensive Icon"] = false,
},
["fullCircle"] = true,
["space"] = 2,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["internalVersion"] = 88,
["selfPoint"] = "BOTTOM",
["align"] = "CENTER",
["gridWidth"] = 5,
["rotation"] = 0,
["stagger"] = 0,
["useLimit"] = false,
["subRegions"] = {
},
["radius"] = 200,
["yOffset"] = 145.99993896484,
["load"] = {
["size"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["grow"] = "UP",
["animate"] = false,
["anchorPoint"] = "CENTER",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 5,
["uid"] = "nNlYP1tIoda",
["regionType"] = "dynamicgroup",
["constantFactor"] = "RADIUS",
["rowSpace"] = 1,
["borderOffset"] = 4,
["frameStrata"] = 1,
["tocversion"] = 120001,
["id"] = "ExternalDefensives",
["config"] = {
},
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["sort"] = "none",
["borderInset"] = 1,
["authorOptions"] = {
},
["gridType"] = "RD",
["conditions"] = {
},
["information"] = {
},
["borderColor"] = {
0,
0,
0,
1,
},
},
["Raid Util » Holding Tradeable Item"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"Raid Util » Tradeable Item Icons",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "_YQvexEpx",
["parent"] = "Raid Util",
["preferToUpdate"] = false,
["groupIcon"] = 133649,
["anchorPoint"] = "CENTER",
["fullCircle"] = true,
["space"] = 13,
["url"] = "https://wago.io/_YQvexEpx/11",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["internalVersion"] = 88,
["alpha"] = 1,
["useLimit"] = true,
["align"] = "CENTER",
["regionType"] = "dynamicgroup",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["grow"] = "DOWN",
["stagger"] = 0,
["yOffset"] = -507.00024414063,
["version"] = 11,
["subRegions"] = {
},
["xOffset"] = -650,
["borderColor"] = {
0,
0,
0,
1,
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["gridType"] = "RD",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["uid"] = "bX)sPI(rPbM",
["animate"] = false,
["borderInset"] = 1,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["radius"] = 200,
["frameStrata"] = 1,
["constantFactor"] = "RADIUS",
["rowSpace"] = 1,
["borderOffset"] = 4,
["semver"] = "1.0.10",
["tocversion"] = 110205,
["id"] = "Raid Util » Holding Tradeable Item",
["limit"] = 5,
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["config"] = {
},
["rotation"] = 0,
["sortHybridTable"] = {
["Raid Util » Tradeable Item Icons"] = false,
},
["conditions"] = {
},
["information"] = {
},
["selfPoint"] = "TOP",
},
["Rune 2"] = {
["sparkWidth"] = 10,
["sparkOffsetX"] = 0,
["wagoID"] = "3zWD5RhVG",
["parent"] = "Runes",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["zoom"] = 0,
["iconSource"] = -1,
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["url"] = "",
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["triggers"] = {
{
["trigger"] = {
["use_rune"] = true,
["type"] = "unit",
["use_absorbHealMode"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["event"] = "Death Knight Rune",
["spellIds"] = {
},
["names"] = {
},
["rune"] = 2,
["use_absorbMode"] = true,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["icon_color"] = {
1,
1,
1,
1,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["xOffset"] = 0,
["preferToUpdate"] = false,
["barColor"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["desaturate"] = false,
["authorOptions"] = {
},
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["version"] = 4,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 21,
["text_text_format_1.precentpower_format"] = "none",
["text_text_format_p_round_type"] = "floor",
["text_text_format_n_format"] = "none",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = 0,
["text_text_format_1.percentpower_format"] = "Number",
["text_text_format_1.percentpower_decimal_precision"] = 0,
["text_visible"] = true,
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "INNER_RIGHT",
["text_shadowXOffset"] = 1,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_dynamic_threshold"] = 60,
},
{
["type"] = "subborder",
["border_offset"] = 0,
["border_visible"] = true,
["border_color"] = {
0,
0,
0,
1,
},
["anchor_area"] = "bar",
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
},
["gradientOrientation"] = "HORIZONTAL",
["textureSource"] = "LSM",
["load"] = {
["use_zoneIds"] = false,
["spec"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["use_class_and_spec"] = true,
["class_and_spec"] = {
["single"] = 250,
},
["size"] = {
["multi"] = {
},
},
},
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["enableGradient"] = false,
["source"] = "import",
["selfPoint"] = "CENTER",
["id"] = "Rune 2",
["barColor2"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["icon"] = false,
["sparkOffsetY"] = 0,
["icon_side"] = "RIGHT",
["height"] = 42,
["spark"] = false,
["sparkHeight"] = 30,
["texture"] = "Solid",
["config"] = {
},
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["semver"] = "1.0.3",
["tocversion"] = 110207,
["sparkHidden"] = "NEVER",
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["width"] = 57,
["uid"] = "lRFMXfW1)xs",
["inverse"] = true,
["alpha"] = 1,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["information"] = {
},
["sparkColor"] = {
1,
1,
1,
1,
},
},
["Raid Util » Reset Boss For Lust"] = {
["outline"] = "OUTLINE",
["wagoID"] = "_YQvexEpx",
["authorOptions"] = {
},
["displayText_format_p_time_dynamic_threshold"] = 60,
["customText"] = "function()\n    return \"|T136090:12|t\"\nend",
["shadowYOffset"] = 0,
["anchorPoint"] = "CENTER",
["displayText_format_p_time_format"] = 0,
["customTextUpdate"] = "event",
["url"] = "https://wago.io/_YQvexEpx/11",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = false,
["auraspellids"] = {
"80354",
"57723",
"57724",
"264689",
"390435",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["auranames"] = {
"Temporal Displacement",
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["unit"] = "player",
["useExactSpellId"] = true,
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auraspellids"] = {
"444257",
"390386",
"381301",
"32182",
"264667",
"2825",
"80353",
"466904",
},
["debuffType"] = "HELPFUL",
["matchesShowOn"] = "showOnMissing",
["useExactSpellId"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["use_absorbHealMode"] = true,
["use_absorbMode"] = true,
["event"] = "Conditions",
["unit"] = "player",
["use_unit"] = true,
["use_alive"] = true,
["use_incombat"] = false,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["displayText_format_p_time_mod_rate"] = true,
["displayText_format_p_time_legacy_floor"] = false,
["selfPoint"] = "BOTTOM",
["displayText_format_c2_format"] = "none",
["font"] = "Expressway",
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["load"] = {
["ingroup"] = {
["single"] = "raid",
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_encounter"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["difficulty"] = {
},
["use_ingroup"] = true,
["instance_type"] = {
["multi"] = {
true,
true,
true,
true,
true,
true,
true,
nil,
true,
nil,
true,
true,
[15] = true,
[205] = true,
[16] = true,
[17] = true,
[167] = true,
[38] = true,
[39] = true,
[40] = true,
[23] = true,
[24] = true,
[33] = true,
[147] = true,
[149] = true,
[14] = true,
[208] = true,
[216] = true,
[220] = true,
[152] = true,
},
},
["use_never"] = false,
["role"] = {
},
["use_combat"] = false,
["use_size"] = false,
["size"] = {
["multi"] = {
["flexible"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["twenty"] = true,
},
},
},
["internalVersion"] = 88,
["fontSize"] = 20,
["automaticWidth"] = "Auto",
["xOffset"] = 0,
["shadowXOffset"] = 0,
["conditions"] = {
},
["displayText"] = "%c Reset Boss %c",
["useTooltip"] = false,
["regionType"] = "text",
["wordWrap"] = "WordWrap",
["uid"] = "jc7xEhQS3PF",
["displayText_format_c1_format"] = "none",
["displayText_format_c3_format"] = "none",
["displayText_format_p_time_precision"] = 1,
["parent"] = "Raid Util",
["yOffset"] = 205,
["semver"] = "1.0.10",
["justify"] = "CENTER",
["tocversion"] = 110205,
["id"] = "Raid Util » Reset Boss For Lust",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["displayText_format_c_format"] = "none",
["config"] = {
},
["preferToUpdate"] = false,
["displayText_format_p_format"] = "timed",
["shadowColor"] = {
0,
0,
0,
1,
},
["fixedWidth"] = 200,
["information"] = {
},
["color"] = {
1,
1,
1,
1,
},
},
["SpeedBuffs List Midnight"] = {
["grow"] = "RIGHT",
["controlledChildren"] = {
"Speedbuffs Midnight",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = -503,
["preferToUpdate"] = true,
["yOffset"] = 54,
["sortHybridTable"] = {
["Speedbuffs Midnight"] = false,
},
["fullCircle"] = true,
["rowSpace"] = 1,
["url"] = "",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["unit"] = "player",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["radius"] = 200,
["selfPoint"] = "LEFT",
["align"] = "CENTER",
["frameStrata"] = 1,
["stepAngle"] = 15,
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["rotation"] = 0,
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = -1,
["subRegions"] = {
},
["groupIcon"] = 132307,
["internalVersion"] = 88,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["parent"] = "Classes",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["uid"] = "1RWcI04XhUB",
["source"] = "import",
["anchorPoint"] = "CENTER",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["arcLength"] = 360,
["gridWidth"] = 5,
["constantFactor"] = "RADIUS",
["authorOptions"] = {
},
["borderOffset"] = 4,
["config"] = {
},
["tocversion"] = 110205,
["id"] = "SpeedBuffs List Midnight",
["sort"] = "none",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["animate"] = false,
["borderInset"] = 1,
["gridType"] = "RD",
["stagger"] = 0,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
},
["useLimit"] = true,
},
["Rune 1"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["wagoID"] = "3zWD5RhVG",
["parent"] = "Runes",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["sparkOffsetX"] = 0,
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["url"] = "",
["icon"] = false,
["triggers"] = {
{
["trigger"] = {
["use_rune"] = true,
["type"] = "unit",
["use_absorbHealMode"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["use_absorbMode"] = true,
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Death Knight Rune",
["spellIds"] = {
},
["use_unit"] = true,
["rune"] = 1,
["use_genericShowOn"] = true,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["authorOptions"] = {
},
["preferToUpdate"] = false,
["barColor"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["desaturate"] = false,
["xOffset"] = 0,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["version"] = 4,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 21,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "floor",
["text_text_format_1.percentpower_decimal_precision"] = 0,
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = 0,
["text_text_format_1.percentpower_format"] = "Number",
["text_visible"] = true,
["text_text_format_1.precentpower_format"] = "none",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 1,
["anchor_point"] = "INNER_RIGHT",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_n_format"] = "none",
},
{
["border_offset"] = 0,
["border_size"] = 1,
["border_visible"] = true,
["border_color"] = {
0,
0,
0,
1,
},
["anchor_area"] = "bar",
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
},
["height"] = 42,
["textureSource"] = "LSM",
["load"] = {
["class_and_spec"] = {
["single"] = 250,
},
["use_never"] = false,
["use_zoneIds"] = false,
["talent"] = {
["multi"] = {
},
},
["use_class_and_spec"] = true,
["class"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["internalVersion"] = 88,
["source"] = "import",
["selfPoint"] = "CENTER",
["sparkHidden"] = "NEVER",
["information"] = {
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["sparkOffsetY"] = 0,
["icon_side"] = "RIGHT",
["gradientOrientation"] = "HORIZONTAL",
["semver"] = "1.0.3",
["sparkHeight"] = 30,
["texture"] = "Solid",
["config"] = {
},
["zoom"] = 0,
["spark"] = false,
["tocversion"] = 110207,
["id"] = "Rune 1",
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["width"] = 57,
["uid"] = "(GfYcIhnARL",
["inverse"] = true,
["alpha"] = 1,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["barColor2"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["sparkColor"] = {
1,
1,
1,
1,
},
},
["Rune 6"] = {
["sparkWidth"] = 10,
["sparkOffsetX"] = 0,
["wagoID"] = "3zWD5RhVG",
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["iconSource"] = -1,
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["url"] = "",
["icon"] = false,
["triggers"] = {
{
["trigger"] = {
["use_rune"] = true,
["type"] = "unit",
["use_absorbHealMode"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["event"] = "Death Knight Rune",
["spellIds"] = {
},
["names"] = {
},
["rune"] = 6,
["use_absorbMode"] = true,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["barColor"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["desaturate"] = false,
["parent"] = "Runes",
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["sparkOffsetY"] = 0,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 21,
["text_text_format_1.precentpower_format"] = "none",
["text_text_format_p_round_type"] = "floor",
["text_text_format_1.percentpower_decimal_precision"] = 0,
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = 0,
["text_text_format_1.percentpower_format"] = "Number",
["text_visible"] = true,
["anchorXOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "INNER_RIGHT",
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_n_format"] = "none",
["text_text_format_p_time_dynamic_threshold"] = 60,
},
{
["border_offset"] = 0,
["border_size"] = 1,
["border_visible"] = true,
["border_color"] = {
0,
0,
0,
1,
},
["anchor_area"] = "bar",
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
},
["height"] = 42,
["textureSource"] = "LSM",
["load"] = {
["use_never"] = false,
["class"] = {
["multi"] = {
},
},
["use_zoneIds"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["use_class_and_spec"] = true,
["class_and_spec"] = {
["single"] = 250,
},
["size"] = {
["multi"] = {
},
},
},
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["internalVersion"] = 88,
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["sparkHidden"] = "NEVER",
["barColor2"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["version"] = 4,
["icon_side"] = "RIGHT",
["gradientOrientation"] = "HORIZONTAL",
["spark"] = false,
["anchorFrameParent"] = false,
["texture"] = "Solid",
["sparkColor"] = {
1,
1,
1,
1,
},
["zoom"] = 0,
["semver"] = "1.0.3",
["tocversion"] = 110207,
["id"] = "Rune 6",
["sparkHeight"] = 30,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["width"] = 58,
["uid"] = "dJG0h7O2cQ4",
["inverse"] = true,
["frameStrata"] = 1,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["information"] = {
},
["config"] = {
},
},
["Taunts Midnight List"] = {
["grow"] = "UP",
["controlledChildren"] = {
"Taunts Midnight",
},
["borderBackdrop"] = "Blizzard Tooltip",
["parent"] = "Classes",
["preferToUpdate"] = true,
["groupIcon"] = 136080,
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = -1,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["radius"] = 200,
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["align"] = "CENTER",
["sort"] = "none",
["gridWidth"] = 5,
["stagger"] = 0,
["useLimit"] = false,
["selfPoint"] = "BOTTOM",
["subRegions"] = {
},
["sortHybridTable"] = {
["Taunts Midnight"] = false,
},
["fullCircle"] = true,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["authorOptions"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["yOffset"] = 246,
["animate"] = false,
["borderInset"] = 1,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 5,
["gridType"] = "RD",
["regionType"] = "dynamicgroup",
["constantFactor"] = "RADIUS",
["uid"] = "Cnj8QSk8811",
["borderOffset"] = 4,
["rowSpace"] = 1,
["tocversion"] = 110205,
["id"] = "Taunts Midnight List",
["internalVersion"] = 88,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["arcLength"] = 360,
["config"] = {
},
["xOffset"] = 190,
["alpha"] = 1,
["conditions"] = {
},
["information"] = {
},
["rotation"] = 0,
},
["Raid Util » Tradeable Item Icons"] = {
["outline"] = "OUTLINE",
["iconSource"] = -1,
["wagoID"] = "_YQvexEpx",
["parent"] = "Raid Util » Holding Tradeable Item",
["displayText"] = "%p",
["customText"] = "function()\n    if WeakAuras.IsOptionsOpen() then\n        return ICON_LIST[math.random(1,8)]..\"13|t\"\n    end\nend",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = false,
["progressSource"] = {
-1,
"",
},
["customTextUpdate"] = "event",
["url"] = "https://wago.io/_YQvexEpx/11",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["customVariables"] = "{\n    duration = true,\n    expirationTime = true\n}",
["event"] = "Health",
["unit"] = "player",
["custom_type"] = "stateupdate",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["names"] = {
},
["check"] = "event",
["custom"] = "function(allstates, event)\n    \n    if event == \"BAG_UPDATE_DELAYED\" then\n        local challengeModeActive = C_ChallengeMode.IsChallengeModeActive()\n        \n        local guildCheck = false\n        for unit in WA_IterateGroupMembers() do\n            if unit ~= \"player\" then\n                if UnitIsInMyGuild(unit) then\n                    guildCheck = true\n                end\n            end\n        end\n        \n        if (aura_env.config.guildshow and guildCheck == false) or (aura_env.config.keyhide and challengeModeActive) then return end\n        \n        if (aura_env.config.guildshow and guildCheck == true) or (aura_env.config.keyhide and not challengeModeActive) or not aura_env.config.guildshow or not aura_env.config.keyhide then\n            \n            for bagID = BACKPACK_CONTAINER, NUM_BAG_SLOTS do\n                for slot = 1, C_Container.GetContainerNumSlots(bagID) do\n                    local icon, itemLink, remainingTime = aura_env.getRemainingTime(bagID, slot)\n                    \n                    if itemLink then\n                        \n                        allstates[bagID..slot] = {\n                            show = true,\n                            changed = true,\n                            progressType = \"timed\",\n                            duration = 10, -- 4 hours\n                            expirationTime = GetTime() + remainingTime,\n                            autoHide = true,\n                            name = itemLink,\n                            link = itemLink,\n                            icon = icon\n                        }\n                    else\n                        allstates[bagID..slot] = {\n                            show = false,\n                            changed = true\n                        }\n                    end\n                    \n                end\n            end\n            return true\n        end\n    end\n    \n    -- Setting up preview stuff\n    if event == \"OPTIONS\" then\n        local examples = {\n            [230027] =  300,\n            [228842] = 1000,\n            [230198] = 9000\n        }\n        for itemID, remainingTime in pairs(examples) do\n            local _, itemLink, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)\n            \n            allstates[itemID] = {\n                show = true,\n                changed = true,\n                progressType = \"timed\",\n                duration = 4 * 60 * 60, -- 4 hours\n                expirationTime = GetTime() + remainingTime,\n                autoHide = true,\n                name = itemLink,\n                icon = icon\n            }\n        end\n        return true\n    end\nend",
["events"] = "BAG_UPDATE_DELAYED",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["authorOptions"] = {
{
["type"] = "header",
["text"] = "",
["useName"] = false,
["width"] = 1,
},
{
["type"] = "description",
["text"] = "|cff00feff » Config For Tradeable Item Icons|r",
["fontSize"] = "large",
["width"] = 2,
},
{
["type"] = "toggle",
["key"] = "guildshow",
["default"] = false,
["useDesc"] = false,
["name"] = "Only show if a guild member is in the group",
["width"] = 2,
},
{
["type"] = "toggle",
["key"] = "keyhide",
["default"] = false,
["useDesc"] = false,
["name"] = "Hide during mythic keystone",
["width"] = 2,
},
},
["internalVersion"] = 88,
["keepAspectRatio"] = false,
["wordWrap"] = "WordWrap",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["color"] = {
1,
1,
1,
1,
},
["stickyDuration"] = false,
["automaticWidth"] = "Auto",
["font"] = "Friz Quadrata TT",
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subborder",
["border_offset"] = 1,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowType"] = "Pixel",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0.92941176470588,
0.18823529411765,
0.24313725490196,
1,
},
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glowLength"] = 10,
["glow"] = false,
["glowScale"] = 1,
["glowLines"] = 5,
["glowBorder"] = true,
},
{
["text_text_format_u_pad"] = false,
["text_text_format_destName_pad_max"] = 8,
["text_text_format_destGUID_pad_max"] = 8,
["text_fixedWidth"] = 64,
["text_text_format_c_format"] = "none",
["rotateText"] = "NONE",
["text_text_format_u_format"] = "Unit",
["text_text_format_destName_realm_name"] = "never",
["text_text_format_destGUID_abbreviate_max"] = 8,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_destGUID_realm_name"] = "never",
["text_text_format_unitCaster_pad_max"] = 8,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_unitCaster_pad"] = false,
["text_text_format_sourceGUID_pad_max"] = 8,
["text_text_format_p_format"] = "timed",
["text_text_format_destGUID_pad_mode"] = "left",
["text_text_format_unitCaster_abbreviate_max"] = 9,
["text_text_format_unitName_color"] = "none",
["anchorYOffset"] = 0,
["text_text_format_u_abbreviate_max"] = 8,
["text_text_format_u_pad_max"] = 8,
["text_text_format_unitCaster_color"] = "class",
["text_anchorYOffset"] = 0,
["text_text_format_sourceGUID_realm_name"] = "never",
["text_text_format_destName_abbreviate"] = false,
["text_text_format_u_color"] = "none",
["text_text_format_unit_pad_max"] = 8,
["text_text_format_sourceGUID_format"] = "guid",
["text_text_format_p_time_format"] = 0,
["text_text_format_sourceGUID_abbreviate_max"] = 8,
["text_text_format_sourceGUID_pad_mode"] = "left",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_name_format"] = "none",
["text_text_format_destName_format"] = "none",
["text_text"] = "Holding Tradeable Item\\n%n",
["text_text_format_unitName_format"] = "none",
["text_text_format_unitCaster_format"] = "Unit",
["text_text_format_unitName_abbreviate"] = true,
["text_text_format_u_pad_mode"] = "left",
["text_text_format_unit_realm_name"] = "never",
["text_color"] = {
0.21960785984993,
1,
0,
1,
},
["text_text_format_unitName_abbreviate_max"] = 8,
["text_text_format_unit_abbreviate"] = false,
["text_shadowYOffset"] = 0,
["text_text_format_unit_format"] = "Unit",
["text_text_format_destGUID_pad"] = false,
["text_visible"] = true,
["text_text_format_destName_pad_mode"] = "left",
["text_text_format_unitname_format"] = "none",
["text_text_format_u_realm_name"] = "never",
["text_text_format_unitCaster_abbreviate"] = false,
["anchorXOffset"] = 0,
["text_text_format_destName_color"] = "class",
["text_text_format_n_format"] = "none",
["text_text_format_destName_pad"] = false,
["text_text_format_p_time_precision"] = 1,
["text_text_format_unit_color"] = "none",
["text_shadowXOffset"] = 0,
["text_text_format_destGUID_abbreviate"] = false,
["text_automaticWidth"] = "Auto",
["text_selfPoint"] = "AUTO",
["text_text_format_sourceGUID_pad"] = false,
["text_text_format_destGUID_color"] = "none",
["text_text_format_unit_pad"] = false,
["text_text_format_sourceGUID_color"] = "class",
["text_text_format_raidMark_format"] = "none",
["text_text_format_1.raidMark_format"] = "none",
["text_text_format_unitCaster_realm_name"] = "never",
["text_text_format_unitCaster_pad_mode"] = "left",
["text_text_format_destUnit_format"] = "none",
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_justify"] = "LEFT",
["text_font"] = "Expressway",
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_u_abbreviate"] = false,
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_destGUID_format"] = "guid",
["text_text_format_unit_pad_mode"] = "left",
["text_fontSize"] = 18,
["text_text_format_sourceGUID_abbreviate"] = false,
["anchor_point"] = "OUTER_RIGHT",
["text_text_format_destName_abbreviate_max"] = 8,
["text_text_format_unitName_realm_name"] = "never",
["text_text_format_unit_abbreviate_max"] = 8,
},
},
["height"] = 40,
["actions"] = {
["start"] = {
["custom"] = "\n\n",
["do_custom"] = false,
},
["init"] = {
["custom"] = "-- Setup tooltip scanner\nlocal tooltip_name = \"WA_TooltipScanner_\" .. gsub(aura_env.id,\" \",\"\")\nlocal tip = _G[tooltip_name]\nif not tip then\n    tip = CreateFrame(\"GameTooltip\", tooltip_name, nil, \"GameTooltipTemplate\")\n    tip:SetOwner(WorldFrame, \"ANCHOR_NONE\")\nend\n\nlocal time_formats = {\n    [INT_SPELL_DURATION_HOURS] = 60 * 60,\n    [INT_SPELL_DURATION_MIN] = 60,\n    [INT_SPELL_DURATION_SEC] = 1\n}\n\n-- Setup a table of all relevant localized time strings,\n-- mapping them to their equivalent time in seconds\nlocal time_lookup = {}\nfor pattern, coefficient in pairs(time_formats) do\n    \n    local prefix = \"\"\n    pattern = pattern:gsub(\"%%d(%s?)\", function(s)\n            prefix = \"(%d+)\" .. s\n            return \"\"  \n    end)\n    \n    pattern = pattern:gsub(\"|4\", \"\"):gsub(\"[:;]\", \" \")\n    \n    for s in pattern:gmatch(\"(%S+)\") do\n        time_lookup[prefix..s] = coefficient\n    end\nend\n\nlocal GetContainerItemInfo = GetContainerItemInfo or C_Container.GetContainerItemInfo\n\n-- Parse the tooltip\nlocal needle = \"You may trade this item with players that were also eligible to loot this item for the next\"\n\naura_env.getRemainingTime = function(bagID, slot)\n    \n    local containerItemInfo = {GetContainerItemInfo(bagID, slot)}\n    local icon, quality, itemLink, _\n    if type(containerItemInfo[1]) == \"table\" then\n        local info = containerItemInfo[1]\n        --DevTool:AddData(info, \"info\")\n        icon, quality, itemLink = info.iconFileID, info.quality, info.hyperlink\n    else\n        icon, _, _, quality, _, _, itemLink = unpack(containerItemInfo) \n    end\n    \n    -- Only scan items that are blue or rarer\n    if quality and quality >= 3 then\n        tip:ClearLines()\n        tip:SetBagItem(bagID, slot)\n        \n        -- Start at the bottom of the tooltip because the tradeable text is usually there\n        local text\n        for i = tip:NumLines(), 1, -1 do\n            local left = _G[tooltip_name..\"TextLeft\"..i]\n            \n            if left then\n                text = left:GetText() or \"\"\n                \n                if text:find(needle) then\n                    break\n                else\n                    text = nil\n                end\n            end\n        end\n        \n        -- Extract each unit of time, convert it to seconds, and sum it\n        if text then        \n            local r = 0\n            for pattern, coefficient in pairs(time_lookup) do\n                local n = text:match(pattern)\n                if n then\n                    r = r + n * coefficient\n                end\n            end\n            return icon, itemLink, r\n        end\n    end\nend",
["do_custom"] = true,
},
["finish"] = {
},
},
["load"] = {
["use_size"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["ingroup"] = {
["single"] = "raid",
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_guildcheck"] = false,
["use_encounter"] = false,
["use_combat"] = false,
["instance_type"] = {
},
["size"] = {
["multi"] = {
["flexible"] = true,
["fortyman"] = true,
["ten"] = true,
["twentyfive"] = true,
["twenty"] = true,
["none"] = true,
},
},
},
["information"] = {
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["useAdjustededMax"] = false,
["fontSize"] = 12,
["source"] = "import",
["useTooltip"] = true,
["selfPoint"] = "BOTTOM",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "<=",
["variable"] = "expirationTime",
["value"] = "600",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.3.glow",
},
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.4.text_color",
},
},
},
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["zoom"] = 0.3,
["desaturate"] = false,
["cooldownEdge"] = false,
["uid"] = "U3S6qz68pUz",
["adjustedMax"] = "",
["anchorFrameParent"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["justify"] = "LEFT",
["tocversion"] = 110205,
["id"] = "Raid Util » Tradeable Item Icons",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 40,
["xOffset"] = 0,
["config"] = {
["guildshow"] = true,
["keyhide"] = true,
},
["inverse"] = false,
["semver"] = "1.0.10",
["auto"] = true,
["displayIcon"] = 2967107,
["cooldown"] = true,
["fixedWidth"] = 200,
},
["Repair"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
0,
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "event",
["event"] = "Health",
["names"] = {
},
["custom_hide"] = "timed",
["events"] = "MERCHANT_SHOW",
["custom"] = "function(e, ...)\n    if e ~= \"OPTIONS\" and CanMerchantRepair() then\n        RepairAllItems()\n    end\nend",
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["desaturate"] = false,
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
},
["height"] = 1,
["authorOptions"] = {
},
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["stickyDuration"] = false,
["source"] = "import",
["xOffset"] = 0,
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["alpha"] = 1,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["selfPoint"] = "CENTER",
["uid"] = "NtzSLX0TVL0",
["cooldownEdge"] = false,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0.1,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 110205,
["id"] = "Repair",
["parent"] = "Raid Utils",
["useCooldownModRate"] = true,
["width"] = 1,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["config"] = {
},
["inverse"] = false,
["preferToUpdate"] = false,
["displayIcon"] = 136241,
["cooldown"] = true,
["keepAspectRatio"] = false,
},
["Rune 3"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["wagoID"] = "3zWD5RhVG",
["parent"] = "Runes",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["sparkOffsetX"] = 0,
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["url"] = "",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["use_rune"] = true,
["type"] = "unit",
["use_absorbHealMode"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["event"] = "Death Knight Rune",
["spellIds"] = {
},
["names"] = {
},
["rune"] = 3,
["use_absorbMode"] = true,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["authorOptions"] = {
},
["adjustedMax"] = "",
["barColor"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["desaturate"] = false,
["xOffset"] = 0,
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["version"] = 4,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 21,
["text_text_format_1.precentpower_format"] = "none",
["text_text_format_p_round_type"] = "floor",
["text_text_format_n_format"] = "none",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = 0,
["text_text_format_1.percentpower_format"] = "Number",
["text_text_format_1.percentpower_decimal_precision"] = 0,
["text_visible"] = true,
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "INNER_RIGHT",
["text_shadowXOffset"] = 1,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_dynamic_threshold"] = 60,
},
{
["type"] = "subborder",
["border_offset"] = 0,
["border_visible"] = true,
["border_color"] = {
0,
0,
0,
1,
},
["anchor_area"] = "bar",
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
},
["gradientOrientation"] = "HORIZONTAL",
["textureSource"] = "LSM",
["load"] = {
["use_zoneIds"] = false,
["spec"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["use_class_and_spec"] = true,
["class_and_spec"] = {
["single"] = 250,
},
["size"] = {
["multi"] = {
},
},
},
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["internalVersion"] = 88,
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["id"] = "Rune 3",
["barColor2"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["icon"] = false,
["sparkOffsetY"] = 0,
["icon_side"] = "RIGHT",
["height"] = 42,
["semver"] = "1.0.3",
["sparkHeight"] = 30,
["texture"] = "Solid",
["uid"] = "0Aqk1JTtGSm",
["zoom"] = 0,
["spark"] = false,
["tocversion"] = 110207,
["sparkHidden"] = "NEVER",
["anchorFrameParent"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["width"] = 58,
["config"] = {
},
["inverse"] = true,
["frameStrata"] = 1,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["information"] = {
},
["sparkColor"] = {
1,
1,
1,
1,
},
},
["BreakTimer"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["yOffset"] = 248.00079345703,
["anchorPoint"] = "CENTER",
["displayText_format_p_time_format"] = 0,
["url"] = "https://wago.io/NSRequiredAuras/48",
["actions"] = {
["start"] = {
["custom"] = "WeakAuras.ScanEvents(\"NS_BREAK\")\n    \n    ",
["do_custom"] = true,
},
["init"] = {
["custom"] = "aura_env.icons = NSMedia.BreakMemes\n\n\n\n\n\n",
["do_custom"] = true,
},
["finish"] = {
},
},
["displayText_format_1.p_time_format"] = 0,
["displayText_format_p_time_mod_rate"] = true,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["rotation"] = 0,
["font"] = "Expressway",
["load"] = {
["use_size"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["use_encounter"] = false,
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
["twentyfive"] = true,
["flexible"] = true,
["twenty"] = true,
["none"] = true,
},
},
},
["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
["shadowXOffset"] = 1,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["blendMode"] = "BLEND",
["texture"] = "Interface\\AddOns\\NorthernSkyMedia\\Media\\Memes\\ZarugarPeace.blp",
["cooldownTextDisabled"] = false,
["tocversion"] = 110200,
["alpha"] = 1,
["uid"] = "itAWCJg(IN7",
["displayIcon"] = "Interface\\AddOns\\NorthernSkyRaidTools\\Media\\Memes\\ZarugarPeace.blp",
["outline"] = "OUTLINE",
["wagoID"] = "nozEGOxht",
["color"] = {
1,
1,
1,
1,
},
["customText"] = "function ()\nend",
["shadowYOffset"] = -1,
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["triggers"] = {
{
["trigger"] = {
["use_absorbMode"] = true,
["message_operator"] = "find('%s')",
["subeventPrefix"] = "SPELL",
["text_operator"] = "==",
["debuffType"] = "HELPFUL",
["type"] = "addons",
["use_absorbHealMode"] = true,
["subeventSuffix"] = "_CAST_START",
["text"] = "Break time",
["use_text"] = true,
["message"] = "Break time",
["spellIds"] = {
},
["use_unit"] = true,
["use_message"] = true,
["names"] = {
},
["event"] = "Boss Mod Timer",
["unit"] = "player",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "event",
["unit"] = "player",
["custom"] = "function ()\n    return true\nend",
["customTexture"] = "function ()\n    local icon, height, width = unpack(aura_env.icons[math.random(#aura_env.icons)])\n    return \"|T\"..icon..\":\"..width..\":\"..height..\"|t\"\nend\n\n\n\n\n",
["custom_hide"] = "custom",
["customIcon"] = "function ()\n    return \"\"\nend",
["events"] = "NS_BREAK",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
["custom"] = "function ()\n    return true\nend",
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function (t)\n    return t[1]\nend",
["activeTriggerMode"] = 2,
},
["displayText_format_p_format"] = "timed",
["displayText_format_p_time_legacy_floor"] = false,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["preferToUpdate"] = false,
["discrete_rotation"] = 0,
["information"] = {
["forceEvents"] = true,
},
["version"] = 48,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%texture",
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_texture_format"] = "none",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_format"] = "timed",
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_shadowYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["anchorYOffset"] = 0,
["anchor_point"] = "CENTER",
["text_fontSize"] = 12,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "Break",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontSize"] = 36,
["anchorXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_text_format_1.p_gcd_cast"] = false,
["text_text_format_1.p_gcd_hide_zero"] = false,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_precision"] = 1,
["text_text_format_1.p_gcd_gcd"] = true,
["type"] = "subtext",
["text_text_format_1.p_big_number_format"] = "AbbreviateNumbers",
["text_shadowXOffset"] = 0,
["text_font"] = "Expressway",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_time_dynamic_threshold"] = 60,
["text_automaticWidth"] = "Auto",
["text_text_format_1.p_decimal_precision"] = 1,
["text_text_format_1.p_format"] = "timed",
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "OUTER_TOP",
["text_justify"] = "CENTER",
["text_text_format_p_format"] = "timed",
["text_text_format_1.p_gcd_channel"] = false,
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontSize"] = 72,
["anchorXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_text_format_1.p_gcd_cast"] = false,
["text_text_format_1.p_gcd_hide_zero"] = false,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_precision"] = 1,
["text_text_format_1.p_gcd_gcd"] = true,
["type"] = "subtext",
["text_text_format_1.p_big_number_format"] = "AbbreviateNumbers",
["text_shadowXOffset"] = 0,
["text_font"] = "Expressway",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_time_dynamic_threshold"] = 60,
["text_automaticWidth"] = "Auto",
["text_text_format_1.p_decimal_precision"] = 1,
["text_text_format_1.p_format"] = "timed",
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "OUTER_RIGHT",
["text_justify"] = "CENTER",
["text_text_format_p_format"] = "timed",
["text_text_format_1.p_gcd_channel"] = false,
},
},
["height"] = 256,
["rotate"] = false,
["xOffset"] = -537.00015258789,
["icon"] = true,
["useAdjustededMax"] = false,
["fontSize"] = 16,
["source"] = "import",
["zoom"] = 0,
["lastUpdate"] = {
["when"] = "29/12/2023 03:58",
["who"] = "Relowindi",
},
["displayText_format_1.p_time_mod_rate"] = true,
["mirror"] = false,
["adjustedMin"] = "",
["displayText_format_1.p_format"] = "timed",
["displayText_format_1.p_time_legacy_floor"] = false,
["config"] = {
},
["width"] = 256,
["useCooldownModRate"] = true,
["internalVersion"] = 88,
["displayText_format_p_time_precision"] = 1,
["displayText_format_1.p_time_dynamic_threshold"] = 60,
["wordWrap"] = "WordWrap",
["displayText_format_1.p_time_precision"] = 1,
["justify"] = "LEFT",
["semver"] = "1.0.47",
["id"] = "BreakTimer",
["displayText_format_texture_format"] = "none",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["fixedWidth"] = 200,
["displayText_format_p_time_dynamic_threshold"] = 60,
["inverse"] = false,
["displayText"] = "%texture",
["shadowColor"] = {
0,
0,
0,
1,
},
["conditions"] = {
},
["cooldown"] = false,
["automaticWidth"] = "Auto",
},
["DmgBuffs Midnight"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "stateupdate",
["customVariables"] = "{\n    expirationTime = true,\n}",
["event"] = "Health",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["custom"] = "function(s, e, ...)    \n    if e == \"OPTIONS\" then\n        for k, v in pairs(aura_env.spells) do\n            local iconID = v.iconID or C_Spell.GetSpellInfo(k).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = v.dur,\n                expirationTime = GetTime()+v.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(k, state)\n        end   \n    else        \n        local u, cast, spellID = ... -- Unit event\n        local spell = aura_env.spells[spellID]\n        if spell then\n            local iconID = spell.iconID or C_Spell.GetSpellInfo(spellID).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = spell.dur,\n                expirationTime = GetTime()+spell.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(spellID, state)\n        end\n    end\nend\n\n\n",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["names"] = {
},
["check"] = "event",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%p",
["text_text_format_p_money_format"] = "AbbreviateNumbers",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_text_format_tooltip1_format"] = "BigNumber",
["text_color"] = {
1,
1,
0.25098040699959,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 50,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "ceil",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_anchorYOffset"] = 0,
["text_text_format_p_format"] = "Number",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "CENTER",
["text_text_format_p_money_precision"] = 3,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_fontType"] = "OUTLINE",
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["useGlowColor"] = true,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowScale"] = 1,
["glowThickness"] = 4,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = true,
},
},
["height"] = 100,
["alpha"] = 1,
["load"] = {
["talent2"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[101445] = true,
[124851] = true,
},
},
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MONK",
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
true,
nil,
true,
true,
},
},
["race"] = {
["multi"] = {
},
},
["use_class"] = true,
["role"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["difficulty"] = {
["multi"] = {
},
},
["ingroup"] = {
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 268,
["multi"] = {
[268] = true,
},
},
["zoneIds"] = "",
},
["parent"] = "DmgBuffs List Midnight",
["useAdjustededMax"] = false,
["animation"] = {
["start"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["source"] = "import",
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
{
["check"] = {
["op"] = "<=",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "5",
},
},
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "4",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.text_color",
},
{
["value"] = 70,
["property"] = "sub.2.text_fontSize",
},
},
},
},
["keepAspectRatio"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom_load"] = false,
["do_custom"] = true,
["custom"] = "aura_env.spells = {\n    [10060] = {dur = 15}, -- Power Infusion\n    [29166] = {dur = 8}, -- Innervate\n    [31884] = {dur = 15}, -- Wings\n}",
},
["finish"] = {
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["preferToUpdate"] = true,
["width"] = 100,
["frameStrata"] = 3,
["anchorFrameParent"] = false,
["stickyDuration"] = false,
["cooldownTextDisabled"] = true,
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "DmgBuffs Midnight",
["useTooltip"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["uid"] = "D9kLDROcsJk",
["inverse"] = false,
["xOffset"] = 0,
["displayIcon"] = 135939,
["cooldown"] = true,
["url"] = "",
},
["No Flask"] = {
["iconSource"] = 0,
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = -33.000122070312,
["anchorPoint"] = "TOP",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["namePattern_operator"] = "find('%s')",
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["unit"] = "player",
["names"] = {
},
["useName"] = false,
["spellIds"] = {
},
["auranames"] = {
},
["namePattern_name"] = "Flask",
["useNamePattern"] = true,
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["rem"] = "600",
["subeventSuffix"] = "_CAST_START",
["namePattern_operator"] = "find('%s')",
["auranames"] = {
},
["event"] = "Health",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["remOperator"] = "<=",
["useRem"] = true,
["useName"] = false,
["namePattern_name"] = "Flask",
["useNamePattern"] = true,
["type"] = "aura2",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "\n\n",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = true,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = " ",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
},
["height"] = 66,
["load"] = {
["use_namerealm"] = false,
["use_level"] = true,
["talent"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
["flexible"] = true,
["party"] = true,
},
},
["level_operator"] = {
">=",
"<",
},
["class"] = {
["multi"] = {
},
},
["level"] = {
"90",
},
["difficulty"] = {
["multi"] = {
["mythic"] = true,
},
},
["instance_type"] = {
["multi"] = {
[0] = true,
[15] = true,
[14] = true,
[16] = true,
[23] = true,
},
},
["use_encounter"] = false,
["zoneIds"] = "",
["spec"] = {
["multi"] = {
true,
[4] = true,
},
},
["use_combat"] = false,
["use_never"] = false,
["use_instance_type"] = false,
},
["useAdjustededMax"] = false,
["width"] = 66,
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["keepAspectRatio"] = false,
["xOffset"] = 278,
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["displayIcon"] = 2057570,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["adjustedMax"] = "",
["uid"] = "jU3ZaxcAsmX",
["frameStrata"] = 1,
["zoom"] = 0.1,
["cooldownTextDisabled"] = false,
["auto"] = false,
["tocversion"] = 110207,
["id"] = "No Flask",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "UIPARENT",
["authorOptions"] = {
},
["config"] = {
},
["inverse"] = false,
["parent"] = "Stuff",
["conditions"] = {
},
["cooldown"] = true,
["stickyDuration"] = false,
},
["Rune 5"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["wagoID"] = "3zWD5RhVG",
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["zoom"] = 0,
["sparkOffsetX"] = 0,
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["url"] = "",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["use_rune"] = true,
["type"] = "unit",
["use_absorbHealMode"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["names"] = {
},
["event"] = "Death Knight Rune",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["rune"] = 5,
["use_absorbMode"] = true,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["authorOptions"] = {
},
["preferToUpdate"] = false,
["barColor"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["desaturate"] = false,
["parent"] = "Runes",
["icon"] = false,
["sparkOffsetY"] = 0,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 21,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "floor",
["text_text_format_1.percentpower_decimal_precision"] = 0,
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = 0,
["text_text_format_1.percentpower_format"] = "Number",
["text_visible"] = true,
["text_text_format_1.precentpower_format"] = "none",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 1,
["anchor_point"] = "INNER_RIGHT",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_n_format"] = "none",
},
{
["border_size"] = 1,
["type"] = "subborder",
["border_visible"] = true,
["border_color"] = {
0,
0,
0,
1,
},
["anchor_area"] = "bar",
["border_edge"] = "Square Full White",
["border_offset"] = 0,
},
},
["height"] = 42,
["textureSource"] = "LSM",
["load"] = {
["class_and_spec"] = {
["single"] = 250,
},
["use_zoneIds"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["use_class_and_spec"] = true,
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["internalVersion"] = 88,
["source"] = "import",
["selfPoint"] = "CENTER",
["id"] = "Rune 5",
["information"] = {
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["version"] = 4,
["icon_side"] = "RIGHT",
["gradientOrientation"] = "HORIZONTAL",
["spark"] = false,
["sparkHeight"] = 30,
["texture"] = "Solid",
["sparkColor"] = {
1,
1,
1,
1,
},
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["semver"] = "1.0.3",
["tocversion"] = 110207,
["sparkHidden"] = "NEVER",
["anchorFrameParent"] = false,
["alpha"] = 1,
["width"] = 58,
["anchorFrameType"] = "SCREEN",
["config"] = {
},
["inverse"] = true,
["frameStrata"] = 1,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["barColor2"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["uid"] = "cDSA4fzZOpv",
},
["Lust"] = {
["iconSource"] = -1,
["xOffset"] = -414.99981689453,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 447.50012207031,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "",
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "stateupdate",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["names"] = {
},
["spellIds"] = {
},
["custom"] = "function(s, e, ...)\n    if e == \"UNIT_SPELL_HASTE\" or e ==\"WA_DELAYED_PLAYER_ENTERING_WORLD\" then\n        local now = GetHaste()+100\n        if not aura_env.last then aura_env.last = now return end\n        local lustvalue = aura_env.last*1.3\n        local diff = now-lustvalue\n        if diff > -0.2 and diff < 0.2 then\n            local state = {\n                progressType = \"timed\",\n                duration = 40,\n                expirationTime = GetTime()+40,\n                autoHide = true,\n            }\n            s:Update(\"\", state)\n        end\n        aura_env.last = now\n    end\nend\n\n\n",
["check"] = "event",
["events"] = "UNIT_SPELL_HASTE WA_DELAYED_PLAYER_ENTERING_WORLD",
["subeventSuffix"] = "_CAST_START",
["custom_hide"] = "timed",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%p",
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_format"] = "Number",
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_pad"] = false,
["text_text_format_p_decimal_precision"] = 0,
["type"] = "subtext",
["text_text_format_p_time_precision"] = 1,
["text_color"] = {
1,
1,
0.25098040699959,
1,
},
["text_font"] = "Expressway",
["text_fontType"] = "OUTLINE",
["text_shadowYOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_pad_max"] = 8,
["anchor_point"] = "CENTER",
["text_fontSize"] = 70,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "ceil",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["type"] = "subborder",
["border_size"] = 1,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_offset"] = 0,
},
},
["height"] = 150,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["conditions"] = {
},
["information"] = {
},
["progressSource"] = {
-1,
"",
},
["icon"] = true,
["color"] = {
1,
1,
1,
1,
},
["zoom"] = 0.1,
["cooldownTextDisabled"] = false,
["uid"] = "PScICGSS3EQ",
["frameStrata"] = 1,
["id"] = "Lust",
["width"] = 150,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["inverse"] = false,
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["displayIcon"] = 132313,
["cooldown"] = true,
["authorOptions"] = {
},
},
["Runes"] = {
["grow"] = "RIGHT",
["controlledChildren"] = {
"Rune 1",
"Rune 2",
"Rune 3",
"Rune 4",
"Rune 5",
"Rune 6",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = -370,
["sortHybridTable"] = {
["Rune 1"] = false,
["Rune 6"] = false,
["Rune 3"] = false,
["Rune 5"] = false,
["Rune 2"] = false,
["Rune 4"] = false,
},
["fullCircle"] = true,
["space"] = -1,
["url"] = "",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["names"] = {
},
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["radius"] = 200,
["selfPoint"] = "LEFT",
["align"] = "CENTER",
["gridType"] = "RD",
["internalVersion"] = 88,
["stagger"] = 0,
["borderColor"] = {
0,
0,
0,
1,
},
["rotation"] = 0,
["subRegions"] = {
},
["anchorPoint"] = "CENTER",
["useLimit"] = false,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["parent"] = "DK",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["borderInset"] = 0,
["animate"] = false,
["rowSpace"] = 1,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 1,
["limit"] = 5,
["uid"] = "704PxvTc67F",
["alpha"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["sort"] = "ascending",
["borderOffset"] = 1,
["gridWidth"] = 5,
["tocversion"] = 110207,
["id"] = "Runes",
["regionType"] = "dynamicgroup",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["arcLength"] = 360,
["config"] = {
},
["xOffset"] = -171,
["groupIcon"] = 237529,
["conditions"] = {
},
["information"] = {
},
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
},
["Rushing Jade Wind Midnight"] = {
["iconSource"] = -1,
["parent"] = "Monk Midnight",
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = -342,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "stateupdate",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["unit"] = "player",
["subeventSuffix"] = "_CAST_START",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["spellIds"] = {
},
["names"] = {
},
["check"] = "event",
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    if spellID == 116847 then\n        local maxdur = 5.4\n        if s[\"\"] then\n            local olddur = s[\"\"].expirationTime-GetTime()\n            local newdur = math.min(maxdur*1.3, maxdur+olddur)\n            local state = {\n                progressType = \"timed\",\n                duration = newdur,\n                expirationTime = GetTime()+newdur,\n                autoHide = true\n            }\n            s:Update(\"\", state)\n        else\n            local state = {\n                progressType = \"timed\",\n                duration = maxdur,\n                expirationTime = GetTime()+maxdur,\n                autoHide = true,\n            }\n            s:Update(\"\", state)\n        end\n    end\nend\n\n\n\n",
["subeventPrefix"] = "SPELL",
["customVariables"] = "{\n    expirationTime = true,\n}",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = 1,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
["text_text_format_p_money_format"] = "AbbreviateNumbers",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_text_format_tooltip1_format"] = "BigNumber",
["text_color"] = {
1,
1,
0.25098040699959,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 50,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "ceil",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_fontType"] = "OUTLINE",
["text_text_format_p_money_precision"] = 3,
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",
["text_text"] = "%p",
["anchor_point"] = "CENTER",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 2,
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["glowDuration"] = 1,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowType"] = "Pixel",
["glowThickness"] = 4,
["glowXOffset"] = 0,
["type"] = "subglow",
["useGlowColor"] = true,
["glowLines"] = 8,
["glowBorder"] = true,
},
},
["height"] = 84,
["selfPoint"] = "CENTER",
["load"] = {
["ingroup"] = {
["multi"] = {
},
},
["use_never"] = false,
["use_class_and_spec"] = true,
["use_encounterid"] = true,
["use_class"] = true,
["race"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["talent2"] = {
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 268,
},
["talent"] = {
["multi"] = {
[101549] = true,
[125007] = true,
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
true,
nil,
true,
true,
},
},
["difficulty"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["pvptalent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MONK",
["multi"] = {
},
},
["role"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["use_talent"] = false,
},
["frameStrata"] = 5,
["useAdjustededMax"] = false,
["keepAspectRatio"] = false,
["source"] = "import",
["stickyDuration"] = false,
["cooldown"] = true,
["displayIcon"] = 606549,
["useCooldownModRate"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = false,
["uid"] = "nhjRSXwRyYo",
["xOffset"] = -380,
["width"] = 84,
["color"] = {
1,
1,
1,
1,
},
["zoom"] = 0.1,
["cooldownTextDisabled"] = true,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Rushing Jade Wind Midnight",
["internalVersion"] = 88,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["icon"] = true,
["config"] = {
},
["inverse"] = false,
["authorOptions"] = {
},
["conditions"] = {
{
["check"] = {
["op"] = "<=",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "5",
},
},
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "4",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.text_color",
},
{
["value"] = 70,
["property"] = "sub.2.text_fontSize",
},
},
},
},
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["Defensives Midnight"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "aura_env.spells = {\n    [115203] = {dur = 15},   \n    [132578] = {dur = 25},\n    [20594] = {dur = 8},\n    [48792] = {dur = 8}, -- Icebound Fortitude\n    [55233] = {dur = 10}, -- Vamp Blood\n    [49028] = {dur = 12}, -- Dancing Rune Weapon\n    [586] = {dur = 10}, -- Fade\n    [47585] = {dur = 6}, -- Dispersion\n    [19236] = {dur = 10}, -- Desperate Prayer\n    [22812] = {dur = 12}, -- Barkskin\n    [31850] = {dur = 8}, -- Ardent Defender\n    [86659] = {dur = 8}, -- Guardian\n    [642] = {dur = 8}, -- Bubble\n}\n\n\n",
["do_custom"] = true,
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["unit"] = "player",
["names"] = {
},
["custom"] = "function(s, e, ...)\n    if e == \"OPTIONS\" then\n        for k, v in pairs(aura_env.spells) do\n            local iconID = v.iconID or C_Spell.GetSpellInfo(k).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = v.dur,\n                expirationTime = GetTime()+v.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(k, state)\n        end   \n    else   \n        local u, cast, spellID = ... -- Unit event\n        local spell = aura_env.spells[spellID]\n        if spell then\n            local iconID = spell.iconID or C_Spell.GetSpellInfo(spellID).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = spell.dur,\n                expirationTime = GetTime()+spell.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(spellID, state)\n        end\n    end\nend",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["custom_type"] = "stateupdate",
["check"] = "event",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["customVariables"] = "{\n    expirationTime = true,\n}",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["stickyDuration"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_format"] = 0,
["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_text_format_tooltip1_format"] = "BigNumber",
["text_color"] = {
1,
1,
0.25098040699959,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 50,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "ceil",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = 0,
["text_text_format_p_money_format"] = "AbbreviateNumbers",
["text_text_format_p_time_mod_rate"] = true,
["text_text"] = "%p",
["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",
["text_shadowXOffset"] = 0,
["anchor_point"] = "CENTER",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_money_precision"] = 3,
["text_text_format_p_time_dynamic_threshold"] = 2,
},
{
["border_offset"] = 0,
["type"] = "subborder",
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["useGlowColor"] = true,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowScale"] = 1,
["glowThickness"] = 4,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = true,
},
},
["height"] = 84,
["useCooldownModRate"] = true,
["load"] = {
["ingroup"] = {
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 268,
["multi"] = {
[268] = true,
},
},
["talent"] = {
["multi"] = {
[101445] = true,
[124851] = true,
},
},
["size"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
true,
nil,
true,
true,
},
},
["class"] = {
["single"] = "MONK",
["multi"] = {
},
},
["role"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["difficulty"] = {
["multi"] = {
},
},
["talent2"] = {
["multi"] = {
},
},
["use_never"] = false,
["zoneIds"] = "",
},
["desaturate"] = false,
["useAdjustededMax"] = false,
["cooldownEdge"] = false,
["source"] = "import",
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
{
["check"] = {
["op"] = "<=",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "5",
},
},
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "4",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.text_color",
},
{
["value"] = 70,
["property"] = "sub.2.text_fontSize",
},
},
},
},
["keepAspectRatio"] = false,
["preferToUpdate"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["animation"] = {
["start"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 3,
["anchorFrameParent"] = false,
["icon"] = true,
["cooldownTextDisabled"] = true,
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Defensives Midnight",
["xOffset"] = 0,
["alpha"] = 1,
["width"] = 84,
["color"] = {
1,
1,
1,
1,
},
["uid"] = "feX(7Gp4Brs",
["inverse"] = false,
["internalVersion"] = 88,
["displayIcon"] = 613398,
["cooldown"] = true,
["parent"] = "Defensives List Midnight",
},
["Defensives List Midnight"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"Defensives Midnight",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["yOffset"] = -259,
["anchorPoint"] = "CENTER",
["fullCircle"] = true,
["rowSpace"] = 1,
["url"] = "",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["names"] = {
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["internalVersion"] = 88,
["useLimit"] = false,
["align"] = "CENTER",
["sort"] = "none",
["frameStrata"] = 1,
["stagger"] = 0,
["space"] = 0,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["subRegions"] = {
},
["groupIcon"] = 4038107,
["rotation"] = 0,
["load"] = {
["size"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
},
["gridType"] = "RD",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["parent"] = "Classes",
["animate"] = false,
["borderInset"] = 1,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["stepAngle"] = 15,
["xOffset"] = -339,
["constantFactor"] = "RADIUS",
["uid"] = ")o)gH7t27pj",
["borderOffset"] = 4,
["alpha"] = 1,
["tocversion"] = 110205,
["id"] = "Defensives List Midnight",
["grow"] = "RIGHT",
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "LEFT",
["config"] = {
},
["sortHybridTable"] = {
["Defensives Midnight"] = false,
},
["radius"] = 200,
["conditions"] = {
},
["information"] = {
},
["borderColor"] = {
0,
0,
0,
1,
},
},
["Cycle of life (On Death Sound)"] = {
["outline"] = "OUTLINE",
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["shadowYOffset"] = -1,
["anchorPoint"] = "CENTER",
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["sound_kit_id"] = "109069",
["sound"] = " KitID",
["do_sound"] = true,
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
["duration"] = "1",
["event"] = "Health",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["customName"] = "\n\n",
["events"] = "UNIT_DIED",
["names"] = {
},
["custom"] = "function(e, G, ...)\n    if G and not issecretvalue(G) then\n        if G == UnitGUID(\"player\") then\n            return true\n        end\n    end    \nend",
["custom_type"] = "event",
["spellIds"] = {
},
["custom_hide"] = "timed",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["wordWrap"] = "WordWrap",
["font"] = "Friz Quadrata TT",
["version"] = 2,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["fontSize"] = 31,
["source"] = "import",
["shadowXOffset"] = 1,
["regionType"] = "text",
["animation"] = {
["start"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["selfPoint"] = "BOTTOM",
["conditions"] = {
},
["automaticWidth"] = "Auto",
["yOffset"] = 348.99993896484,
["justify"] = "LEFT",
["tocversion"] = 110207,
["id"] = "Cycle of life (On Death Sound)",
["parent"] = "Stuff",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["config"] = {
},
["uid"] = "I4DHWpitVXl",
["xOffset"] = -0.0001220703125,
["displayText"] = " ",
["shadowColor"] = {
0,
0,
0,
1,
},
["fixedWidth"] = 200,
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["authorOptions"] = {
},
},
["BoC Midnight"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 196.8622436523438,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "stateupdate",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["spellIds"] = {
},
["names"] = {
},
["check"] = "event",
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    if spellID == 205523 then\n        local state = {\n            progressType = \"timed\",\n            duration = 15,\n            expirationTime = GetTime()+15,\n            autoHide = true,\n        }\n        s:Update(\"\", state)\n    elseif tContains(aura_env.spells, spellID) then\n        s:RemoveAll()\n    end\nend\n\n\n",
["unit"] = "player",
["customVariables"] = "{\n    expirationTime = true,\n}",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
["text_text_format_p_money_format"] = "AbbreviateNumbers",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_text_format_tooltip1_format"] = "BigNumber",
["text_color"] = {
1,
1,
0.25098040699959,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 60,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "ceil",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_fontType"] = "OUTLINE",
["text_text_format_p_money_precision"] = 3,
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",
["text_text"] = "%p",
["anchor_point"] = "CENTER",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 2,
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
},
["height"] = 100,
["load"] = {
["use_spellknown"] = true,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 196736,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 100,
["source"] = "import",
["useCooldownModRate"] = true,
["authorOptions"] = {
},
["parent"] = "Monk Midnight",
["cooldown"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["displayIcon"] = 574568,
["keepAspectRatio"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["config"] = {
},
["alpha"] = 1,
["cooldownTextDisabled"] = true,
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "BoC Midnight",
["xOffset"] = -574.1743774414062,
["frameStrata"] = 3,
["anchorFrameType"] = "SCREEN",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "aura_env.spells = {121253, 100780} -- Tiger Palm, Keg Smash",
},
["finish"] = {
},
},
["uid"] = "LOZStxXmKRt",
["inverse"] = false,
["stickyDuration"] = false,
["conditions"] = {
{
["check"] = {
["op"] = "<=",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "5",
},
},
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "4",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.text_color",
},
{
["value"] = 80,
["property"] = "sub.2.text_fontSize",
},
},
},
},
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = true,
},
["Stuff"] = {
["backdropColor"] = {
1,
1,
1,
0.5,
},
["controlledChildren"] = {
"Default Current expansion only filter",
"Cycle of life (On Death Sound)",
"No Rune",
"No Flask",
"No Food",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["border"] = false,
["borderEdge"] = "Square Full White",
["anchorPoint"] = "CENTER",
["borderSize"] = 2,
["yOffset"] = 0,
["borderColor"] = {
0,
0,
0,
1,
},
["xOffset"] = 0,
["regionType"] = "group",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["names"] = {
},
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["borderInset"] = 1,
["internalVersion"] = 88,
["scale"] = 1,
["tocversion"] = 110207,
["id"] = "Stuff",
["borderOffset"] = 4,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["uid"] = "3j79PiVoXwQ",
["frameStrata"] = 1,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["config"] = {
},
["conditions"] = {
},
["information"] = {
},
["load"] = {
["size"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
},
},
["Raid Utils"] = {
["backdropColor"] = {
1,
1,
1,
0.5,
},
["controlledChildren"] = {
"Sell Grey Items",
"Repair",
"Raid Util",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
["borderEdge"] = "Square Full White",
["border"] = false,
["yOffset"] = 0,
["regionType"] = "group",
["borderSize"] = 2,
["selfPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["authorOptions"] = {
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["event"] = "Health",
["names"] = {
},
},
["untrigger"] = {
},
},
},
["anchorPoint"] = "CENTER",
["internalVersion"] = 88,
["scale"] = 1,
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["id"] = "Raid Utils",
["borderOffset"] = 4,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["config"] = {
},
["borderInset"] = 1,
["information"] = {
},
["subRegions"] = {
},
["frameStrata"] = 1,
["conditions"] = {
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["uid"] = "ShjKvb7A9wa",
},
["Stagger"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["wagoID"] = "3zWD5RhVG",
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = -342,
["anchorPoint"] = "CENTER",
["sparkColor"] = {
1,
1,
1,
1,
},
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["url"] = "",
["icon"] = false,
["triggers"] = {
{
["trigger"] = {
["scaleStagger"] = "1",
["use_absorbMode"] = true,
["use_deficit"] = false,
["subeventPrefix"] = "SPELL",
["powertype"] = 99,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["use_absorbHealMode"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Power",
["use_percentpower"] = false,
["spellIds"] = {
},
["use_scaleStagger"] = true,
["names"] = {
},
["unit"] = "player",
["use_unit"] = true,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["use_absorbHealMode"] = true,
["debuffType"] = "HELPFUL",
["use_unit"] = true,
["use_absorbMode"] = true,
["event"] = "Character Stats",
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["icon_color"] = {
1,
1,
1,
1,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["sparkOffsetX"] = 0,
["parent"] = "Monk Midnight",
["barColor"] = {
1,
0.85882359743118,
0.42352944612503,
1,
},
["desaturate"] = false,
["preferToUpdate"] = false,
["spark"] = false,
["sparkOffsetY"] = 0,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%2.dodgepercent",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_2.dodgepercent_pad_mode"] = "left",
["text_fixedWidth"] = 64,
["rotateText"] = "NONE",
["text_text_format_3.dodgepercent_pad_mode"] = "left",
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontSize"] = 26,
["text_text_format_1.precentpower_format"] = "none",
["text_text_format_n_format"] = "none",
["text_text_format_3.dodgepercent_round_type"] = "floor",
["text_text_format_3.dodgepercent_format"] = "Number",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_3.dodgepercent_pad"] = false,
["type"] = "subtext",
["text_text_format_2.dodgepercent_decimal_precision"] = 1,
["text_text_format_3.dodgepercent_pad_max"] = 8,
["text_font"] = "Expressway",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = 0,
["text_text_format_1.percentpower_format"] = "Number",
["text_text_format_2.dodgepercent_format"] = "Number",
["text_text_format_2.dodgepercent_pad_max"] = 8,
["anchorXOffset"] = 0,
["text_text_format_1.percentpower_decimal_precision"] = 0,
["anchor_point"] = "INNER_RIGHT",
["text_text_format_3.dodgepercent_decimal_precision"] = 0,
["text_text_format_2.dodgepercent_pad"] = false,
["text_fontType"] = "OUTLINE",
},
{
["text_shadowXOffset"] = 1,
["text_text_format_s_format"] = "BigNumber",
["text_text"] = "%power",
["text_text_format_s_decimal_precision"] = 0,
["text_text_format_s_pad_mode"] = "left",
["text_fixedWidth"] = 64,
["text_text_format_power_pad_max"] = 8,
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_s_big_number_format"] = "AbbreviateNumbers",
["anchorXOffset"] = 0,
["text_text_format_s_round_type"] = "floor",
["text_text_format_n_format"] = "none",
["text_text_format_s_pad_max"] = 8,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_text_format_s_pad"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_power_big_number_format"] = "AbbreviateNumbers",
["type"] = "subtext",
["text_text_format_power_pad_mode"] = "left",
["text_font"] = "Expressway",
["text_anchorYOffset"] = 0,
["text_text_format_power_pad"] = false,
["rotateText"] = "NONE",
["text_fontSize"] = 21,
["anchor_point"] = "INNER_LEFT",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_power_format"] = "BigNumber",
["text_visible"] = true,
},
{
["border_size"] = 1,
["type"] = "subborder",
["anchor_area"] = "bar",
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_offset"] = 0,
},
},
["gradientOrientation"] = "HORIZONTAL",
["textureSource"] = "LSM",
["load"] = {
["class_and_spec"] = {
["single"] = 268,
},
["class"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["use_class_and_spec"] = true,
["use_zoneIds"] = false,
["size"] = {
["multi"] = {
},
},
},
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["source"] = "import",
["enableGradient"] = false,
["selfPoint"] = "TOPLEFT",
["barColor2"] = {
1,
1,
0,
1,
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["sparkHidden"] = "NEVER",
["icon_side"] = "RIGHT",
["version"] = 4,
["height"] = 42,
["sparkHeight"] = 30,
["texture"] = "Solid",
["config"] = {
},
["zoom"] = 0,
["semver"] = "1.0.3",
["tocversion"] = 110207,
["id"] = "Stagger",
["width"] = 341,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "L5JW2JanCHb",
["inverse"] = false,
["xOffset"] = -173,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "power",
["op"] = ">=",
["value"] = "150000",
},
["changes"] = {
{
["value"] = {
1,
0.6235294342041,
0.25098040699959,
1,
},
["property"] = "barColor",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "power",
["value"] = "300000",
["op"] = ">=",
},
["changes"] = {
{
["value"] = {
1,
0.25098040699959,
0.25098040699959,
1,
},
["property"] = "barColor",
},
},
},
},
["information"] = {
},
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
},
["Monk Midnight"] = {
["controlledChildren"] = {
"Stagger",
"Rushing Jade Wind Midnight",
"BoC Midnight",
"Pretense of Instability Midnight",
"Vivacious Vivification",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["yOffset"] = -7,
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["names"] = {
},
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["internalVersion"] = 88,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["subRegions"] = {
},
["load"] = {
["size"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["scale"] = 1,
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "group",
["borderSize"] = 2,
["config"] = {
},
["borderOffset"] = 4,
["parent"] = "Classes",
["tocversion"] = 110205,
["id"] = "Monk Midnight",
["selfPoint"] = "CENTER",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["groupIcon"] = 608951,
["uid"] = "1WoSSFg3fDC",
["borderInset"] = 1,
["alpha"] = 1,
["conditions"] = {
},
["information"] = {
},
["xOffset"] = 2,
},
["Rune 4"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["wagoID"] = "3zWD5RhVG",
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["sparkOffsetX"] = 0,
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["url"] = "",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["use_rune"] = true,
["type"] = "unit",
["use_absorbHealMode"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["names"] = {
},
["event"] = "Death Knight Rune",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["rune"] = 4,
["use_absorbMode"] = true,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["authorOptions"] = {
},
["preferToUpdate"] = false,
["barColor"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["desaturate"] = false,
["parent"] = "Runes",
["icon"] = false,
["version"] = 4,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 21,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "floor",
["text_text_format_1.percentpower_decimal_precision"] = 0,
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = 0,
["text_text_format_1.percentpower_format"] = "Number",
["text_visible"] = true,
["text_text_format_1.precentpower_format"] = "none",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 1,
["anchor_point"] = "INNER_RIGHT",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_n_format"] = "none",
},
{
["border_size"] = 1,
["type"] = "subborder",
["border_visible"] = true,
["border_color"] = {
0,
0,
0,
1,
},
["anchor_area"] = "bar",
["border_edge"] = "Square Full White",
["border_offset"] = 0,
},
},
["height"] = 42,
["textureSource"] = "LSM",
["load"] = {
["class_and_spec"] = {
["single"] = 250,
},
["use_zoneIds"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["use_class_and_spec"] = true,
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["internalVersion"] = 88,
["source"] = "import",
["selfPoint"] = "CENTER",
["sparkHidden"] = "NEVER",
["information"] = {
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["sparkOffsetY"] = 0,
["icon_side"] = "RIGHT",
["gradientOrientation"] = "HORIZONTAL",
["semver"] = "1.0.3",
["anchorFrameParent"] = false,
["texture"] = "Solid",
["sparkColor"] = {
1,
1,
1,
1,
},
["zoom"] = 0,
["spark"] = false,
["tocversion"] = 110207,
["id"] = "Rune 4",
["sparkHeight"] = 30,
["alpha"] = 1,
["width"] = 58,
["anchorFrameType"] = "SCREEN",
["uid"] = "xAkb7UVR4E1",
["inverse"] = true,
["frameStrata"] = 1,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["barColor2"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["config"] = {
},
},
["Speedbuffs Midnight"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["unit"] = "player",
["custom_type"] = "stateupdate",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["spellIds"] = {
},
["names"] = {
},
["check"] = "event",
["custom"] = "function(s, e, ...)    \n    if e == \"OPTIONS\" then\n        for k, v in pairs(aura_env.spells) do\n            local iconID = v.iconID or C_Spell.GetSpellInfo(k).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = v.dur,\n                expirationTime = GetTime()+v.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(k, state)\n        end   \n    else        \n        local u, cast, spellID = ... -- Unit event\n        local spell = aura_env.spells[spellID]\n        if spell then\n            local iconID = spell.iconID or C_Spell.GetSpellInfo(spellID).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = spell.dur,\n                expirationTime = GetTime()+spell.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(spellID, state)\n        end\n    end\nend\n\n\n",
["subeventPrefix"] = "SPELL",
["customVariables"] = "{\n    expirationTime = true,\n}",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_format"] = 0,
["text_text_format_p_big_number_format"] = "AbbreviateNumbers",
["text_text_format_p_money_format"] = "AbbreviateNumbers",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_text_format_p_decimal_precision"] = 0,
["text_text_format_tooltip1_format"] = "BigNumber",
["text_color"] = {
1,
1,
0.25098040699959,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_max"] = 8,
["text_fontSize"] = 50,
["anchorXOffset"] = 0,
["text_text_format_p_round_type"] = "ceil",
["text_text_format_p_pad"] = false,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_money_precision"] = 3,
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_font"] = "Expressway",
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_time_mod_rate"] = true,
["text_text"] = "%p",
["text_text_format_tooltip1_big_number_format"] = "AbbreviateNumbers",
["text_shadowXOffset"] = 0,
["anchor_point"] = "CENTER",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_format"] = "Number",
["text_shadowColor"] = {
0,
0,
0,
1,
},
},
{
["type"] = "subborder",
["border_size"] = 1,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_offset"] = 0,
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowType"] = "Pixel",
["glowThickness"] = 4,
["glowDuration"] = 1,
["glowXOffset"] = 0,
["type"] = "subglow",
["glowLines"] = 8,
["glowBorder"] = true,
},
},
["height"] = 84,
["authorOptions"] = {
},
["load"] = {
["ingroup"] = {
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 268,
["multi"] = {
[268] = true,
},
},
["talent"] = {
["multi"] = {
[101445] = true,
[124851] = true,
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "MONK",
["multi"] = {
},
},
["use_never"] = false,
["talent2"] = {
["multi"] = {
},
},
["use_class"] = true,
["role"] = {
["multi"] = {
},
},
["difficulty"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["race"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
true,
nil,
true,
true,
},
},
["size"] = {
["multi"] = {
},
},
},
["keepAspectRatio"] = false,
["useAdjustededMax"] = false,
["color"] = {
1,
1,
1,
1,
},
["source"] = "import",
["cooldown"] = true,
["displayIcon"] = 651727,
["cooldownEdge"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "yYFg2jIj9nh",
["useTooltip"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["frameStrata"] = 3,
["zoom"] = 0.1,
["cooldownTextDisabled"] = true,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Speedbuffs Midnight",
["parent"] = "SpeedBuffs List Midnight",
["alpha"] = 1,
["width"] = 84,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom_load"] = false,
["do_custom"] = true,
["custom"] = "aura_env.spells = {\n    [116841] = {dur = 6}, -- Tiger's Lust\n    [109132] = {dur = 5, iconID = C_Spell.GetSpellInfo(449582).iconID}, -- Lighter than Air\n    [48265] = {dur = 10}, -- Death's Advance\n    [121536] = {dur = 5}, -- Feather\n    [17] = {dur = 3}, -- Body and Soul\n    [1044] = {dur = 8}, -- Freedom\n    [190784] = {dur = 7}, -- Steed\n}",
},
},
["config"] = {
},
["inverse"] = false,
["stickyDuration"] = false,
["conditions"] = {
{
["check"] = {
["op"] = "<=",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "5",
["op"] = "<=",
},
},
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "4",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.text_color",
},
{
["value"] = 70,
["property"] = "sub.2.text_fontSize",
},
},
},
},
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = true,
},
["Default Current expansion only filter"] = {
["outline"] = "OUTLINE",
["wagoID"] = "FW6qfBuIH",
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["shadowYOffset"] = -1,
["anchorPoint"] = "CENTER",
["displayText_format_p_time_format"] = 0,
["customTextUpdate"] = "event",
["url"] = "https://wago.io/FW6qfBuIH/9",
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "local ownerId = \"WA_OWNER_ID_ALTER_DEFAULT_SEARCH_FILTER_VALUES\"\nlocal filterUpdater = _G[ownerId]\nif(not filterUpdater) then\n    _G[ownerId] = {\n        hookStates = {},\n        config = {},\n    }\n    filterUpdater = _G[ownerId]\nend\nfunction filterUpdater:isHookSet(key)\n    return self.hookStates[key]\nend\nfunction filterUpdater:markHookSet(key)\n    self.hookStates[key] = true\nend\nfunction filterUpdater:refreshConfig(currentConfig)\n    self.config = currentConfig\nend\nfunction filterUpdater:focusSearchBar(editBox, shouldFocus)\n    shouldFocus = shouldFocus or false\n    if(not shouldFocus and editBox:HasFocus()) then\n        editBox:ClearFocus()\n    end\n    if(shouldFocus and not editBox:HasFocus()) then\n        editBox:SetFocus()\n    end\nend\naura_env.FilterUpdater = filterUpdater\n\n",
["do_custom"] = true,
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["custom_hide"] = "timed",
["custom"] = "function(event, ...)\n    -- closure should capture FilterUpdater because it is made as a static updatable instance unlike aura_env\n    local filterUpdater = aura_env.FilterUpdater\n    -- this fires after any hooked \"OnShow\", but also fires on WA \"OPTIONS\" event to update before the \"OnShow\"s\n    -- aura_env value is recreated on config change, so pass current instance config\n    filterUpdater:refreshConfig(aura_env.config)\n    if(event == \"CRAFTINGORDERS_SHOW_CUSTOMER\") then\n        if(not filterUpdater.config.forCraftOrdersOverwrite) then return end\n        -- Filter state is preserved on tab switch, but let's still enforce filter state in case a user has cleared it\n        if(not filterUpdater:isHookSet(\"CraftOrdersFilterDropdown\")) then\n            local filterDropdown = ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.FilterDropdown\n            local searchBox = ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.SearchBox\n            local function onShow()\n                local config = filterUpdater.config -- use our updatable config, do not capture transient aura_env.config.\n                if(not config.forCraftOrdersOverwrite) then return end -- keep disablable even when hooked\n                filterDropdown.filters[Enum.AuctionHouseFilter.CurrentExpansionOnly] = config.forCraftOrdersValue or false\n                filterDropdown:ValidateResetState()\n                filterUpdater:focusSearchBar(searchBox, config.forCraftOrdersFocusSearchBar)\n            end\n            -- this enforces filter and focus state on tab switch\n            filterDropdown:HookScript(\"OnShow\", function(filterDropdown)\n                    -- schedule to run after current event and all OnShow callbacks\n                    C_Timer.After(0, onShow)\n            end)\n            filterUpdater:markHookSet(\"CraftOrdersFilterDropdown\")\n            -- for the first time it's too late for the hook to trigger, so run it explicitly\n            C_Timer.After(0, onShow)\n        end\n    elseif(event == \"AUCTION_HOUSE_SHOW\") then\n        if(not filterUpdater.config.forAuctionHouseOverwrite) then return end\n        if(not filterUpdater:isHookSet(\"AuctionHouseSearchBar\")) then\n            -- this enforces filter state on tab switch\n            local searchBar = AuctionHouseFrame.SearchBar\n            local searchBox = AuctionHouseFrame.SearchBar.SearchBox\n            local function onShow()\n                local config = filterUpdater.config -- use our updatable config, do not capture transient aura_env.config.\n                if(not config.forAuctionHouseOverwrite) then return end -- keep disablable even when hooked\n                searchBar.FilterButton.filters[Enum.AuctionHouseFilter.CurrentExpansionOnly] = config.forAuctionHouseValue or false\n                searchBar:UpdateClearFiltersButton()\n                filterUpdater:focusSearchBar(searchBox, config.forAuctionHouseFocusSearchBar)\n            end\n            -- this enforces filter and focus state on tab switch\n            searchBar:HookScript(\"OnShow\", function(searchBar)\n                    -- schedule to run after current event and all OnShow callbacks\n                    C_Timer.After(0, onShow)\n            end)\n            filterUpdater:markHookSet(\"AuctionHouseSearchBar\")\n            -- for the first time it's too late for the hook to trigger, so run it explicitly\n            C_Timer.After(0, onShow)\n        end\n    elseif(event == \"PLAYER_INTERACTION_MANAGER_FRAME_SHOW\") then\n        local type = ...\n        if(type ~= Enum.PlayerInteractionType.Auctioneer) then return end\n        if(not filterUpdater.config.forAuctionatorOverwrite) then return end\n        if(not C_AddOns.IsAddOnLoaded(\"Auctionator\")) then return end\n        if(not filterUpdater:isHookSet(\"AuctionatorShoppingTabItemFrame\")) then\n            local function hookAuctionator()\n                if(not filterUpdater:isHookSet(\"AuctionatorShoppingTabItemFrame\")) then\n                    local shoppingTabItem = AuctionatorShoppingTabItemFrame\n                    local function onShow()\n                        local config = filterUpdater.config -- use our updatable config, do not capture transient aura_env.config.\n                        if(not config.forAuctionatorOverwrite) then return end -- keep disablable even when hooked\n                        local value = config.forAuctionatorValue and tostring(LE_EXPANSION_LEVEL_CURRENT) or \"\"\n                        shoppingTabItem.ExpansionContainer.DropDown:SetValue(value)\n                    end\n                    shoppingTabItem:HookScript(\"OnShow\", function(shoppingTabItem)\n                            -- schedule to run after current event and all OnShow callbacks\n                            C_Timer.After(0, onShow)\n                    end)\n                    filterUpdater:markHookSet(\"AuctionatorShoppingTabItemFrame\")\n                end\n            end\n            C_Timer.After(0, hookAuctionator) -- delay until Actionator has finished initializing its frames\n        end\n    end\nend",
["events"] = "CRAFTINGORDERS_SHOW_CUSTOMER,AUCTION_HOUSE_SHOW,PLAYER_INTERACTION_MANAGER_FRAME_SHOW",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["custom_type"] = "event",
["spellIds"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["displayText_format_p_format"] = "timed",
["internalVersion"] = 88,
["wordWrap"] = "WordWrap",
["font"] = "Friz Quadrata TT",
["version"] = 9,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["load"] = {
["use_encounter"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["fontSize"] = 12,
["source"] = "import",
["shadowXOffset"] = 1,
["xOffset"] = 0,
["displayText_format_p_time_dynamic_threshold"] = 60,
["regionType"] = "text",
["displayText"] = "",
["conditions"] = {
},
["displayText_format_p_time_legacy_floor"] = false,
["displayText_format_p_time_mod_rate"] = true,
["displayText_format_p_time_precision"] = 1,
["config"] = {
["forAuctionHouseFocusSearchBar"] = true,
["forCraftOrdersFocusSearchBar"] = true,
["forAuctionHouseValue"] = true,
["forAuctionHouseOverwrite"] = true,
["forCraftOrdersValue"] = true,
["forCraftOrdersOverwrite"] = true,
["forAuctionatorOverwrite"] = true,
["forAuctionatorValue"] = true,
},
["parent"] = "Stuff",
["justify"] = "LEFT",
["semver"] = "1.0.8",
["tocversion"] = 110205,
["id"] = "Default Current expansion only filter",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
{
["useName"] = true,
["type"] = "header",
["text"] = "Crafting Orders (Blizzard)",
["width"] = 1,
},
{
["type"] = "description",
["text"] = "Place Order > Filter",
["fontSize"] = "small",
["width"] = 2,
},
{
["type"] = "toggle",
["default"] = true,
["desc"] = "Activate filter enforcement",
["key"] = "forCraftOrdersOverwrite",
["useDesc"] = true,
["name"] = "Set filter state:",
["width"] = 1,
},
{
["type"] = "toggle",
["default"] = true,
["desc"] = "Set option to this state",
["key"] = "forCraftOrdersValue",
["useDesc"] = true,
["name"] = "Current Expansion Only",
["width"] = 1,
},
{
["type"] = "toggle",
["default"] = false,
["key"] = "forCraftOrdersFocusSearchBar",
["useDesc"] = false,
["name"] = "... and focus search bar",
["width"] = 2,
},
{
["useName"] = true,
["type"] = "header",
["text"] = "Auction House (Blizzard)",
["width"] = 1,
},
{
["type"] = "description",
["text"] = "Buy > Filter",
["fontSize"] = "small",
["width"] = 2,
},
{
["type"] = "toggle",
["default"] = true,
["desc"] = "Activate filter enforcement",
["key"] = "forAuctionHouseOverwrite",
["useDesc"] = true,
["name"] = "Set filter state:",
["width"] = 1,
},
{
["type"] = "toggle",
["default"] = true,
["desc"] = "Set option to this state",
["key"] = "forAuctionHouseValue",
["useDesc"] = true,
["name"] = "Current Expansion Only",
["width"] = 1,
},
{
["type"] = "toggle",
["default"] = false,
["key"] = "forAuctionHouseFocusSearchBar",
["useDesc"] = false,
["name"] = "... and focus search bar",
["width"] = 2,
},
{
["useName"] = true,
["type"] = "header",
["text"] = "Auctionator (addon)",
["width"] = 1,
},
{
["type"] = "description",
["text"] = "Shopping > Search Options > Extended Search Options",
["fontSize"] = "small",
["width"] = 2,
},
{
["type"] = "toggle",
["default"] = true,
["desc"] = "Set option to this state",
["key"] = "forAuctionatorOverwrite",
["useDesc"] = true,
["name"] = "Set filter state:",
["width"] = 1,
},
{
["type"] = "toggle",
["default"] = true,
["desc"] = "Set option to this state",
["key"] = "forAuctionatorValue",
["useDesc"] = true,
["name"] = "Current Expansion Only",
["width"] = 1,
},
},
["uid"] = "OJ1JBI6dA5H",
["automaticWidth"] = "Auto",
["selfPoint"] = "BOTTOM",
["shadowColor"] = {
0,
0,
0,
1,
},
["fixedWidth"] = 200,
["information"] = {
},
["yOffset"] = 0,
},
["No Rune"] = {
["iconSource"] = 0,
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = -33.000122070312,
["anchorPoint"] = "TOP",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["useName"] = false,
["type"] = "aura2",
["useExactSpellId"] = true,
["subeventPrefix"] = "SPELL",
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["unit"] = "player",
["auraspellids"] = {
"453250",
"393438",
"1242347",
},
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["names"] = {
},
["namePattern_name"] = "",
["useNamePattern"] = false,
["auranames"] = {
"",
},
["namePattern_operator"] = "find('%s')",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["desaturate"] = true,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = " ",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
{
["type"] = "subborder",
["border_size"] = 1,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_offset"] = 0,
},
},
["height"] = 66,
["load"] = {
["use_namerealm"] = false,
["zoneIds"] = "",
["namerealm"] = "Relowindi",
["talent"] = {
["multi"] = {
},
},
["use_never"] = false,
["spec"] = {
["multi"] = {
true,
[4] = true,
},
},
["level"] = {
"90",
},
["level_operator"] = {
">=",
},
["difficulty"] = {
["multi"] = {
["mythic"] = true,
},
},
["use_level"] = true,
["size"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["use_encounter"] = false,
["use_combat"] = false,
["instance_type"] = {
["multi"] = {
[0] = true,
[15] = true,
[14] = true,
[16] = true,
[23] = true,
},
},
["use_instance_type"] = false,
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "UIPARENT",
["source"] = "import",
["stickyDuration"] = false,
["selfPoint"] = "CENTER",
["parent"] = "Stuff",
["cooldown"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["conditions"] = {
},
["icon"] = true,
["adjustedMax"] = "",
["config"] = {
},
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110207,
["id"] = "No Rune",
["alpha"] = 1,
["useCooldownModRate"] = true,
["width"] = 66,
["authorOptions"] = {
},
["uid"] = "yufHk9hEgT5",
["inverse"] = false,
["xOffset"] = 343,
["displayIcon"] = 134425,
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["keepAspectRatio"] = false,
},
["No Food"] = {
["iconSource"] = 0,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = -33,
["anchorPoint"] = "TOP",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useName"] = true,
["auranames"] = {
"Well Fed",
"Hearty Well Fed",
},
["unit"] = "player",
["names"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["rem"] = "300",
["type"] = "aura2",
["remOperator"] = "<=",
["auranames"] = {
"Well Fed",
"Hearty Well Fed",
},
["unit"] = "player",
["useRem"] = true,
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["desaturate"] = true,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = " ",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
},
["height"] = 66,
["load"] = {
["use_namerealm"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
["flexible"] = true,
["party"] = true,
},
},
["level_operator"] = {
">=",
},
["spec"] = {
["multi"] = {
},
},
["use_combat"] = false,
["difficulty"] = {
["multi"] = {
["mythic"] = true,
},
},
["instance_type"] = {
["multi"] = {
[0] = true,
[15] = true,
[14] = true,
[16] = true,
[23] = true,
},
},
["use_level"] = true,
["zoneIds"] = "",
["class"] = {
["multi"] = {
},
},
["level"] = {
"90",
},
["use_encounter"] = false,
["use_instance_type"] = false,
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "UIPARENT",
["source"] = "import",
["authorOptions"] = {
},
["keepAspectRatio"] = false,
["preferToUpdate"] = false,
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["conditions"] = {
},
["icon"] = true,
["selfPoint"] = "CENTER",
["uid"] = "DG3gSG(0jgb",
["alpha"] = 1,
["zoom"] = 0.1,
["cooldownTextDisabled"] = false,
["auto"] = false,
["tocversion"] = 110207,
["id"] = "No Food",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["width"] = 66,
["parent"] = "Stuff",
["config"] = {
},
["inverse"] = false,
["xOffset"] = 213,
["displayIcon"] = 136000,
["cooldown"] = true,
["stickyDuration"] = false,
},
["ExternalDefensive Icon"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["customText"] = "function()\n    return C_StringUtil.RoundToNearestString(aura_env.state.durationObject:GetRemainingDuration()), UnitName(aura_env.state.unit)\nend",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["custom"] = "function(allstates, event, ...)\n    if event == \"UNIT_AURA\" then\n        local unit, updateInfo = ...    \n        \n        if updateInfo.isFullUpdate and next(allstates) then\n            local auraInstanceIds = C_UnitAuras.GetUnitAuraInstanceIDs(unit, \"HELPFUL\")\n            local foundStates = {}\n            for i, auraInstanceID in ipairs(auraInstanceIds) do\n                if allstates[auraInstanceID] then\n                    foundStates[auraInstanceID] = true \n                end \n            end\n            \n            for k, v in pairs(allstates) do\n                if not foundStates[k] then\n                    allstates:Remove(k) \n                end \n            end\n        end\n        \n        if updateInfo.addedAuras then\n            for i, auraData in ipairs(updateInfo.addedAuras) do                \n                local auraInstanceID = auraData.auraInstanceID\n                local isExternalDefensive = not C_UnitAuras.IsAuraFilteredOutByInstanceID(\"player\", auraInstanceID, \"HELPFUL|EXTERNAL_DEFENSIVE\")\n                if isExternalDefensive then\n                    local duration = C_UnitAuras.GetAuraDuration(unit, auraInstanceID)\n                    \n                    allstates:Update(auraInstanceID, {\n                            progressType = \"timed\",\n                            duration = duration:GetTotalDuration(),\n                            expirationTime = duration:GetEndTime(),\n                            durationObject = duration,\n                            name = auraData.name,\n                            icon = auraData.icon,\n                            unit = auraData.sourceUnit,\n                    })\n                end\n            end\n        end \n        \n        if updateInfo.updatedAuraInstanceIDs then\n            for i, auraInstanceID in ipairs(updateInfo.updatedAuraInstanceIDs)  do\n                if allstates[auraInstanceID]  then\n                    local auraData = C_UnitAuras.GetAuraDataByAuraInstanceID(unit, auraInstanceID)\n                    local duration = C_UnitAuras.GetAuraDuration(unit, auraInstanceID)\n                    \n                    allstates:Update(auraInstanceID, {\n                            progressType = \"timed\",\n                            duration = duration:GetTotalDuration(),\n                            expirationTime = duration:GetEndTime(),\n                            durationObject = duration,\n                            name = auraData.name,\n                            icon = auraData.icon,\n                            unit = auraData.sourceUnit,\n                    })\n                end\n            end\n        end\n        \n        if updateInfo.removedAuraInstanceIDs then\n            for i, auraInstanceID in ipairs(updateInfo.removedAuraInstanceIDs)  do\n                if allstates[auraInstanceID]  then                    \n                    allstates:Remove(auraInstanceID)\n                end\n            end\n        end\n    elseif event == \"OPTIONS\" then\n        for i=1,3 do\n            local duration = C_DurationUtil.CreateDuration()\n            duration:SetTimeFromStart(GetTime(), 5)\n            allstates:Update(i, {\n                    progressType = \"timed\",\n                    duration = duration:GetTotalDuration(),\n                    expirationTime = duration:GetEndTime(),\n                    durationObject = duration,\n                    icon = C_Spell.GetSpellTexture(102342),\n                    name = C_Spell.GetSpellName(102342),\n                    unit = \"player\",\n            }) \n        end\n    end\nend",
["events"] = "UNIT_AURA:player",
["custom_type"] = "stateupdate",
["check"] = "event",
["names"] = {
},
["spellIds"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["border_size"] = 1,
["type"] = "subborder",
["border_color"] = {
0,
0,
0,
1,
},
["border_visible"] = true,
["border_edge"] = "Square Full White",
["border_offset"] = 0,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_p_pad"] = false,
["text_text"] = "%c",
["text_text_format_p_format"] = "none",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["anchorXOffset"] = 0,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_c_format"] = "none",
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_decimal_precision"] = 0,
["type"] = "subtext",
["text_text_format_p_time_format"] = 0,
["text_color"] = {
1,
1,
0.250980406999588,
1,
},
["text_font"] = "Expressway",
["text_fontType"] = "OUTLINE",
["text_shadowYOffset"] = 0,
["anchorYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_pad_max"] = 8,
["anchor_point"] = "CENTER",
["text_fontSize"] = 50,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_round_type"] = "ceil",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%c2",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_text_format_c_format"] = "none",
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
0,
},
["text_font"] = "Expressway",
["type"] = "subtext",
["text_text_format_p_time_format"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_text_format_text_format"] = "none",
["text_fontType"] = "OUTLINE",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_text_format_c2_format"] = "none",
["text_visible"] = true,
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["anchor_point"] = "OUTER_LEFT",
["text_fontSize"] = 30,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 100,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["frameStrata"] = 1,
["uid"] = "iu(XmoBeyjY",
["xOffset"] = 0,
["parent"] = "ExternalDefensives",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldown"] = true,
["displayIcon"] = 572025,
["adjustedMin"] = "",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["width"] = 100,
["useCooldownModRate"] = true,
["zoom"] = 0.1,
["cooldownTextDisabled"] = true,
["tocversion"] = 120001,
["id"] = "ExternalDefensive Icon",
["preferToUpdate"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["inverse"] = false,
["authorOptions"] = {
},
["conditions"] = {
},
["information"] = {
},
["actions"] = {
["start"] = {
["message"] = "",
["custom"] = "local ttsVoice = TextToSpeech_GetSelectedVoice(Enum.TtsVoiceType.Standard).voiceID\nif GetLocale() == \"ruRU\" then\n    ttsVoice = 0 \nend\n\nlocal queued = false\nC_VoiceChat.SpeakText(\n    ttsVoice,\n    aura_env.state.name,\n    0,\n    75,\n    queued\n)",
["message_format_name_format"] = "none",
["message_type"] = "TTS",
["do_custom"] = false,
["do_message"] = false,
["do_sound"] = false,
},
["init"] = {
["do_custom"] = true,
["custom"] = "if not aura_env.colorcurve then\n    aura_env.colorcurve = C_CurveUtil.CreateColorCurve()\n    aura_env.colorcurve:SetType(Enum.LuaCurveType.Step)\n    aura_env.colorcurve:AddPoint(1, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(2, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(3, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(4, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(5, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(6, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(7, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(8, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(9, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(10, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(11, CreateColor(1, 0, 0, 1))\n    aura_env.colorcurve:AddPoint(12, CreateColor(1, 1, 1, 1))\n    aura_env.colorcurve:AddPoint(13, CreateColor(1, 1, 1, 1))\nend\n\n\n",
},
["finish"] = {
},
},
},
},
["historyCutoff"] = 730,
["editor_theme"] = "Standard",
}
