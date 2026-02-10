
WeakAurasSaved = {
["dynamicIconCache"] = {
},
["editor_tab_spaces"] = 4,
["editor_font_size"] = 16,
["login_squelch_time"] = 10,
["lastArchiveClear"] = 1770159839,
["minimap"] = {
["minimapPos"] = 241.3104412971023,
["hide"] = false,
},
["historyCutoff"] = 730,
["dbVersion"] = 88,
["migrationCutoff"] = 730,
["features"] = {
},
["registered"] = {
},
["displays"] = {
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
["spellIds"] = {
},
["custom"] = "function(event, ...)\n    -- closure should capture FilterUpdater because it is made as a static updatable instance unlike aura_env\n    local filterUpdater = aura_env.FilterUpdater\n    -- this fires after any hooked \"OnShow\", but also fires on WA \"OPTIONS\" event to update before the \"OnShow\"s\n    -- aura_env value is recreated on config change, so pass current instance config\n    filterUpdater:refreshConfig(aura_env.config)\n    if(event == \"CRAFTINGORDERS_SHOW_CUSTOMER\") then\n        if(not filterUpdater.config.forCraftOrdersOverwrite) then return end\n        -- Filter state is preserved on tab switch, but let's still enforce filter state in case a user has cleared it\n        if(not filterUpdater:isHookSet(\"CraftOrdersFilterDropdown\")) then\n            local filterDropdown = ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.FilterDropdown\n            local searchBox = ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.SearchBox\n            local function onShow()\n                local config = filterUpdater.config -- use our updatable config, do not capture transient aura_env.config.\n                if(not config.forCraftOrdersOverwrite) then return end -- keep disablable even when hooked\n                filterDropdown.filters[Enum.AuctionHouseFilter.CurrentExpansionOnly] = config.forCraftOrdersValue or false\n                filterDropdown:ValidateResetState()\n                filterUpdater:focusSearchBar(searchBox, config.forCraftOrdersFocusSearchBar)\n            end\n            -- this enforces filter and focus state on tab switch\n            filterDropdown:HookScript(\"OnShow\", function(filterDropdown)\n                    -- schedule to run after current event and all OnShow callbacks\n                    C_Timer.After(0, onShow)\n            end)\n            filterUpdater:markHookSet(\"CraftOrdersFilterDropdown\")\n            -- for the first time it's too late for the hook to trigger, so run it explicitly\n            C_Timer.After(0, onShow)\n        end\n    elseif(event == \"AUCTION_HOUSE_SHOW\") then\n        if(not filterUpdater.config.forAuctionHouseOverwrite) then return end\n        if(not filterUpdater:isHookSet(\"AuctionHouseSearchBar\")) then\n            -- this enforces filter state on tab switch\n            local searchBar = AuctionHouseFrame.SearchBar\n            local searchBox = AuctionHouseFrame.SearchBar.SearchBox\n            local function onShow()\n                local config = filterUpdater.config -- use our updatable config, do not capture transient aura_env.config.\n                if(not config.forAuctionHouseOverwrite) then return end -- keep disablable even when hooked\n                searchBar.FilterButton.filters[Enum.AuctionHouseFilter.CurrentExpansionOnly] = config.forAuctionHouseValue or false\n                searchBar:UpdateClearFiltersButton()\n                filterUpdater:focusSearchBar(searchBox, config.forAuctionHouseFocusSearchBar)\n            end\n            -- this enforces filter and focus state on tab switch\n            searchBar:HookScript(\"OnShow\", function(searchBar)\n                    -- schedule to run after current event and all OnShow callbacks\n                    C_Timer.After(0, onShow)\n            end)\n            filterUpdater:markHookSet(\"AuctionHouseSearchBar\")\n            -- for the first time it's too late for the hook to trigger, so run it explicitly\n            C_Timer.After(0, onShow)\n        end\n    elseif(event == \"PLAYER_INTERACTION_MANAGER_FRAME_SHOW\") then\n        local type = ...\n        if(type ~= Enum.PlayerInteractionType.Auctioneer) then return end\n        if(not filterUpdater.config.forAuctionatorOverwrite) then return end\n        if(not C_AddOns.IsAddOnLoaded(\"Auctionator\")) then return end\n        if(not filterUpdater:isHookSet(\"AuctionatorShoppingTabItemFrame\")) then\n            local function hookAuctionator()\n                if(not filterUpdater:isHookSet(\"AuctionatorShoppingTabItemFrame\")) then\n                    local shoppingTabItem = AuctionatorShoppingTabItemFrame\n                    local function onShow()\n                        local config = filterUpdater.config -- use our updatable config, do not capture transient aura_env.config.\n                        if(not config.forAuctionatorOverwrite) then return end -- keep disablable even when hooked\n                        local value = config.forAuctionatorValue and tostring(LE_EXPANSION_LEVEL_CURRENT) or \"\"\n                        shoppingTabItem.ExpansionContainer.DropDown:SetValue(value)\n                    end\n                    shoppingTabItem:HookScript(\"OnShow\", function(shoppingTabItem)\n                            -- schedule to run after current event and all OnShow callbacks\n                            C_Timer.After(0, onShow)\n                    end)\n                    filterUpdater:markHookSet(\"AuctionatorShoppingTabItemFrame\")\n                end\n            end\n            C_Timer.After(0, hookAuctionator) -- delay until Actionator has finished initializing its frames\n        end\n    end\nend",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["custom_type"] = "event",
["events"] = "CRAFTINGORDERS_SHOW_CUSTOMER,AUCTION_HOUSE_SHOW,PLAYER_INTERACTION_MANAGER_FRAME_SHOW",
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
["use_level"] = true,
["level"] = {
"81",
},
["use_encounter"] = false,
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
["level_operator"] = {
">=",
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
["displayText_format_p_time_legacy_floor"] = false,
["regionType"] = "text",
["automaticWidth"] = "Auto",
["conditions"] = {
},
["selfPoint"] = "BOTTOM",
["displayText_format_p_time_mod_rate"] = true,
["displayText_format_p_time_precision"] = 1,
["config"] = {
["forAuctionHouseFocusSearchBar"] = true,
["forAuctionHouseOverwrite"] = true,
["forAuctionatorValue"] = true,
["forCraftOrdersFocusSearchBar"] = true,
["forCraftOrdersValue"] = true,
["forCraftOrdersOverwrite"] = true,
["forAuctionatorOverwrite"] = true,
["forAuctionHouseValue"] = true,
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
["displayText"] = "",
["yOffset"] = 0,
["shadowColor"] = {
0,
0,
0,
1,
},
["fixedWidth"] = 200,
["information"] = {
},
["displayText_format_p_time_dynamic_threshold"] = 60,
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
["parent"] = "Classes",
["radius"] = 200,
["stagger"] = 0,
["arcLength"] = 360,
["gridType"] = "RD",
["subRegions"] = {
},
["groupIcon"] = 135939,
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
["rotation"] = 0,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["borderInset"] = 1,
["source"] = "import",
["rowSpace"] = 1,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["stepAngle"] = 15,
["gridWidth"] = 5,
["constantFactor"] = "RADIUS",
["authorOptions"] = {
},
["borderOffset"] = 4,
["config"] = {
},
["tocversion"] = 110205,
["id"] = "DmgBuffs List Midnight",
["sort"] = "none",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["animate"] = false,
["uid"] = "TBljI7F0nkA",
["selfPoint"] = "LEFT",
["fullCircle"] = true,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
},
["anchorPoint"] = "CENTER",
},
["Evoker Essence Bar"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"Evoker Essence",
},
["borderBackdrop"] = "None",
["wagoID"] = "oR42u5m2B",
["xOffset"] = -0.5,
["preferToUpdate"] = false,
["yOffset"] = 345,
["anchorPoint"] = "BOTTOM",
["borderColor"] = {
0,
0,
0,
1,
},
["rowSpace"] = 1,
["url"] = "https://wago.io/oR42u5m2B/2",
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
["unit"] = "player",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["names"] = {
},
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["internalVersion"] = 88,
["gridWidth"] = 5,
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
["align"] = "CENTER",
["gridType"] = "RD",
["groupIcon"] = 4630443,
["space"] = -1,
["rotation"] = 0,
["selfPoint"] = "CENTER",
["version"] = 2,
["subRegions"] = {
},
["stagger"] = 0,
["grow"] = "HORIZONTAL",
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
["uid"] = "o)B21RdY5zV",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["authorOptions"] = {
},
["source"] = "import",
["sortHybridTable"] = {
["Evoker Essence"] = false,
},
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 5,
["frameStrata"] = 1,
["regionType"] = "dynamicgroup",
["anchorFrameParent"] = true,
["constantFactor"] = "RADIUS",
["animate"] = false,
["borderOffset"] = 4,
["semver"] = "1.0.1",
["tocversion"] = 100100,
["id"] = "Evoker Essence Bar",
["sort"] = "none",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["radius"] = 200,
["borderInset"] = 1,
["config"] = {
},
["fullCircle"] = true,
["conditions"] = {
},
["information"] = {
},
["useLimit"] = false,
},
["Timers"] = {
["sparkWidth"] = 10,
["iconSource"] = 1,
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["customVariables"] = "{\n    expirationTime = true\n}\n\n\n",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["custom"] = "function(s, e, ...)\n    if e == \"OPTIONS\" then\n        for i=1, 3 do\n            info = {id = i, spellName = \"Some SpellName\", iconFileID = C_Spell.GetSpellInfo(774).iconID, duration = math.random(5, 20)}\n            local state = {\n                progressType = \"timed\",\n                duration = info.duration,\n                expirationTime = info.duration+GetTime(),\n                text = info.spellName,\n                icon = info.iconFileID,\n                autoHide = false,\n            }\n            s:Update(info.id, state)\n        end\n        \n    elseif e == \"ENCOUNTER_TIMELINE_EVENT_ADDED\" then\n        local info = ...\n        local state = {\n            progressType = \"timed\",\n            duration = info.duration,\n            expirationTime = info.duration+GetTime(),\n            text = info.spellName,\n            icon = info.iconFileID,\n            autoHide = false,\n        }\n        s:Update(info.id, state)\n    elseif e == \"ENCOUNTER_TIMELINE_EVENT_REMOVED\" then\n        local id = ...\n        if s[id] then\n            s[id].show = false\n            s[id].changed = true\n            return true\n        end\n    end\nend\n\n\n\n",
["spellIds"] = {
},
["names"] = {
},
["check"] = "event",
["events"] = "ENCOUNTER_TIMELINE_EVENT_ADDED ENCOUNTER_TIMELINE_EVENT_REMOVED",
["custom_type"] = "stateupdate",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
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
["selfPoint"] = "CENTER",
["barColor"] = {
0,
0.5333333611488342,
1,
1,
},
["desaturate"] = false,
["width"] = 300,
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
["text_text"] = "%text",
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
["text_text_format_p_time_precision"] = 1,
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_text_format_text_format"] = "none",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_text_format_p_format"] = "timed",
["text_shadowYOffset"] = -1,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["anchor_point"] = "INNER_LEFT",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_legacy_floor"] = false,
},
{
["text_shadowXOffset"] = 1,
["text_text_format_p_pad"] = false,
["text_text"] = "%p",
["text_text_format_p_time_mod_rate"] = true,
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_precision"] = 1,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_time_format"] = 0,
["text_text_format_p_decimal_precision"] = 0,
["type"] = "subtext",
["text_fontType"] = "OUTLINE",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_text_format_n_format"] = "none",
["text_shadowYOffset"] = -1,
["text_text_format_text_format"] = "none",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_format"] = "Number",
["text_text_format_p_pad_max"] = 8,
["anchor_point"] = "INNER_RIGHT",
["text_fontSize"] = 19,
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_text_format_p_round_type"] = "floor",
},
{
["border_offset"] = 0,
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
["border_size"] = 1,
},
},
["height"] = 40,
["textureSource"] = "LSM",
["load"] = {
["use_never"] = true,
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
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["sparkOffsetX"] = 0,
["information"] = {
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
["enableGradient"] = false,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["config"] = {
},
["uid"] = "lKz)Wn80fMH",
["icon_side"] = "LEFT",
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["sparkHeight"] = 30,
["texture"] = "Minimalist",
["frameStrata"] = 1,
["zoom"] = 0,
["spark"] = false,
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["sparkHidden"] = "NEVER",
["id"] = "Timers",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["gradientOrientation"] = "HORIZONTAL",
["sparkColor"] = {
1,
1,
1,
1,
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
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "5",
},
["changes"] = {
{
["value"] = {
1,
0,
0.02745098248124123,
1,
},
["property"] = "barColor",
},
},
},
},
["barColor2"] = {
1,
1,
0,
1,
},
["parent"] = "Bossmod",
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
["config"] = {
},
["groupIcon"] = 341221,
["borderOffset"] = 4,
["semver"] = "1.0.10",
["tocversion"] = 110205,
["id"] = "Raid Util",
["parent"] = "Raid Utils",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
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
["borderInset"] = 1,
["uid"] = "JZZKAGMH8gC",
["alpha"] = 1,
["conditions"] = {
},
["information"] = {
},
["xOffset"] = 0,
},
["Bossmod"] = {
["grow"] = "DOWN",
["controlledChildren"] = {
"Timers",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 574,
["yOffset"] = 62,
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
["radius"] = 200,
["selfPoint"] = "TOP",
["align"] = "CENTER",
["stagger"] = 0,
["rotation"] = 0,
["subRegions"] = {
},
["uid"] = ")QYMzBKZ5n6",
["gridType"] = "RD",
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
["authorOptions"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["config"] = {
},
["animate"] = false,
["groupIcon"] = 134376,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "ascending",
["fullCircle"] = true,
["limit"] = 5,
["constantFactor"] = "RADIUS",
["useLimit"] = false,
["borderOffset"] = 4,
["gridWidth"] = 5,
["rowSpace"] = 1,
["id"] = "Bossmod",
["frameStrata"] = 1,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
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
["borderInset"] = 1,
["regionType"] = "dynamicgroup",
["internalVersion"] = 88,
["conditions"] = {
},
["information"] = {
},
["arcLength"] = 360,
},
["Combo Point 3"] = {
["wagoID"] = "OaJQX6khW",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["url"] = "https://wago.io/OaJQX6khW/30",
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
["use_power"] = true,
["use_showCost"] = false,
["unit"] = "player",
["powertype"] = 4,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["unevent"] = "auto",
["power_operator"] = {
">=",
},
["event"] = "Power",
["duration"] = "1",
["names"] = {
},
["use_showChargedComboPoints"] = false,
["spellIds"] = {
},
["use_absorbMode"] = true,
["power"] = {
"3",
},
["subeventSuffix"] = "_CAST_START",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["discrete_rotation"] = 0,
["version"] = 30,
["subRegions"] = {
{
["type"] = "subbackground",
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
["height"] = 38,
["rotate"] = true,
["load"] = {
["class_and_spec"] = {
["single"] = 103,
["multi"] = {
[103] = true,
[105] = true,
},
},
["use_ignoreNameRealm"] = false,
["use_class_and_spec"] = false,
["use_class"] = false,
["use_dragonriding"] = false,
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
["DRUID"] = true,
["ROGUE"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["textureWrapMode"] = "CLAMP",
["mirror"] = false,
["regionType"] = "texture",
["blendMode"] = "BLEND",
["width"] = 68,
["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",
["xOffset"] = 0,
["rotation"] = 0,
["semver"] = "2.0.12",
["tocversion"] = 110200,
["id"] = "Combo Point 3",
["color"] = {
0.65098039215686,
0.63137254901961,
0.34901960784314,
1,
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["uid"] = "XBd6PsiZj4p",
["parent"] = "Combo Points",
["conditions"] = {
{
["check"] = {
["value"] = 1,
["variable"] = "show",
},
["changes"] = {
{
["value"] = {
0.11372549019608,
0.11372549019608,
0.11372549019608,
1,
},
["property"] = "color",
},
},
},
{
["check"] = {
["value"] = "3",
["op"] = "==",
["variable"] = "stacks",
},
["changes"] = {
{
["value"] = {
0.015686275437474,
0.74901962280273,
0.75686281919479,
1,
},
["property"] = "color",
},
},
},
},
["information"] = {
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
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
},
["XP Group"] = {
["controlledChildren"] = {
"Experience Bar",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "3GaU4Ttxj",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["groupIcon"] = "132996",
["anchorPoint"] = "TOP",
["borderColor"] = {
0,
0,
0,
1,
},
["url"] = "https://wago.io/LuxthosExperienceBar/44",
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
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["unit"] = "player",
},
["untrigger"] = {
},
},
},
["internalVersion"] = 88,
["selfPoint"] = "BOTTOMLEFT",
["desc"] = "Created by Luxthos & Daemoos\nwww.twitch.tv/luxthos",
["version"] = 44,
["subRegions"] = {
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
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
["zoneIds"] = "",
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["scale"] = 1,
["border"] = false,
["anchorFrameFrame"] = "UIParent",
["regionType"] = "group",
["borderSize"] = 2,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
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
["borderOffset"] = 4,
["semver"] = "11.0.0",
["tocversion"] = 110000,
["id"] = "XP Group",
["yOffset"] = -24.0001220703125,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["borderEdge"] = "Square Full White",
["config"] = {
},
["borderInset"] = 1,
["uid"] = "71NVVv0hq7p",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["groupOffset"] = true,
},
["xOffset"] = -0.9998779296875,
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
["spellIds"] = {
},
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["names"] = {
},
["check"] = "event",
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    if spellID == 121253 then\n        local state = {\n            progressType = \"timed\",\n            duration = 20,\n            expirationTime = GetTime()+20,\n            autoHide = true,\n        }\n        s:Update(\"\", state)\n    elseif spellID == 116670 then\n        s:RemoveAll()\n    end\nend\n\n\n",
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
["useTooltip"] = false,
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
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["selfPoint"] = "CENTER",
["source"] = "import",
["url"] = "",
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
["config"] = {
},
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["cooldownTextDisabled"] = true,
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Vivacious Vivification",
["desaturate"] = false,
["frameStrata"] = 5,
["width"] = 84,
["xOffset"] = -547,
["uid"] = "hdJ1uC4Z6pz",
["inverse"] = false,
["color"] = {
1,
1,
1,
1,
},
["displayIcon"] = 1360980,
["cooldown"] = true,
["progressSource"] = {
-1,
"",
},
},
["DK"] = {
["controlledChildren"] = {
"Runes",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
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
["uid"] = "Fmy)nqpRlhi",
["parent"] = "Classes",
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
["config"] = {
},
["groupIcon"] = 135770,
["borderInset"] = 1,
["conditions"] = {
},
["information"] = {
},
["frameStrata"] = 1,
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
["custom"] = "function(s, e, ...)    \n    if e == \"OPTIONS\" then\n        for k, v in pairs(aura_env.spells) do\n            local iconID = v.iconID or C_Spell.GetSpellInfo(k).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = v.dur,\n                expirationTime = GetTime()+v.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(k, state)\n        end   \n    else        \n        local u, cast, spellID = ... -- Unit event\n        local spell = aura_env.spells[spellID]\n        if spell then\n            local iconID = spell.iconID or C_Spell.GetSpellInfo(spellID).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = spell.dur,\n                expirationTime = GetTime()+spell.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(spellID, state)\n        end\n    end\nend\n\n\n",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["names"] = {
},
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
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMax"] = false,
["useTooltip"] = false,
["source"] = "import",
["cooldown"] = true,
["displayIcon"] = 651727,
["preferToUpdate"] = true,
["keepAspectRatio"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "yYFg2jIj9nh",
["cooldownEdge"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
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
["zoom"] = 0.1,
["cooldownTextDisabled"] = true,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Speedbuffs Midnight",
["alpha"] = 1,
["frameStrata"] = 5,
["width"] = 84,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom_load"] = false,
["do_custom"] = true,
["custom"] = "aura_env.spells = {\n    [116841] = {dur = 6}, -- Tiger's Lust\n    [109132] = {dur = 5, iconID = C_Spell.GetSpellInfo(449582).iconID}, -- Lighter than Air\n    [48265] = {dur = 10}, -- Death's Advance\n    [121536] = {dur = 5}, -- Feather\n    [17] = {dur = 3}, -- Body and Soul\n    [1044] = {dur = 8}, -- Freedom\n    [190784] = {dur = 7}, -- Steed\n    [6544] = {dur = 3.8}, -- Heroic Leap\n    [186257] = {dur = 12}, -- Ascept of the Cheetah\n}",
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
["parent"] = "SpeedBuffs List Midnight",
},
["Rune 4"] = {
["sparkWidth"] = 10,
["sparkOffsetX"] = 0,
["wagoID"] = "3zWD5RhVG",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
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
["internalVersion"] = 88,
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
["parent"] = "Runes",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
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
["enableGradient"] = false,
["source"] = "import",
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
["frameStrata"] = 5,
["information"] = {
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["icon"] = false,
["version"] = 4,
["icon_side"] = "RIGHT",
["gradientOrientation"] = "HORIZONTAL",
["sparkHidden"] = "NEVER",
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
["id"] = "Rune 4",
["anchorFrameParent"] = false,
["alpha"] = 1,
["width"] = 58,
["zoom"] = 0,
["uid"] = "xAkb7UVR4E1",
["inverse"] = true,
["spark"] = false,
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
["spellIds"] = {
},
["events"] = "MERCHANT_SHOW",
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
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["parent"] = "Raid Utils",
["source"] = "import",
["url"] = "",
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["keepAspectRatio"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["icon"] = true,
["uid"] = "(fYpcYICivH",
["desaturate"] = false,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0.1,
["auto"] = false,
["cooldownTextDisabled"] = false,
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
["alpha"] = 1,
["width"] = 1,
["adjustedMax"] = "",
["config"] = {
},
["inverse"] = false,
["xOffset"] = 0,
["displayIcon"] = 133785,
["cooldown"] = true,
["frameStrata"] = 5,
},
["Combo Points"] = {
["grow"] = "RIGHT",
["controlledChildren"] = {
"Combo Point 1",
"Combo Point 2",
"Combo Point 3",
"Combo Point 4",
"Combo Point 5",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = -169,
["yOffset"] = -371.0001831054688,
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
["radius"] = 200,
["selfPoint"] = "LEFT",
["align"] = "CENTER",
["stagger"] = 0,
["borderInset"] = 1,
["subRegions"] = {
},
["config"] = {
},
["groupIcon"] = 535593,
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
["rotation"] = 0,
["backdropColor"] = {
1,
1,
1,
0.5,
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
["animate"] = false,
["gridType"] = "RD",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 5,
["arcLength"] = 360,
["fullCircle"] = true,
["constantFactor"] = "RADIUS",
["internalVersion"] = 88,
["borderOffset"] = 4,
["frameStrata"] = 1,
["gridWidth"] = 5,
["id"] = "Combo Points",
["rowSpace"] = 1,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["sort"] = "none",
["uid"] = "x8OoEyCqf3o",
["regionType"] = "dynamicgroup",
["useLimit"] = false,
["conditions"] = {
},
["information"] = {
},
["authorOptions"] = {
},
},
["Taunts List"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = -1.000000678168403,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["custom"] = "function(s, e, ...)\n    if e == \"OPTIONS\" then\n        for i=1, 3 do\n            local boss = \"boss\"..i\n            local state = {\n                progressType = \"timed\",\n                duration = 6,\n                expirationTime = 6+GetTime(),\n                icon = i <= 2 and C_Spell.GetSpellInfo(aura_env.TauntIcons[1]).iconID or 237552,\n                text = NSAPI:Shorten(\"player\", 8, true, \"GlobalNickNames\", true),\n                autoHide = true,\n            }\n            s:Update(boss, state)\n        end\n    elseif e == \"ENCOUNTER_START\" then\n        aura_env.tanking = {}\n        aura_env.tanks = {}\n        for unit in WA_IterateGroupMembers() do\n            if UnitGroupRolesAssigned(unit) == \"TANK\" and not UnitIsUnit(\"player\", unit) then\n                table.insert(aura_env.tanks, unit)\n            end\n        end\n    elseif e == \"ENCOUNTER_END\" then\n        aura_env.tanking = {}\n        aura_env.tanks = {}        \n    elseif e == \"UNIT_THREAT_SITUATION_UPDATE\" then\n        local unit = ...\n        if UnitGroupRolesAssigned(unit) == \"TANK\" then\n            for i=1, 10 do -- iterate all bosses\n                local boss = \"boss\"..i\n                if UnitExists(boss) then\n                    local isTanking = UnitDetailedThreatSituation(\"player\", boss)\n                    if aura_env.tanking[boss] and not isTanking then \n                        -- if player was previously tanking the boss but isn't anymore\n                        local TankThreat = false\n                        local ThreatUnit = nil\n                        for u in WA_IterateGroupMembers() do\n                            local HasThreat = UnitDetailedThreatSituation(u, boss) \n                            if HasThreat then\n                                ThreatUnit = u\n                                TankThreat = UnitGroupRolesAssigned(u) == \"TANK\"\n                                break\n                            end\n                        end                        \n                        \n                        local state = {\n                            progressType = \"timed\",\n                            duration = 6,\n                            expirationTime = 6+GetTime(),\n                            icon = TankThreat and C_Spell.GetSpellInfo(aura_env.TauntIcons[select(3, UnitClass(ThreatUnit))]).iconID or 237552,\n                            text = NSAPI:Shorten(ThreatUnit, 8, true, \"GlobalNickNames\", true),\n                            TankThreat = TankThreat,\n                            autoHide = true,\n                        }\n                        s:Update(boss, state)\n                        break\n                    end\n                    aura_env.tanking[boss] = isTanking\n                end\n            end\n        end\n    end\nend\n\n\n",
["names"] = {
},
["spellIds"] = {
},
["custom_type"] = "stateupdate",
["check"] = "event",
["events"] = "UNIT_THREAT_SITUATION_UPDATE ENCOUNTER_START ENCOUNTER_END",
["unit"] = "player",
["customVariables"] = "{\n    TankThreat = \"bool\",\n}\n\n\n",
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
["text_shadowXOffset"] = 0,
["text_text_format_p_pad"] = false,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_format"] = "Number",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorXOffset"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_decimal_precision"] = 0,
["type"] = "subtext",
["text_text_format_p_time_precision"] = 1,
["text_color"] = {
1,
1,
0.250980406999588,
1,
},
["text_font"] = "Expressway",
["text_text_format_p_time_format"] = 0,
["text_shadowYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_pad_mode"] = "left",
["text_text_format_p_pad_max"] = 8,
["anchor_point"] = "CENTER",
["text_fontSize"] = 40,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_round_type"] = "ceil",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%text",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "RIGHT",
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
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "OUTER_LEFT",
["text_fontSize"] = 20,
["anchorXOffset"] = 0,
["text_text_format_text_format"] = "none",
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
},
["height"] = 100,
["load"] = {
["role"] = {
["single"] = "TANK",
},
["talent"] = {
["multi"] = {
},
},
["use_role"] = true,
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
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "TankThreat",
["value"] = 0,
},
["changes"] = {
{
["value"] = {
["custom"] = "NSAPI:TTS(\"Aggro Alert\")",
},
["property"] = "customcode",
},
},
},
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "aura_env.TauntIcons = {\n    [1] = 355, -- Warrior\n    [2] = 62124, -- Paladin\n    [6] = 56222, -- DK\n    [10] = 173338, -- Monk\n    [11] = 2649, -- Druid\n    [12] = 185245, -- DH        \n}",
},
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
["information"] = {
},
["keepAspectRatio"] = false,
["uid"] = "ld333az0t65",
["cooldownTextDisabled"] = true,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["id"] = "Taunts List",
["frameStrata"] = 5,
["alpha"] = 1,
["width"] = 100,
["zoom"] = 0,
["config"] = {
},
["inverse"] = false,
["parent"] = "Taunt Tracker",
["displayIcon"] = 136080,
["cooldown"] = true,
["xOffset"] = 0,
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
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    if tContains(aura_env.spells, spellID) then\n        local state = {\n            progressType = \"timed\",\n            duration = 5,\n            expirationTime = GetTime()+5,\n            autoHide = true,\n        }\n        s:Update(\"\", state)\n    end\nend",
["names"] = {
},
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
["xOffset"] = -464.00018310547,
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
["internalVersion"] = 88,
["source"] = "import",
["url"] = "",
["cooldown"] = true,
["displayIcon"] = 516667,
["frameStrata"] = 5,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["stickyDuration"] = false,
["uid"] = "La)8i30w8et",
["adjustedMax"] = "",
["width"] = 84,
["progressSource"] = {
-1,
"",
},
["zoom"] = 0.1,
["cooldownTextDisabled"] = true,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Pretense of Instability Midnight",
["authorOptions"] = {
},
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["parent"] = "Monk Midnight",
["config"] = {
},
["inverse"] = false,
["icon"] = true,
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
["selfPoint"] = "CENTER",
},
["Stagger"] = {
["sparkWidth"] = 10,
["sparkOffsetX"] = 0,
["wagoID"] = "3zWD5RhVG",
["parent"] = "Monk Midnight",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = -342,
["anchorPoint"] = "CENTER",
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
["selfPoint"] = "TOPLEFT",
["iconSource"] = -1,
["xOffset"] = -173,
["barColor"] = {
1,
0.85882359743118,
0.42352944612503,
1,
},
["desaturate"] = false,
["preferToUpdate"] = false,
["zoom"] = 0,
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
["text_text_format_2.dodgepercent_pad"] = false,
["type"] = "subtext",
["text_text_format_3.dodgepercent_decimal_precision"] = 0,
["text_text_format_2.dodgepercent_pad_max"] = 8,
["text_text_format_3.dodgepercent_pad"] = false,
["text_text_format_1.percentpower_round_type"] = "floor",
["text_text_format_2.dodgepercent_decimal_precision"] = 1,
["text_text_format_1.percentpower_format"] = "Number",
["text_text_format_2.dodgepercent_format"] = "Number",
["text_text_format_3.dodgepercent_pad_max"] = 8,
["anchorXOffset"] = 0,
["text_text_format_1.percentpower_decimal_precision"] = 0,
["anchor_point"] = "INNER_RIGHT",
["text_anchorYOffset"] = 0,
["text_font"] = "Expressway",
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
["height"] = 42,
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
["single"] = 268,
},
["size"] = {
["multi"] = {
},
},
},
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["source"] = "import",
["enableGradient"] = false,
["barColor2"] = {
1,
1,
0,
1,
},
["authorOptions"] = {
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["sparkHidden"] = "NEVER",
["version"] = 4,
["icon_side"] = "RIGHT",
["gradientOrientation"] = "HORIZONTAL",
["sparkColor"] = {
1,
1,
1,
1,
},
["sparkHeight"] = 30,
["texture"] = "Solid",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 110207,
["id"] = "Stagger",
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 5,
["width"] = 341,
["alpha"] = 1,
["uid"] = "L5JW2JanCHb",
["inverse"] = false,
["config"] = {
},
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
["semver"] = "1.0.3",
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
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["spellIds"] = {
},
["names"] = {
},
["check"] = "event",
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    local spell = aura_env.spells[spellID]\n    if spell then\n        local iconID = spell.iconID or C_Spell.GetSpellInfo(spellID).iconID\n        local state = {\n            progressType = \"timed\",\n            duration = spell.dur,\n            expirationTime = GetTime()+spell.dur,\n            icon = iconID,\n            autoHide = true,\n        }\n        s:Update(spellID, state)\n    end\nend\n\n\n",
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
["parent"] = "Taunts Midnight List",
["useAdjustededMax"] = false,
["useTooltip"] = false,
["source"] = "import",
["cooldown"] = true,
["displayIcon"] = 136080,
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
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "8spHpyyBSLf",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["progressSource"] = {
-1,
"",
},
["zoom"] = 0.1,
["cooldownTextDisabled"] = true,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Taunts Midnight",
["alpha"] = 1,
["frameStrata"] = 5,
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
["url"] = "",
},
["TotemFrames"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["displayText_format_p_time_format"] = 0,
["url"] = "https://wago.io/3fH2MR2PA/6",
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["icon_color"] = {
1,
1,
1,
1,
},
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["barColor"] = {
1,
0.85882359743118,
0.42352944612503,
1,
},
["desaturate"] = false,
["font"] = "Friz Quadrata TT",
["sparkOffsetY"] = 0,
["load"] = {
["use_never"] = false,
["class_and_spec"] = {
["single"] = 268,
["multi"] = {
[269] = true,
[270] = true,
[268] = true,
},
},
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
["use_class_and_spec"] = false,
["size"] = {
["multi"] = {
},
},
},
["shadowXOffset"] = 1,
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["texture"] = "Solid",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 100002,
["alpha"] = 1,
["sparkColor"] = {
1,
1,
1,
1,
},
["fixedWidth"] = 200,
["outline"] = "OUTLINE",
["sparkOffsetX"] = 0,
["wagoID"] = "3fH2MR2PA",
["color"] = {
1,
1,
1,
1,
},
["adjustedMin"] = "",
["shadowYOffset"] = -1,
["cooldownSwipe"] = true,
["customTextUpdate"] = "event",
["automaticWidth"] = "Auto",
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "status",
["custom_hide"] = "timed",
["event"] = "Health",
["unit"] = "player",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["custom"] = "function(e, ...)\n    if e == \"STATUS\" and not UnitAffectingCombat(\"player\") then\n        aura_env.region.MyFrameCreated = aura_env.region.MyFrameCreated or {}\n        for i=1, 4 do \n            if not aura_env.region.MyFrameCreated[i] then\n                aura_env.region.MyFrameCreated[i] = true\n                local b = CreateFrame(\"Button\",\"MyTotemFrame\"..i,UIParent,\"SecureUnitButtonTemplate\")\n                b:SetAttribute(\"type\", \"destroytotem\")\n                b:SetAttribute(\"totem-slot\", i)\n            end\n        end\n    end\nend",
["names"] = {
},
["check"] = "event",
["events"] = "STATUS",
["spellIds"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "\n\n",
["activeTriggerMode"] = -10,
},
["displayText_format_p_format"] = "timed",
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
["preferToUpdate"] = false,
["information"] = {
},
["displayText"] = "",
["shadowColor"] = {
0,
0,
0,
1,
},
["displayIcon"] = "627607",
["version"] = 6,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%c",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_c_format"] = "none",
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_n_format"] = "none",
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_shadowYOffset"] = -1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = 4,
["text_text_format_1.percentpower_format"] = "Number",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_1.percentpower_decimal_precision"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 20,
["text_text_format_1.precentpower_format"] = "none",
["anchorYOffset"] = 0,
},
{
["text_shadowXOffset"] = 1,
["text_text_format_s_format"] = "BigNumber",
["text_text"] = "%s",
["text_text_format_s_decimal_precision"] = 0,
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
["text_text_format_s_pad_max"] = 8,
["text_text_format_s_pad_mode"] = "left",
["type"] = "subtext",
["text_text_format_s_big_number_format"] = "AbbreviateNumbers",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_text_format_n_format"] = "none",
["text_shadowYOffset"] = -1,
["text_anchorYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_s_pad"] = false,
["text_visible"] = true,
["anchor_point"] = "INNER_LEFT",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_s_round_type"] = "floor",
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
["height"] = 64,
["displayText_format_p_time_mod_rate"] = true,
["wordWrap"] = "WordWrap",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["fontSize"] = 12,
["source"] = "import",
["config"] = {
},
["width"] = 64,
["useCooldownModRate"] = true,
["zoom"] = 0.1,
["sparkHidden"] = "NEVER",
["uid"] = "1NOckBRhuux",
["semver"] = "1.0.5",
["cooldownTextDisabled"] = true,
["icon_side"] = "RIGHT",
["xOffset"] = 0,
["icon"] = false,
["displayText_format_p_time_precision"] = 1,
["sparkHeight"] = 30,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
},
},
["justify"] = "LEFT",
["displayText_format_p_time_dynamic_threshold"] = 60,
["id"] = "TotemFrames",
["customText"] = "function()\n    if aura_env.state then\n        for i=1, 4 do\n            local name = select(2, GetTotemInfo(i))\n            if name == aura_env.state.totemName then\n                return i\n            end\n        end\n    end\nend",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["inverse"] = false,
["displayText_format_p_time_legacy_floor"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["cooldown"] = false,
["parent"] = "Statues",
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
["frameStrata"] = 1,
["rotation"] = 0,
["stepAngle"] = 15,
["yOffset"] = 145.99993896484,
["subRegions"] = {
},
["borderColor"] = {
0,
0,
0,
1,
},
["gridType"] = "RD",
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
["stagger"] = 0,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["grow"] = "UP",
["animate"] = false,
["radius"] = 200,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["borderInset"] = 1,
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
["constantFactor"] = "RADIUS",
["gridWidth"] = 5,
["borderOffset"] = 4,
["uid"] = "nNlYP1tIoda",
["tocversion"] = 120001,
["id"] = "ExternalDefensives",
["rowSpace"] = 1,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["sort"] = "none",
["config"] = {
},
["anchorPoint"] = "CENTER",
["useLimit"] = false,
["conditions"] = {
},
["information"] = {
},
["authorOptions"] = {
},
},
["Raid Util » Tradeable Item Icons"] = {
["outline"] = "OUTLINE",
["iconSource"] = -1,
["wagoID"] = "_YQvexEpx",
["parent"] = "Raid Util » Holding Tradeable Item",
["displayText"] = "%p",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = false,
["internalVersion"] = 88,
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
["custom"] = "function(allstates, event)\n    \n    if event == \"BAG_UPDATE_DELAYED\" then\n        local challengeModeActive = C_ChallengeMode.IsChallengeModeActive()\n        \n        local guildCheck = false\n        for unit in WA_IterateGroupMembers() do\n            if unit ~= \"player\" then\n                if UnitIsInMyGuild(unit) then\n                    guildCheck = true\n                end\n            end\n        end\n        \n        if (aura_env.config.guildshow and guildCheck == false) or (aura_env.config.keyhide and challengeModeActive) then return end\n        \n        if (aura_env.config.guildshow and guildCheck == true) or (aura_env.config.keyhide and not challengeModeActive) or not aura_env.config.guildshow or not aura_env.config.keyhide then\n            \n            for bagID = BACKPACK_CONTAINER, NUM_BAG_SLOTS do\n                for slot = 1, C_Container.GetContainerNumSlots(bagID) do\n                    local icon, itemLink, remainingTime = aura_env.getRemainingTime(bagID, slot)\n                    \n                    if itemLink then\n                        \n                        allstates[bagID..slot] = {\n                            show = true,\n                            changed = true,\n                            progressType = \"timed\",\n                            duration = 10, -- 4 hours\n                            expirationTime = GetTime() + remainingTime,\n                            autoHide = true,\n                            name = itemLink,\n                            link = itemLink,\n                            icon = icon\n                        }\n                    else\n                        allstates[bagID..slot] = {\n                            show = false,\n                            changed = true\n                        }\n                    end\n                    \n                end\n            end\n            return true\n        end\n    end\n    \n    -- Setting up preview stuff\n    if event == \"OPTIONS\" then\n        local examples = {\n            [230027] =  300,\n            [228842] = 1000,\n            [230198] = 9000\n        }\n        for itemID, remainingTime in pairs(examples) do\n            local _, itemLink, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)\n            \n            allstates[itemID] = {\n                show = true,\n                changed = true,\n                progressType = \"timed\",\n                duration = 4 * 60 * 60, -- 4 hours\n                expirationTime = GetTime() + remainingTime,\n                autoHide = true,\n                name = itemLink,\n                icon = icon\n            }\n        end\n        return true\n    end\nend",
["names"] = {
},
["check"] = "event",
["events"] = "BAG_UPDATE_DELAYED",
["spellIds"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["color"] = {
1,
1,
1,
1,
},
["useTooltip"] = true,
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
["customText"] = "function()\n    if WeakAuras.IsOptionsOpen() then\n        return ICON_LIST[math.random(1,8)]..\"13|t\"\n    end\nend",
["fixedWidth"] = 200,
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
["text_text_format_unitName_abbreviate_max"] = 8,
["text_text_format_u_pad_mode"] = "left",
["text_text_format_unit_realm_name"] = "never",
["text_color"] = {
0.21960785984993,
1,
0,
1,
},
["text_text_format_unitName_abbreviate"] = true,
["text_text_format_unit_abbreviate"] = false,
["text_shadowYOffset"] = 0,
["text_text_format_unit_format"] = "Unit",
["text_text_format_destName_abbreviate_max"] = 8,
["text_visible"] = true,
["text_text_format_destName_pad_mode"] = "left",
["text_text_format_unitname_format"] = "none",
["text_text_format_u_realm_name"] = "never",
["text_fontSize"] = 18,
["anchorXOffset"] = 0,
["text_text_format_destName_color"] = "class",
["text_text_format_n_format"] = "none",
["text_text_format_destName_pad"] = false,
["text_text_format_p_time_precision"] = 1,
["text_text_format_unit_color"] = "none",
["text_shadowXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
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
["text_text_format_destGUID_abbreviate"] = false,
["text_text_format_u_abbreviate"] = false,
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_destGUID_format"] = "guid",
["text_text_format_unit_pad_mode"] = "left",
["text_text_format_unitCaster_abbreviate"] = false,
["text_text_format_sourceGUID_abbreviate"] = false,
["anchor_point"] = "OUTER_RIGHT",
["text_text_format_destGUID_pad"] = false,
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
["keepAspectRatio"] = false,
["wordWrap"] = "WordWrap",
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
["selfPoint"] = "BOTTOM",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["semver"] = "1.0.10",
["desaturate"] = false,
["cooldownEdge"] = false,
["uid"] = "U3S6qz68pUz",
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
["anchorFrameParent"] = false,
["width"] = 40,
["alpha"] = 1,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 110205,
["id"] = "Raid Util » Tradeable Item Icons",
["useCooldownModRate"] = true,
["frameStrata"] = 5,
["anchorFrameType"] = "SCREEN",
["justify"] = "LEFT",
["config"] = {
["guildshow"] = true,
["keyhide"] = true,
},
["inverse"] = false,
["cooldownTextDisabled"] = false,
["adjustedMax"] = "",
["displayIcon"] = 2967107,
["cooldown"] = true,
["xOffset"] = 0,
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
["borderInset"] = 1,
["authorOptions"] = {
},
["sortHybridTable"] = {
["Raid Util » Tradeable Item Icons"] = false,
},
["stagger"] = 0,
["grow"] = "DOWN",
["version"] = 11,
["subRegions"] = {
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
["yOffset"] = -507.00024414063,
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
["xOffset"] = -650,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["config"] = {
},
["animate"] = false,
["rotation"] = 0,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["sort"] = "none",
["stepAngle"] = 15,
["gridWidth"] = 5,
["constantFactor"] = "RADIUS",
["rowSpace"] = 1,
["borderOffset"] = 4,
["semver"] = "1.0.10",
["tocversion"] = 110205,
["id"] = "Raid Util » Holding Tradeable Item",
["limit"] = 5,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "TOP",
["uid"] = "bX)sPI(rPbM",
["gridType"] = "RD",
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
["Rune 2"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["wagoID"] = "3zWD5RhVG",
["parent"] = "Runes",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["width"] = 57,
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
["enableGradient"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["xOffset"] = 0,
["adjustedMax"] = "",
["barColor"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
1,
},
["desaturate"] = false,
["authorOptions"] = {
},
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
["class_and_spec"] = {
["single"] = 250,
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
["alpha"] = 1,
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
["height"] = 42,
["id"] = "Rune 2",
["anchorFrameParent"] = false,
["texture"] = "Solid",
["config"] = {
},
["zoom"] = 0,
["spark"] = false,
["tocversion"] = 110207,
["sparkHidden"] = "NEVER",
["sparkHeight"] = 30,
["frameStrata"] = 5,
["anchorFrameType"] = "SCREEN",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["uid"] = "lRFMXfW1)xs",
["inverse"] = true,
["semver"] = "1.0.3",
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
["auranames"] = {
"",
},
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
["useExactSpellId"] = true,
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
["keepAspectRatio"] = false,
["adjustedMax"] = "",
["authorOptions"] = {
},
["cooldown"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["conditions"] = {
},
["stickyDuration"] = false,
["parent"] = "Stuff",
["config"] = {
},
["alpha"] = 1,
["frameStrata"] = 1,
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110207,
["id"] = "No Rune",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 66,
["selfPoint"] = "CENTER",
["uid"] = "yufHk9hEgT5",
["inverse"] = false,
["icon"] = true,
["displayIcon"] = 134425,
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["xOffset"] = 343,
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
["automaticWidth"] = "Auto",
["fontSize"] = 20,
["xOffset"] = 0,
["wordWrap"] = "WordWrap",
["shadowXOffset"] = 0,
["conditions"] = {
},
["useTooltip"] = false,
["displayText_format_c_format"] = "none",
["regionType"] = "text",
["color"] = {
1,
1,
1,
1,
},
["uid"] = "jc7xEhQS3PF",
["displayText"] = "%c Reset Boss %c",
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
["frameStrata"] = 5,
["anchorFrameType"] = "SCREEN",
["internalVersion"] = 88,
["config"] = {
},
["displayText_format_c1_format"] = "none",
["preferToUpdate"] = false,
["shadowColor"] = {
0,
0,
0,
1,
},
["fixedWidth"] = 200,
["information"] = {
},
["displayText_format_p_format"] = "timed",
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
["internalVersion"] = 88,
["borderColor"] = {
0,
0,
0,
1,
},
["stagger"] = 0,
["rotation"] = 0,
["useLimit"] = true,
["subRegions"] = {
},
["anchorPoint"] = "CENTER",
["gridType"] = "RD",
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
["arcLength"] = 360,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["uid"] = "1RWcI04XhUB",
["animate"] = false,
["space"] = -1,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 5,
["regionType"] = "dynamicgroup",
["alpha"] = 1,
["constantFactor"] = "RADIUS",
["authorOptions"] = {
},
["borderOffset"] = 4,
["config"] = {
},
["tocversion"] = 110205,
["id"] = "SpeedBuffs List Midnight",
["sort"] = "none",
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["borderInset"] = 1,
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
["parent"] = "Classes",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
},
["groupIcon"] = 132307,
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
["custom"] = "function(e, ...)\n    if e ~= \"OPTIONS\" and CanMerchantRepair() then\n        RepairAllItems()\n    end\nend",
["events"] = "MERCHANT_SHOW",
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
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["stickyDuration"] = false,
["uid"] = "NtzSLX0TVL0",
["keepAspectRatio"] = false,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.1,
["semver"] = "1.0.0",
["tocversion"] = 110205,
["id"] = "Repair",
["parent"] = "Raid Utils",
["frameStrata"] = 5,
["width"] = 1,
["cooldownEdge"] = false,
["config"] = {
},
["inverse"] = false,
["xOffset"] = 0,
["displayIcon"] = 136241,
["cooldown"] = true,
["alpha"] = 1,
},
["Rune 6"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["wagoID"] = "3zWD5RhVG",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["width"] = 58,
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
["class_and_spec"] = {
["single"] = 250,
},
["spec"] = {
["multi"] = {
},
},
["use_zoneIds"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["use_class_and_spec"] = true,
["use_never"] = false,
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
["frameStrata"] = 5,
["barColor2"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
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
["sparkOffsetY"] = 0,
["icon_side"] = "RIGHT",
["gradientOrientation"] = "HORIZONTAL",
["sparkHidden"] = "NEVER",
["sparkHeight"] = 30,
["texture"] = "Solid",
["sparkColor"] = {
1,
1,
1,
1,
},
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 110207,
["id"] = "Rune 6",
["anchorFrameParent"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0,
["uid"] = "dJG0h7O2cQ4",
["inverse"] = true,
["semver"] = "1.0.3",
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
["useLimit"] = false,
["frameStrata"] = 1,
["stagger"] = 0,
["gridType"] = "RD",
["sortHybridTable"] = {
["Taunts Midnight"] = false,
},
["subRegions"] = {
},
["arcLength"] = 360,
["alpha"] = 1,
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
["fullCircle"] = true,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["rotation"] = 0,
["animate"] = false,
["uid"] = "Cnj8QSk8811",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 5,
["sort"] = "none",
["xOffset"] = 190,
["constantFactor"] = "RADIUS",
["config"] = {
},
["borderOffset"] = 4,
["rowSpace"] = 1,
["tocversion"] = 110205,
["id"] = "Taunts Midnight List",
["yOffset"] = 246,
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["regionType"] = "dynamicgroup",
["borderInset"] = 1,
["internalVersion"] = 88,
["authorOptions"] = {
},
["conditions"] = {
},
["information"] = {
},
["selfPoint"] = "BOTTOM",
},
["Combo Point 5"] = {
["wagoID"] = "OaJQX6khW",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["url"] = "https://wago.io/OaJQX6khW/30",
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
["use_power"] = true,
["use_showCost"] = false,
["unit"] = "player",
["powertype"] = 4,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["unevent"] = "auto",
["power_operator"] = {
">=",
},
["event"] = "Power",
["duration"] = "1",
["names"] = {
},
["use_showChargedComboPoints"] = false,
["spellIds"] = {
},
["use_absorbMode"] = true,
["power"] = {
"5",
},
["subeventSuffix"] = "_CAST_START",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["discrete_rotation"] = 0,
["version"] = 30,
["subRegions"] = {
{
["type"] = "subbackground",
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
["height"] = 38,
["rotate"] = true,
["load"] = {
["class_and_spec"] = {
["single"] = 103,
["multi"] = {
[103] = true,
[105] = true,
},
},
["use_ignoreNameRealm"] = false,
["use_class_and_spec"] = false,
["use_class"] = false,
["use_dragonriding"] = false,
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
["DRUID"] = true,
["ROGUE"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["textureWrapMode"] = "CLAMP",
["mirror"] = false,
["regionType"] = "texture",
["blendMode"] = "BLEND",
["width"] = 68,
["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",
["xOffset"] = 0,
["rotation"] = 0,
["semver"] = "2.0.12",
["tocversion"] = 110200,
["id"] = "Combo Point 5",
["color"] = {
0.1843137254902,
0.63137254901961,
0.2,
1,
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["uid"] = "BxmUU29tWwE",
["parent"] = "Combo Points",
["conditions"] = {
{
["check"] = {
["value"] = 1,
["variable"] = "show",
},
["changes"] = {
{
["value"] = {
0.11372549019608,
0.11372549019608,
0.11372549019608,
1,
},
["property"] = "color",
},
},
},
},
["information"] = {
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
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
},
["Taunt Tracker"] = {
["grow"] = "UP",
["controlledChildren"] = {
"Taunts List",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 448,
["yOffset"] = 175,
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 2,
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
["columnSpace"] = 1,
["radius"] = 200,
["selfPoint"] = "BOTTOM",
["align"] = "CENTER",
["stagger"] = 0,
["stepAngle"] = 15,
["subRegions"] = {
},
["config"] = {
},
["gridType"] = "RD",
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
["arcLength"] = 360,
["animate"] = false,
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
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["rotation"] = 0,
["internalVersion"] = 88,
["constantFactor"] = "RADIUS",
["useLimit"] = false,
["borderOffset"] = 4,
["alpha"] = 1,
["frameStrata"] = 1,
["id"] = "Taunt Tracker",
["rowSpace"] = 1,
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["sort"] = "none",
["borderInset"] = 1,
["uid"] = "zYGECEKETtf",
["fullCircle"] = true,
["conditions"] = {
},
["information"] = {
},
["groupIcon"] = 136080,
},
["Combo Point 4"] = {
["wagoID"] = "OaJQX6khW",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["url"] = "https://wago.io/OaJQX6khW/30",
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
["use_power"] = true,
["use_showCost"] = false,
["unit"] = "player",
["powertype"] = 4,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["unevent"] = "auto",
["power_operator"] = {
">=",
},
["event"] = "Power",
["duration"] = "1",
["names"] = {
},
["use_showChargedComboPoints"] = false,
["spellIds"] = {
},
["use_absorbMode"] = true,
["power"] = {
"4",
},
["subeventSuffix"] = "_CAST_START",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["discrete_rotation"] = 0,
["version"] = 30,
["subRegions"] = {
{
["type"] = "subbackground",
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
["height"] = 38,
["rotate"] = true,
["load"] = {
["class_and_spec"] = {
["single"] = 103,
["multi"] = {
[103] = true,
[105] = true,
},
},
["use_ignoreNameRealm"] = false,
["use_class_and_spec"] = false,
["use_class"] = false,
["use_dragonriding"] = false,
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
["DRUID"] = true,
["ROGUE"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["textureWrapMode"] = "CLAMP",
["mirror"] = false,
["regionType"] = "texture",
["blendMode"] = "BLEND",
["width"] = 68,
["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",
["xOffset"] = 0,
["rotation"] = 0,
["semver"] = "2.0.12",
["tocversion"] = 110200,
["id"] = "Combo Point 4",
["color"] = {
0.56078431372549,
0.63137254901961,
0.34117647058824,
1,
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["uid"] = "aaNfDNvyC27",
["parent"] = "Combo Points",
["conditions"] = {
{
["check"] = {
["value"] = 1,
["variable"] = "show",
},
["changes"] = {
{
["value"] = {
0.11372549019608,
0.11372549019608,
0.11372549019608,
1,
},
["property"] = "color",
},
},
},
},
["information"] = {
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
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
},
["Combo Point 2"] = {
["wagoID"] = "OaJQX6khW",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["url"] = "https://wago.io/OaJQX6khW/30",
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
["use_power"] = true,
["use_showCost"] = false,
["unit"] = "player",
["powertype"] = 4,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["unevent"] = "auto",
["power_operator"] = {
">=",
},
["event"] = "Power",
["duration"] = "1",
["names"] = {
},
["use_showChargedComboPoints"] = false,
["spellIds"] = {
},
["use_absorbMode"] = true,
["power"] = {
"2",
},
["subeventSuffix"] = "_CAST_START",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["discrete_rotation"] = 0,
["version"] = 30,
["subRegions"] = {
{
["type"] = "subbackground",
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
["height"] = 38,
["rotate"] = true,
["load"] = {
["class_and_spec"] = {
["single"] = 103,
["multi"] = {
[103] = true,
[105] = true,
},
},
["use_ignoreNameRealm"] = false,
["use_class_and_spec"] = false,
["use_class"] = false,
["use_dragonriding"] = false,
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
["DRUID"] = true,
["ROGUE"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["textureWrapMode"] = "CLAMP",
["mirror"] = false,
["regionType"] = "texture",
["blendMode"] = "BLEND",
["width"] = 68,
["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",
["xOffset"] = 0,
["rotation"] = 0,
["semver"] = "2.0.12",
["tocversion"] = 110200,
["id"] = "Combo Point 2",
["color"] = {
0.74901962280273,
0.46666669845581,
0.2549019753933,
1,
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["uid"] = "ftwtaBrmN4X",
["parent"] = "Combo Points",
["conditions"] = {
{
["check"] = {
["value"] = 1,
["variable"] = "show",
},
["changes"] = {
{
["value"] = {
0.11372549019608,
0.11372549019608,
0.11372549019608,
1,
},
["property"] = "color",
},
},
},
{
["check"] = {
["value"] = "2",
["op"] = ">=",
["variable"] = "stacks",
},
["changes"] = {
{
["value"] = {
0.015686275437474,
0.74901962280273,
0.75686281919479,
1,
},
["property"] = "color",
},
},
},
},
["information"] = {
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
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
},
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
["events"] = "ENCOUNTER_END, LOOT_OPENED, CHAT_MSG_MONEY",
["custom"] = "function(allstates, event, _, _, _, _, success)\n    \n    -- Trigger WA on encounter ending & boss killed\n    if event == \"ENCOUNTER_END\" and success == 1 then\n        allstates[\"\"] = {\n            show = true,\n            changed = true,\n            expirationTime = GetTime() + 20,\n            duration = 20,\n            autoHide = true\n        }\n        return true\n        \n        -- Untrigger WA when loot window gets opened or you loot something.    \n    elseif event == \"LOOT_OPENED\" or event == \"CHAT_MSG_MONEY\" then\n        if allstates[\"\"] then\n            allstates[\"\"].changed = true\n            allstates[\"\"].show = false\n            return true\n        end\n    end\nend",
["subeventPrefix"] = "SPELL",
["check"] = "event",
["custom_type"] = "stateupdate",
["spellIds"] = {
},
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
["frameStrata"] = 5,
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
["borderInset"] = 1,
["borderOffset"] = 4,
["parent"] = "Classes",
["tocversion"] = 110205,
["id"] = "Monk Midnight",
["groupIcon"] = 608951,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["config"] = {
},
["xOffset"] = 2,
["uid"] = "1WoSSFg3fDC",
["conditions"] = {
},
["information"] = {
},
["selfPoint"] = "CENTER",
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
["stepAngle"] = 15,
["borderColor"] = {
0,
0,
0,
1,
},
["rotation"] = 0,
["rowSpace"] = 1,
["internalVersion"] = 88,
["subRegions"] = {
},
["parent"] = "DK",
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
["useLimit"] = false,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["uid"] = "704PxvTc67F",
["animate"] = false,
["arcLength"] = 360,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 1,
["sort"] = "ascending",
["limit"] = 5,
["alpha"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["anchorPoint"] = "CENTER",
["borderOffset"] = 1,
["gridWidth"] = 5,
["tocversion"] = 110207,
["id"] = "Runes",
["config"] = {
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["groupIcon"] = 237529,
["borderInset"] = 0,
["xOffset"] = -171,
["stagger"] = 0,
["conditions"] = {
},
["information"] = {
},
["gridType"] = "RD",
},
["Rune 3"] = {
["sparkWidth"] = 10,
["sparkOffsetX"] = 0,
["wagoID"] = "3zWD5RhVG",
["parent"] = "Runes",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["width"] = 58,
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
["init"] = {
},
["finish"] = {
},
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
["class_and_spec"] = {
["single"] = 250,
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
["enableGradient"] = false,
["source"] = "import",
["selfPoint"] = "CENTER",
["frameStrata"] = 5,
["barColor2"] = {
0.50196081399918,
0.50196081399918,
0.50196081399918,
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
["version"] = 4,
["icon_side"] = "RIGHT",
["height"] = 42,
["id"] = "Rune 3",
["anchorFrameParent"] = false,
["texture"] = "Solid",
["uid"] = "0Aqk1JTtGSm",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["semver"] = "1.0.3",
["tocversion"] = 110207,
["sparkHidden"] = "NEVER",
["sparkHeight"] = 30,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0,
["config"] = {
},
["inverse"] = true,
["spark"] = false,
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
["difficulty"] = {
},
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
["semver"] = "1.0.47",
["justify"] = "LEFT",
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
["Experience Bar"] = {
["sparkWidth"] = 10,
["iconSource"] = 0,
["xOffset"] = -5.38461580123098,
["adjustedMax"] = "",
["yOffset"] = 16.92279653169727,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://wago.io/LuxthosExperienceBar/44",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["useTooltip"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
0.33725491166115,
0.38823533058166,
1,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_petbattle"] = false,
["use_level"] = false,
["talent"] = {
["multi"] = {
},
},
["level_operator"] = {
"<",
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
["level"] = {
"80",
},
["use_never"] = false,
["size"] = {
["multi"] = {
},
},
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["overlayclip"] = true,
["texture"] = "Solid",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 110000,
["alpha"] = 1,
["sparkColor"] = {
1,
1,
1,
1,
},
["displayIcon"] = 894556,
["sparkOffsetX"] = 0,
["wagoID"] = "3GaU4Ttxj",
["parent"] = "XP Group",
["adjustedMin"] = "",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["duration"] = "1",
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "",
["unit"] = "player",
["customOverlay1"] = "",
["use_genericShowOn"] = true,
["debuffType"] = "HELPFUL",
["spellIds"] = {
},
["custom_hide"] = "custom",
["events"] = "LWA_EXPERIENCE_UPDATE",
["type"] = "custom",
["use_spellName"] = true,
["custom_type"] = "stateupdate",
["realSpellName"] = 0,
["unevent"] = "timed",
["event"] = "Combat Log",
["spellName"] = {
0,
},
["customDuration"] = "",
["customName"] = "",
["custom"] = "function(allstates, event, ...)\n    local env = aura_env\n    local cfg = env.config\n    local show = not env.IsXPUserDisabled() and (cfg[\"showmaxlevel\"] or not env.isPlayerMaxLevel)\n    \n    if env.timerHandler then\n        env.timerHandler:Cancel()\n        env.timerHandler = nil\n    end\n    \n    allstates[\"\"] = allstates[\"\"] or { show = false }\n    \n    if show then\n        local WAS = env.GetSavedVars()\n        local session = WAS.session\n        local level = env.level or UnitLevel(\"player\")\n        local totalTime = session.realTotalTime or 0\n        local levelTime = session.realLevelTime or 0\n        local currentTime, sessionTime = time(), 0\n        local hourlyXP, timeToLevel = 0, 0\n        local gainedXP = session.gainedXP or 0\n        local currentXP = UnitXP(\"player\") or 0\n        local totalXP = UnitXPMax(\"player\") or 0\n        local remainingXP = totalXP - currentXP\n        local restedXP = GetXPExhaustion() or 0\n        local questXP = env.questXP or 0\n        local completeXP = env.completeXP or 0\n        local incompleteXP = env.incompleteXP or 0\n        \n        if cfg[\"leveltime-text\"] and session.lastTimePlayedRequest > 0 then\n            totalTime = currentTime - session.lastTimePlayedRequest + session.realTotalTime\n            levelTime = currentTime - session.lastTimePlayedRequest + session.realLevelTime\n        end\n        \n        if cfg[\"sessiontime-text\"] or cfg[\"showxphour-text\"] then\n            if session.startTime > 0 then\n                sessionTime = currentTime - session.startTime\n                \n                local coeff = sessionTime / 3600\n                \n                if coeff > 0 and gainedXP > 0 then\n                    hourlyXP = ceil(gainedXP / coeff)\n                    timeToLevel = ceil(remainingXP / hourlyXP * 3600)\n                end\n            end\n        end\n        \n        allstates[\"\"] = {\n            show = true,\n            changed = true,\n            progressType = \"static\",\n            value = currentXP,\n            total = totalXP,\n            \n            -- Usable Variables\n            level = level,\n            currentXP = currentXP,\n            totalXP = totalXP,\n            remainingXP = remainingXP,\n            restedXP = restedXP,\n            questXP = questXP,\n            completeXP = completeXP,\n            incompleteXP = incompleteXP,\n            hourlyXP = hourlyXP,\n            timeToLevel = timeToLevel,\n            timeToLevelText = timeToLevel > 0 and env.FormatTime(timeToLevel) or \"--\",\n            totalTime = totalTime,\n            totalTimeText = env.FormatTime(totalTime),\n            levelTime = levelTime,\n            levelTimeText = env.FormatTime(levelTime),\n            sessionTime = sessionTime,\n            sessionTimeText = env.FormatTime(sessionTime),\n            percentXP = totalXP > 0 and ((currentXP / totalXP) * 100) or 0,\n            percentremaining = totalXP > 0 and ((remainingXP / totalXP) * 100) or 0,\n            percentrested = totalXP > 0 and ((restedXP / totalXP) * 100) or 0,\n            percentquest = totalXP > 0 and ((questXP / totalXP) * 100) or 0,\n            percentcomplete = totalXP > 0 and ((completeXP / totalXP) * 100) or 0,\n            percentincomplete = totalXP > 0 and ((incompleteXP / totalXP) * 100) or 0,\n            totalpercentcomplete = totalXP > 0 and (((completeXP + currentXP) / totalXP) * 100) or 0,\n            \n            additionalProgress = {\n                {\n                    -- Complete Quest XP\n                    direction = \"forward\",\n                    width = completeXP\n                },\n                {\n                    -- Incomplete Quest XP\n                    direction = \"forward\",\n                    width = env.config[\"showincompletequest-bar\"] and incompleteXP or 0,\n                    offset = completeXP,\n                },\n                {\n                    -- Rested XP\n                    direction = \"forward\",\n                    width = restedXP,\n                    offset = completeXP + (env.config[\"showincompletequest-bar\"] and incompleteXP or 0)\n                }\n            }\n        }\n        \n        env.UpdateCustomTexts(allstates[\"\"])\n        \n        env.timerHandler = C_Timer.NewTimer(1, function()\n                WeakAuras.ScanEvents(\"LWA_EXPERIENCE_UPDATE\")\n        end)\n        \n        return true\n        \n    elseif allstates[\"\"][\"show\"] then\n        allstates[\"\"] = {\n            show = false,\n            changed = true,\n        }\n        \n        return true\n    end\nend",
["subeventSuffix"] = "",
["check"] = "event",
["names"] = {
},
["use_track"] = true,
["customVariables"] = "{\n    additionalProgress = 3,\n    \n    level = {\n        display = WeakAuras.L[\"Level\"],\n        type = \"number\",\n    },\n    currentXP = {\n        display = WeakAuras.L[\"Current Experience\"],\n        type = \"number\",\n    },\n    percentXP = {\n        display = WeakAuras.L[\"Experience (%)\"],\n        type = \"number\",\n    },\n    totalXP = {\n        display = WeakAuras.L[\"Total Experience\"],\n        type = \"number\",\n    },\n    remainingXP = {\n        display = WeakAuras.L[\"Remaining Experience\"],\n        type = \"number\",\n    },\n    percentremaining = {\n        display = WeakAuras.L[\"Remaining Experience (%)\"],\n        type = \"number\",\n    },\n    restedXP = {\n        display = WeakAuras.L[\"Rested Experience\"],\n        type = \"number\",\n    },\n    percentrested = {\n        display = WeakAuras.L[\"Rested Experience (%)\"],\n        type = \"number\",\n    },\n    questXP = {\n        display = WeakAuras.L[\"Quest Experience\"],\n        type = \"number\",\n    },\n    percentquest = {\n        display = WeakAuras.L[\"Quest Experience (%)\"],\n        type = \"number\",\n    },\n    completeXP = {\n        display = WeakAuras.L[\"Completed Experience\"],\n        type = \"number\",\n    },\n    percentcomplete = {\n        display = WeakAuras.L[\"Completed Experience (%)\"],\n        type = \"number\",\n    }\n}",
},
["untrigger"] = {
["custom"] = "",
},
},
{
["trigger"] = {
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "",
["debuffType"] = "HELPFUL",
["type"] = "custom",
["spellName"] = {
0,
},
["subeventSuffix"] = "",
["unit"] = "player",
["custom_type"] = "event",
["event"] = "Combat Log",
["custom"] = "function(event, arg1, arg2, arg3, arg4, ...)\n    local env = aura_env\n    local cfg = env.config\n    local WAS = env.GetSavedVars()\n    local session = WAS.session\n    local currentXP = UnitXP(\"player\")\n    local maxXP = UnitXPMax(\"player\")\n    local currentTime = time()\n    \n    --print(event, arg1, arg2)\n    \n    if env.timerHandler then\n        env.timerHandler:Cancel()\n        env.timerHandler = nil\n    end\n    \n    if \"PLAYER_ENTERING_WORLD\" == event then\n        if arg1 or (arg2 and cfg.reset_reload) then\n            session.gainedXP = 0\n            session.lastXP = currentXP\n            session.maxXP = maxXP\n            session.startTime = currentTime\n        end\n        \n        if arg1 or arg2 then\n            session.realTotalTime = 0\n            session.realLevelTime = 0\n            session.lastTimePlayedRequest = 0\n            \n            if StatusTrackingBarManager then\n                if cfg.hide_xpbar then\n                    StatusTrackingBarManager:Hide()\n                    StatusTrackingBarManager.Show = nop\n                else\n                    UIParent.Show(StatusTrackingBarManager)\n                end\n            end\n        end\n        \n        if cfg[\"leveltime-text\"] and session.lastTimePlayedRequest <= 0 then\n            env.RequestTimePlayed()\n        end\n        \n    elseif \"PLAYER_LEVEL_UP\" == event then\n        env.level = arg1 or env.level\n        env.isPlayerMaxLevel = env.level >= env.GetMaxLevel()\n        \n        session.realLevelTime = 0\n        session.maxXP = maxXP\n        \n        session.lastTimePlayedRequest = currentTime\n        \n    elseif \"UPDATE_EXPANSION_LEVEL\" == event or \"MAX_EXPANSION_LEVEL_UPDATED\" == event then\n        local minExpLevel, maxExpLevel\n        \n        if arg3 then\n            minExpLevel = min(arg1, arg2, arg3, arg4)\n            maxExpLevel = max(arg1, arg2, arg3, arg4)\n        else\n            minExpLevel = GetExpansionLevel()\n            maxExpLevel = minExpLevel\n        end\n        \n        env.isPlayerMaxLevel = env.level >= env.GetMaxLevel(maxExpLevel)\n        \n        if env.level == GetMaxLevelForExpansionLevel(minExpLevel) or (currentTime - session.startTime >= (86400 * 3)) then\n            session.startTime = currentTime\n        end\n    elseif \"QUEST_LOG_UPDATE\" == event or (\"UNIT_QUEST_LOG_CHANGED\" == event and arg1 == \"player\") then\n        env.UpdateQuestXP()\n        \n    elseif \"TIME_PLAYED_MSG\" == event and arg2 then\n        session.realTotalTime = arg1\n        session.realLevelTime = arg2\n        \n        session.lastTimePlayedRequest = currentTime\n        \n        env.ClearTickerRTP()\n        \n    elseif \"PLAYER_XP_UPDATE\" == event then\n        local gainedXP = currentXP - session.lastXP\n        \n        if gainedXP < 0 then\n            gainedXP = session.maxXP - session.lastXP + currentXP\n        end\n        \n        session.gainedXP = session.gainedXP + gainedXP\n        session.lastXP = currentXP\n        session.maxXP = maxXP\n        \n    elseif \"OPTIONS\" == event then\n        if cfg[\"leveltime-text\"] then\n            if session.lastTimePlayedRequest <= 0 or WeakAuras.IsImporting() then\n                env.RequestTimePlayed()\n            end\n        else\n            env.ClearTickerRTP()\n        end\n        \n        if currentTime - session.startTime >= (86400 * 3) then\n            session.startTime = currentTime\n        end\n        \n        if StatusTrackingBarManager then\n            if cfg.hide_xpbar then\n                StatusTrackingBarManager:Hide()\n                StatusTrackingBarManager.Show = nop\n            else\n                UIParent.Show(StatusTrackingBarManager)\n            end\n        end\n    end\n    \n    WeakAuras.ScanEvents(\"LWA_EXPERIENCE_UPDATE\")\n    \n    return true\nend",
["realSpellName"] = 0,
["use_spellName"] = true,
["events"] = "PLAYER_ENTERING_WORLD QUEST_LOG_UPDATE UNIT_QUEST_LOG_CHANGED PLAYER_XP_UPDATE PLAYER_LEVEL_UP UPDATE_EXHAUSTION UPDATE_EXPANSION_LEVEL MAX_EXPANSION_LEVEL_UPDATED TIME_PLAYED_MSG ENABLE_XP_GAIN DISABLE_XP_GAIN",
["unevent"] = "timed",
["check"] = "event",
["duration"] = "1",
["use_track"] = true,
["custom_hide"] = "custom",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function()\n    return not aura_env.IsXPUserDisabled() and (aura_env.config[\"showmaxlevel\"] or not aura_env.isPlayerMaxLevel)\nend",
["activeTriggerMode"] = 1,
},
["internalVersion"] = 88,
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
["version"] = 44,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_shadowXOffset"] = 1,
["text_text_format_level_format"] = "none",
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
["text_text_format_p_format"] = "timed",
["text_text_format_p_time_dynamic_threshold"] = 60,
["type"] = "subtext",
["text_anchorXOffset"] = 5,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_text"] = "%c1",
["text_shadowYOffset"] = -1,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_c1_format"] = "none",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "INNER_LEFT",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%c2",
["text_text_format_restedXP_format"] = "none",
["text_text_format_completeXP_format"] = "none",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["rotateText"] = "NONE",
["text_color"] = {
1,
1,
1,
1,
},
["text_text_format_currentXP_big_number_format"] = "AbbreviateLargeNumbers",
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_questXP_format"] = "none",
["text_text_format_totalXP_format"] = "none",
["anchorXOffset"] = 0,
["text_text_format_percentXP_round_type"] = "floor",
["text_text_format_n_format"] = "none",
["text_text_format_totalXP_big_number_format"] = "AbbreviateLargeNumbers",
["text_selfPoint"] = "AUTO",
["text_text_format_percentXP_format"] = "Number",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_remainingXP_big_number_format"] = "AbbreviateLargeNumbers",
["text_text_format_currentXP_round_type"] = "floor",
["text_text_format_c2_format"] = "none",
["text_font"] = "Friz Quadrata TT",
["text_text_format_currentXP_decimal_precision"] = 0,
["text_text_format_totalXP_decimal_precision"] = 0,
["text_text_format_percentXP_decimal_precision"] = 0,
["text_automaticWidth"] = "Auto",
["text_text_format_remainingXP_format"] = "none",
["text_text_format_currentXP_format"] = "none",
["type"] = "subtext",
["anchor_point"] = "INNER_CENTER",
["text_fontType"] = "OUTLINE",
["text_fontSize"] = 14,
["text_text_format_totalXP_round_type"] = "floor",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%c3",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_percentcomplete_color"] = true,
["text_fixedWidth"] = 64,
["text_text_format_percentcomplete_decimal_precision"] = 0,
["rotateText"] = "NONE",
["text_color"] = {
1,
1,
1,
1,
},
["text_text_format_2.t_time_format"] = 0,
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_totalXP_format"] = "none",
["anchorXOffset"] = 0,
["text_text_format_percentXP_round_type"] = "floor",
["text_text_format_n_format"] = "none",
["text_text_format_totalpercentcomplete_round_type"] = "floor",
["text_text_format_percentcomplete_round_type"] = "floor",
["text_text_format_2.t_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_text_format_percentXP_format"] = "Number",
["text_text_format_percentcomplete_format"] = "Number",
["text_text_format_percentcomplete_realm_name"] = "never",
["anchorYOffset"] = 0,
["text_text_format_percentcomplete_abbreviate_max"] = 8,
["text_text_format_2.t_time_precision"] = 1,
["text_text_format_totalpercentcomplete_format"] = "Number",
["text_justify"] = "CENTER",
["text_fontType"] = "OUTLINE",
["type"] = "subtext",
["text_anchorXOffset"] = -5,
["text_text_format_percentXP_decimal_precision"] = 1,
["text_font"] = "Friz Quadrata TT",
["text_text_format_percentrested_round_type"] = "floor",
["text_text_format_totalpercentcomplete_decimal_precision"] = 1,
["text_text_format_2.t_time_dynamic_threshold"] = 60,
["text_fontSize"] = 16,
["text_text_format_c3_format"] = "none",
["text_text_format_currentXP_format"] = "none",
["text_automaticWidth"] = "Auto",
["anchor_point"] = "INNER_RIGHT",
["text_text_format_percentcomplete_abbreviate"] = false,
["text_text_format_percentrested_decimal_precision"] = 0,
["text_text_format_percentrested_format"] = "Number",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%c4",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_c7_format"] = "none",
["text_text_format_percentreste_format"] = "none",
["text_text_format_percentcomplete_decimal_precision"] = 0,
["text_text_format_percentrested_decimal_precision"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_n_format"] = "none",
["text_text_format_percentcomplete_round_type"] = "floor",
["text_selfPoint"] = "RIGHT",
["text_automaticWidth"] = "Auto",
["text_text_format_percentcomplete_format"] = "Number",
["anchorYOffset"] = 0,
["text_justify"] = "LEFT",
["text_text_format_c4_format"] = "none",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_font"] = "Friz Quadrata TT",
["text_text_format_percentrested_round_type"] = "floor",
["text_anchorYOffset"] = 0,
["text_text_format_c411_format"] = "none",
["text_text_format_c1_format"] = "none",
["text_fontType"] = "OUTLINE",
["anchor_point"] = "LEFT",
["text_fixedWidth"] = 64,
["rotateText"] = "NONE",
["text_text_format_percentrested_format"] = "Number",
},
{
["text_text_format_n_format"] = "none",
["text_text"] = "%c5",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["anchorYOffset"] = 0,
["text_text_format_percentcomplete_round_type"] = "floor",
["text_text_format_c4_format"] = "none",
["text_selfPoint"] = "RIGHT",
["text_automaticWidth"] = "Auto",
["text_text_format_percentcomplete_format"] = "Number",
["anchor_point"] = "BOTTOMRIGHT",
["text_text_format_percentcomplete_decimal_precision"] = 0,
["text_justify"] = "RIGHT",
["rotateText"] = "NONE",
["text_shadowXOffset"] = 1,
["text_text_format_percentreste_format"] = "none",
["text_fontType"] = "OUTLINE",
["type"] = "subtext",
["text_anchorYOffset"] = -18,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_text_format_percentrested_round_type"] = "floor",
["text_shadowYOffset"] = -1,
["text_fixedWidth"] = 64,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_c1_format"] = "none",
["text_text_format_percentrested_decimal_precision"] = 0,
["text_text_format_c5_format"] = "none",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_percentrested_format"] = "Number",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%c6",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "TOPLEFT",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_n_format"] = "none",
["text_shadowYOffset"] = -1,
["type"] = "subtext",
["text_text_format_levelTime_format"] = "none",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_text_format_c6_format"] = "none",
["text_anchorYOffset"] = 24,
["anchor_point"] = "TOPLEFT",
["text_text_format_c2_format"] = "none",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_text_format_c5_format"] = "none",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_C_format"] = "none",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%c7",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_c7_format"] = "none",
["text_selfPoint"] = "TOPRIGHT",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_text_format_n_format"] = "none",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_text_format_c6_format"] = "none",
["text_shadowYOffset"] = -1,
["text_text_format_sessionTime_format"] = "none",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_c3_format"] = "none",
["anchor_point"] = "TOPRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_anchorYOffset"] = 24,
},
},
["height"] = 30,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["source"] = "import",
["authorOptions"] = {
{
["type"] = "toggle",
["default"] = true,
["width"] = 1,
["name"] = "Played Time Text",
["useDesc"] = true,
["key"] = "leveltime-text",
["desc"] = "Enabling this will give you the time played at this level or total at max level.",
},
{
["type"] = "toggle",
["default"] = true,
["width"] = 1,
["name"] = "Session Time Text",
["useDesc"] = true,
["key"] = "sessiontime-text",
["desc"] = "Enabling this will give you the time spent in this current session.",
},
{
["type"] = "toggle",
["default"] = true,
["key"] = "showxphour-text",
["name"] = "Leveling Time & XP/Hour Text",
["useDesc"] = false,
["width"] = 1,
},
{
["type"] = "toggle",
["default"] = true,
["width"] = 1,
["name"] = "Completed & Rested Text",
["useDesc"] = true,
["key"] = "questrested-text",
["desc"] = "Enabling this will give you Completed and Rested text information at the bottom of the Experience Bar.",
},
{
["type"] = "toggle",
["default"] = false,
["key"] = "showincompletequest-bar",
["name"] = "Show Incomplete Quests Bar",
["useDesc"] = false,
["width"] = 1,
},
{
["type"] = "toggle",
["default"] = false,
["key"] = "showmaxlevel",
["name"] = "Show Bar at Max Level",
["useDesc"] = false,
["width"] = 1,
},
{
["type"] = "toggle",
["default"] = false,
["key"] = "reset_reload",
["name"] = "Reset Session Time and XP/Hour on Reload UI",
["useDesc"] = false,
["width"] = 2,
},
{
["type"] = "toggle",
["default"] = false,
["key"] = "hide_xpbar",
["name"] = "Hide Default Experience Bar (Retail)",
["useDesc"] = false,
["width"] = 2,
},
},
["barColor2"] = {
0.77647066116333,
0.38039219379425,
1,
1,
},
["actions"] = {
["start"] = {
["custom"] = "\n\n",
["do_custom"] = false,
},
["finish"] = {
["hide_all_glows"] = false,
},
["init"] = {
["custom"] = "local this = aura_env\n\nthis.timerHandler = this.timerHandler or nil\n\nthis.GetSavedVars = function()\n    local WAS = this.saved or {}\n    this.saved = WAS\n    \n    WAS.session = WAS.session or {}\n    \n    WAS.session.gainedXP = WAS.session.gainedXP or 0\n    WAS.session.lastXP = WAS.session.lastXP or UnitXP(\"player\")\n    WAS.session.maxXP = WAS.session.maxXP or UnitXPMax(\"player\")\n    WAS.session.startTime = WAS.session.startTime or time()\n    WAS.session.realTotalTime = WAS.session.realTotalTime or 0\n    WAS.session.realLevelTime = WAS.session.realLevelTime or 0\n    WAS.session.lastTimePlayedRequest = WAS.session.lastTimePlayedRequest or 0\n    \n    return WAS\nend\n\nthis.IsXPUserDisabled = IsXPUserDisabled or function() return false end\n\nthis.GetMaxLevel = function(exp)\n    exp = exp or GetExpansionLevel()\n    \n    return min(GetMaxPlayerLevel(), GetMaxLevelForExpansionLevel(exp))\nend\n\nthis.level = UnitLevel(\"player\")\nthis.isPlayerMaxLevel = this.level >= this.GetMaxLevel()\n\nlocal GetNumQuestLogEntries = C_QuestLog.GetNumQuestLogEntries or GetNumQuestLogEntries\nlocal GetQuestIDForLogIndex = C_QuestLog.GetQuestIDForLogIndex or function(i)\n    return select(8, GetQuestLogTitle(i))\nend\nlocal SelectQuestLogEntry = SelectQuestLogEntry or function() end\nlocal IsQuestComplete = C_QuestLog.IsComplete or IsQuestComplete\nlocal QuestReadyForTurnIn = C_QuestLog.ReadyForTurnIn or function() return false end\n\nthis.UpdateQuestXP = function()\n    local numQ = GetNumQuestLogEntries()\n    local questXP = 0\n    local completeXP = 0\n    local incompleteXP = 0\n    local questID, rewardXP\n    local selQ = 0\n    local GetQuestLogRewardXP = GetQuestLogRewardXP or function()\n        return 0\n    end\n    \n    if GetQuestLogSelection then\n        selQ = GetQuestLogSelection()\n    end\n    \n    for i = 1, numQ do\n        SelectQuestLogEntry(i)\n        questID = GetQuestIDForLogIndex(i)\n        \n        if questID > 0 then\n            rewardXP = GetQuestLogRewardXP(questID) or 0\n            \n            if rewardXP > 0 then\n                questXP = questXP + rewardXP\n                \n                if IsQuestComplete(questID) or QuestReadyForTurnIn(questID) then\n                    completeXP = completeXP + rewardXP\n                else\n                    incompleteXP = incompleteXP + rewardXP\n                end\n            end\n        end\n    end\n    \n    this.questXP = questXP\n    this.completeXP = completeXP\n    this.incompleteXP = incompleteXP\n    \n    if selQ > 0 then\n        SelectQuestLogEntry(selQ)\n        StaticPopup_Hide(\"ABANDON_QUEST\")\n        StaticPopup_Hide(\"ABANDON_QUEST_WITH_ITEMS\")\n        \n        if QuestLogControlPanel_UpdateState then\n            local SetAbandonQuest = SetAbandonQuest or function() end\n            \n            QuestLogControlPanel_UpdateState()\n            SetAbandonQuest()\n        end\n    end\nend\n\nthis.UpdateQuestXP()\n\nthis.round = function(num, decimals)\n    local mult = 10^(decimals or 0)\n    \n    return Round(num * mult) / mult\nend\n\nthis.FormatTime = function(time, format)\n    if time <= 59 then\n        return \"< 1m\"\n    end\n    \n    local d, h, m, s = ChatFrame_TimeBreakDown(time)\n    local t = format or \"%dd %hh %mm\" --\"%d:%H:%M:%S\"\n    \n    \n    local pad = function(v)\n        return v < 10 and \"0\" .. v or v\n    end\n    \n    local subs = {\n        [\"%%D([Dd]?)\"] = d > 0 and (pad(d) .. \"%1\") or \"\",\n        [\"%%d([Dd]?)\"] = d > 0 and (d .. \"%1\") or \"\",\n        [\"%%H([Hh]?)\"] = (d > 0 or h > 0) and (pad(h) .. \"%1\") or \"\",\n        [\"%%h([Hh]?)\"] = (d > 0 or h > 0) and (h .. \"%1\") or \"\",\n        [\"%%M([Mm]?)\"] = pad(m) .. \"%1\",\n        [\"%%m([Mm]?)\"] = m .. \"%1\",\n        [\"%%S([Ss]?)\"] = pad(s) .. \"%1\",\n        [\"%%s([Ss]?)\"] = s .. \"%1\",\n    }\n    \n    for k,v in pairs(subs) do\n        t = t:gsub(k, v)\n    end\n    \n    -- Remove trailing spaces/zeroes/symbols\n    return strtrim(t:gsub(\"^%s*0*\", \"\"):gsub(\"^%s*[DdHhMm]\", \"\"), \" :/-|\")\nend\n\nthis.tickerRTP = this.tickerRTP or nil\nthis.requestingTimePlayed = false\n\nthis.ClearTickerRTP = function()\n    if this.tickerRTP then\n        this.tickerRTP:Cancel()\n        this.tickerRTP = nil\n    end\n    \n    this.requestingTimePlayed = false\nend\n\nthis.RequestTimePlayed = function()\n    if not this.requestingTimePlayed then\n        this.ClearTickerRTP()\n        \n        this.requestingTimePlayed = true\n        \n        this.tickerRTP = C_Timer.NewTimer(0.5, function() RequestTimePlayed() end)\n    end\nend\n\nthis.customTexts = {\n    c1 = \"Level \" .. this.level,\n    c2 = \"0 / 0 (0)\",\n    c3 = \"0%\",\n    c4 = \"\",\n    c5 = \"\",\n    c6 = \"\",\n    c7 = \"\",\n}\n\nthis.UpdateCustomTexts = function(state)\n    local c1, c2, c3, c4, c5, c6, c7\n    local s = state or this.state\n    local cfg = this.config\n    local round = this.round\n    local isMaxLevel = this.isPlayerMaxLevel\n    \n    c1 = \"Level \" .. (s.level or UnitLevel(\"player\"))\n    \n    if isMaxLevel then\n        c2 = \"Max Level\"\n    else\n        c2 = string.format(\"%s / %s (%s)\", FormatLargeNumber(s.currentXP or 0), FormatLargeNumber(s.totalXP or 0), FormatLargeNumber(s.remainingXP or 0))\n    end\n    \n    c3 = string.format(\"%s%%\" .. ((s.percentcomplete or 0) > 0 and \" (%s%%)\" or \"\"), round(s.percentXP or 0, 1), round(s.totalpercentcomplete or 0, 1))\n    \n    if not isMaxLevel then\n        if cfg[\"showxphour-text\"] then\n            local hourlyXP = s.hourlyXP or 0\n            \n            c4 = string.format(\"Leveling in: %s (%s%s XP/Hour)\", s.timeToLevelText or \"\", hourlyXP > 10000 and round(hourlyXP / 1000, 1) or FormatLargeNumber(hourlyXP), hourlyXP > 10000 and \"K\" or \"\")\n        end\n        \n        if cfg[\"questrested-text\"] then\n            c5 = string.format(\"Completed: |cFFFF9700%s%%|r - Rested: |cFF4F90FF%s%%|r\", round(s.percentcomplete or 0, 1), round(s.percentrested or 0, 1))\n        end\n    end\n    \n    if cfg[\"leveltime-text\"] then\n        if isMaxLevel then\n            c6 = \"Time played: \" .. (s.totalTimeText or \"\")\n        else\n            c6 = \"Time this level: \" .. (s.levelTimeText or \"\")\n        end\n    end\n    \n    if cfg[\"sessiontime-text\"] then\n        c7 = \"Time this session: \" .. (s.sessionTimeText or \"\")\n    end\n    \n    this.customTexts = {\n        c1 = c1,\n        c2 = c2,\n        c3 = c3,\n        c4 = c4,\n        c5 = c5,\n        c6 = c6,\n        c7 = c7,\n    }\nend",
["do_custom"] = true,
},
},
["uid"] = "UpaCp8I(Gtg",
["icon_side"] = "LEFT",
["desc"] = "Created by Luxthos & Daemoos\nwww.twitch.tv/luxthos",
["auto"] = false,
["sparkHeight"] = 30,
["zoom"] = 0,
["backgroundColor"] = {
0,
0,
0,
0.5,
},
["width"] = 600,
["semver"] = "11.0.0",
["id"] = "Experience Bar",
["sparkHidden"] = "NEVER",
["enableGradient"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["config"] = {
["leveltime-text"] = false,
["sessiontime-text"] = false,
["showxphour-text"] = true,
["questrested-text"] = false,
["showincompletequest-bar"] = false,
["showmaxlevel"] = false,
["hide_xpbar"] = true,
["reset_reload"] = true,
},
["customText"] = "function()\n    local t = aura_env.customTexts\n    \n    return t.c1, t.c2, t.c3, t.c4, t.c5, t.c6, t.c7\nend",
["inverse"] = false,
["overlays"] = {
{
1,
0.5921568627451,
0,
1,
},
{
1,
0.82352941176471,
0.30980392156863,
1,
},
{
0.30980392156863,
0.56470588235294,
1,
0.54487144947052,
},
},
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["saved"] = "JrXkQ4ulU4mZpVYskNelUKicGXlvuQjMti5xcqImZnvgBk9eZmVutbOebLBIveraAW6xFidtQ4ssSOsajVgz296BgSw8j1YsfIwkquqgfizdiNeRm1uck1cln1IlHra)",
},
["preferToUpdate"] = false,
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
["stickyDuration"] = false,
["adjustedMax"] = "",
["authorOptions"] = {
},
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["displayIcon"] = 2057570,
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
["xOffset"] = 278,
["uid"] = "jU3ZaxcAsmX",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = false,
["tocversion"] = 110207,
["id"] = "No Flask",
["zoom"] = 0.1,
["alpha"] = 1,
["anchorFrameType"] = "UIPARENT",
["keepAspectRatio"] = false,
["config"] = {
},
["inverse"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["conditions"] = {
},
["cooldown"] = true,
["parent"] = "Stuff",
},
["Auto Leave&Join Delve <= lvl 89"] = {
["outline"] = "OUTLINE",
["authorOptions"] = {
},
["displayText"] = "%p",
["shadowYOffset"] = -1,
["anchorPoint"] = "CENTER",
["displayText_format_p_time_format"] = 0,
["customTextUpdate"] = "event",
["automaticWidth"] = "Auto",
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
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["unit"] = "player",
["custom"] = "function(e, ...)\n    if e == \"GOSSIP_SHOW\" then\n        local npc = UnitGUID(\"npc\")\n        if issecretvalue(npc) then return end\n        local id = select(6, strsplit(\"-\", npc))\n        if id == \"249340\" then\n            local level = DelvesDifficultyPickerFrame and DelvesDifficultyPickerFrame.selectedLevel\n            if level and level == 0 then\n                DelvesDifficultyPickerFrame.EnterDelveButton:Click()\n            end\n        elseif id == \"248112\" then\n            local title = C_GossipInfo.GetOptions()\n            if title[1] and title[1].gossipOptionID then\n                C_GossipInfo.SelectOption(title[1].gossipOptionID)\n                C_Timer.After(0.3, function()\n                        C_GossipInfo.CloseGossip()\n                end)\n            end\n        end\n    elseif e == \"SCENARIO_COMPLETED\" or e == \"SCENARIO_UPDATE\" then\n        if C_PartyInfo.IsDelveComplete() then C_PartyInfo.DelveTeleportOut() end\n        C_Timer.After(0.25, function() -- loop through until player is ported out in case they were stuck in combat\n                if C_PartyInfo.IsDelveComplete() then\n                    WeakAuras.ScanEvents(\"SCENARIO_UPDATE\") \n                end    \n        end)\n    end\nend\n\n\n",
["names"] = {
},
["custom_type"] = "status",
["events"] = "SCENARIO_UPDATE SCENARIO_COMPLETED GOSSIP_SHOW SPELL_CONFIRMATION_PROMPT",
["spellIds"] = {
},
["custom_hide"] = "timed",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["displayText_format_p_format"] = "timed",
["internalVersion"] = 88,
["selfPoint"] = "BOTTOM",
["font"] = "Friz Quadrata TT",
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["load"] = {
["level_operator"] = {
"<=",
">=",
},
["use_level"] = true,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["level"] = {
"89",
"80",
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
["fontSize"] = 12,
["shadowXOffset"] = 1,
["regionType"] = "text",
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
["displayText_format_p_time_precision"] = 1,
["displayText_format_p_time_mod_rate"] = true,
["conditions"] = {
},
["color"] = {
1,
1,
1,
1,
},
["justify"] = "LEFT",
["displayText_format_p_time_dynamic_threshold"] = 60,
["id"] = "Auto Leave&Join Delve <= lvl 89",
["yOffset"] = 0,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["config"] = {
},
["uid"] = "YF4NV5ULI3r",
["wordWrap"] = "WordWrap",
["xOffset"] = 0,
["shadowColor"] = {
0,
0,
0,
1,
},
["fixedWidth"] = 200,
["information"] = {
},
["displayText_format_p_time_legacy_floor"] = false,
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
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    if spellID == 116847 then\n        local maxdur = 5.4\n        if s[\"\"] then\n            local olddur = s[\"\"].expirationTime-GetTime()\n            local newdur = math.min(maxdur*1.3, maxdur+olddur)\n            local state = {\n                progressType = \"timed\",\n                duration = newdur,\n                expirationTime = GetTime()+newdur,\n                autoHide = true\n            }\n            s:Update(\"\", state)\n        else\n            local state = {\n                progressType = \"timed\",\n                duration = maxdur,\n                expirationTime = GetTime()+maxdur,\n                autoHide = true,\n            }\n            s:Update(\"\", state)\n        end\n    end\nend\n\n\n\n",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["names"] = {
},
["check"] = "event",
["spellIds"] = {
},
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
["stickyDuration"] = false,
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
["color"] = {
1,
1,
1,
1,
},
["source"] = "import",
["cooldownEdge"] = false,
["cooldown"] = true,
["displayIcon"] = 606549,
["useCooldownModRate"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["keepAspectRatio"] = false,
["uid"] = "nhjRSXwRyYo",
["adjustedMax"] = "",
["width"] = 84,
["selfPoint"] = "CENTER",
["zoom"] = 0.1,
["cooldownTextDisabled"] = true,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Rushing Jade Wind Midnight",
["xOffset"] = -380,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["config"] = {
},
["inverse"] = false,
["icon"] = true,
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
["internalVersion"] = 88,
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
["events"] = "UNIT_SPELL_HASTE WA_DELAYED_PLAYER_ENTERING_WORLD",
["custom"] = "function(s, e, ...)\n    if e == \"UNIT_SPELL_HASTE\" or e ==\"WA_DELAYED_PLAYER_ENTERING_WORLD\" then\n        local now = GetHaste()+100\n        if not aura_env.last then aura_env.last = now return end\n        local lustvalue = aura_env.last*1.3\n        local diff = now-lustvalue\n        if diff > -0.2 and diff < 0.2 then\n            local state = {\n                progressType = \"timed\",\n                duration = 40,\n                expirationTime = GetTime()+40,\n                autoHide = true,\n            }\n            s:Update(\"\", state)\n        end\n        aura_env.last = now\n    end\nend\n\n\n\n",
["check"] = "event",
["spellIds"] = {
},
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
["color"] = {
1,
1,
1,
1,
},
["authorOptions"] = {
},
["cooldownTextDisabled"] = true,
["zoom"] = 0.1,
["uid"] = "PScICGSS3EQ",
["alpha"] = 1,
["id"] = "Lust",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["width"] = 150,
["frameStrata"] = 5,
["config"] = {
},
["inverse"] = false,
["icon"] = true,
["displayIcon"] = 132313,
["cooldown"] = true,
["progressSource"] = {
-1,
"",
},
},
["Evoker Essence"] = {
["sparkWidth"] = 10,
["sparkOffsetX"] = 0,
["wagoID"] = "oR42u5m2B",
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["config"] = {
},
["sparkRotation"] = 0,
["sparkRotationMode"] = "AUTO",
["url"] = "https://wago.io/oR42u5m2B/2",
["backgroundColor"] = {
0,
0,
0,
0.5,
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
["events"] = "UNIT_POWER_UPDATE:player",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["check"] = "event",
["custom_type"] = "stateupdate",
["custom"] = "function(states, event, data)\n    \n    local cur = UnitPower(\"player\", 19, false) or 0\n    local max = UnitPowerMax(\"player\", 19, false) or 0\n \n    for _, state in pairs(states) do\n        state.show = false;\n        state.changed = true;\n    end\n\n    for i=1, max do\n        states[i] = states[i] or {}\n        local s = states[i]\n        \n        s.show = true\n        s.changed = true\n        s.progressType = 'static'\n        s.total = 1\n        if (i <= cur) then\n            s.value = 1\n        else\n            s.value = 0\n        end\n    end\n    \n    return true\nend",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["use_absorbHealMode"] = true,
["useExactSpellId"] = true,
["matchesShowOn"] = "showAlways",
["event"] = "Power",
["unit"] = "player",
["powertype"] = 19,
["use_requirePowerType"] = false,
["auraspellids"] = {
"344179",
},
["use_unit"] = true,
["use_absorbMode"] = true,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
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
["selfPoint"] = "CENTER",
["iconSource"] = -1,
["authorOptions"] = {
},
["barColor"] = {
0.20000001788139,
0.57647061347961,
0.49803924560547,
1,
},
["desaturate"] = false,
["preferToUpdate"] = false,
["zoom"] = 0,
["sparkOffsetY"] = 0,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
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
["height"] = 32,
["textureSource"] = "LSM",
["load"] = {
["use_vehicleUi"] = false,
["class_and_spec"] = {
["single"] = 263,
["multi"] = {
[1467] = true,
[1468] = true,
[1473] = true,
},
},
["talent"] = {
["multi"] = {
[101948] = true,
},
},
["use_class_and_spec"] = false,
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
["information"] = {
},
["smoothProgress"] = false,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["icon"] = false,
["parent"] = "Evoker Essence Bar",
["icon_side"] = "RIGHT",
["version"] = 2,
["gradientOrientation"] = "HORIZONTAL",
["sparkHeight"] = 30,
["texture"] = "Solid",
["uid"] = "NIVEperBTeN",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["semver"] = "1.0.1",
["tocversion"] = 100100,
["id"] = "Evoker Essence",
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["width"] = 57,
["frameStrata"] = 1,
["sparkColor"] = {
1,
1,
1,
1,
},
["inverse"] = false,
["sparkHidden"] = "NEVER",
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["barColor2"] = {
1,
1,
0,
1,
},
["spark"] = false,
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
["custom"] = "aura_env.spells = {\n    [115203] = {dur = 15},   \n    [132578] = {dur = 25},\n    [20594] = {dur = 8},\n    [48792] = {dur = 8}, -- Icebound Fortitude\n    [55233] = {dur = 10}, -- Vamp Blood\n    [49028] = {dur = 12}, -- Dancing Rune Weapon\n    [586] = {dur = 10}, -- Fade\n    [47585] = {dur = 6}, -- Dispersion\n    [19236] = {dur = 10}, -- Desperate Prayer\n    [22812] = {dur = 12}, -- Barkskin\n    [31850] = {dur = 8}, -- Ardent Defender\n    [86659] = {dur = 8}, -- Guardian\n    [642] = {dur = 8}, -- Bubble\n    [203720] = {dur = 12}, -- Demon Spikes\n    [187827] = {dur = 20}, -- Meta\n    [871] = {dur = 80}, -- Shield Wall\n    [23920] = {dur = 5}, -- Spell Reflection\n    [1160] = {dur = 8}, -- Demo Shout\n    [264735] = {dur = 8}, -- Survival of the Fittest\n}\n\n\n",
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
["spellIds"] = {
},
["custom"] = "function(s, e, ...)\n    if e == \"OPTIONS\" then\n        for k, v in pairs(aura_env.spells) do\n            local iconID = v.iconID or C_Spell.GetSpellInfo(k).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = v.dur,\n                expirationTime = GetTime()+v.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(k, state)\n        end   \n    else   \n        local u, cast, spellID = ... -- Unit event\n        local spell = aura_env.spells[spellID]\n        if spell then\n            local iconID = spell.iconID or C_Spell.GetSpellInfo(spellID).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = spell.dur,\n                expirationTime = GetTime()+spell.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(spellID, state)\n        end\n    end\nend",
["custom_type"] = "stateupdate",
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
["cooldownEdge"] = false,
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
["talent2"] = {
["multi"] = {
},
},
["use_never"] = false,
["zoneIds"] = "",
},
["desaturate"] = false,
["useAdjustededMax"] = false,
["preferToUpdate"] = true,
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
["parent"] = "Defensives List Midnight",
["keepAspectRatio"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 5,
["anchorFrameParent"] = false,
["internalVersion"] = 88,
["cooldownTextDisabled"] = true,
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "Defensives Midnight",
["alpha"] = 1,
["useCooldownModRate"] = true,
["width"] = 84,
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
["uid"] = "feX(7Gp4Brs",
["inverse"] = false,
["xOffset"] = 0,
["displayIcon"] = 613398,
["cooldown"] = true,
["icon"] = true,
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
["sortHybridTable"] = {
["Defensives Midnight"] = false,
},
["frameStrata"] = 1,
["stagger"] = 0,
["groupIcon"] = 4038107,
["space"] = 0,
["subRegions"] = {
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
["selfPoint"] = "LEFT",
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
["rotation"] = 0,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["parent"] = "Classes",
["animate"] = false,
["config"] = {
},
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["sort"] = "none",
["stepAngle"] = 15,
["constantFactor"] = "RADIUS",
["xOffset"] = -339,
["borderOffset"] = 4,
["alpha"] = 1,
["tocversion"] = 110205,
["id"] = "Defensives List Midnight",
["gridType"] = "RD",
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["borderInset"] = 1,
["uid"] = ")o)gH7t27pj",
["borderColor"] = {
0,
0,
0,
1,
},
["radius"] = 200,
["conditions"] = {
},
["information"] = {
},
["grow"] = "RIGHT",
},
["Rune 1"] = {
["sparkWidth"] = 10,
["sparkOffsetX"] = 0,
["wagoID"] = "3zWD5RhVG",
["parent"] = "Runes",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["width"] = 57,
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
["internalVersion"] = 88,
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
["enableGradient"] = false,
["source"] = "import",
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
["alpha"] = 1,
["information"] = {
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["version"] = 4,
["icon_side"] = "RIGHT",
["gradientOrientation"] = "HORIZONTAL",
["sparkHidden"] = "NEVER",
["anchorFrameParent"] = false,
["texture"] = "Solid",
["config"] = {
},
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["semver"] = "1.0.3",
["tocversion"] = 110207,
["id"] = "Rune 1",
["sparkHeight"] = 30,
["frameStrata"] = 5,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0,
["uid"] = "(GfYcIhnARL",
["inverse"] = true,
["spark"] = false,
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
["custom"] = "function(s, e, ...)\n    local u, cast, spellID = ... -- Unit event\n    if spellID == 205523 then\n        local state = {\n            progressType = \"timed\",\n            duration = 15,\n            expirationTime = GetTime()+15,\n            autoHide = true,\n        }\n        s:Update(\"\", state)\n    elseif tContains(aura_env.spells, spellID) then\n        s:RemoveAll()\n    end\nend\n\n\n",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
["names"] = {
},
["check"] = "event",
["spellIds"] = {
},
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
["keepAspectRatio"] = false,
["preferToUpdate"] = true,
["parent"] = "Monk Midnight",
["cooldown"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["displayIcon"] = 574568,
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
["authorOptions"] = {
},
["config"] = {
},
["alpha"] = 1,
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
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "BoC Midnight",
["cooldownTextDisabled"] = true,
["frameStrata"] = 5,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
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
["xOffset"] = -574.1743774414062,
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
["config"] = {
},
["internalVersion"] = 88,
["scale"] = 1,
["tocversion"] = 110207,
["id"] = "Stuff",
["borderOffset"] = 4,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
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
["borderInset"] = 1,
["alpha"] = 1,
["selfPoint"] = "CENTER",
["uid"] = "3j79PiVoXwQ",
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
["scale"] = 1,
["borderEdge"] = "Square Full White",
["border"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["borderSize"] = 2,
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
["regionType"] = "group",
["internalVersion"] = 88,
["xOffset"] = 0,
["selfPoint"] = "CENTER",
["id"] = "Raid Utils",
["borderOffset"] = 4,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["borderInset"] = 1,
["config"] = {
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
["subRegions"] = {
},
["frameStrata"] = 1,
["conditions"] = {
},
["information"] = {
},
["uid"] = "ShjKvb7A9wa",
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
["spellIds"] = {
},
["names"] = {
},
["custom"] = "function(e, G, ...)\n    if G and not issecretvalue(G) then\n        if G == UnitGUID(\"player\") then\n            return true\n        end\n    end    \nend",
["custom_type"] = "event",
["events"] = "UNIT_DIED",
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
["selfPoint"] = "BOTTOM",
["authorOptions"] = {
},
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
["borderEdge"] = "Square Full White",
["border"] = false,
["groupIcon"] = "135724",
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
["borderOffset"] = 4,
["xOffset"] = 0,
["selfPoint"] = "CENTER",
["id"] = "Classes",
["internalVersion"] = 88,
["frameStrata"] = 1,
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
["uid"] = "7r)c8EH)9sn",
["alpha"] = 1,
["subRegions"] = {
},
["borderInset"] = 1,
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
["Combo Point 1"] = {
["wagoID"] = "OaJQX6khW",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["url"] = "https://wago.io/OaJQX6khW/30",
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
["duration"] = "1",
["use_showCost"] = false,
["unit"] = "player",
["powertype"] = 4,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["power_operator"] = {
">=",
},
["form"] = {
},
["event"] = "Power",
["use_absorbMode"] = true,
["power"] = {
"1",
},
["use_showChargedComboPoints"] = false,
["spellIds"] = {
},
["use_power"] = true,
["rune"] = 0,
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["use_unit"] = true,
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 88,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["discrete_rotation"] = 0,
["version"] = 30,
["subRegions"] = {
{
["type"] = "subbackground",
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
["border_edge"] = "1 Pixel",
["type"] = "subborder",
},
},
["height"] = 38,
["rotate"] = true,
["load"] = {
["class_and_spec"] = {
["single"] = 103,
["multi"] = {
[103] = true,
[105] = true,
},
},
["use_ignoreNameRealm"] = false,
["use_class_and_spec"] = false,
["use_class"] = false,
["use_dragonriding"] = false,
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
["DRUID"] = true,
["ROGUE"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["textureWrapMode"] = "CLAMP",
["mirror"] = false,
["regionType"] = "texture",
["blendMode"] = "BLEND",
["width"] = 68,
["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",
["xOffset"] = 0,
["rotation"] = 0,
["semver"] = "2.0.12",
["tocversion"] = 110200,
["id"] = "Combo Point 1",
["color"] = {
0.79607843137255,
0.27450980392157,
0.23529411764706,
1,
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["uid"] = "g2xnwHMm3Pg",
["parent"] = "Combo Points",
["conditions"] = {
{
["check"] = {
["value"] = 1,
["variable"] = "show",
},
["changes"] = {
{
["value"] = {
0.11372549019608,
0.11372549019608,
0.11372549019608,
1,
},
["property"] = "color",
},
},
},
{
["check"] = {
["value"] = "1",
["op"] = ">=",
["variable"] = "stacks",
},
["changes"] = {
{
["value"] = {
0.015686275437474,
0.74901962280273,
0.75686281919479,
1,
},
["property"] = "color",
},
},
},
},
["information"] = {
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
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
},
["Rune 5"] = {
["sparkWidth"] = 10,
["sparkOffsetX"] = 0,
["wagoID"] = "3zWD5RhVG",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
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
["internalVersion"] = 88,
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
["parent"] = "Runes",
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
["enableGradient"] = false,
["source"] = "import",
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
["frameStrata"] = 5,
["information"] = {
},
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["icon"] = false,
["sparkOffsetY"] = 0,
["icon_side"] = "RIGHT",
["gradientOrientation"] = "HORIZONTAL",
["id"] = "Rune 5",
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
["sparkHidden"] = "NEVER",
["sparkHeight"] = 30,
["alpha"] = 1,
["width"] = 58,
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["config"] = {
},
["inverse"] = true,
["semver"] = "1.0.3",
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
["Statues"] = {
["grow"] = "LEFT",
["controlledChildren"] = {
"TotemFrames",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "3fH2MR2PA",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["groupIcon"] = 627607,
["gridType"] = "RD",
["borderColor"] = {
0,
0,
0,
1,
},
["rowSpace"] = 1,
["url"] = "https://wago.io/3fH2MR2PA/6",
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
["unit"] = "player",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["event"] = "Health",
["names"] = {
},
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["radius"] = 200,
["gridWidth"] = 5,
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
["align"] = "CENTER",
["sortHybridTable"] = {
["TotemFrames"] = false,
},
["selfPoint"] = "RIGHT",
["fullCircle"] = true,
["stagger"] = 0,
["rotation"] = 0,
["version"] = 6,
["subRegions"] = {
},
["space"] = -1,
["arcLength"] = 360,
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
["anchorPoint"] = "CENTER",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["uid"] = "AYiiYwpCvnx",
["source"] = "import",
["borderInset"] = 1,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["useLimit"] = false,
["alpha"] = 1,
["constantFactor"] = "RADIUS",
["sort"] = "none",
["borderOffset"] = 4,
["semver"] = "1.0.5",
["tocversion"] = 100002,
["id"] = "Statues",
["stepAngle"] = 15,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["animate"] = false,
["config"] = {
},
["internalVersion"] = 88,
["xOffset"] = -205.9998779296875,
["conditions"] = {
},
["information"] = {
},
["yOffset"] = -588.9996643066406,
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
["spellIds"] = {
},
["custom"] = "function(s, e, ...)    \n    if e == \"OPTIONS\" then\n        for k, v in pairs(aura_env.spells) do\n            local iconID = v.iconID or C_Spell.GetSpellInfo(k).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = v.dur,\n                expirationTime = GetTime()+v.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(k, state)\n        end   \n    else        \n        local u, cast, spellID = ... -- Unit event\n        local spell = aura_env.spells[spellID]\n        if spell then\n            local iconID = spell.iconID or C_Spell.GetSpellInfo(spellID).iconID\n            local state = {\n                progressType = \"timed\",\n                duration = spell.dur,\n                expirationTime = GetTime()+spell.dur,\n                icon = iconID,\n                autoHide = true,\n            }\n            s:Update(spellID, state)\n        end\n    end\nend\n\n\n",
["names"] = {
},
["check"] = "event",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player",
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
["parent"] = "DmgBuffs List Midnight",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom_load"] = false,
["do_custom"] = true,
["custom"] = "aura_env.spells = {\n    [10060] = {dur = 15}, -- Power Infusion\n    [29166] = {dur = 8}, -- Innervate\n    [31884] = {dur = 15}, -- Wings\n    [102560] = {dur = 20}, -- Incarnation\n    [1233346] = {dur = 12}, -- Solar Eclipse\n    [107574] = {dur = 20}, -- Avatar\n    [19574] = {dur = 15}, -- Bestial Wrath\n}",
},
["finish"] = {
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
["url"] = "",
["keepAspectRatio"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["authorOptions"] = {
},
["width"] = 100,
["frameStrata"] = 5,
["anchorFrameParent"] = false,
["xOffset"] = 0,
["cooldownTextDisabled"] = true,
["zoom"] = 0.1,
["auto"] = false,
["tocversion"] = 110205,
["id"] = "DmgBuffs Midnight",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["preferToUpdate"] = true,
["uid"] = "D9kLDROcsJk",
["inverse"] = false,
["useTooltip"] = false,
["displayIcon"] = 135939,
["cooldown"] = true,
["stickyDuration"] = false,
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
["stickyDuration"] = false,
["selfPoint"] = "CENTER",
["parent"] = "Stuff",
["information"] = {
["forceEvents"] = false,
["ignoreOptionsEventErrors"] = true,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["conditions"] = {
},
["authorOptions"] = {
},
["preferToUpdate"] = false,
["uid"] = "DG3gSG(0jgb",
["useCooldownModRate"] = true,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = false,
["tocversion"] = 110207,
["id"] = "No Food",
["zoom"] = 0.1,
["frameStrata"] = 1,
["width"] = 66,
["keepAspectRatio"] = false,
["config"] = {
},
["inverse"] = false,
["icon"] = true,
["displayIcon"] = 136000,
["cooldown"] = true,
["xOffset"] = 213,
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
["spellIds"] = {
},
["custom"] = "function(allstates, event, ...)\n    if event == \"UNIT_AURA\" then\n        local unit, updateInfo = ...    \n        \n        if updateInfo.isFullUpdate and next(allstates) then\n            local auraInstanceIds = C_UnitAuras.GetUnitAuraInstanceIDs(unit, \"HELPFUL\")\n            local foundStates = {}\n            for i, auraInstanceID in ipairs(auraInstanceIds) do\n                if allstates[auraInstanceID] then\n                    foundStates[auraInstanceID] = true \n                end \n            end\n            \n            for k, v in pairs(allstates) do\n                if not foundStates[k] then\n                    allstates:Remove(k) \n                end \n            end\n        end\n        \n        if updateInfo.addedAuras then\n            for i, auraData in ipairs(updateInfo.addedAuras) do                \n                local auraInstanceID = auraData.auraInstanceID\n                local isExternalDefensive = not C_UnitAuras.IsAuraFilteredOutByInstanceID(\"player\", auraInstanceID, \"HELPFUL|EXTERNAL_DEFENSIVE\")\n                if isExternalDefensive then\n                    local duration = C_UnitAuras.GetAuraDuration(unit, auraInstanceID)\n                    \n                    allstates:Update(auraInstanceID, {\n                            progressType = \"timed\",\n                            duration = duration:GetTotalDuration(),\n                            expirationTime = duration:GetEndTime(),\n                            durationObject = duration,\n                            name = auraData.name,\n                            icon = auraData.icon,\n                            unit = auraData.sourceUnit,\n                    })\n                end\n            end\n        end \n        \n        if updateInfo.updatedAuraInstanceIDs then\n            for i, auraInstanceID in ipairs(updateInfo.updatedAuraInstanceIDs)  do\n                if allstates[auraInstanceID]  then\n                    local auraData = C_UnitAuras.GetAuraDataByAuraInstanceID(unit, auraInstanceID)\n                    local duration = C_UnitAuras.GetAuraDuration(unit, auraInstanceID)\n                    \n                    allstates:Update(auraInstanceID, {\n                            progressType = \"timed\",\n                            duration = duration:GetTotalDuration(),\n                            expirationTime = duration:GetEndTime(),\n                            durationObject = duration,\n                            name = auraData.name,\n                            icon = auraData.icon,\n                            unit = auraData.sourceUnit,\n                    })\n                end\n            end\n        end\n        \n        if updateInfo.removedAuraInstanceIDs then\n            for i, auraInstanceID in ipairs(updateInfo.removedAuraInstanceIDs)  do\n                if allstates[auraInstanceID]  then                    \n                    allstates:Remove(auraInstanceID)\n                end\n            end\n        end\n    elseif event == \"OPTIONS\" then\n        for i=1,3 do\n            local duration = C_DurationUtil.CreateDuration()\n            duration:SetTimeFromStart(GetTime(), 5)\n            allstates:Update(i, {\n                    progressType = \"timed\",\n                    duration = duration:GetTotalDuration(),\n                    expirationTime = duration:GetEndTime(),\n                    durationObject = duration,\n                    icon = C_Spell.GetSpellTexture(102342),\n                    name = C_Spell.GetSpellName(102342),\n                    unit = \"player\",\n            }) \n        end\n    end\nend",
["custom_type"] = "stateupdate",
["check"] = "event",
["names"] = {
},
["events"] = "UNIT_AURA:player",
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
["text_text_format_p_time_legacy_floor"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
0,
},
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_text_format_text_format"] = "none",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Expressway",
["text_text_format_c2_format"] = "none",
["text_shadowYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["anchor_point"] = "OUTER_LEFT",
["text_fontSize"] = 30,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_c_format"] = "none",
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
["xOffset"] = 0,
["uid"] = "iu(XmoBeyjY",
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
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldown"] = true,
["displayIcon"] = 572025,
["preferToUpdate"] = false,
["progressSource"] = {
-1,
"",
},
["width"] = 100,
["useCooldownModRate"] = false,
["cooldownTextDisabled"] = true,
["parent"] = "ExternalDefensives",
["tocversion"] = 120001,
["id"] = "ExternalDefensive Icon",
["frameStrata"] = 5,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0.1,
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
["custom"] = "\n\n",
["message_format_name_format"] = "none",
["message_type"] = "TTS",
["do_message"] = false,
["do_custom"] = false,
["do_sound"] = false,
},
["init"] = {
["do_custom"] = false,
["custom"] = "\n\n",
},
["finish"] = {
},
},
},
},
["lastUpgrade"] = 1769651474,
["editor_theme"] = "Standard",
}
