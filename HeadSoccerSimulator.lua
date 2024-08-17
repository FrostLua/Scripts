-- updated 31st of march 2024
--[[
Read licene to know your rights with the script!

]]


local function createPlatformGUI()
    local platformGUI = Instance.new("ScreenGui")
    platformGUI.Name = "PlatformSelection"
    platformGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    frame.BorderSizePixel = 0
    frame.Parent = platformGUI

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.2, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Select Your Platform"
    title.TextSize = 20
    title.Font = Enum.Font.GothamSemibold
    title.TextColor3 = Color3.fromRGB(20, 20, 20)
    title.BackgroundTransparency = 1 
    title.Parent = frame

    local function addButton(text, url)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.8, 0, 0.15, 0)
        button.Position = UDim2.new(0.1, 0, (#frame:GetChildren() - 1) * 0.2 + 0.25, 0)
        button.Text = text
        button.Font = Enum.Font.Gotham
        button.TextSize = 18
        button.TextColor3 = Color3.fromRGB(255, 255, 255) 
        button.BackgroundColor3 = Color3.fromRGB(58, 130, 247) 
        button.BorderSizePixel = 0
        button.Parent = frame
        button.MouseButton1Click:Connect(function()
            platformGUI:Destroy()
            device = text:lower() 
        end)
    end

    addButton("PC", "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua")
    addButton("Emulator", "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua")
    addButton("Mobile", "https://raw.githubusercontent.com/NICKISBAD/Nick-s-Modded-KAVO-Lib/main/Nick'sModdedKavoLib.lua")
end

createPlatformGUI()

repeat
    wait()
until device == "mobile" or device == "pc" or device == "emulator"

local libchoose

if device == "mobile" then
    libchoose = "https://raw.githubusercontent.com/NICKISBAD/Nick-s-Modded-KAVO-Lib/main/Nick'sModdedKavoLib.lua"
elseif device == "pc" then
    libchoose = "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"
elseif device == "emulator" then
    libchoose = "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"
end














































































local Library = loadstring(game:HttpGet(libchoose))()

local scriptversion = "1.1.0 "
local discord = "discord.gg/XUUjpeyc3S "
local credit = "made by _shqiperia_ on dc"
local Window = Library.CreateLib("Frosties " .. scriptversion .. discord, "GrapeTheme")

local Main = Window:NewTab("Main")
local Eggs = Window:NewTab("Eggs")
local Teleports = Window:NewTab("Teleports")
local Credits = Window:NewTab("Credits")
local MainSection1 = Main:NewSection("Auto Farms")
local EggsSection1 = Eggs:NewSection("Eggs")
local TeleportsSection1 = Teleports:NewSection("Teleports")
local CreditsSection1 = Credits:NewSection("Credits")
local ClickBypassEnabled = false
local RealClickEnabled = false

local function ClickBypass()
    while ClickBypassEnabled do
        game:GetService("ReplicatedStorage").CurrentGame.Managers.Training.Training_UI.Click:Fire()
        wait(0.1)
    end
end

local function RealClick()
    while RealClickEnabled do
        game:GetService("ReplicatedStorage").CurrentGame.Managers.Training.Training_m.UpdateManualClicking:InvokeServer()
        wait(0.1)
    end
end

local autocometEnabled = false
local function autocomet()
    while autocometEnabled do
        game:GetService("ReplicatedStorage").CurrentGame.Managers.Comets.Comets_m.OpenComet:InvokeServer()
        wait(0.1)
    end
end

local opponent = nil


local autogetopponentenabled = false
local function autogetopponent()
    while autogetopponentenabled do
        local strength = game:GetService("Players").LocalPlayer.DataSave.Strength.Value
        strength = tonumber(strength)
        if strength <= 21120 then
            opponent = "Default"
        elseif strength <= 132000 then
            opponent = "Grandma"
        elseif strength <= 1540000 then
            opponent = "Cowboy"
        elseif strength <= 19800000 then
            opponent = "Ronaldo"
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Ronaldo", "Score")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Ronaldo", "BonusShot")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_UI.FinishedLeavingBattle:Fire()
        elseif strength <= 32560000 then
            opponent = "Goku"
        elseif strength <= 56320000 then
            opponent = "Diver"
        elseif strength <= 682000000 then
            opponent = "Monkey"
        elseif strength <= 9900000000 then
            opponent = "Tourist"
        elseif strength <= 71280000000 then
            opponent = "Pufferfish"
        elseif strength <= 100300000000 then
            opponent = "Shark" 
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Shark", "Score")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Shark", "BonusShot")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_UI.FinishedLeavingBattle:Fire()
        elseif strength <= 162000000000 then
            opponent = "Peter"
        elseif strength <= 950000000000 then
            opponent = "Hiker" 
        elseif strength <= 2700000000000 then
            opponent = "Snowman"
        elseif strength <= 45000000000000 then
            opponent = "Yeti"
        elseif strength <= 320000000000000 then
            opponent = "Elf"
        elseif strength <= 450000000000000 then
            opponent = "Doge"
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Doge", "Score")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Doge", "BonusShot")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_UI.FinishedLeavingBattle:Fire()
        elseif strength <= 800000000000000 then
            opponent = "Sussy"
        elseif strength <= 4800000000000000 then
            opponent = "Football"
        elseif strength <= 12500000000000000 then
            opponent = "Skeleton"
        elseif strength <= 19500000000000000 then
            opponent = "Blue"
        elseif strength <= 129500000000000000 then
            opponent = "Girl"
        elseif strength <= 140000000000000000 then
            opponent = "Egg"
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Egg", "Score")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Egg", "BonusShot")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_UI.FinishedLeavingBattle:Fire()
        elseif strength <= 150000000000000000 then
            opponent = "Batman"
        elseif strength <= 855000000000000000 then
            opponent = "Astronaut"
        elseif strength <= 1825000000000000000 then
            opponent = "Pilot"
        elseif strength <= 30000000000000000000 then
            opponent = "Alien"
        elseif strength <= 215000000000000000000 then
            opponent = "Cursed"
        elseif strength <= 36000000000000000000000 then 
            opponent = "Proud"
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Proud", "Score")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Proud", "BonusShot")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_UI.FinishedLeavingBattle:Fire()
        elseif strength <= 155000000000000000000000 then
            opponent = "Thanos"
        elseif strength <= 849900000000000000000000 then
            opponent = "Farmer"
        elseif strength <= 2249000000000000000000000 then
            opponent = "Bodybuilder"
        elseif strength <= 37500000000000000000000000 then
            opponent = "Plant"
        elseif strength <= 45000000000000000000000000 then
            opponent = "Kitty"
        elseif strength <= 80000000000000000000000000 then
            opponent = "Nightmare"
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Nightmare", "Score")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer("Nightmare", "BonusShot")
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_UI.FinishedLeavingBattle:Fire()
        elseif strength <= 500000000000000000000000000 then
            opponent = "Hamster"
        elseif strength <= 3250000000000000000000000000 then
            opponent = "Parrot"
        elseif strength <= 8250000000000000000000000000 then
            opponent = "Pirate"
        elseif strength <= 135000000000000000000000000000 then
            opponent = "Emoji"
        elseif strength <= 1000000000000000000000000000000 then
            opponent = "Mike"
        elseif strength <= 3000000000000000000000000000000 then
            opponent = "Nightmare2"
        elseif strength <= 31250000000000000000000000000000 then
            opponent = "Moai"
        elseif strength <= 250000000000000000000000000000000 then
            opponent = "Mech-Cat"
        elseif strength <= 700000000000000000000000000000000 then
            opponent = "Smurf"
        elseif strength <= 12500000000000000000000000000000000 then
            opponent = "Mr Cool"
        elseif strength <= 87500000000000000000000000000000000 then
            opponent = "Dog"
        else
            opponent = "Lemon"
        end
        wait(.1)
    end
