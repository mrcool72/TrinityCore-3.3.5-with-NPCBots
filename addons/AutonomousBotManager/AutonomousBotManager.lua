local frame = CreateFrame("Frame", "AutonomousBotManagerFrame", UIParent)
frame:SetWidth(430); frame:SetHeight(430); frame:SetPoint("CENTER")
frame:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border", tile=true, tileSize=32, edgeSize=32, insets={left=11,right=12,top=12,bottom=11}})
frame:Hide()

local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOP",0,-20); title:SetText("Autonomous Bot Manager")
local hint = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
hint:SetPoint("TOP",title,"BOTTOM",0,-8); hint:SetText("Target an online player, then manage the bot profile.")

local function command(text)
  SendChatMessage(text, "SAY")
end

local function button(text,x,y,fn)
  local b=CreateFrame("Button",nil,frame,"UIPanelButtonTemplate")
  b:SetWidth(175); b:SetHeight(28); b:SetPoint("TOPLEFT",x,y); b:SetText(text)
  b:SetScript("OnClick",fn); return b
end

button("Create / Attach",22,-72,function() command(".autobot add") end)
button("Delete Profile",232,-72,function() command(".autobot delete") end)
button("Attach",22,-108,function() command(".autobot attach") end)
button("Detach",232,-108,function() command(".autobot detach") end)
button("Start AI",22,-144,function() command(".autobot start") end)
button("Stop AI",232,-144,function() command(".autobot stop") end)
button("Info",22,-180,function() command(".autobot info") end)
button("List All Bots",232,-180,function() command(".autobot list") end)
button("Start Enabled Headless",22,-348,function() command(".autobot startall") end)
button("Stop Headless Bots",232,-348,function() command(".autobot stopall") end)

local endpoint = CreateFrame("EditBox","AutonomousBotEndpoint",frame,"InputBoxTemplate")
endpoint:SetWidth(175); endpoint:SetHeight(28); endpoint:SetPoint("TOPLEFT",22,-222); endpoint:SetAutoFocus(false); endpoint:SetText("127.0.0.1:8765")
local endpointButton=CreateFrame("Button",nil,frame,"UIPanelButtonTemplate")
endpointButton:SetWidth(175); endpointButton:SetHeight(28); endpointButton:SetPoint("TOPLEFT",232,-222); endpointButton:SetText("Set Endpoint")
endpointButton:SetScript("OnClick",function()
  local host,port=string.match(endpoint:GetText(),"^([^:]+):(%d+)$")
  if host and port then command(".autobot edit endpoint "..host.." "..port) end
end)

local personality = CreateFrame("EditBox","AutonomousBotPersonality",frame,"InputBoxTemplate")
personality:SetWidth(175); personality:SetHeight(28); personality:SetPoint("TOPLEFT",22,-264); personality:SetAutoFocus(false); personality:SetText("balanced")
local personalityButton=CreateFrame("Button",nil,frame,"UIPanelButtonTemplate")
personalityButton:SetWidth(175); personalityButton:SetHeight(28); personalityButton:SetPoint("TOPLEFT",232,-264); personalityButton:SetText("Set Personality")
personalityButton:SetScript("OnClick",function()
  local value=personality:GetText()
  if value and value ~= "" then command(".autobot edit personality "..value) end
end)

local quest=CreateFrame("EditBox","AutonomousBotQuestId",frame,"InputBoxTemplate")
quest:SetWidth(175); quest:SetHeight(28); quest:SetPoint("TOPLEFT",22,-306); quest:SetAutoFocus(false); quest:SetText("Quest ID")
local qbutton=CreateFrame("Button",nil,frame,"UIPanelButtonTemplate")
qbutton:SetWidth(175); qbutton:SetHeight(28); qbutton:SetPoint("TOPLEFT",232,-306); qbutton:SetText("Assign Quest")
qbutton:SetScript("OnClick",function()
  local id=tonumber(quest:GetText()); if id then command(".autobot quest "..id) end
end)

local close=CreateFrame("Button",nil,frame,"UIPanelButtonTemplate")
close:SetWidth(100); close:SetHeight(28); close:SetPoint("BOTTOM",0,12); close:SetText("Close")
close:SetScript("OnClick",function() frame:Hide() end)

SLASH_AUTOBOT1="/autobot"
SlashCmdList["AUTOBOT"]=function() frame:SetShown(not frame:IsShown()) end