end
local autowinenabled = false

local function autowin()
    while autowinenabled do
        if opponent ~= nil then
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer(opponent, "Score")
            wait(.2)
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_m.GiveWins_RE:FireServer(opponent, "BonusShot")
            wait(.1)
            game:GetService("ReplicatedStorage").CurrentGame.Managers.Battles.Fight.Fight_UI.FinishedLeavingBattle:Fire()
        else
            wait(.1)
        end
        wait(.1)
    end
end

MainSection1:NewLabel("Update: Now supports every world!.")

MainSection1:NewToggle("Auto Click", "Will auto click.", function(state)
    if state then
        ClickBypassEnabled = true
        RealClickEnabled = true
        ClickBypass()
        RealClick() 
    else
        ClickBypassEnabled = false
        RealClickEnabled = false
    end
end)

MainSection1:NewToggle("Auto Get Infinite Comets & Open", "Gives you infinite comets, and will open the comets.", function(state)
    if state then
        autocometEnabled = true
        autocomet() 
    else
        autocometEnabled = false
    end
end)


MainSection1:NewToggle("Auto Wins (retoggle if not work)", "Automatically farm your wins.", function(state)
    autowinenabled = state
    if state then
        autogetopponentenabled = true
        autogetopponent()
        wait(.1)
        autowinenabled = true
        autowin()
    else
        autowinenabled = false
        autogetopponentenabled = false
    end
end)

MainSection1:NewToggle("Auto Rebirth", "Automatically rebirths when you have enough trophies.", function(state)
    while state do
        game:GetService("ReplicatedStorage").CurrentGame.Stats.Rebirths.Rebirths_m.RebirthUsingTrophies:InvokeServer()
        wait(.5)
    end
end)

MainSection1:NewToggle("Auto Claim Index Rewards", "Automatically claims the index rewards.", function(state)
    while state do
        game:GetService("ReplicatedStorage").CurrentGame.Lobby.Index.Index_m.ClaimNextReward:InvokeServer()
        wait(.5)
    end
end)


EggsSection1:NewLabel("Currently only supports World 1.")
EggsSection1:NewLabel("World 1 Eggs")


EggsSection1:NewToggle("Auto Open Egg 1, World 1", "This will automatically open the first egg of world one.", function(state)
    if state then
        while state do
            local a={[1]={["Pets"]={[1]={["Object"]={["StrengthMultiplier"]=1,["CameraZoomoutDistance"]=0.75,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=0,["Name"]="Common",["SuperLuckAdd"]=0,["Color"]=nil,["LuckAdd"]=0,["HasForms"]=true,["DisplayName"]="Common"},["Zone"]={["LayoutOrder"]=1,["Name"]="Zone1",["BossOpponent"]={["StrengthNeeded"]="17600000",["HeadHeight"]=0,["DisplayName"]="Ronaldo",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="BOSS",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Ronaldo",["Trophies_Score"]="500",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},["Opponents"]={[1]={["StrengthNeeded"]="660",["HeadHeight"]=0,["DisplayName"]="Striker",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Easy",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Default",["Trophies_Score"]="1",["FeetHidden"]=false,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[2]={["StrengthNeeded"]="21120",["HeadHeight"]=-0.8,["DisplayName"]="Grandma",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Medium",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Grandma",["Trophies_Score"]="5",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[3]={["StrengthNeeded"]="132000",["HeadHeight"]=0,["DisplayName"]="Cowboy",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Hard",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Cowboy",["Trophies_Score"]="20",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[4]={["StrengthNeeded"]="1540000.0000000002",["HeadHeight"]=-0.3,["DisplayName"]="Clown",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Expert",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Clown",["Trophies_Score"]="100",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil},[5]={},[6]={["LobbyAnimation"]="Bonus_Levitate",["StrengthNeeded"]="19800000",["Scale"]=2,["Name"]="Goku",["HeadHeight"]=0,["DisplayName"]="Roku",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="SAIYAN",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=true},["lowerMultiplier"]=true,["Trophies_Score"]="1000",["FeetHidden"]=false,["AdjustNametag"]=Vector3.new(0,-4,0),["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil}},["Arena"]="Arena1",["TrophiesNeeded"]="10000",["DisplayName"]="Starter Zone"},["Name"]="Dog",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Dog"},["Scale"]=35},[2]={["Object"]={["StrengthMultiplier"]=1.2,["CameraZoomoutDistance"]=0.75,["Rarity"]={},["Zone"]={},["Name"]="Pig",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Pig"},["Scale"]=30},[3]={["Object"]={["StrengthMultiplier"]=1.4,["CameraZoomoutDistance"]=0.7,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=5,["Name"]="Uncommon",["SuperLuckAdd"]=5,["Color"]=nil,["LuckAdd"]=5,["HasForms"]=true,["DisplayName"]="Uncommon"},["Zone"]={},["Name"]="Chicken",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Chicken"},["Scale"]=22},[4]={["Object"]={["StrengthMultiplier"]=1.6,["CameraZoomoutDistance"]=0.85,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=10,["Name"]="Rare",["SuperLuckAdd"]=10,["Color"]=nil,["LuckAdd"]=10,["HasForms"]=true,["DisplayName"]="Rare"},["Zone"]={},["Name"]="Cow",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Cow"},["Scale"]=11},[5]={["Object"]={["StrengthMultiplier"]=4,["CameraZoomoutDistance"]=0.85,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=25,["Name"]="Epic",["SuperLuckAdd"]=20,["Color"]=nil,["LuckAdd"]=15,["HasForms"]=true,["DisplayName"]="Epic"},["Zone"]={},["Name"]="Lucky Cat",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Lucky Cat"},["Scale"]=2}},["EggType"]="Default",["Name"]="Default1",["Zone"]={},["Price"]=10,["DisplayName"]=""},[2]=false}a[1].Pets[1].Object.Zone.Opponents[5]=a[1].Pets[1].Object.Zone.BossOpponent;a[1].Pets[2].Object.Rarity=a[1].Pets[1].Object.Rarity;a[1].Pets[2].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[3].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[4].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[5].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Zone=a[1].Pets[1].Object.Zone;game:GetService("ReplicatedStorage").CurrentGame.Pets.Eggs.Eggs_m.BuyEgg:InvokeServer(unpack(a))
            wait(.1)
        end
    else
        print("Auto Egg 1, World 1 Turned Off")
    end
end)

EggsSection1:NewButton("Open Egg 1, World 1", "This will open the first egg of world one.", function()
        local a={[1]={["Pets"]={[1]={["Object"]={["StrengthMultiplier"]=1,["CameraZoomoutDistance"]=0.75,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=0,["Name"]="Common",["SuperLuckAdd"]=0,["Color"]=nil,["LuckAdd"]=0,["HasForms"]=true,["DisplayName"]="Common"},["Zone"]={["LayoutOrder"]=1,["Name"]="Zone1",["BossOpponent"]={["StrengthNeeded"]="17600000",["HeadHeight"]=0,["DisplayName"]="Ronaldo",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="BOSS",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Ronaldo",["Trophies_Score"]="500",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},["Opponents"]={[1]={["StrengthNeeded"]="660",["HeadHeight"]=0,["DisplayName"]="Striker",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Easy",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Default",["Trophies_Score"]="1",["FeetHidden"]=false,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[2]={["StrengthNeeded"]="21120",["HeadHeight"]=-0.8,["DisplayName"]="Grandma",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Medium",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Grandma",["Trophies_Score"]="5",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[3]={["StrengthNeeded"]="132000",["HeadHeight"]=0,["DisplayName"]="Cowboy",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Hard",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Cowboy",["Trophies_Score"]="20",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[4]={["StrengthNeeded"]="1540000.0000000002",["HeadHeight"]=-0.3,["DisplayName"]="Clown",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Expert",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Clown",["Trophies_Score"]="100",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil},[5]={},[6]={["LobbyAnimation"]="Bonus_Levitate",["StrengthNeeded"]="19800000",["Scale"]=2,["Name"]="Goku",["HeadHeight"]=0,["DisplayName"]="Roku",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="SAIYAN",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=true},["lowerMultiplier"]=true,["Trophies_Score"]="1000",["FeetHidden"]=false,["AdjustNametag"]=Vector3.new(0,-4,0),["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil}},["Arena"]="Arena1",["TrophiesNeeded"]="10000",["DisplayName"]="Starter Zone"},["Name"]="Dog",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Dog"},["Scale"]=35},[2]={["Object"]={["StrengthMultiplier"]=1.2,["CameraZoomoutDistance"]=0.75,["Rarity"]={},["Zone"]={},["Name"]="Pig",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Pig"},["Scale"]=30},[3]={["Object"]={["StrengthMultiplier"]=1.4,["CameraZoomoutDistance"]=0.7,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=5,["Name"]="Uncommon",["SuperLuckAdd"]=5,["Color"]=nil,["LuckAdd"]=5,["HasForms"]=true,["DisplayName"]="Uncommon"},["Zone"]={},["Name"]="Chicken",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Chicken"},["Scale"]=22},[4]={["Object"]={["StrengthMultiplier"]=1.6,["CameraZoomoutDistance"]=0.85,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=10,["Name"]="Rare",["SuperLuckAdd"]=10,["Color"]=nil,["LuckAdd"]=10,["HasForms"]=true,["DisplayName"]="Rare"},["Zone"]={},["Name"]="Cow",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Cow"},["Scale"]=11},[5]={["Object"]={["StrengthMultiplier"]=4,["CameraZoomoutDistance"]=0.85,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=25,["Name"]="Epic",["SuperLuckAdd"]=20,["Color"]=nil,["LuckAdd"]=15,["HasForms"]=true,["DisplayName"]="Epic"},["Zone"]={},["Name"]="Lucky Cat",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Lucky Cat"},["Scale"]=2}},["EggType"]="Default",["Name"]="Default1",["Zone"]={},["Price"]=10,["DisplayName"]=""},[2]=false}a[1].Pets[1].Object.Zone.Opponents[5]=a[1].Pets[1].Object.Zone.BossOpponent;a[1].Pets[2].Object.Rarity=a[1].Pets[1].Object.Rarity;a[1].Pets[2].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[3].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[4].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[5].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Zone=a[1].Pets[1].Object.Zone;game:GetService("ReplicatedStorage").CurrentGame.Pets.Eggs.Eggs_m.BuyEgg:InvokeServer(unpack(a))
end)

EggsSection1:NewToggle("Auto Open Egg 2, World 1", "This will automatically open the second egg of world one.", function(state)
    if state then
        while state do
                local a={[1]={["Pets"]={[1]={["Object"]={["StrengthMultiplier"]=1.3,["CameraZoomoutDistance"]=0.8,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=0,["Name"]="Common",["SuperLuckAdd"]=0,["Color"]=nil,["LuckAdd"]=0,["HasForms"]=true,["DisplayName"]="Common"},["Zone"]={["LayoutOrder"]=1,["Name"]="Zone1",["BossOpponent"]={["StrengthNeeded"]="17600000",["HeadHeight"]=0,["DisplayName"]="Ronaldo",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="BOSS",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Ronaldo",["Trophies_Score"]="500",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},["Opponents"]={[1]={["StrengthNeeded"]="660",["HeadHeight"]=0,["DisplayName"]="Striker",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Easy",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Default",["Trophies_Score"]="1",["FeetHidden"]=false,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[2]={["StrengthNeeded"]="21120",["HeadHeight"]=-0.8,["DisplayName"]="Grandma",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Medium",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Grandma",["Trophies_Score"]="5",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[3]={["StrengthNeeded"]="132000",["HeadHeight"]=0,["DisplayName"]="Cowboy",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Hard",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Cowboy",["Trophies_Score"]="20",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[4]={["StrengthNeeded"]="1540000.0000000002",["HeadHeight"]=-0.3,["DisplayName"]="Clown",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Expert",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Clown",["Trophies_Score"]="100",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil},[5]={},[6]={["LobbyAnimation"]="Bonus_Levitate",["StrengthNeeded"]="19800000",["Scale"]=2,["Name"]="Goku",["HeadHeight"]=0,["DisplayName"]="Roku",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="SAIYAN",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=true},["lowerMultiplier"]=true,["Trophies_Score"]="1000",["FeetHidden"]=false,["AdjustNametag"]=Vector3.new(0,-4,0),["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil}},["Arena"]="Arena1",["TrophiesNeeded"]="10000",["DisplayName"]="Starter Zone"},["Name"]="Mouse",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Mouse"},["Scale"]=35},[2]={["Object"]={["StrengthMultiplier"]=1.6,["CameraZoomoutDistance"]=0.65,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=5,["Name"]="Uncommon",["SuperLuckAdd"]=5,["Color"]=nil,["LuckAdd"]=5,["HasForms"]=true,["DisplayName"]="Uncommon"},["Zone"]={},["Name"]="Bird",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Bird"},["Scale"]=30},[3]={["Object"]={["StrengthMultiplier"]=1.9,["CameraZoomoutDistance"]=0.7,["Rarity"]={},["Zone"]={},["Name"]="Tiger",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Tiger"},["Scale"]=22},[4]={["Object"]={["StrengthMultiplier"]=2.2,["CameraZoomoutDistance"]=0.7,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=10,["Name"]="Rare",["SuperLuckAdd"]=10,["Color"]=nil,["LuckAdd"]=10,["HasForms"]=true,["DisplayName"]="Rare"},["Zone"]={},["Name"]="Squirrel",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Squirrel"},["Scale"]=11},[5]={["Object"]={["StrengthMultiplier"]=5.5,["CameraZoomoutDistance"]=0.3,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=25,["Name"]="Epic",["SuperLuckAdd"]=20,["Color"]=nil,["LuckAdd"]=15,["HasForms"]=true,["DisplayName"]="Epic"},["Zone"]={},["Name"]="Spider",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Spider"},["Scale"]=2}},["EggType"]="Default",["Name"]="Default2",["Zone"]={},["Price"]=120,["DisplayName"]=""},[2]=false}a[1].Pets[1].Object.Zone.Opponents[5]=a[1].Pets[1].Object.Zone.BossOpponent;a[1].Pets[2].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[3].Object.Rarity=a[1].Pets[2].Object.Rarity;a[1].Pets[3].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[4].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[5].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Zone=a[1].Pets[1].Object.Zone;game:GetService("ReplicatedStorage").CurrentGame.Pets.Eggs.Eggs_m.BuyEgg:InvokeServer(unpack(a))
            wait(.1)
        end
    else
        print("Auto Egg 2, World 1 Turned Off")
    end
end)

EggsSection1:NewButton("Open Egg 2, World 1", "This will open the second egg of world one.", function()
    local a={[1]={["Pets"]={[1]={["Object"]={["StrengthMultiplier"]=1.3,["CameraZoomoutDistance"]=0.8,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=0,["Name"]="Common",["SuperLuckAdd"]=0,["Color"]=nil,["LuckAdd"]=0,["HasForms"]=true,["DisplayName"]="Common"},["Zone"]={["LayoutOrder"]=1,["Name"]="Zone1",["BossOpponent"]={["StrengthNeeded"]="17600000",["HeadHeight"]=0,["DisplayName"]="Ronaldo",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="BOSS",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Ronaldo",["Trophies_Score"]="500",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},["Opponents"]={[1]={["StrengthNeeded"]="660",["HeadHeight"]=0,["DisplayName"]="Striker",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Easy",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Default",["Trophies_Score"]="1",["FeetHidden"]=false,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[2]={["StrengthNeeded"]="21120",["HeadHeight"]=-0.8,["DisplayName"]="Grandma",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Medium",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Grandma",["Trophies_Score"]="5",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[3]={["StrengthNeeded"]="132000",["HeadHeight"]=0,["DisplayName"]="Cowboy",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Hard",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Cowboy",["Trophies_Score"]="20",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[4]={["StrengthNeeded"]="1540000.0000000002",["HeadHeight"]=-0.3,["DisplayName"]="Clown",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Expert",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Clown",["Trophies_Score"]="100",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil},[5]={},[6]={["LobbyAnimation"]="Bonus_Levitate",["StrengthNeeded"]="19800000",["Scale"]=2,["Name"]="Goku",["HeadHeight"]=0,["DisplayName"]="Roku",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="SAIYAN",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=true},["lowerMultiplier"]=true,["Trophies_Score"]="1000",["FeetHidden"]=false,["AdjustNametag"]=Vector3.new(0,-4,0),["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil}},["Arena"]="Arena1",["TrophiesNeeded"]="10000",["DisplayName"]="Starter Zone"},["Name"]="Mouse",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Mouse"},["Scale"]=35},[2]={["Object"]={["StrengthMultiplier"]=1.6,["CameraZoomoutDistance"]=0.65,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=5,["Name"]="Uncommon",["SuperLuckAdd"]=5,["Color"]=nil,["LuckAdd"]=5,["HasForms"]=true,["DisplayName"]="Uncommon"},["Zone"]={},["Name"]="Bird",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Bird"},["Scale"]=30},[3]={["Object"]={["StrengthMultiplier"]=1.9,["CameraZoomoutDistance"]=0.7,["Rarity"]={},["Zone"]={},["Name"]="Tiger",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Tiger"},["Scale"]=22},[4]={["Object"]={["StrengthMultiplier"]=2.2,["CameraZoomoutDistance"]=0.7,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=10,["Name"]="Rare",["SuperLuckAdd"]=10,["Color"]=nil,["LuckAdd"]=10,["HasForms"]=true,["DisplayName"]="Rare"},["Zone"]={},["Name"]="Squirrel",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Squirrel"},["Scale"]=11},[5]={["Object"]={["StrengthMultiplier"]=5.5,["CameraZoomoutDistance"]=0.3,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=25,["Name"]="Epic",["SuperLuckAdd"]=20,["Color"]=nil,["LuckAdd"]=15,["HasForms"]=true,["DisplayName"]="Epic"},["Zone"]={},["Name"]="Spider",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Spider"},["Scale"]=2}},["EggType"]="Default",["Name"]="Default2",["Zone"]={},["Price"]=120,["DisplayName"]=""},[2]=false}a[1].Pets[1].Object.Zone.Opponents[5]=a[1].Pets[1].Object.Zone.BossOpponent;a[1].Pets[2].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[3].Object.Rarity=a[1].Pets[2].Object.Rarity;a[1].Pets[3].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[4].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[5].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Zone=a[1].Pets[1].Object.Zone;game:GetService("ReplicatedStorage").CurrentGame.Pets.Eggs.Eggs_m.BuyEgg:InvokeServer(unpack(a))
end)

EggsSection1:NewToggle("Auto Open Egg 3, World 1", "This will automatically open the third egg of world one.", function(state)
    if state then
        while state do
            local a={[1]={["Pets"]={[1]={["Object"]={["StrengthMultiplier"]=2,["CameraZoomoutDistance"]=1.3,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=0,["Name"]="Common",["SuperLuckAdd"]=0,["Color"]=nil,["LuckAdd"]=0,["HasForms"]=true,["DisplayName"]="Common"},["Zone"]={["LayoutOrder"]=1,["Name"]="Zone1",["BossOpponent"]={["StrengthNeeded"]="17600000",["HeadHeight"]=0,["DisplayName"]="Ronaldo",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="BOSS",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Ronaldo",["Trophies_Score"]="500",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},["Opponents"]={[1]={["StrengthNeeded"]="660",["HeadHeight"]=0,["DisplayName"]="Striker",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Easy",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Default",["Trophies_Score"]="1",["FeetHidden"]=false,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[2]={["StrengthNeeded"]="21120",["HeadHeight"]=-0.8,["DisplayName"]="Grandma",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Medium",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Grandma",["Trophies_Score"]="5",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[3]={["StrengthNeeded"]="132000",["HeadHeight"]=0,["DisplayName"]="Cowboy",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Hard",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Cowboy",["Trophies_Score"]="20",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[4]={["StrengthNeeded"]="1540000.0000000002",["HeadHeight"]=-0.3,["DisplayName"]="Clown",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Expert",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Clown",["Trophies_Score"]="100",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil},[5]={},[6]={["LobbyAnimation"]="Bonus_Levitate",["StrengthNeeded"]="19800000",["Scale"]=2,["Name"]="Goku",["HeadHeight"]=0,["DisplayName"]="Roku",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="SAIYAN",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=true},["lowerMultiplier"]=true,["Trophies_Score"]="1000",["FeetHidden"]=false,["AdjustNametag"]=Vector3.new(0,-4,0),["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil}},["Arena"]="Arena1",["TrophiesNeeded"]="10000",["DisplayName"]="Starter Zone"},["Name"]="Ant",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Ant"},["Scale"]=35},[2]={["Object"]={["StrengthMultiplier"]=2.4,["CameraZoomoutDistance"]=0.6,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=5,["Name"]="Uncommon",["SuperLuckAdd"]=5,["Color"]=nil,["LuckAdd"]=5,["HasForms"]=true,["DisplayName"]="Uncommon"},["Zone"]={},["Name"]="Owl",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Owl"},["Scale"]=30},[3]={["Object"]={["StrengthMultiplier"]=2.8,["CameraZoomoutDistance"]=0.75,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=10,["Name"]="Rare",["SuperLuckAdd"]=10,["Color"]=nil,["LuckAdd"]=10,["HasForms"]=true,["DisplayName"]="Rare"},["Zone"]={},["Name"]="Blue Bug",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Blue Bug"},["Scale"]=22},[4]={["Object"]={["StrengthMultiplier"]=3.2,["CameraZoomoutDistance"]=0.6,["Rarity"]={},["Zone"]={},["Name"]="Demon",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Demon"},["Scale"]=11},[5]={["Object"]={["StrengthMultiplier"]=6,["CameraZoomoutDistance"]=0.3,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=25,["Name"]="Epic",["SuperLuckAdd"]=20,["Color"]=nil,["LuckAdd"]=15,["HasForms"]=true,["DisplayName"]="Epic"},["Zone"]={},["Name"]="Green Dragon",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Green Dragon"},["Scale"]=2}},["EggType"]="Default",["Name"]="Default3",["Zone"]={},["Price"]=700,["DisplayName"]=""},[2]=false}a[1].Pets[1].Object.Zone.Opponents[5]=a[1].Pets[1].Object.Zone.BossOpponent;a[1].Pets[2].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[3].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[4].Object.Rarity=a[1].Pets[3].Object.Rarity;a[1].Pets[4].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[5].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Zone=a[1].Pets[1].Object.Zone;game:GetService("ReplicatedStorage").CurrentGame.Pets.Eggs.Eggs_m.BuyEgg:InvokeServer(unpack(a))
            wait(.1)
        end
    else
        print("Auto Egg 3, World 1 Turned Off")
    end
end)

local function tpcalls()
    game:GetService("ReplicatedStorage").CurrentGame.Lobby.Collectables.Trails.Trails_m.Logic_CurrentStrengthMultiplier:Invoke(game:GetService("Players").LocalPlayer)
    game:GetService("ReplicatedStorage").CurrentGame.Lobby.Collectables.Shoes.Shoes_m.Logic_CurrentBasePerClick:Invoke(game:GetService("Players").LocalPlayer)
    game:GetService("ReplicatedStorage").CurrentGame.Stats.Rebirths.Rebirths_m.Get_RebirthBoostForPlayer:Invoke(game:GetService("Players").LocalPlayer)
end

EggsSection1:NewButton("Open Egg 3, World 1", "This will open the third egg of world one.", function()
    tpcalls()
    local a={[1]={["Pets"]={[1]={["Object"]={["StrengthMultiplier"]=2,["CameraZoomoutDistance"]=1.3,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=0,["Name"]="Common",["SuperLuckAdd"]=0,["Color"]=nil,["LuckAdd"]=0,["HasForms"]=true,["DisplayName"]="Common"},["Zone"]={["LayoutOrder"]=1,["Name"]="Zone1",["BossOpponent"]={["StrengthNeeded"]="17600000",["HeadHeight"]=0,["DisplayName"]="Ronaldo",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="BOSS",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Ronaldo",["Trophies_Score"]="500",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},["Opponents"]={[1]={["StrengthNeeded"]="660",["HeadHeight"]=0,["DisplayName"]="Striker",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Easy",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Default",["Trophies_Score"]="1",["FeetHidden"]=false,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[2]={["StrengthNeeded"]="21120",["HeadHeight"]=-0.8,["DisplayName"]="Grandma",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Medium",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Grandma",["Trophies_Score"]="5",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[3]={["StrengthNeeded"]="132000",["HeadHeight"]=0,["DisplayName"]="Cowboy",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Hard",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Cowboy",["Trophies_Score"]="20",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=false,["FeetColor"]=nil},[4]={["StrengthNeeded"]="1540000.0000000002",["HeadHeight"]=-0.3,["DisplayName"]="Clown",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="Expert",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=false},["Name"]="Clown",["Trophies_Score"]="100",["FeetHidden"]=true,["lowerMultiplier"]=true,["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil},[5]={},[6]={["LobbyAnimation"]="Bonus_Levitate",["StrengthNeeded"]="19800000",["Scale"]=2,["Name"]="Goku",["HeadHeight"]=0,["DisplayName"]="Roku",["Difficulty"]={["LobbyTextColor"]=nil,["AutoFightBackgroundColor"]=nil,["Name"]="SAIYAN",["PlayingTextColor"]=nil,["LobbyStrokeColor"]=nil,["IsSpecialOpponent"]=true},["lowerMultiplier"]=true,["Trophies_Score"]="1000",["FeetHidden"]=false,["AdjustNametag"]=Vector3.new(0,-4,0),["HeadColor"]=nil,["HeadHidden"]=true,["FeetColor"]=nil}},["Arena"]="Arena1",["TrophiesNeeded"]="10000",["DisplayName"]="Starter Zone"},["Name"]="Ant",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Ant"},["Scale"]=35},[2]={["Object"]={["StrengthMultiplier"]=2.4,["CameraZoomoutDistance"]=0.6,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=5,["Name"]="Uncommon",["SuperLuckAdd"]=5,["Color"]=nil,["LuckAdd"]=5,["HasForms"]=true,["DisplayName"]="Uncommon"},["Zone"]={},["Name"]="Owl",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Owl"},["Scale"]=30},[3]={["Object"]={["StrengthMultiplier"]=2.8,["CameraZoomoutDistance"]=0.75,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=10,["Name"]="Rare",["SuperLuckAdd"]=10,["Color"]=nil,["LuckAdd"]=10,["HasForms"]=true,["DisplayName"]="Rare"},["Zone"]={},["Name"]="Blue Bug",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Blue Bug"},["Scale"]=22},[4]={["Object"]={["StrengthMultiplier"]=3.2,["CameraZoomoutDistance"]=0.6,["Rarity"]={},["Zone"]={},["Name"]="Demon",["Form"]="Default",["ExtraHeight"]=0.1,["DisplayName"]="Demon"},["Scale"]=11},[5]={["Object"]={["StrengthMultiplier"]=6,["CameraZoomoutDistance"]=0.3,["Rarity"]={["LayoutOrder"]=1,["MegaLuckAdd"]=25,["Name"]="Epic",["SuperLuckAdd"]=20,["Color"]=nil,["LuckAdd"]=15,["HasForms"]=true,["DisplayName"]="Epic"},["Zone"]={},["Name"]="Green Dragon",["Form"]="Default",["ExtraHeight"]=0,["DisplayName"]="Green Dragon"},["Scale"]=2}},["EggType"]="Default",["Name"]="Default3",["Zone"]={},["Price"]=700,["DisplayName"]=""},[2]=false}a[1].Pets[1].Object.Zone.Opponents[5]=a[1].Pets[1].Object.Zone.BossOpponent;a[1].Pets[2].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[3].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[4].Object.Rarity=a[1].Pets[3].Object.Rarity;a[1].Pets[4].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Pets[5].Object.Zone=a[1].Pets[1].Object.Zone;a[1].Zone=a[1].Pets[1].Object.Zone;game:GetService("ReplicatedStorage").CurrentGame.Pets.Eggs.Eggs_m.BuyEgg:InvokeServer(unpack(a))
end)

TeleportsSection1:NewButton("Open teleport GUI", "This will open the teleport GUI", function()
    tpcalls()
    game:GetService("ReplicatedStorage").EveryGame.UI.Popups.Popups_UI.PopupController_h.TogglePopup:Invoke(game:GetService("Players").LocalPlayer.PlayerGui.EveryGame.Popups_o.Map)
end)




CreditsSection1:NewLabel("Made and fully developed, by _shqiperia_ on discord")
CreditsSection1:NewLabel("Discord Invite: discord.gg/XUUjpeyc3S")
CreditsSection1:NewLabel("Made with love by FrostLua ;)")

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Update log 1.1.0", -- Required
	Text = "Added Auto Click, and Auto Win support for every world!", -- Required
    Duration = 100
})
