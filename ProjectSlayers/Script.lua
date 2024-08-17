--[[
Thank you for using Frosties!
Update: 12 PM 1st of August 2024
Update: 12 PM 2nd of August 2024
Update: 12 AM 9th of August 2024
Update: 2 PM 9th of August 2024 (also key sys fix)
Update: 5 PM 9th of August 2024 
Update: 7 PM 12th of August 2024
Update: 9 AM 13th of August 2024 (ACTUALLY FIXED AUTO FARM BOSSES)
Update: 9 PM 13th of August 2024
Update: 2 PM 17th of August 2024 (open src the script)
]]


--[[
Yes, parts of the script are stolen; this was a fork first but ive almost rewritten everything!


Made, and solely developed by frostlua on discord :)
You can skid it; Learn from it; Make a fork of this; but just make sure to credit me :D
It was fun maintaining this project, for the time being.
https://github.com/FrostLua/Scripts/tree/main/ProjectSlayers
Reason for open sourcing: I feel like it's better performance wise to keep it open source and so other people can use the script on shitty executors; It's just a cool and fun project to have.
Please read the License file to know what your rights are specifically with this script!

]]
























--[[
Frosties v1.3 TO DO
by FrostLua


[-] Fix GUI Size for mobile users
[-] Fix Auto Skill
[-] Fix Mugen Delay
[-] Fix Lag with Remove Stun & Remove Mob Block
[ ] Fix Auto Cup Game
[-] Fix Auto Gourd
[ ] Fix Auto Orbs
[-] Optimize way of tweening to bosses
[-] Save settings
[-] View Breathing Progress
[-] Add TP to Trainer
[-] Add TP to Location


]]

local FrostiesKicked, RotatingToBoss, FrostiesVersion = false, false, "1.27"
local RealVersion = loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Scripts/main/ProjectSlayers/Version.lua"))()
local ScriptsVersion = "1.27"
if not (RealVersion == ScriptsVersion) then
    FrostiesKicked = true
    game:GetService("Players").LocalPlayer:Kick("")
    local ErrorPrompt = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt
    ErrorPrompt.TitleFrame.ErrorTitle.Text = "Frosties Authentication Problem"
    ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text = "It seems like you are using an outdated version of Frosties, please use the latest loader!"
    return
end


local pressed = false
if getgenv().Loaded then
    local screenGui = Instance.new("ScreenGui") -- Couldn't care less, thanks chatgpt
    screenGui.Name = "FrostiesNotification"
    screenGui.ResetOnSpawn = false

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 120)
    frame.Position = UDim2.new(1, -310, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(1, 0)
    frame.Parent = screenGui

    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 10)
    frameCorner.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -20, 0, 60)
    textLabel.Position = UDim2.new(0, 10, 0, 10)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 16
    textLabel.Text = "Frosties is already loaded.\nIf you still want to load Frosties, please select the Proceed option!"
    textLabel.TextWrapped = true
    textLabel.Parent = frame

    local proceedButton = Instance.new("TextButton")
    proceedButton.Size = UDim2.new(0, 130, 0, 30)
    proceedButton.Position = UDim2.new(0, 10, 1, -40)
    proceedButton.BackgroundColor3 = Color3.fromRGB(0, 150, 136)
    proceedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    proceedButton.Font = Enum.Font.Gotham
    proceedButton.TextSize = 16
    proceedButton.Text = "Proceed"
    proceedButton.Parent = frame

    local proceedButtonCorner = Instance.new("UICorner")
    proceedButtonCorner.CornerRadius = UDim.new(0, 10)
    proceedButtonCorner.Parent = proceedButton

    local cancelButton = Instance.new("TextButton")
    cancelButton.Size = UDim2.new(0, 130, 0, 30)
    cancelButton.Position = UDim2.new(1, -140, 1, -40)
    cancelButton.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
    cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    cancelButton.Font = Enum.Font.Gotham
    cancelButton.TextSize = 16
    cancelButton.Text = "Cancel"
    cancelButton.Parent = frame

    local cancelButtonCorner = Instance.new("UICorner")
    cancelButtonCorner.CornerRadius = UDim.new(0, 10)
    cancelButtonCorner.Parent = cancelButton

    local function onProceedButtonClick()
        pressed = true
        getgenv().Loaded = false
        screenGui:Destroy()
    end

    local function onCancelButtonClick()
        pressed = true
        getgenv().Loaded = true
        screenGui:Destroy()
    end

    proceedButton.MouseButton1Click:Connect(onProceedButtonClick)
    cancelButton.MouseButton1Click:Connect(onCancelButtonClick)

    screenGui.Parent = game:GetService"Players".LocalPlayer:WaitForChild("PlayerGui")
    
    while not pressed do
        wait()
    end
end

local StartingTime = tick();

if getgenv().Loaded then return end

if not getgenv().Loaded then
    getgenv().Loaded = true
end


local function CustomToString(a)
    return `{a}` -- i love you brizzy
end

if not isfolder("Frosties") then makefolder("Frosties") end

local function EQ(a,b,c)
	if not c then
		return (type(a) == typeof(b) and typeof(a) == type(b) and not(type(a) ~= typeof(b) and typeof(a) ~= type(b))) and ((#CustomToString(a) == #CustomToString(b)) and not (#CustomToString(a) ~= #CustomToString(b))) and rawequal(a,b) and (not(CustomToString(a) < CustomToString(b)) and not (CustomToString(a) > CustomToString(b)) and rawequal(CustomToString(a), CustomToString(b))) 
	end
	return (EQ(a,b) and EQ(a,c) and EQ(b,c))
end

local guiToggle = Instance.new("ScreenGui")
guiToggle.Name = "main"
guiToggle.Parent = game:GetService("CoreGui")

local Butt = Instance.new("TextButton")
Butt.Name = "ToggleButton"
Butt.Size = UDim2.new(0, 60, 0, 60)
Butt.Position = UDim2.new(0, 10, 0, 10)
Butt.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Butt.BorderSizePixel = 0
Butt.Text = ""
Butt.Parent = guiToggle

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Butt

local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Parent = Butt
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0, 5, 0, 5)
Logo.Size = UDim2.new(1, -10, 1, -10)
Logo.Image = "http://www.roblox.com/asset/?id=18871844721"

Butt.MouseButton1Click:Connect(function()
    local virtualInputManager = game:GetService("VirtualInputManager")
    virtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
    virtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
end)

Butt.Draggable = true

if not EQ(game.PlaceId, 5956785391) then
    local Services = setmetatable({}, {
        __index = function(self, index)
            return game:GetService(index)
        end,
    })


                warn("Whitelisted")

                repeat
                    task.wait()
                until game:IsLoaded()

                local Places = 
                {
                    ["Menu"] = 5956785391,
                    ["FirstMap"] = 6152116144,
                    ["AlsoFirstMap"] = 17387475546,
                    ["FirstMapPS"] = 13883279773,
                    ["SecondMap"] = 13881804983,
                    ["SecondMapAgain"] = 17387482786,
                    ["SecondMapPS"] = 13883059853,
                    ["Dungeon"] = 10636616861,
                    ["Mugen"] = 11468034852,
                    ["Ouwigahara"] = 11468075017,
                }

                local Authenticated = false
                local Fluent1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Scripts/main/FluentGUI.lua"))()
                local success, err = ypcall(function()
                    local Content = readfile("Frosties/frostieskey.txt")
                    if Content == "FrostiesOnTop" then
                        print("Key already grabbed!")
                        Authenticated = true
                    else
                        Authenticated = false
                    end
                end)
                if not Authenticated then
                    local Window1 = Fluent1:CreateWindow({
                        Title = "Frosties v"..FrostiesVersion,
                        SubTitle = "discord.gg/XUUjpeyc3S",
                        TabWidth = 160,
                        Size = UDim2.fromOffset(550, 280),
                        Acrylic = true,
                        Theme = "Amethyst",
                        MinimizeKey = Enum.KeyCode.LeftControl
                    })

                    local Tabs1 = {
                        Main = Window1:AddTab({ Title = "Main", Icon = "" }),
                    }


                    Tabs1.Main:AddParagraph({
                        Title = "Key System",
                        Content = "Sorry for making you go through the key system\nI just want all users to be in the discord\nsorry... get the key here\ndiscord.gg/XUUjpeyc3S link is already set to \nyour clipboard!\nThe script does support Solara, Celery and Inicognito!"
                    })

                    setclipboard("discord.gg/XUUjpeyc3S")
                    Window1:SelectTab(1)
                    local Input = Tabs1.Main:AddInput("Input", {
                        Title = "Insert Key Here",
                        Default = "",
                        Placeholder = "Placeholder",
                        Numeric = false, -- Only allows numbers
                        Finished = false, -- Only calls callback when you press enter
                        Callback = function(Value)
                            if CustomToString(Value) == "FrostiesOnTop" then
                                writefile("Frosties/frostieskey.txt", "FrostiesOnTop")
                                Authenticated = true
                                Window1:Destroy()
                            end
                        end
                    })
                end
                repeat task.wait() until Authenticated
                print("Correct Key!")
                if string.find(string.lower(identifyexecutor()), "solara") or string.find(string.lower(identifyexecutor()), "celery") or string.find(string.lower(identifyexecutor()), "inicognito") then
                    getgenv().fireproximityprompt = function(ProximityPrompt)
                        local OldEnabled = ProximityPrompt.Enabled
                        local OldHoldDuration = ProximityPrompt.HoldDuration
                        local OldRequiresLineOfSight = ProximityPrompt.RequiresLineOfSight
                        
                        ProximityPrompt.Enabled = true
                        ProximityPrompt.HoldDuration = 0
                        ProximityPrompt.RequiresLineOfSight = false
                        
                        ProximityPrompt:InputHoldBegin()
                        task.wait()
                        ProximityPrompt:InputHoldEnd()
                        
                        ProximityPrompt.Enabled = OldEnabled
                        ProximityPrompt.HoldDuration = OldHoldDuration
                        ProximityPrompt.RequiresLineOfSight = OldRequiresLineOfSight
                    end
                end


                local Workspace = game:GetService("Workspace")
                local VirtualUser = game:GetService("VirtualUser")
                local VIM = game:GetService("VirtualInputManager")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local ContextActionService = game:GetService("ContextActionService")
                local UserInputService = game:GetService("UserInputService")
                local Players = game:GetService("Players")
                local CoreGUI = game:GetService("CoreGui")
                local LocalPlayer = Players.LocalPlayer
                local HttpService = game:GetService("HttpService")
                local RunService = game:GetService("RunService")
                local TweenService = game:GetService("TweenService")
                local Teams = game:GetService("Teams")
                local Mouse = LocalPlayer:GetMouse()
                local req = request or http_request or http.request
                local Data
                if not Place == "Menu" then
                    Data = ReplicatedStorage["Player_Data"][LocalPlayer.Name]
                end
                local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local Humanoid = Character.Humanoid
                local HumanoidRootPart = Character.HumanoidRootPart
                local PlaceId = game.PlaceId

                local function MouseClick(a, b)
                    VIM:SendMouseButtonEvent(a, b, 1, true, game, 1)
                end    

                local function GetHuman()
                    Character = Character and (Character:FindFirstChild("Humanoid") or Character:FindFirstChildWhichIsA("Humanoid"))
                    return Character or Workspace.CurrentCamera.CameraSubject
                end

                local GramxProjectFloat = CustomToString(math.random(0, 100000))
                local TweenFloatVelocity = Vector3.new(0, 0, 0)
                function CreateTweenFloat()
                    local BV = HumanoidRootPart:FindFirstChild(GramxProjectFloat) or Instance.new("BodyVelocity");
                    BV.Parent = HumanoidRootPart;
                    BV.Name = GramxProjectFloat;
                    BV.MaxForce = Vector3.new(100000, 100000, 100000);
                    BV.Velocity = TweenFloatVelocity;
                end;

                local function GetDistance(Endpoint)
                    if typeof(Endpoint) == "Instance" then
                        Endpoint = Vector3.new(Endpoint.Position.X, HumanoidRootPart.Position.Y, Endpoint.Position.Z)
                    elseif typeof(Endpoint) == "CFrame" then
                        Endpoint = Vector3.new(Endpoint.Position.X, HumanoidRootPart.Position.Y, Endpoint.Position.Z)
                    end
                    local Magnitude = (Endpoint - HumanoidRootPart.Position).Magnitude
                    return Magnitude
                end

                function Tween(Endpoint)
                    if typeof(Endpoint) == "Instance" then
                        Endpoint = Endpoint.CFrame
                    end
                    local TweenFunc = {}
                    local Distance = GetDistance(Endpoint)
                    local TweenInfo = TweenService:Create(HumanoidRootPart, TweenInfo.new(Distance / getgenv().TweeningSpeed, Enum.EasingStyle.Linear), {
                        CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1, 0, 0), math.rad(0))
                    })
                    TweenInfo:Play()
                    function TweenFunc:Cancel()
                        TweenInfo:Cancel()
                        return false
                    end
                    if Distance <= 100 then
                        HumanoidRootPart.CFrame = Endpoint
                        TweenInfo:Cancel()
                        return false
                    end
                    return TweenFunc
                end


                local function RemoveDamageText()
                    local parts = {
                        game:GetService("StarterPlayer").StarterPlayerScripts.Client_Modules.Modules.Extra.Damage_Text,
                        ReplicatedStorage.Assets.Extras.Damage_Text,
                        LocalPlayer.PlayerScripts.Client_Modules.Modules.Extra.Damage_Text
                    }
                    for _, part in ipairs(parts) do
                        if part then
                            part:Destroy()
                        end
                    end
                end


                local function RemoveParticles()
                    local particles = {
                        ReplicatedStorage.Assets.Extras.Coin,
                        ReplicatedStorage.Assets.Particles.Parts
                    }
                    for _, particle in ipairs(particles) do
                        if particle then
                            particle:Destroy()
                        end
                    end
                end

                task.spawn(function()
                    while task.wait() do
                        if AutoLoot or getgenv().AutoLoot then
                            repeat task.wait()
                                if AutoLoot or getgenv().AutoLoot then
                                    pcall(function()
                                        for a, b in pairs(Workspace.Debree:GetChildren()) do
                                            if b.Name == "Loot_Chest" then
                                                for c, d in pairs(b.Drops:GetChildren()) do
                                                    b.Add_To_Inventory:InvokeServer(d.Name)
                                                    if getgenv().SendWebhook or SendWebhook then
                                                            local message = "**||"..LocalPlayer.Name.."|| collected a "..d.Name.."**"
                                                            
                                                            local embed = {
                                                                ["title"] = "Frosties Auto Loot:",
                                                                ["description"] = message,
                                                                ["color"] = tonumber("0x00FF00"),
                                                                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                                                                ["footer"] = {
                                                                    ["text"] = "Frosties Auto Loot",
                                                                },
                                                                ["author"] = {
                                                                    ["name"] = CustomToString(Services.MarketplaceService:GetProductInfo(game.PlaceId).Name),
                                                                    ["icon_url"] = "https://media.discordapp.net/attachments/1211273819638206464/1267776145290432562/frosties_logo.png?ex=66aa040b&is=66a8b28b&hm=5b3f6e87522a2258323cb5c1408568519dca1c8eeaa54f57ec45fa0a7907789a&=&format=webp&quality=lossless",
                                                                },
                                                                ["fields"] = {
                                                                    {
                                                                        ["name"] = "Item Name:",
                                                                        ["value"] = d.Name,
                                                                        ["inline"] = true
                                                                    },
                                                                    {
                                                                        ["name"] = "Rarity:",
                                                                        ["value"] = d.Value,
                                                                        ["inline"] = true
                                                                    }
                                                                }
                                                            }
                                                            
                                                            local res = request({
                                                                Url = tostring(getgenv().WebhookURL),
                                                                Method = "POST",
                                                                Headers = {
                                                                    ["Content-Type"] = "application/json"
                                                                },
                                                                Body = Services.HttpService:JSONEncode({
                                                                    embeds = { embed }
                                                                })
                                                            })
                                                        end
                                                    end
                                                end
                                                b:Destroy()
                                            end
                                    end)
                                end
                            until not AutoLoot or getgenv().AutoLoot
                        end
                    end
                end)
                
                

                    
                local function Hop()
                    local PlaceId = PlaceId
                    local AllIDs = {}
                    local foundAnything = ""
                    local actualHour = os.date("!*value").hour
                    local Deleted = false
                    function TPReturner()
                        local Site;
                        if foundAnything == "" then
                            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                        else
                            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                        end
                        local ID = ""
                        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                            foundAnything = Site.nextPageCursor
                        end
                        local num = 0;
                        for i, v in pairs(Site.data) do
                            local Possible = true
                            ID = CustomToString(v.id)
                            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                                for _, Existing in pairs(AllIDs) do
                                    if num ~= 0 then
                                        if ID == CustomToString(Existing) then
                                            Possible = false
                                        end
                                    else
                                        if tonumber(actualHour) ~= tonumber(Existing) then
                                            local delFile = pcall(function()
                                                AllIDs = {}
                                                table.insert(AllIDs, actualHour)
                                            end)
                                        end
                                    end
                                    num = num + 1
                                end
                                if Possible == true then
                                    table.insert(AllIDs, ID)
                                    wait()
                                    pcall(function()
                                        wait()
                                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, ID, game.Players.LocalPlayer)
                                    end)
                                    wait(4)
                                end
                            end
                        end
                    end
                    function Teleport()
                        while wait() do
                            pcall(function()
                                TPReturner()
                                if foundAnything ~= "" then
                                    TPReturner()
                                end
                            end)
                        end
                    end
                    Teleport()
                end

                local BossesTable, BossesCFTable, TrainersCF, Locations

                if rawequal(PlaceId, Places.FirstMap) or rawequal(PlaceId, Places.FirstMapPS) or rawequal(PlaceId, Places.AlsoFirstMap) then
                    print("Map 1")
                    TrainersCF = {
                        ["Water Trainer"] = CFrame.new(705, 261, -2409),
                        ["Insect Trainer"] = CFrame.new(2873, 316, -3917),
                        ["Thunder Trainer"] = CFrame.new(-322, 426, -2384),
                        ["Wind Trainer"] = CFrame.new(1792, 334, -3521)
                    }
                    Locations = {
                        ["Zapiwara Mountain"] = CFrame.new(-365, 425, -2303),
                        ["Waroru Cave"] = CFrame.new(683, 261, -2401),
                        ["Slasher Demon"] = CFrame.new(-485, 274, -3314),
                        ["Ushumaru Village"] = CFrame.new(-90, 354, -3170),
                        ["Ouwbayashi Home"] = CFrame.new(1593, 315, -4618),
                        ["Kabiwaru Village"] = CFrame.new(2037, 315, -2956),
                        ["Zapiwara Cave"] = CFrame.new(-8, 275, -2414),
                        ["Dangerous Woods"] = CFrame.new(4061, 342, -3928),
                        ["Final Selection"] = CFrame.new(5200, 365, -2425),
                        ["Kiribating Village"] = CFrame.new(-40, 282, -1623),
                        ["Butterfly Mansion"] = CFrame.new(3022, 316, -3928),
                        ["Abubu Cave"] = CFrame.new(1044, 276, -3483),
                        ["Testing Place"] = CFrame.new(-32, 3, 137)
                    }
                    BossesTable = {
                        "Slasher",
                        "Nezuko",
                        "Shiron",
                        "Giyu",
                        "Sanemi",
                        "Yahaba",
                        "Susamaru",
                        "Sabito",
                        "Bandit Kaden",
                        "Zanegutsu Kuuchie",
                        "Bandit Zoku"
                    }
                    BossesCFTable = {
                        ["Slasher"] = CFrame.new(4355, 342, -4386),
                        ["Nezuko"] = CFrame.new(3549, 342, -4595),
                        ["Shiron"] = CFrame.new(3203, 370, -3953),
                        ["Giyu"] = CFrame.new(3013, 316, -2916),
                        ["Sanemi"] = CFrame.new(1619, 348, -3717),
                        ["Yahaba"] = CFrame.new(1415, 315, -4571),
                        ["Susamaru"] = CFrame.new(1415, 315, -4571),
                        ["Sabito"] = CFrame.new(1257, 275, -2834),
                        ["Bandit Kaden"] = CFrame.new(-569, 304, -2827),
                        ["Zanegutsu Kuuchie"] = CFrame.new(-336, 425, -2271),
                        ["Bandit Zoku"] = CFrame.new(174, 283, -1969)
                    }
                else
                    print("Map 2")
                    BossesTable = {
                        "Renpeke",
                        "Swampy",
                        "Douma",
                        "Snow Trainee",
                        "Tengen",
                        "Sound Trainee",
                        "Rengoku",
                        "Muichiro Tokito",
                        "Akeza",
                        "Inosuke",
                        "Enme"
                    };
                    BossesCFTable = {
                        ["Rengoku"] = CFrame.new(3656, 673, -345),
                        ["Akeza"] = CFrame.new(2010, 556, -128),
                        ["Renpeke"] = CFrame.new(-1258, 601, -650),
                        ["Muichiro Tokito"] = CFrame.new(4513, 673, -544),
                        ["Enme"] = CFrame.new(1591, 484, -690),
                        ["Swampy"] = CFrame.new(-1377, 601, -202),
                        ["Douma"] = CFrame.new(-5, 513, -1689),
                        ["Tengen"] = CFrame.new(1464, 486, -3118),
                        ["Sound Trainee"] = CFrame.new(1897, 663, -2805),
                        ["Inosuke"] = CFrame.new(1585, 300, -389),
                    }
                    TrainersCF = {
                        ["Flame Trainer"] = CFrame.new(-330, 602, -545),
                        ["Mist Trainer"] = CFrame.new(4323, 677, -724),
                        ["Beast Trainer"] = CFrame.new(1621, 300, -415),
                        ["Sound Trainer"] = CFrame.new(1650, 694, -2638),
                        ["Snow Trainer"] = CFrame.new(402, 532, -2877),
                    }
                    Locations = {
                        ["Frozen Lake"] = CFrame.new(2703, 675, -701),
                        ["Nomay Village"] = CFrame.new(3562, 673, -2109),
                        ["Wop City"] = CFrame.new(-31, 601, -431),
                        ["Dungeon"] = CFrame.new(-146, 611, -498),
                        ["Cave 1"] = CFrame.new(4222, 674, 582),
                        ["Tsune Village"] = CFrame.new(1214, 569, 77),
                        ["Akeza Cave"] = CFrame.new(1933, 556, -142),
                        ["Wop Training Grounds"] = CFrame.new(224, 597, 483),
                        ["Mugen Train Station"] = CFrame.new(733, 500, 1056),
                        ["Cave 2"] = CFrame.new(1183, 487, -1192),
                        ["Frozen Lake Cave"] = CFrame.new(2753, 675, -699),
                        ["Snowy Place"] = CFrame.new(379, 532, -2866),
                        ["Sound Cave"] = CFrame.new(1829, 487, -2771),
                        ["Devourers Jaw"] = CFrame.new(481, 508, -1864),
                    }
                end;

                local Weapons = {
                    ["Combat"] = 'fist_combat',
                    ["Sword"] = 'Sword_Combat_Slash',
                    ["Scythe"] = 'Scythe_Combat_Slash',
                    ["Claw"] = 'claw_Combat_Slash',
                    ["Fans"] = 'fans_combat_slash'
                };

                if game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping") then
                    game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping").OnClientInvoke = function()
                        task.wait(5)
                        return true
                    end 
                end 

                spawn(function()
                    while wait() do
                        pcall(function()
                            for i, v in pairs(LocalPlayer.PlayerGui.MainGuis.Items.Scroll:GetChildren()) do
                                Insert = true
                                if v.ClassName == "Frame" and v.Name ~= "Health Elixir" and v.Name ~= "Health Regen Elixir" and v.Name ~= "Stamina Elixir" and v.Name ~= "Bandage" then
                                    for i, v2 in pairs(invTable) do
                                        if v2 == v.Name then
                                            Insert = false
                                        end
                                    end
                                    if Insert == true then
                                        table.insert(invTable, v.Name)
                                    end;
                                end;
                            end;
                        end)
                    end;
                end)


                local function KA14Hit(Weapon)
                    for i = 1, 14 do
                        ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer(Weapon, LocalPlayer, Character, HumanoidRootPart, Humanoid, (i % 2 == 0) and math.huge or 919, "ground_slash")
                    end
                end

                local KADelay = 1.25

                task.spawn(function()
                    while task.wait() do
                        pcall(function()
                            if getgenv().KA14H then
                                KA14Hit(Weapons[Weapon])
                                task.wait(KADelay)
                                repeat
                                    wait()
                                until game.Players.LocalPlayer:WaitForChild("combotangasd123").Value == 0;
                            end
                        end)
                    end
                end)


                spawn(function()
                    RunService.Stepped:Connect(function()
                        if getgenv().AutoFarmBosses or getgenv().NoClip or getgenv().TPtoPos or TPtoPos or getgenv().TPtoTrainer or TPtoTrainer or getgenv().TPToMuzan or FarmBoss then
                            for _, v in pairs(Character:GetDescendants()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false;
                                end
                                if v:IsA("Humanoid") then
                                    v:ChangeState(11);
                                end
                            end
                        end
                    end)
                end)

                game.NetworkClient.ChildRemoved:Connect(function()
                    game:GetService("TeleportService"):Teleport(5956785391);
                end)
                CoreGUI.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                        game:GetService("TeleportService"):Teleport(5956785391);
                    end
                end)
                
                local BossLocations = {}
                local BossAmount, BossIndex = #BossesTable, 1
                local FindBosses, GoToBoss, CurrentBoss, CFramePosition

                local function InitializeBossLocations()
                    BossLocations = {}
                    for _, BossName in ipairs(BossesTable) do
                        local BossCFrame = BossesCFTable[BossName]
                        if BossCFrame then
                            table.insert(BossLocations, {Name = BossName, CFrame = BossCFrame})
                        end
                    end
                end

                local function GetBossHRP(BossName)
                    for _, Bosses in ipairs(Workspace.Mobs.Bosses:GetDescendants()) do
                        if Bosses:IsA("Model") and Bosses.Name == BossName then
                            local HRP = Bosses:FindFirstChild("HumanoidRootPart")
                            if HRP then
                                return HRP
                            end
                        end
                    end
                    return nil
                end

                local function GetBossHP(BossName)
                    for _, Bosses in ipairs(Workspace.Mobs.Bosses:GetDescendants()) do
                        if Bosses:IsA("Model") and Bosses.Name == BossName then
                            local HP = Bosses:FindFirstChild("Humanoid").Health
                            if HP then
                                return tonumber(HP)
                            end
                        end
                    end
                    return nil
                end

                local function GetFarmCFrame(Position)
                    if FarmingMethod == "Above" then
                        CFramePosition = CFrame.new(0, getgenv().Distance, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                    elseif FarmingMethod == "Below" then
                        CFramePosition = CFrame.new(0, -getgenv().Distance, 0) * CFrame.Angles(math.rad(90), 0, 0)
                    elseif FarmingMethod == "Behind" then
                        CFramePosition = CFrame.new(0, 0, getgenv().Distance)
                    elseif FarmingMethod == "Front" then
                        CFramePosition = CFrame.new(0, 0, -getgenv().Distance)
                    else
                        CFramePosition = CFrame.new(0, 8, 0)
                    end
                    return CFrame.new(Position) * CFramePosition
                end

                local function RotateToBoss(BossName)
                    if GoToBoss then GoToBoss:Disconnect() end
                    GoToBoss = game:GetService("RunService").Heartbeat:Connect(function()
                        local HRP = GetBossHRP(BossName)
                        local BHP = GetBossHP(BossName)
                        if HumanoidRootPart and HRP then
                            RotatingToBoss = true
                            local BossCFrame = GetFarmCFrame(HRP.Position)
                            local Distance = (HumanoidRootPart.Position - BossCFrame.Position).Magnitude
                            if CustomToString(Distance) > CustomToString(getgenv().Distance) and BHP > 0 then
                                local TweenInfo = TweenInfo.new(Distance / getgenv().TweeningSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                                local InitiateTween = TweenService:Create(HumanoidRootPart, TweenInfo, {CFrame = BossCFrame})
                                InitiateTween:Play()
                                InitiateTween.Completed:Wait()
                            else
                                HumanoidRootPart.CFrame = BossCFrame
                            end
                        else
                            RotatingToBoss = false
                            GoToBoss:Disconnect()
                            SpawnBosses()
                        end
                    end)
                    CurrentBoss = BossName
                end
                local CoroutineInitialized = false;
                function SpawnBosses()
                    print("Spawning Bosses...")
                    if not CoroutineInitialized then
                        CoroutineInitialized = true;
                        coroutine.wrap(function()
                            while task.wait() and getgenv().AutoFarmBosses do
                                if #BossLocations == 0 then
                                    print("Went to all locations, now reinitializing");
                                    InitializeBossLocations();
                                end;
                                print("Length:", #BossLocations);
                                task.wait(1);
                            end;
                        end)();
                    end;
                    FindBosses = true;
                    while FindBosses and #BossLocations > 0 do
                        local Boss = table.remove(BossLocations, 1)
                        local BossName = Boss.Name
                        local BossCFrame = Boss.CFrame
                        
                        if BossCFrame then
                            local Distance = (HumanoidRootPart.Position - BossCFrame.Position).Magnitude
                            local TweenInfo = TweenInfo.new(Distance / getgenv().TweeningSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                            local InitiateTween = TweenService:Create(HumanoidRootPart, TweenInfo, {CFrame = BossCFrame})
                            InitiateTween:Play()
                            
                            local TweenCompleted = false
                            InitiateTween.Completed:Connect(function()
                                TweenCompleted = true
                            end)
                            
                            while not TweenCompleted do
                                local HRP = GetBossHRP(BossName)
                                if HRP then
                                    FindBosses = false
                                    InitiateTween:Cancel()
                                    RotateToBoss(BossName)
                                    return
                                end
                                task.wait(0.1)
                            end
                            task.wait(.3)
                        end
                    end
                end

                spawn(function()
                    InitializeBossLocations()
                    while task.wait(0.39) do 
                        pcall(function()
                            if getgenv().AutoFarmBosses then
                                wait(1)
                                if not FindBosses then
                                    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                                        antifall3 = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        antifall3.Velocity = Vector3.new(0, 0, 0)
                                        antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                                    end
                                    local HRP = nil
                                    local foundBossName = nil
                                    for _, boss in ipairs(BossesTable) do
                                        HRP = GetBossHRP(boss)
                                        if HRP then
                                            foundBossName = boss
                                            break
                                        end
                                    end
                                    if HRP then
                                        RotateToBoss(foundBossName)
                                    else
                                        SpawnBosses()
                                    end
                                end
                            else
                                if antifall3 then antifall3:Destroy() end
                            end
                            if getgenv().AutoFarmBosses == false then
                                FindBosses = false
                                if InitiateTween then InitiateTween:Cancel() end
                                if GoToBoss then GoToBoss:Disconnect() end
                                CurrentBoss = nil
                            end
                        end)
                    end
                end)


                    

                local function DestroyEmptyChest(chest)
                    if chest and chest:IsA("Model") and chest.Name == "Loot_Chest" and chest:FindFirstChild("Drops") then
                        if #chest.Drops:GetChildren() == 0 then
                            chest:Destroy()
                        end
                    end
                end

                UserInputService.InputBegan:Connect(function(input)
                    if not MouseClicks and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2) then
                        return
                    end
                end)


                spawn(function()
                    while task.wait() do
                        if AutoEatSouls then
                            for i, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
                                if v.Name == "Soul" then
                                    ypcall(function()
                                        Workspace.Debree.Soul.Handle.Eatthedamnsoul:FireServer()
                                    end)
                                end
                            end
                        end
                    end
                end)


                local MouseClicks = true
                local function DisableMouseClicks()
                    MouseClicks = false
                    ContextActionService:BindAction("DisableMouseClicks", function()
                    end, false, Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2)
                end

                local function EnableMouseClicks()
                    MouseClicks = true
                    ContextActionService:UnbindAction("DisableMouseClicks")
                end


                local function isMobInRange(Mob, range)
                    if Character and Character:FindFirstChild("HumanoidRootPart") then
                        local MobHRP = Mob:FindFirstChild("HumanoidRootPart")
                        if MobHRP then
                            local distance = (MobHRP.Position - HumanoidRootPart.Position).magnitude
                            return distance <= range
                        end
                    end
                    return false
                end

                local function ToggleUnlockUltimate()
                    local LocalPlayer = Players.LocalPlayer
                    local ArtValue = ReplicatedStorage.Player_Data[LocalPlayer.Name].Demon_Art.Value
                    local Skills = {
                        Ice = LocalPlayer.PlayerGui.Power_Adder.Ice_Bda.Skills["Bodhisattva"],
                        Arrow = LocalPlayer.PlayerGui.Power_Adder.Arrow.Skills["Arrow Spikes"],
                        Swamp = LocalPlayer.PlayerGui.Power_Adder.Swamp_Bda.Skills["Swamp Domain"],
                        Akaza = LocalPlayer.PlayerGui.Power_Adder.Akaza_Bda.Skills["Annihilation Type"],
                        Dream = LocalPlayer.PlayerGui.Power_Adder.Dream_Bda.Skills["Flesh Monster"],
                        Blood = LocalPlayer.PlayerGui.Power_Adder.Blood_Burst.Skills["Blood Burst"],
                        Reaper = LocalPlayer.PlayerGui.Power_Adder.Reaper.Skills["Speed Rush"]
                    }
                    
                    local function HandleSkill(Skill, Team)
                        pcall(function()
                                if ArtValue == Team and Skill.Mastery and Skill.Mastery.Parent ~= Teams then
                                    Skill.Mastery.RobloxLocked = true
                                    Skill.Locked.RobloxLocked = true
                                    Skill.Mastery.Value = 0
                                    Skill.Locked.Value = false
                                    Skill.Mastery.Parent = Teams
                                end
                        end)
                    end
                    
                    for Team, Skill in pairs(Skills) do
                        HandleSkill(Skill, Team)
                    end
                    
                    local BreathingSkills = {
                        Thunder = LocalPlayer.PlayerGui.Power_Adder.Thunder_Breathing.Skills["Thunder clap and flash six fold"],
                        Water = LocalPlayer.PlayerGui.Power_Adder.Water_Breathing.Skills["Constant Flux"],
                        Insect = LocalPlayer.PlayerGui.Power_Adder.Insect_Breathing.Skills["Caprice"],
                        Wind = LocalPlayer.PlayerGui.Power_Adder.Wind_Breathing.Skills["Idaten Typhoon"],
                        Beast = LocalPlayer.PlayerGui.Power_Adder.Beast_Breathing.Skills["Devouring Rush"],
                        Sound = LocalPlayer.PlayerGui.Power_Adder.Sound_Breathing.Skills["String Performance"],
                        Snow = LocalPlayer.PlayerGui.Power_Adder.Snow_Breathing.Skills["Snowtide Vortex"],
                        Flame = LocalPlayer.PlayerGui.Power_Adder.Flame_Breathing.Skills["Purgatory"],
                        Mist = LocalPlayer.PlayerGui.Power_Adder.Mist_Breathing.Skills["Obscuring Clouds"]
                    }
                    
                    local BreathingValue = ReplicatedStorage.Player_Data[LocalPlayer.Name].Power.Value
                    
                    local function HandleBreathingSkill(Skill, Team)
                        pcall(function()
                            if state then
                                    Skill.Mastery.RobloxLocked = true
                                    Skill.Locked.RobloxLocked = true
                                    Skill.Mastery.Value = 0
                                    Skill.Locked.Value = false
                                    Skill.Mastery.Parent = Teams
                                end
                        end)
                    end
                    
                    for Team, Skill in pairs(BreathingSkills) do
                        HandleBreathingSkill(Skill, Team)
                    end
                end
                if getgenv().NoDrowning then
                    task.spawn(function()
                        for i,v in pairs(getgc(true)) do
                            if type(v) == "table" and rawget(v, "swim_bar") then
                                while task.wait() do
                                    if getgenv().NoDrowning then
                                        rawset(v, "swim_bar", {
                                            [1] = 2,
                                            [2] = 2
                                        })
                                    end
                                    wait(1);
                                end
                            end
                        end
                    end)
                end;

                local function training(gui, path, value)
                    while task.wait() do
                        if getgenv()[gui] then
                            ypcall(function()
                                LocalPlayer.PlayerGui.ExcessGuis[path].Holder.LocalScript.Value.Value = value;
                            end)
                        end;
                    end;
                end;

                spawn(function() training("AutoBouldler", "boulder_split_ui", 10000) end);
                spawn(function() training("AutoMeditate", "Meditate_gui", 100) end);
                spawn(function() training("AutoPushUp", "Push_Up_Gui", 1000) end);
                spawn(function() training("AutoCupGame", "cup_game_gui", 1000) end);
                spawn(function() training("AutoTargetGame", "chairui", 1000) end);



                task.spawn(function()
                    local function Invoke(ting, ...)
                        return ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ting, ...)
                    end

                    local function blow(gourd, money)
                        if Data.Yen.Value >= money then
                            Invoke("buysomething", LocalPlayer.Name, gourd, Data.Yen, Data.Inventory)
                            wait(1)
                            Invoke("change_equip_for_item", LocalPlayer.Name, Data.Inventory, Data.Inventory.Items:FindFirstChild(gourd))
                            wait(1)
                            for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                                if v.Name == gourd then
                                    v.Parent = LocalPlayer.Character
                                end
                            end
                            wait(1)
                            while true do
                                local gourd = Character:FindFirstChild(gourd)
                                if gourd then
                                    Invoke("blow_in_gourd_thing", LocalPlayer, gourd, 1)
                                else
                                    break
                                end
                                wait()
                            end
                        end
                    end

                    while true do
                        if getgenv().AutoBlowGourd then
                            if getgenv().GourdSelect == "Big Gourd" then
                                blow("Big Gourd", 700)
                            elseif getgenv().GourdSelect == "Medium Gourd" then
                                blow("Medium Gourd", 450)
                            elseif getgenv().GourdSelect == "Small Gourd" then
                                blow("Small Gourd", 200)
                            end
                        end
                        wait()
                    end
            end)


                local DefaultSpeed = Humanoid.WalkSpeed

                local function PressKey(key)
                    pcall(function()
                        VIM:SendKeyEvent(true, key, false, game)
                        wait()
                        VIM:SendKeyEvent(false, key, false, game)
                        wait()
                    end)
                end	

                local function UseSkill(key)
                    for i = 1, 10 do
                        PressKey(key)
                    end
                end

                spawn(function()
                    local moves = {"Z", "X", "C", "V", "B", "N"}
                    while task.wait() do -- I love you chatgpt <3
                        for _, move in ipairs(moves) do
                            local MoveGlobal = getgenv()[move .. "Move"]
                            if MoveGlobal and not UsingSkill and RotatingToBoss then
                                running = RotatingToBoss
                                UsingSkill = true
                                UseSkill(move)
                                UsingSkill = false
                            end;
                        end;
                    end;
                end)

                local function FindMob(hrp)
                    for i, v in pairs(Workspace.Mobs:GetDescendants()) do
                        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                            if hrp then
                                if v:FindFirstChild('HumanoidRootPart') then
                                    return v
                                end
                            else
                                return v
                            end
                        end
                    end
                end
                
                local function FindPlayers(hrp)
                    for i, Player in pairs(Players:GetPlayers()) do
                        if Player ~= player and Player.Character:FindFirstChild("HumanoidRootPart") then
                            return Player.Character
                        end
                    end
                end

                local function GetClosestMob()
                    local ClosestMob
                    local closestDistance = math.huge
                    for _, mob in ipairs(workspace.Mobs:GetDescendants()) do
                        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                            local distance = (mob.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).Magnitude
                            if distance < closestDistance then
                                ClosestMob = mob
                                closestDistance = distance
                            end
                        end
                    end
                    return ClosestMob
                end
                


                -- START SCRIPT


                local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Scripts/main/FluentGUI.lua"))()
                local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
                local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

                local Window = Fluent:CreateWindow({
                    Title = "Frosties v" .. FrostiesVersion,
                    SubTitle = "by FrostLua, discord.gg/XUUjpeyc3S",
                    TabWidth = 160,
                    Size = UDim2.fromOffset(550, 280),
                    Acrylic = true,
                    Theme = "Amethyst",
                    MinimizeKey = Enum.KeyCode.LeftControl
                })

                local Tabs, Place
                if PlaceId == Places.Menu then
                    Place = "Menu"
                elseif PlaceId == Places.Mugen then
                    Place = "Mugen"
                    Tabs = {
                        Main = Window:AddTab({ Title = "Main", Icon = "" }),
                        Mugen = Window:AddTab({ Title = "Mugen", Icon = "" }),
                        KillAuras = Window:AddTab({ Title = "Kill Auras", Icon = "" }),
                        SideFuncs = Window:AddTab({ Title = "Side Functions", Icon = "" }),
                        Misc = Window:AddTab({ Title = "Misc", Icon = "" }),
                        GodModes = Window:AddTab({ Title = "GodModes", Icon = "" }),
                        Extra = Window:AddTab({ Title = "Extra", Icon = "" }),
                        Teleports = Window:AddTab({ Title = "Teleports", Icon = "" }),
                        Credits = Window:AddTab({ Title = "Credits", Icon = "" }),
                        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
                    }
                elseif PlaceId == Places.Ouwigahara then
                    Place = "Ouwigahara"
                    Tabs = {
                        Ouwigahara = Window:AddTab({ Title = "Ouwigahara", Icon = "" }),
                        Main = Window:AddTab({ Title = "Main", Icon = "" }),
                        KillAuras = Window:AddTab({ Title = "Kill Auras", Icon = "" }),
                        SideFuncs = Window:AddTab({ Title = "Side Functions", Icon = "" }),
                        Misc = Window:AddTab({ Title = "Misc", Icon = "" }),
                        GodModes = Window:AddTab({ Title = "GodModes", Icon = "" }),
                        Extra = Window:AddTab({ Title = "Extra", Icon = "" }),
                        Teleports = Window:AddTab({ Title = "Teleports", Icon = "" }),
                        Credits = Window:AddTab({ Title = "Credits", Icon = "" }),
                        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
                    }
                elseif PlaceId == Places.Dungeon then
                    Place = "Dungeon"
                    Tabs = {
                        Ouwigahara = Window:AddTab({ Title = "Dungeon", Icon = "" }),
                        Main = Window:AddTab({ Title = "Main", Icon = "" }),
                        KillAuras = Window:AddTab({ Title = "Kill Auras", Icon = "" }),
                        SideFuncs = Window:AddTab({ Title = "Side Functions", Icon = "" }),
                        Misc = Window:AddTab({ Title = "Misc", Icon = "" }),
                        GodModes = Window:AddTab({ Title = "GodModes", Icon = "" }),
                        Extra = Window:AddTab({ Title = "Extra", Icon = "" }),
                        Teleports = Window:AddTab({ Title = "Teleports", Icon = "" }),
                        Credits = Window:AddTab({ Title = "Credits", Icon = "" }),
                        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
                    }
                else
                    Place = "MainWorld"
                    Tabs = {
                        Main = Window:AddTab({ Title = "Main", Icon = "" }),
                        KillAuras = Window:AddTab({ Title = "Kill Auras", Icon = "" }),
                        FarmSettings = Window:AddTab({ Title = "Farm Settings", Icon = "" }),
                        SideFuncs = Window:AddTab({ Title = "Side Functions", Icon = "" }),
                        AutoSkill = Window:AddTab({ Title = "Auto Skill", Icon = "" }),
                        Gourds = Window:AddTab({ Title = "Gourds", Icon = "" }),
                        Misc = Window:AddTab({ Title = "Misc", Icon = "" }),
                        AutoTrain = Window:AddTab({ Title = "Auto Train", Icon = "" }),
                        GodModes = Window:AddTab({ Title = "GodModes", Icon = "" }),
                        Extra = Window:AddTab({ Title = "Extra", Icon = "" }),
                        Teleports = Window:AddTab({ Title = "Teleports", Icon = "" }),
                        Credits = Window:AddTab({ Title = "Credits", Icon = "" }),
                        Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
                    }
                end
                local dc = 1;
                local Tponhop = Tabs.Settings:AddSection("[Teleport Farming]")
                Tponhop:AddToggle("tponhop",{
                    Title = "Auto Execute On Server Hop",
                    Description = "This will automatically execute the script\n when you server hop\n (or when you get kicked). \nThis will load the autoload config!",
                    Callback = function(state)
                        if state and dc == 1 then
                            dc = dc - 1
                            queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/FrostLua/Scripts/main/ProjectSlayers/Script.lua'))()")
                        end;
                    end
                })
                
                LocalPlayer.Idled:Connect(function()
                    Fluent:Notify({
                        Title = "Kick Attempt",
                        Content = "The game tried kicking you, but Frosties didn't allow it!",
                        SubContent = "Thank you for using Frosties ❤️", -- Optional
                        Duration = 5
                    })
                    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
                end)

                local CreditsSection = Tabs.Credits:AddSection("[ Credits ]")

                CreditsSection:AddParagraph({
                    Title = "Credits",
                    Content = "This script was developed by frostlua on discord, if you encounter any bugs. Please report them at our discord server: (discord.gg/XUUjpeyc3S) Thanks for choosing Frosties!"
                })

                CreditsSection:AddButton({
                    Title = "Copy Discord Link",
                    Description = "This sets our discord server to your clipboard",
                    Callback = function()
                        setclipboard("discord.gg/XUUjpeyc3S")
                    end
                })

                Window:SelectTab(1)

                    

                    local Farm = Tabs.Main:AddSection("[Auto Farms]")
                    local AutoLooting = Tabs.Main:AddSection("[Auto Looting]")
                    local Shop = Tabs.Main:AddSection("[Shop]")
                    local ArrowKASection = Tabs.KillAuras:AddSection("[Arrow Kill Auras]")
                    local SwampKASection = Tabs.KillAuras:AddSection("[Swamp Kill Aura]")
                    local IceKASection = Tabs.KillAuras:AddSection("[Ice Kill Aura]")
                    local BloodBurstKASection = Tabs.KillAuras:AddSection("[Blood Burst Kill Aura]")

                    local FarmToggle = Farm:AddToggle("FarmToggle",{
                        Title = "Auto Farm", 
                        Description = "Auto Farms All Bosses, configurate at Farm Settings",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoFarmBosses = state
                        end
                    })

                    local KAToggle = Farm:AddToggle("KAToggle",{
                        Title = "Kill Aura", 
                        Description = "Config this at Farm Settings",
                        Default = false,
                        Callback = function(state)
                            getgenv().KA14H = state
                        end
                    })


                    local AKAMOBS = ArrowKASection:AddToggle("AKA",{
                        Title = "Arrow KA Mobs", 
                        Description = "Only works with Arrow BDA, this basically just kills all the mobs around you.",
                        Default = false,
                        Callback = function(state)
                            getgenv().AKAMOBS = state
                            task.spawn(function()
                                while getgenv().AKAMOBS do 
                                    local target = FindMob(true)
                                    if target then
                                        local args = {
                                            [1] = "arrow_knock_back_damage",
                                            [2] = Character,
                                            [3] = target:GetModelCFrame(),
                                            [4] = target,
                                            [5] = math.huge,
                                            [6] = math.huge
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args))
                                    end
                                    task.wait(.5)
                                end
                            end)
                            task.spawn(function()
                                while state do
                                    local args = {
                                        [1] = "skil_ting_asd",
                                        [2] = LocalPlayer,
                                        [3] = "arrow_knock_back",
                                        [4] = 5
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args))
                                    task.wait(6)
                                end
                            end)
                        end
                    })

                    local ArrowBringMobs = ArrowKASection:AddToggle("ArrowBringMobs",{
                        Title = "Arrow Bring Mobs", 
                        Description = "Basically brings all the mobs to you and auto kills them. OP!\nDoesn't work on hell mugen train.",
                        Default = false,
                        Callback = function(state)
                            getgenv().ArrowBringMobs = state
                            task.spawn(function()
                                local FC = 0
                                while getgenv().ArrowBringMobs do 
                                    local target = FindMob(true)
                                    if target then
                                        repeat
                                            FC = FC + 1
                                                if FC >= 4 then
                                                    wait(1)
                                                    FC = 0
                                                else
                                                local args = {
                                                    [1] = "piercing_arrow_damage",
                                                    [2] = LocalPlayer,
                                                    [3] = target:GetModelCFrame(),
                                                    [4] = math.huge
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args))
                                            task.wait(0.05)
                                        end
                                        until target.Humanoid.Health <= 0 or not state
                                    end
                                    task.wait(0.1)
                                end
                            end)
                            
                            task.spawn(function()
                                while getgenv().ArrowBringMobs do
                                    local args = {
                                        [1] = "skil_ting_asd",
                                        [2] = LocalPlayer,
                                        [3] = "arrow_knock_back",
                                        [4] = 5
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args))
                                    task.wait(6)
                                end
                            end)
                            end
                        })
                        --[[
                        local SWAMPKA = SwampKASection:AddToggle("SWAMPKA",{
                            Title = "Swamp KA", 
                            Description = "Basically kills all the mobs around you. Requires Swamp",
                            Default = false,
                            Callback = function(state)
                                task.spawn(function()
                                    getgenv().SwampKA = state
                                    while getgenv().SwampKA do 
                                        local target = findMob(true)
                                        if target then
                                            local args = {
                                                [1] = "swamp_puddle_damage",
                                                [2] = player.Character,
                                                [3] = target:GetModelCFrame()
                                            }          
                                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))                
                                        end
                                        task.wait(0.3)
                                    end
                                end)
                                task.spawn(function()
                                    while getgenv().SwampKA do
                                        local args = {
                                            [1] = "skil_ting_asd",
                                            [2] = player,
                                            [3] = "swampbda_swamp_puddle",
                                            [4] = 5
                                        }
                                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))        
                                        task.wait(9.5)
                                    end
                                end)
                                end
                            })
                            ]]
                            local ICEKA = IceKASection:AddToggle("ICEKA",{
                                Title = "Ice KA", 
                                Description = "Requires Ice BDA, it's very weak. I recommend using other KA's",
                                Default = false,
                                Callback = function(state)
                                    getgenv().IceKA = state
                                    task.spawn(function()
                                        while getgenv().IceKA do
                                            local target = FindMob(true) -- dis is stolen hahaha
                                            if target then
                                                local args = {
                                                    [1] = "skil_ting_asd",
                                                    [2] = LocalPlayer,
                                                    [3] = "ice_demon_art_wintry_iciles",
                                                    [4] = 5
                                                }
                                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))
                                                for i = 1, 7 do
                                                    local args = {
                                                        [1] = "ice_demon_art_wintry_iciles_damage",
                                                        [2] = Character,
                                                        [3] = target:GetModelCFrame()
                                                    }
                                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))
                                                end
                                                task.wait(15)
                                            end
                                            task.wait()
                                        end
                                    end)
                                    end
                                })

                            local BBKA = BloodBurstKASection:AddToggle("BBKA",{
                                Title = "Blood Burst KA", 
                                Description = "Requires Blood Burst BDA, not very good. But it's fine.",
                                Default = false,
                                Callback = function(state)
                                    getgenv().BBKA = state
                                    task.spawn(function()
                                        task.wait(0.5)
                                        while getgenv().BBKA do 
                                            local target = closestMob()
                                            if target then
                                                local args = {
                                                    [1] = "land_mines_place",
                                                    [2] = Character,
                                                    [3] = target:GetModelCFrame()
                                                }    
                                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))
                                                local folder = Workspace.Debree:WaitForChild(LocalPlayer.Name .. "'s explosive land mines")
                                                task.wait(0.2)
                                                for i, mine in pairs(folder:GetChildren()) do
                                                    mine.DetonateEvent:FireServer()
                                                end
                                            end
                                            task.wait()
                                        end
                                    end)
                                    task.spawn(function()
                                        while getgenv().BBKA do
                                            local args = {
                                                [1] = "skil_ting_asd",
                                                [2] = LocalPlayer,
                                                [3] = "blood_burst_explosive_land_mines",
                                                [4] = 5
                                            }    
                                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))    
                                            task.wait(30)
                                        end
                                    end)
                                    end
                                })
                            
                    --[[
                    local ThunderKA = Farm:AddToggle("ThunderKA",{
                        Title = "Thunder KA [Mas 30]", 
                        Description = "Only works with Thunder Breathing",
                        Default = false,
                        Callback = function(state)
                            getgenv().TKA = state
                        end
                    })
                    ]]
                    local SoulsEat = Farm:AddToggle("SoulsEat",{
                        Title = "Auto Eat Souls", 
                        Description = "Auto Eats Souls",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoEatSouls = state
                        end
                    })

                    local AutoLoot = AutoLooting:AddToggle("AutoLoot",{
                        Title = "Auto Loot", 
                        Description = "Auto collects chest loot",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoLoot = state
                        end;
                    })
                    
                    if isfile("Frosties/Webhook.txt") then
                        local content = readfile("Frosties/Webhook.txt")
                        getgenv().WebhookURL = content
                    end                    

                    local WebhookInput = AutoLooting:AddInput("Input", {
                        Title = "Put your webhook here",
                        Default = getgenv().WebhookURL or "",
                        Placeholder = "Insert Webhook",
                        Numeric = false,
                        Finished = true,
                        Callback = function(Value)
                        end
                    })
                
                    WebhookInput:OnChanged(function()
                        getgenv().WebhookURL = WebhookInput.Value
                        if isfile("Frosties/Webhook.txt") then
                            delfile("Frosties/Webhook.txt")
                            writefile("Frosties/Webhook.txt", WebhookInput.Value)
                        else
                            writefile("Frosties/Webhook.txt", WebhookInput.Value)
                        end
                    end)
                

                    local WebhookSendingAutoLoot = AutoLooting:AddToggle("SendWebhooks",{
                        Title = "Send Webhook", 
                        Description = "Sends a webhook with the loot you've gotten. Doesn't send on Rare and Uncommon items.",
                        Default = false,
                        Callback = function(state)
                            getgenv().SendWebhook = state
                        end
                    })

                    Shop:AddButton({
                        Title = "Spin BDA",
                        Description = "This rerolls your BDA if you have spins.",
                        Callback = function()
                            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S_"):InvokeServer("check_can_spin_demon_art")
                        end
                    })

                if not (PlaceId == Places.Mugen or PlaceId == Places.Ouwigahara or PlaceId == Places.Menu or PlaceId == Places.Dungeon) then


                    local FarmSettings = Tabs.FarmSettings:AddSection("[Farm Settings]")
                    FarmSettings:AddParagraph({
                        Title = "This is the configuration for the Auto Farm",
                    })

                    local FarmSettingsDD = FarmSettings:AddDropdown("FarmSettings", {
                        Title = "Farm Position",
                        Description = "The position you want to stand versus the boss",
                        Default = "Above",
                        Values = {
                            "Above",
                            "Below",
                            "Behind",
                            "Front"
                        },
                        Multi = false,
                    })

                    FarmSettingsDD:OnChanged(function(value)
                        getgenv().FarmingMethod = value
                    end)

                    local FarmWeaponDD = FarmSettings:AddDropdown("FarmWeaponDD", {
                        Title = "Farm Weapon",
                        Description = "Select the weapon you want to use when killing the boss.",
                        Default = "Sword",
                        Values = {
                            "Scythe",
                            "Sword",
                            "Fans",
                            "Combat",
                            "Claw"
                        },
                        Multi = false,
                    })

                    FarmWeaponDD:OnChanged(function(value)
                        getgenv().Weapon = value
                    end)

                    local FarmDistanceSlider = Tabs.FarmSettings:AddSlider("FarmDistanceSlider", {
                        Title = "Distance",
                        Description = "Distance from the boss",
                        Default = 10,
                        Min = 0,
                        Max = 25,
                        Rounding = 1,
                        Callback = function(value)
                            getgenv().Distance = value
                        end
                    })

                    local FarmTweenSpeedSlider = Tabs.FarmSettings:AddSlider("FarmTweenSpeedSlider", {
                        Title = "Tweening Speed",
                        Description = "How fast (in studs) you want to tween to the boss. Don't set this higher then 240 or risk getting kicked.",
                        Default = 240,
                        Min = 50,
                        Max = 700,
                        Rounding = 1,
                        Callback = function(value)
                            getgenv().TweeningSpeed = value
                        end
                    })
                end

                if not (PlaceId == Places.Menu) then

                    local SideFuncsSection = Tabs.SideFuncs:AddSection("[Side Functions]")

                    local SwampINFstun = SideFuncsSection:AddToggle("SwampINFstun",{
                        Title = "Inf Stun Mobs Swamp 40+", 
                        Description = "This will auto stun mobs in range.",
                        Default = false,
                        Callback = function(state)
                            while state do
                                local MaxRange, swampinfstun = 20, true
                                local ClosestMob = nil
                                local Distance = math.huge
                                for _, Mob in ipairs(Workspace.Mobs:GetDescendants()) do
                                    if Mob:IsA("Model") and Mob:FindFirstChild("Humanoid") then
                                        if isMobInRange(Mob, MaxRange) then
                                            local distance = (Mob.HumanoidRootPart.Position - LocalPlayer.HumanoidRootPart.Position).magnitude
                                            if distance < Distance then
                                                Distance = distance
                                                ClosestMob = Mob
                                            end
                                        end
                                    end
                                end
                                if ClosestMob then
                                    ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("swamp_trap_damage", LocalPlayer, ClosestMob.HumanoidRootPart.CFrame)
                                end
                                wait(0.450)
                            end
                        end
                    })

                    local InvisSwamp = SideFuncsSection:AddToggle("InvisSwamp",{
                        Title = "Invisible Swamp", 
                        Description = "Makes you invisible",
                        Default = false,
                        Callback = function(state)
                            while state do
                                ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd", LocalPlayer, "swampbda_swamp_puddle", 1)
                                wait(0.1)
                            end
                        end
                    })

                    SideFuncsSection:AddButton({
                        Title = "Remove Damage Sound",
                        Description = "Removes the damage sound",
                        Callback = function()
                            RemoveParticles()
                        end
                    })

                    SideFuncsSection:AddButton({
                        Title = "Remove Combo Text",
                        Description = "Removes the combo text",
                        Callback = function()
                            RemoveDamageText()
                        end
                    })

                    local RemoveMouseMovement = SideFuncsSection:AddToggle("RemoveMouseMovement",{
                        Title = "Remove Mouse Movement", 
                        Description = "Lowers the kick chance lesser. If using Arrow KA",
                        Default = false,
                        Callback = function(state)
                            if state then
                                DisableMouseClicks()
                            else
                                EnableMouseClicks()
                            end
                        end
                    })

                    local RejoinOnKicks = SideFuncsSection:AddToggle("RejoinOnKicks",{
                        Title = "Auto Rejoin On Kicks", 
                        Description = "If you get kicked by the anti-cheat, this will instantly rejoin",
                        Default = true,
                        Callback = function(state)
                            local function onChildAdded(child)
                                if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                                    if not FrostiesKicked then
                                        game:GetService("TeleportService"):Teleport(PlaceId)
                                    end
                                end
                            end
                            if state then
                                getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(onChildAdded)
                        else
                                getgenv().rejoin:Disconnect()
                            end
                        end
                    })

                    SideFuncsSection:AddButton({
                        Title = "Unlock Ultimate",
                        Description = "Unlocks your ultimate Skill without killing the required boss",
                        Callback = ToggleUnlockUltimate
                    })

                end


                if not (PlaceId == Places.Mugen or PlaceId == Places.Ouwigahara or PlaceId == Places.Menu or PlaceId == Places.Dungeon) then


                    local AutoSkillSection = Tabs.AutoSkill:AddSection("[Auto Skill]")

                    AutoSkillSection:AddParagraph({
                        Title = "This works only when you are Auto Farming Bosses, to be the most efficient.",
                    })

                    local AutoSkillZ = AutoSkillSection:AddToggle("AutoSkillZ",{
                        Title = "Auto Use Skill Z", 
                        Description = "Auto Uses the Z Skill",
                        Default = false,
                        Callback = function(state)
                            getgenv().ZMove = state
                        end
                    })




                    local AutoSkillX = AutoSkillSection:AddToggle("AutoSkillZ",{
                        Title = "Auto Use Skill X", 
                        Description = "Auto Uses the X Skill",
                        Default = false,
                        Callback = function(state)
                            getgenv().XMove = state
                        end
                    })

                    local AutoSkillC = AutoSkillSection:AddToggle("AutoSkillC",{
                        Title = "Auto Use Skill C", 
                        Description = "Auto Uses the C Skill",
                        Default = false,
                        Callback = function(state)
                            getgenv().CMove = state
                        end
                    })

                    local AutoSkillV = AutoSkillSection:AddToggle("AutoSkillV",{
                        Title = "Auto Use Skill V", 
                        Description = "Auto Uses the V Skill",
                        Default = false,
                        Callback = function(state)
                            getgenv().VMove = state
                        end
                    })

                    local AutoSkillB = AutoSkillSection:AddToggle("AutoSkillZ",{
                        Title = "Auto Use Skill B", 
                        Description = "Auto Uses the B Skill",
                        Default = false,
                        Callback = function(state)
                            getgenv().BMove = state
                        end
                    })

                    local AutoSkillN = AutoSkillSection:AddToggle("AutoSkillN",{
                        Title = "Auto Use Skill N", 
                        Description = "Auto Uses the N Skill",
                        Default = false,
                        Callback = function(state)
                            getgenv().NMove = state
                        end
                    })

                    local Gourds = Tabs.Gourds:AddSection("[Gourds]")

                    Gourds:AddButton({
                        Title = "Show Breathing Progress",
                        Description = "This will show your Breathing Progress",
                        Callback = function()
                            local BreathingPath = game:GetService("ReplicatedStorage").Player_Data[LocalPlayer.Name].BreathingProgress
                            local ProgressText = BreathingPath["1"].Value .. " Out of " .. BreathingPath["2"].Value
                            Fluent:Notify({
                                Title = "Breathing Progress:",
                                Content = "Your breathing progress: ".. ProgressText,
                                SubContent = "Thank you for using Frosties ❤️", -- Optional
                                Duration = 7
                            })
                        end
                    })

                    local AutoGourd = Gourds:AddToggle("AutoGourd",{
                        Title = "Enable Auto Gourds", 
                        Description = "This needs to be enabled so the following functions work",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoBlowGourd = state
                        end
                    })

                    local AutoGourdDropdown = Gourds:AddDropdown("AutoGourdDropdown", {
                        Title = "Select Gourd",
                        Description = "Select the gourd you want to blow 🥛",
                        Values = {"Small Gourd","Medium Gourd","Big Gourd"},
                        Multi = false,
                    })

                    AutoGourdDropdown:OnChanged(function(value)
                        getgenv().GourdSelect = value
                    end)
                end


                if not (PlaceId == Places.Menu) then

                    local MiscSection = Tabs.Misc:AddSection("[Miscellanous]")


                    

                    local NoSunDMG = MiscSection:AddToggle("NoSunDMG",{
                        Title = "No Sun Damage", 
                        Description = "You won't take any sun damage",
                        Default = true,
                        Callback = function(state)
                            if state then
                                LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = true
                            else
                                LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = false
                            end
                        end
                    })

                    local Whitescreen = MiscSection:AddToggle("Whitescreen",{
                        Title = "Whitescreen", 
                        Description = "This makes your screen white, which significantly boosts your fps",
                        Default = false,
                        Callback = function(state)
                            if state then
                                RunService:Set3dRenderingEnabled(false)
                            else
                                RunService:Set3dRenderingEnabled(true)
                            end
                        end
                    })

                    if string.find(string.lower(identifyexecutor()), "solara") then
                        MiscSection:AddParagraph({
                            Title = "Only for Solara Users:",
                            Content = "The following 4 functions (Anti Stun, Remove Mob Block, No Cooldowns, No Drowning) do not work on Solara! Sorry!"
                        })
                    elseif string.find(string.lower(identifyexecutor()), "celery") then
                        MiscSection:AddParagraph({
                            Title = "Only for Celery Users:",
                            Content = "The following 4 functions (Anti Stun, Remove Mob Block, No Cooldowns, No Drowning) do not work on Celery! Sorry!"
                        })
                    end

                    local AntiStunToggle = MiscSection:AddToggle("AntiStun", {
                        Title = "Anti Stun",
                        Description = "Prevents you from getting stunned",
                        Default = false,
                        Callback = function(state)
                            if state then
                                local mt = getrawmetatable(game)
                                setreadonly(mt, false)
                                local namecall = mt.__namecall
                                mt.__namecall = newcclosure(function(self, ...)
                                    local Weapon = getnamecallmethod()
                                    local args = {...}
                                    if Weapon == "FireServer" and args[1] == "Stunned_Head_Effect" then
                                        return wait(9e9)
                                    end
                                    return namecall(self, ...)
                                end)
                                RunService.RenderStepped:Connect(function()
                                    Humanoid.WalkSpeed = Humanoid.WalkSpeed + 1
                                end)
                                wait(1);
                            else
                                RunService:UnbindFromRenderStep("AntiStun")
                                Humanoid.WalkSpeed = DefaultSpeed
                            end
                        end
                    })

                    local RemoveMobBlockConnection

                    local RemoveMobBlock = MiscSection:AddToggle("RemoveMobBlock", {
                        Title = "Remove Mob Block",
                        Description = "Removes mob blocking, so they can't block your attack.",
                        Default = false,
                        Callback = function(state)
                            if state then
                                RemoveMobBlockConnection = Workspace.Mobs:GetDescendants().DescendantAdded:Connect(function(MobBlocking) -- Why the nigger does this error?
                                    if MobBlocking.Name == "Blocking" then
                                        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer("remove_blocking", MobBlocking.Parent)
                                    end
                                end)
                                wait(1);
                            else
                                if RemoveMobBlockConnection then
                                    RemoveMobBlockConnection:Disconnect()
                                    RemoveMobBlockConnection = nil
                                end
                            end
                        end
                    })

                    local NOCD = MiscSection:AddToggle("NOCD",{
                        Title = "No Cooldowns", 
                        Description = "This removes your cooldowns, but don't use your moves too much. Else it will trigger the anticheat.",
                        Default = false,
                        Callback = function(state)
                            if state then
                                getgenv().NoCdMoves = true
                                oldindex = hookmetamethod(game, "__index", function(index, state)
                                    if CustomToString(index) == "LastUsed" and getgenv().NoCdMoves then
                                        return 0
                                    end
                                    return oldindex(index, state)
                                end)
                            else
                                getgenv().NoCdMoves = false
                                hookmetamethod(game, "__index", oldindex)
                            end
                        end
                    })

                    local NoDrowing = MiscSection:AddToggle("NoDrowing",{
                        Title = "No Drowing", 
                        Description = "This won't let you drown to death",
                        Default = false,
                        Callback = function(sate)
                            getgenv().NoDrowning = state
                        end
                    })

                end

                if not (PlaceId == Places.Mugen or PlaceId == Places.Ouwigahara or PlaceId == Places.Menu or PlaceId == Places.Dungeon) then

                    local TrainSection = Tabs.AutoTrain:AddSection("[Auto Train]")

                    local AutoBouldler = TrainSection:AddToggle("AutoBouldler",{
                        Title = "Auto Split Boulder", 
                        Description = "This will automatically split the border for you",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoBouldler = state
                        end
                    })

                    local AutoPushUp = TrainSection:AddToggle("AutoPushUp",{
                        Title = "Auto Pushups", 
                        Description = "This will automatically do pushups for you",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoPushUp = state
                        end
                    })

                    local AutoMeditate = TrainSection:AddToggle("AutoMeditate",{
                        Title = "Auto Meditate", 
                        Description = "This will automatically Meditate for you",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoMeditate = state
                        end
                    })

                    local AutoCupGame = TrainSection:AddToggle("AutoCupGame",{
                        Title = "Auto Cup Game", 
                        Description = "This will automatically win the Cup Game for you",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoCupGame = state
                        end
                    })

                    local AutoTargetGame = TrainSection:AddToggle("AutoTargetGame",{
                        Title = "Auto Target", 
                        Description = "This will automatically hit the Target for you",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoTargetGame = state
                        end
                    })

                end

                if not (PlaceId == Places.Menu) then

                    local ModesSection = Tabs.GodModes:AddSection("[Modes]")

                    local WarDrumMode = ModesSection:AddToggle("WarDrumMode",{
                        Title = "War Drums Mode", 
                        Description = "This constantly enables War Drums, even if you don't have an item with it.",
                        Default = false,
                        Callback = function(state)
                            local function triggerWarDrums()
                                while state do
                                    ReplicatedStorage.Remotes.war_Drums_remote:FireServer(true)
                                    wait(3)
                                end
                            end
                            if state then
                                spawn(triggerWarDrums)
                            end
                        end
                    })


                    local RengokuMode = ModesSection:AddToggle("RengokuMode",{
                        Title = "Heart Ablaze Mode", 
                        Description = "This only works if you're a slayer",
                        Default = false,
                        Callback = function(state)
                            ReplicatedStorage.Remotes.heart_ablaze_mode_remote:FireServer(state)
                        end
                    })

                    local GodModesSection = Tabs.GodModes:AddSection("[Universal GodMode]")
                    GodModesSection:AddParagraph({
                        Title = "All Races GodMode",
                    })

                    local ScytheGM = GodModesSection:AddToggle("ScytheGM",{
                        Title = "Scythe GodMode 30 mastery", 
                        Description = "Godmode with scythe, you gotta have it 30 mastery or higher",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer("skil_ting_asd", LocalPlayer, "scythe_asteroid_reap", 1)
                                wait(.1)
                            end
                        end
                    })

                    local KamadoGM = GodModesSection:AddToggle("KamadoGM",{
                        Title = "Kamado Auto Reheal", 
                        Description = "This will just use the heal ability, must be Kamado though",
                        Default = false,
                        Callback = function(state)
                            ReplicatedStorage.Remotes.heal_tang123asd:FireServer(state)
                        end
                    })

                    local AutoReheal = GodModesSection:AddToggle("AutoReheal",{
                        Title = "Auto Reheal", 
                        Description = "This will just constantly reheal, only for slayers, so it's not really a GodeMode",
                        Default = false,
                        Callback = function(state)
                            ReplicatedStorage.Remotes.regeneration_breathing_remote:FireServer(state)
                        end
                    })

                    local GodModesDemon = Tabs.GodModes:AddSection("[Demon GodModes]")

                    GodModesDemon:AddToggle("Shock Wave Godmode 50 Mastery", {
                        Title = "Shock Wave Godmode",
                        Description = "To use this, you need to have Shock Wave at 50 mastery",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Shock Wave",
                                    1
                                )
                                wait(0.1)
                            end
                        end
                    })

                    GodModesDemon:AddToggle("Dream Godmode ULT required", {
                        Title = "Dream Godmode",
                        Description = "To use this, you need to have Dream ULT",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Dream",
                                    1
                                )
                                wait(0.1)
                            end
                        end
                    })

                    GodModesDemon:AddToggle("Swamp Godmode ULT required", {
                        Title = "Swamp Godmode",
                        Description = "To use this, you need to have Swamp ULT",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Swamp",
                                    1
                                )
                                wait(0.1)
                            end
                        end
                    })

                    GodModesDemon:AddToggle("Ice Godmode ULT required", {
                        Title = "Ice Godmode",
                        Description = "To use this, you need to have Ice ULT",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Ice",
                                    1
                                )
                                wait(0.1)
                            end
                        end
                    })

                    GodModesDemon:AddToggle("Blood Burst Godmode ULT required", {
                        Title = "Blood Burst Godmode",
                        Description = "To use this, you need to have Blood Burst ULT",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Blood Burst",
                                    1
                                )
                                wait(0.1)
                            end
                        end
                    })

                    local GodModeSlayer = Tabs.GodModes:AddSection("[Slayer Godmodes]")

                    GodModeSlayer:AddToggle("Sound Godmode [Mas 50]", {
                        Title = "Sound Godmode",
                        Description = "To use this, you need to have Sound at 50 mastery",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Sound",
                                    1
                                )
                                wait(0.1)
                            end
                        end
                    })

                    GodModeSlayer:AddToggle("Flame Godmode 32 mastery", {
                        Title = "Flame Godmode",
                        Description = "To use this, you need to have Flame at 32 mastery",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Flame",
                                    1
                                )
                                wait(0.1)
                            end
                        end
                    })

                    GodModeSlayer:AddToggle("Beast Godmode 40 mastery", {
                        Title = "Beast Godmode",
                        Description = "To use this, you need to have Beast at 40 mastery",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Beast",
                                    1
                                )
                                wait(0.5)
                            end
                        end
                    })

                    GodModeSlayer:AddToggle("Insect Godmode 28 mastery", {
                        Title = "Insect Godmode",
                        Description = "To use this, you need to have Insect at 28 mastery",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Insect",
                                    1
                                )
                                wait(0.5)
                            end
                        end
                    })

                    GodModeSlayer:AddToggle("Wind Godmode [Mas 30]", {
                        Title = "Wind Godmode",
                        Description = "To use this, you need to have Wind at 30 mastery",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Wind",
                                    1
                                )
                                wait(0.5)
                            end
                        end
                    })

                    GodModeSlayer:AddToggle("Water Godmode [Mas 30]", {
                        Title = "Water Godmode",
                        Description = "To use this, you need to have Water at 30 mastery",
                        Default = false,
                        Callback = function(state)
                            while state do
                                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(
                                    "skil_ting_asd",
                                    LocalPlayer,
                                    "Water",
                                    1
                                )
                                wait(0.5)
                            end
                        end
                    })

                end

                if not (PlaceId == Places.Menu) then

                    local ExtraSection = Tabs.Extra:AddSection("[Extras]")

                    ExtraSection:AddButton({
                        Title = "FPS Boost",
                        Description = "Boosts FPS",
                        Callback = function()
                            loadstring(game:HttpGet("https://pastebin.com/raw/eLcK9X9X"))()
                        end
                    })

                    ExtraSection:AddButton({
                        Title = "ULTIMATE FPS Boost",
                        Description = "Ultimate FPS Boost",
                        Callback = function()
                            loadstring(game:HttpGet('https://pastebin.com/raw/vQMhMCaQ'))()
                        end
                    })

                    ExtraSection:AddButton({
                        Title = "Infinite Yield",
                        Description = "Admin Commands",
                        Callback = function()
                            loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'), true))()
                        end
                    })

                end
                local TrainersTP = Tabs.Teleports:AddSection("[Trainer Teleports]")
                local LocationTP = Tabs.Teleports:AddSection("[Location Teleports]")
                local TeleportSection = Tabs.Teleports:AddSection("[Teleports]")

                local Trainers = {}
                for i,v in pairs(TrainersCF) do 
                    table.insert(Trainers, i)
                end;

                local TrainerDD = TrainersTP:AddDropdown("TrainerDD", {
                    Title = "Select trainer",
                    Description = "Select the trainer you want to teleport to",
                    Values = Trainers,
                    Multi = false,
                })

                TrainerDD:OnChanged(function(value)
                    getgenv().TrainerSelected = value
                end)

                TrainersTP:AddButton({
                    Title = "Teleport To Selected Trainer",
                    Description = "This will teleport you to the selected Trainer",
                    Callback = function()
                        local SelectedTrainer = TrainerSelected
                        for i,v in pairs(TrainersCF) do
                            if i == SelectedTrainer then
                                local CFrame = v
                                local TweenInfo = TweenInfo.new(2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
                                local tween = TweenService:Create(HumanoidRootPart, TweenInfo, {
                                    CFrame = CFrame
                                })
                                tween:Play()
                            end
                        end
                    end
                })

                local TeleportingLocations = {}
                for i,v in pairs(Locations) do 
                    table.insert(TeleportingLocations, i)
                end;

                local LocationDD = LocationTP:AddDropdown("TrainerDD", {
                    Title = "Select location",
                    Description = "Select the location you want to teleport to",
                    Values = TeleportingLocations,
                    Multi = false,
                })

                LocationDD:OnChanged(function(value)
                    getgenv().LocationSelected = value
                end)

                LocationTP:AddButton({
                    Title = "Teleport To Selected Location",
                    Description = "This will teleport you to the selected location",
                    Callback = function()
                        local SelectedLocation = LocationSelected
                        for i,v in pairs(Locations) do
                            if i == SelectedLocation then
                                local CFrame = v
                                local TweenInfo = TweenInfo.new(2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
                                local tweeny = TweenService:Create(HumanoidRootPart, TweenInfo, {
                                    CFrame = CFrame
                                })
                                tweeny:Play()
                            end
                        end
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Menu",
                    Description = "Teleport to Menu",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(5956785391)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Map 1",
                    Description = "Teleport to Map 1",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(6152116144)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Map 1 Private Server",
                    Description = "Teleport to Map 1 Private Server",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(13883279773)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Map 2",
                    Description = "Teleport to Map 2",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(13881804983)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Map 2 Private Server",
                    Description = "Teleport to Map 2 Private Server",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(13883059853)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Ouwigahara",
                    Description = "Teleport to Ouwigahara",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(11468075017)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Hub",
                    Description = "Teleport to Hub",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(9321822839)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Trading",
                    Description = "Teleport to Trading",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(13489082242)
                    end
                })

                TeleportSection:AddButton({
                    Title = "Hop Server",
                    Description = "Hop to another server",
                    Callback = function()
                        Hop()
                    end
                })

                TeleportSection:AddButton({
                    Title = "Join Oldest Server",
                    Description = "Join the oldest server",
                    Callback = function()
                        local AllIDs = {}
                        local foundAnything = ""
                        local actualHour = os.date("!*t").hour
                        local Deleted = false
                        local File = pcall(function()
                            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
                        end)
                        if not File then
                            table.insert(AllIDs, actualHour)
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        end
                        function TPReturner()
                            local Site
                            if foundAnything == "" then
                                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                            else
                                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                            end
                            local ID = ""
                            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                                foundAnything = Site.nextPageCursor
                            end
                            local num = 0
                            for _, v in pairs(Site.data) do
                                local Possible = true
                                ID = CustomToString(v.id)
                                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                                    for _, Existing in pairs(AllIDs) do
                                        if num ~= 0 then
                                            if ID == CustomToString(Existing) then
                                                Possible = false
                                            end
                                        else
                                            if tonumber(actualHour) ~= tonumber(Existing) then
                                                local delFile = pcall(function()
                                                    delfile("NotSameServers.json")
                                                    AllIDs = {}
                                                    table.insert(AllIDs, actualHour)
                                                end)
                                            end
                                        end
                                        num = num + 1
                                    end
                                    if Possible == true then
                                        table.insert(AllIDs, ID)
                                        wait()
                                        pcall(function()
                                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                            wait()
                                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, ID, game.Players.LocalPlayer)
                                        end)
                                        wait(4)
                                    end
                                end
                            end
                        end
                        function Teleport()
                            while wait() do
                                pcall(function()
                                    TPReturner()
                                    if foundAnything ~= "" then
                                        TPReturner()
                                    end
                                end)
                            end
                        end
                        Teleport()
                    end
                })


                if PlaceId == Places.FirstMapPS or PlaceId == Places.FirstMap or PlaceId == Places.AlsoFirstMap then

                    TeleportSection:AddParagraph({
                        Title = "Lily Farm, Muzan TP",
                    })

                    local AutoCollectLily = TeleportSection:AddToggle("AutoCollectLily", {
                        Title = "Auto Collect Lily",
                        Description = "Automatically collect lily flowers",
                        Default = false,
                        Callback = function(state)
                            getgenv().NoClip = state
                            local speed, AutoRegion, delay = 270, true, 1
                            local function fireproximityprompt(ProximityPrompt, Amount, Skip)
                                assert(ProximityPrompt, "Argument #1 Missing or nil")
                                assert(
                                    typeof(ProximityPrompt) == "Instance" and ProximityPrompt:IsA("ProximityPrompt"),
                                    "Attempted to fire a Value that is not a ProximityPrompt"
                                )
                                local HoldDuration = ProximityPrompt.HoldDuration
                                if Skip then
                                    ProximityPrompt.HoldDuration = 0
                                end
                                for i = 1, Amount or 1 do
                                    ProximityPrompt:InputHoldBegin()
                                    if Skip then
                                        wait(HoldDuration)
                                    end
                                    ProximityPrompt:InputHoldEnd()
                                end
                                ProximityPrompt.HoldDuration = HoldDuration
                            end
                            local function ImprovedTeleport(Target)
                                if not HumanoidRootPart then
                                    return
                                end
                                local TeleportSpeed = getgenv().TweeningSpeed or 250
                                local StartingPosition = HumanoidRootPart.Position
                                local PositionDelta = Target - StartingPosition
                                local TotalDuration = (StartingPosition - Target).magnitude / TeleportSpeed
                                local StartingTime = tick()
                                while (HumanoidRootPart.Position - Target).magnitude > TeleportSpeed / 2 do
                                    local deltaTime = tick() - StartingTime
                                    local progress = math.min(deltaTime / TotalDuration, 1)
                                    local MappedPosition = StartingPosition + (PositionDelta * progress)
                                    HumanoidRootPart.Velocity = Vector3.new()
                                    HumanoidRootPart.CFrame = CFrame.new(MappedPosition)
                                    RunService.RenderStepped:Wait()
                                    if not TP then
                                        break
                                    end
                                end
                                HumanoidRootPart.Anchored = false
                                HumanoidRootPart.Velocity = Vector3.new()
                                HumanoidRootPart.CFrame = CFrame.new(Target)
                            end
                            local FlowerCount
                            local function getClosestFlower()
                                local closestFlower, closestDist
                                local flowers = Workspace.Demon_Flowers_Spawn:GetChildren()
                                if not HumanoidRootPart then
                                    return
                                end
                                for _, flower in ipairs(flowers) do
                                    if flower:IsA("Model") then
                                        local mag = (HumanoidRootPart.Position - flower.WorldPivot.Position).magnitude
                                        if not closestDist or mag < closestDist then
                                            closestDist = mag
                                            closestFlower = flower
                                        end
                                    end
                                end
                                return closestFlower
                            end
                            TP = state
                            if TP then
                                while TP do
                                    local currentFlower = getClosestFlower()
                                    if currentFlower then
                                        ImprovedTeleport(currentFlower.WorldPivot.Position)
                                        wait(delay)
                                        for _, v in ipairs(currentFlower:GetDescendants()) do
                                            if v:IsA("ProximityPrompt") then
                                                FlowerCount = 0
                                                repeat
                                                    wait(0.01)
                                                    FlowerCount = FlowerCount + 1
                                                    fireproximityprompt(v, 1, true)
                                                    if not getClosestFlower() or not TP then
                                                        return
                                                    end
                                                until FlowerCount == 10
                                                currentFlower:Destroy()
                                            end
                                        end
                                    end
                                end
                            else
                                if Character then
                                    if HumanoidRootPart then
                                        HumanoidRootPart.Anchored = false
                                        HumanoidRootPart.Velocity = Vector3.new()
                                    end
                                end
                            end
                        end
                    })
                    
                    local TeleportMuzan = TeleportSection:AddToggle("TeleportMuzan", {
                        Title = "Teleport Muzan [ONLY NIGHT]",
                        Description = "Teleport to Muzan, only works at night time",
                        Default = false,
                        Callback = function(state)
                            if state then
                                local function TPtoMuzan()
                                    local Muzan = Workspace:FindFirstChild("Muzan")
                                    if Muzan then
                                        local SpawnPos = Muzan:FindFirstChild("SpawnPos")
                                        if SpawnPos then
                                            local MuzanLocation = SpawnPos.Value
                                            if HumanoidRootPart then
                                                local TweenInfo = TweenInfo.new(
                                                    1,
                                                    Enum.EasingStyle.Quad,
                                                    Enum.EasingDirection.Out
                                                )
                                                local tween = TweenService:Create(HumanoidRootPart, TweenInfo, {
                                                    CFrame = CFrame.new(MuzanLocation)
                                                })
                                                tween:Play()
                                            end
                                        end
                                    end
                                end
                                TPtoMuzan()
                            end
                            if not state then
                                getgenv().TPToMuzan = false
                            end
                        end
                    })
                end


                if PlaceId == Places.Mugen then
                

                    local MugenClashes = Tabs.Mugen:AddSection("[Mugen Hell Clashes]")

                    MugenClashes:AddParagraph({
                        Title = "Guide",
                        Content = "Use Insta Clash Yourself or Insta Clash All when the timer is around 35 seconds, or you'll get kicked."
                    })
                    

                    MugenClashes:AddButton({
                        Title = "Insta Clash All",
                        Description = "Instantly clash all players",
                        Callback = function()
                            for _, player in pairs(Players:GetPlayers()) do
                                local ClashFolder = Workspace.Debree.clash_folder
                                local PlayersVsEnmu = ClashFolder:FindFirstChild(player.Name .. "vsEnmu")
                                if PlayersVsEnmu then
                                    local ClashingPlayers = PlayersVsEnmu:FindFirstChild(player.Name)
                                    if ClashingPlayers then
                                        ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Change_Value", ClashingPlayers, 200)
                                    end
                                end
                            end
                        end
                    })

                    MugenClashes:AddButton({
                        Title = "Insta Clash Yourself",
                        Description = "Instantly clash yourself",
                        Callback = function()
                            local PlayersVsEnmu = Workspace.Debree.clash_folder:FindFirstChild(LocalPlayer.Name .. "vsEnmu")
                            if PlayersVsEnmu then
                                local ClashingPlayers = PlayersVsEnmu:FindFirstChild(LocalPlayer.Name)
                                if ClashingPlayers then
                                    ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Change_Value", ClashingPlayers, 200)
                                end
                            end
                        end
                    })

                    local MugenKillAuras = Tabs.Mugen:AddSection("[Mugen Hell Auras]")

                    MugenKillAuras:AddParagraph({
                        Title = "Guide",
                        Content = "When in core, stand in the middle. For civilians, position yourself between the two carts. For other stages, stay near the boss. This has a 95% success rate. While Arrow Mugen KA is turned on."
                    })
                    
                    --[[
                    local KADD = MugenKillAuras:AddDropdown("KADD", {
                        Title = "Arrow KA Multiplier",
                        Description = "If you have low stats and the KA toggle doesn’t deal enough damage to kill NPCs at core and cart, activate the multiplier.\nNOTE: Only use this if you're using the safe version.",
                        Values = {"x1", "x1.1", "x1.2", "x1.3", "x1.4", "x1.5", "x1.6", "x1.7", "x1.8", "x1.9", "x2"},
                        Multi = false,
                        Default = 1,
                    })
    
                    KADD:OnChanged(function(value)
                        local gsubbedvalue = value:gsub("x", "") 
                        getgenv().KAMultiplier = tonumber(gsubbedvalue)
                    end)
    
                    local MugenAKA = MugenKillAuras:AddToggle("Arrow BDA Mugen KA", {
                        Title = "Arrow BDA Mugen KA | SAFE VERSION",
                        Description = "The Toggle Arrow BDA Mugen KA kills all nearby mobs, making it essential for soloing Hell Mode Mugen Train. The damage is intentionally low. Avoid using any skills. For instance your sword skills and BDA skills.\nThis is the safe version, has been tested way way more than the Unsafe Version.",
                        Default = false,
                        Callback = function(state)
                            
                            if state then
                                coroutine.wrap(function()
                                    while state do
                                        local success, error = pcall(function()
                                            local HitCounter = {}
                    
                                            for i, v in next, Workspace.Mobs:GetDescendants() do
                                                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                                                    local MobName = v:GetFullName()
                    
                                                    if not HitCounter[MobName] then
                                                        HitCounter[MobName] = 0
                                                    end
                    
                                                    if HitCounter[MobName] < 2 then
                                                        local humanoid = v:FindFirstChildOfClass("Humanoid")
                                                        if humanoid and humanoid.Health > 0 then
                                                            ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage", Character, v.HumanoidRootPart.CFrame, v, 80*getgenv().KAMultiplier, 80*getgenv().KAMultiplier)
                                                            HitCounter[MobName] = HitCounter[MobName] + 1
                                                        end
                                                    end
                    
                                                    local HitCount = 0
                                                    for _, count in pairs(HitCounter) do
                                                        HitCount = HitCount + count
                                                    end
                                                    if HitCount >= 2 then
                                                        break
                                                    end
                                                end
                                            end
                                        end)
                                        task.wait(1)
                                    end
                                end)()
                                coroutine.wrap(function()
                                    while state do
                                        ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("skil_ting_asd", game.Players.LocalPlayer, "arrow_knock_back", 5)
                                        wait(12)
                                    end
                                end)()
                            end
                        end
                    })
                    ]]
                    local MUGENWAITTIME = MugenKillAuras:AddInput("MUGENWAITTIME", {
                        Title = "Mugen KA Delay",
                        Default = 0.75,
                        Placeholder = "Insert Number Here",
                        Numeric = true,
                        Finished = true,
                        Callback = function(Value)
                        end
                    })

                    MUGENWAITTIME:OnChanged(function()
                        getgenv().AKAMUGENWAITTIME = tonumber(MUGENWAITTIME.Value)
                    end)

                    getgenv().AKAMUGENWAITTIME = 0.75

                    local MugenAKA = MugenKillAuras:AddToggle("Arrow BDA Mugen KA", {
                        Title = "Arrow Mugen KA (SAFE)",
                        Description = "The Toggle Arrow BDA Mugen KA kills all nearby mobs. Avoid using any skills, including sword and BDA skills.\nIf you want a stronger version of this then activate the one at Kill Auras",
                        Default = false,
                        Callback = function(state)
                            running = state
                            if state then
                                coroutine.wrap(function()
                                    while running do
                                        local success, error = pcall(function()
                                            local HitCounter = {}
                    
                                            for i, v in next, Workspace.Mobs:GetDescendants() do
                                                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                                                    local MobName = v:GetFullName()
                    
                                                    if not HitCounter[MobName] then
                                                        HitCounter[MobName] = 0
                                                    end
                    
                                                    if HitCounter[MobName] < 2 then
                                                        local humanoid = v:FindFirstChildOfClass("Humanoid")
                                                        if humanoid and humanoid.Health > 0 then
                                                            ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage", Character, v.HumanoidRootPart.CFrame, v, 350, 350)
                                                            HitCounter[MobName] = HitCounter[MobName] + 1
                                                        end
                                                    end
                    
                                                    local HitCount = 0
                                                    for _, count in pairs(HitCounter) do
                                                        HitCount = HitCount + count
                                                    end
                                                    if HitCount >= 2 then
                                                        break
                                                    end
                                                end
                                            end
                                        end)
                                        task.wait(getgenv().AKAMUGENWAITTIME)
                                    end
                                end)()
                                coroutine.wrap(function()
                                    while running do
                                        ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("skil_ting_asd", game.Players.LocalPlayer, "arrow_knock_back", 5)
                                        wait(12)
                                    end
                                end)()
                            end
                        end
                    })
                    
                    local MugenOptions = Tabs.Mugen:AddSection("[Mugen Hell Options]")
                    MugenOptions:AddButton({
                        Title = "Activate Hell Mode",
                        Description = "You need an ingot for this to work.",
                        Callback = function()
                            fireproximityprompt(Workspace.HardMode.ProximityPrompt)
                        end
                    })
                end

                if rawequal(PlaceId, Places.Ouwigahara) or rawequal(PlaceId, Places.Dungeon) then
                    local Ouwi = Tabs.Ouwigahara:AddSection("Auto Orbs")
                    local MFollow = Tabs.Ouwigahara:AddSection("Ouwi Auto Farm")
                    local OuwStart = Tabs.Ouwigahara:AddSection("Start Ouwigahara")
                    local AutoEnd = Tabs.Ouwigahara:AddSection("Auto End")

                    local function GetMobsHRP()
                        for _, mob in ipairs(Workspace.Mobs:GetDescendants()) do
                            if mob:IsA("Model") then
                                local humanoid = mob:FindFirstChildOfClass("Humanoid")
                                if humanoid and humanoid.Health > 0 then
                                    return mob:FindFirstChild("HumanoidRootPart")
                                end
                            end
                        end
                        return nil
                    end
                    
                    local function RotateToMobs(MHRP)
                        if GoToMobs then GoToMobs:Disconnect() end
                        GoToMobs = game:GetService("RunService").Heartbeat:Connect(function()
                            if HumanoidRootPart and MHRP then
                                local MobCFrame = GetFarmCFrame(MHRP.Position)
                                local Distance = (HumanoidRootPart.Position - MobCFrame.Position).Magnitude
                                if Distance > getgenv().Distance then
                                    local TweenInfo = TweenInfo.new(Distance / getgenv().TweeningSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                                    local InitiateTween = game:GetService("TweenService"):Create(HumanoidRootPart, TweenInfo, {CFrame = MobCFrame})
                                    InitiateTween:Play()
                                    InitiateTween.Completed:Wait()
                                else
                                    HumanoidRootPart.CFrame = MobCFrame
                                end
                            else
                                GoToMobs:Disconnect()
                            end
                        end)
                    end
                    
                    spawn(function()
                        while task.wait() do 
                            pcall(function()
                                if getgenv().OuwiFarmMobs then
                                    wait(1.5)
                                    if not HumanoidRootPart:FindFirstChild("BodyVelocity") then
                                        local antifall3 = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
                                        antifall3.Velocity = Vector3.new(0, 0, 0)
                                        antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                                    end
                                    local MHRP = GetMobsHRP()
                                    if MHRP then
                                        RotateToMobs(MHRP)
                                    else
                                        task.wait()
                                    end
                                else
                                    if antifall3 then antifall3:Destroy() end
                                    if InitiateTween then InitiateTween:Cancel() end
                                    if GoToMobs then GoToMobs:Disconnect() end
                                    HumanoidRootPart.Anchored = false
                                end
                            end)
                        end
                    end)

                    MFollow:AddParagraph({
                        Title = "Guide:",
                        Content = "The mob follow is weak.\nJust get the Colosseum map or a similar one.\nGo to the center of the map and use Infinite Yield to rise until you're about 10 centimeters from the top.\nThen turn on Arrow KA.\nDone!\nOr you can manually walk around."
                    })

                    local FarmMethodDropdown = MFollow:AddDropdown("Farm Weapon", {
                        Title = "Farm Weapon",
                        Description = "Select farming method",
                        Values = { "Above", "Below", "Behind", "Front" },
                        Default = 1,
                    })
                    FarmMethodDropdown:OnChanged(function(Value)
                        getgenv().FarmingMethod = Value
                    end)

                    local KillAuraWeaponDropdown = MFollow:AddDropdown("Kill Aura Weapon", {
                        Title = "Kill Aura Weapon",
                        Description = "Select kill aura weapon",
                        Values = { "Scythe", "Sword", "Fans", "Combat", "Claw" },
                        Default = 2,
                    })
                    KillAuraWeaponDropdown:OnChanged(function(Value)
                        getgenv().Weapon = Value
                    end)

                    local DistanceSlider = MFollow:AddSlider("Distance", {
                        Title = "Distance",
                        Description = "Set the distance",
                        Default = 70,
                        Min = 0,
                        Max = 300,
                        Rounding = 1,
                        Callback = function(Value)
                            getgenv().Distance = Value
                        end
                    })

                    local TweenSpeedSlider = MFollow:AddSlider("Tweening Speed", {
                        Title = "Tweening Speed",
                        Description = "Set the tweening speed",
                        Default = 240,
                        Min = 100,
                        Max = 700,
                        Rounding = 1,
                        Callback = function(Value)
                            getgenv().TweeningSpeed = Value
                        end
                    })

                    local AutoFarmMobsToggle = MFollow:AddToggle("Auto Farm Mobs", {
                        Title = "Auto Farm Mobs",
                        Description = "Toggle auto farm mobs",
                        Default = false,
                        Callback = function(state)
                            getgenv().OuwiFarmMobs = state
                        end
                    })

                    local KA14HToggle = MFollow:AddToggle("Kill Aura [14 Hit] Safest", {
                        Title = "Kill Aura",
                        Description = "Toggle kill aura",
                        Default = false,
                        Callback = function(state)
                            getgenv().KA14H = state
                        end
                    })

                    local ArrowKAToggle = MFollow:AddToggle("Arrow KA", {
                        Title = "Arrow KA",
                        Description = "Toggle Arrow KA, this basically just kills all the mobs around you. Really the only way to easily get alot of points.",
                        Default = false,
                        Callback = function(state)
                            running = state
                            if state then
                                coroutine.wrap(function()
                                    while running do
                                        local success, error = pcall(function()
                                            local HitCounter = {}
                                            for i, v in next, Workspace.Mobs:GetDescendants() do
                                                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                                                    local MobName = v:GetFullName()
                                                    if not HitCounter[MobName] then
                                                        HitCounter[MobName] = 0
                                                    end
                                                    if HitCounter[MobName] < 2 then
                                                        local humanoid = v:FindFirstChildOfClass("Humanoid")
                                                        if humanoid and humanoid.Health > 0 then
                                                            ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage", Character, v.HumanoidRootPart.CFrame, v, 9e9, 9e9)
                                                            HitCounter[MobName] = HitCounter[MobName] + 1
                                                        end
                                                    end
                                                    local HitCount = 0
                                                    for _, count in pairs(HitCounter) do
                                                        HitCount = HitCount + count
                                                    end
                                                    if HitCount >= 2 then
                                                        break
                                                    end
                                                end
                                            end
                                        end)
                                        wait(1.5)
                                    end
                                end)()
                                coroutine.wrap(function()
                                    while running do
                                        ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("skil_ting_asd", game.Players.LocalPlayer, "arrow_knock_back", 5)
                                        wait(14)
                                    end
                                end)()
                            end
                        end
                    })

                    spawn(function()
                        while task.wait(1) do
                            if getgenv().AutoEnd then
                                if Workspace.Total_Time.Value >= getgenv().time * 60 then
                                    if Character and Character:FindFirstChildOfClass("Humanoid") then
                                        Character:FindFirstChildOfClass("Humanoid").Health = 0
                                    end
                                    wait(4)
                                    ReplicatedStorage.TeleportToShop:FireServer()
                                end
                            end
                        end
                    end)

                    local AutoEndInput = AutoEnd:AddInput("AENDThingy", {
                        Title = "Auto End Time (in minutes)",
                        Default = 0,
                        Placeholder = "Insert Webhook",
                        Numeric = true,
                        Finished = true,
                        Callback = function(Value)
                        end
                    })

                    AutoEndInput:OnChanged(function()
                        getgenv().time = tonumber(AutoEndInput.Value)
                    end)

                    local AutoEndEnabledToggle = AutoEnd:AddToggle("Auto End Enabled", {
                        Title = "Auto End Enabled",
                        Description = "Toggle auto end",
                        Default = false,
                        Callback = function(state)
                            getgenv().AutoEnd = state
                        end
                    })

                    local function Touchieeesss(OrbName)
                        local LocalPlayer = LocalPlayer
                        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                        local basePart = character:FindFirstChildWhichIsA("BasePart")
                        for _, v in ipairs(game:GetService("Workspace").Map:GetChildren()) do
                            if v:IsA("Model") and v.Name == OrbName then
                                for _, touchTransmitter in ipairs(v:GetDescendants()) do
                                    if touchTransmitter:IsA("TouchTransmitter") then
                                        firetouchinterest(basePart, touchTransmitter.Parent, 0)
                                        task.wait(0.1)
                                        firetouchinterest(basePart, touchTransmitter.Parent, 1)
                                    end
                                end
                            end
                        end
                    end

                    local Orbs = {
                        "HealthRegen",
                        "StaminaRegen",
                        "BloodMoney",
                        "DoublePoints",
                        "InstaKill",
                        "WisteriaPoisoning",
                        "MobCamouflage"
                    }

                    for _, OrbName in ipairs(Orbs) do
                        spawn(function()
                            while task.wait() do
                                if getgenv()[OrbName] then
                                    Touchieeesss(OrbName)
                                end
                            end
                        end)
                    end

                    local AutoAllOrbsToggle = Ouwi:AddToggle("Auto All Orbs", {
                        Title = "Auto All Orbs",
                        Description = "Toggle auto all orbs",
                        Default = false,
                        Callback = function(state)
                            getgenv().HealthRegen = state
                            getgenv().StaminaRegen = state
                            getgenv().BloodMoney = state
                            getgenv().DoublePoints = state
                            getgenv().InstaKill = state
                            getgenv().WisteriaPoisoning = state
                            getgenv().MobCamouflage = state
                        end
                    })

                    local AutoHealthRegenToggle = Ouwi:AddToggle("Auto Health Regen", {
                        Title = "Auto [Health Regen]",
                        Description = "Toggle auto health regen",
                        Default = false,
                        Callback = function(state)
                            getgenv().HealthRegen = state
                        end
                    })

                    local AutoStaminaRegenToggle = Ouwi:AddToggle("Auto Stamina Regen", {
                        Title = "Auto [Stamina Regen]",
                        Description = "Toggle auto stamina regen",
                        Default = false,
                        Callback = function(state)
                            getgenv().StaminaRegen = state
                        end
                    })

                    local AutoBloodMoneyToggle = Ouwi:AddToggle("Auto Blood Money", {
                        Title = "Auto [Blood Money]",
                        Description = "Toggle auto blood money",
                        Default = false,
                        Callback = function(state)
                            getgenv().BloodMoney = state
                        end
                    })

                    local AutoDoublePointsToggle = Ouwi:AddToggle("Auto Double Points", {
                        Title = "Auto [Double Points]",
                        Description = "Toggle auto double points",
                        Default = false,
                        Callback = function(state)
                            getgenv().DoublePoints = state
                        end
                    })

                    local AutoInstantKillToggle = Ouwi:AddToggle("Auto Instant Kill", {
                        Title = "Auto [Instant Kill]",
                        Description = "Toggle auto instant kill",
                        Default = false,
                        Callback = function(state)
                            getgenv().InstaKill = state
                        end
                    })

                    local AutoWisteriaPoisoningToggle = Ouwi:AddToggle("Auto Wisteria Poisoning", {
                        Title = "Auto [Wisteria Poisoning]",
                        Description = "Toggle auto wisteria poisoning",
                        Default = false,
                        Callback = function(state)
                            getgenv().WisteriaPoisoning = state
                        end
                    })

                    local AutoMobCamouflageToggle = Ouwi:AddToggle("Auto Mob Camouflage", {
                        Title = "Auto [Mob Camouflage]",
                        Description = "Toggle auto mob camouflage",
                        Default = false,
                        Callback = function(state)
                            getgenv().MobCamouflage = state
                        end
                    })

                    local StartOuwiNormalToggle = OuwStart:AddToggle("Start Ouwi Normal", {
                        Title = "Start Ouwi Normal",
                        Description = "Start Ouwi in normal mode",
                        Default = false,
                        Callback = function(state)
                            if state then
                                game:GetService("ReplicatedStorage").TeleportCirclesEvent:FireServer("Normal")
                            end
                        end
                    })

                    local StartOuwiCompetitiveToggle = OuwStart:AddToggle("Start Ouwi Competitive", {
                        Title = "Start Ouwi Competitive",
                        Description = "Start Ouwi in competitive mode",
                        Default = false,
                        Callback = function(state)
                            if state then
                                game:GetService("ReplicatedStorage").TeleportCirclesEvent:FireServer("Competitive")
                            end
                        end
                    })
                end
            
                    for i, v in pairs(LocalPlayer.PlayerScripts.Small_Scripts:GetDescendants()) do
                        if v:IsA("LocalScript") then
                            if v.Name == "client_global_delete_script" or v.Name == "Client_Global_utility" then
                                warn("Kick Bypassed [BETA]")
                                pcall(function()
                                    v:Destroy()
                                end)
                            end
                        end
                    end;
                    SaveManager:SetLibrary(Fluent)
                    InterfaceManager:SetLibrary(Fluent)
                    SaveManager:IgnoreThemeSettings()
                    SaveManager:SetIgnoreIndexes({})
                    InterfaceManager:SetFolder("Frosties")
                    SaveManager:SetFolder("Frosties/Project Slayers")
                    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
                    SaveManager:BuildConfigSection(Tabs.Settings)
                    SaveManager:LoadAutoloadConfig()
elseif EQ(game.PlaceId, 5956785391) then
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                print("Authentication Successful!")
                print("Correct Key!")

                local Flwuent = loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Scripts/main/FluentGUI.lua"))()
                Flwuent:Notify({
                    Title = "Loading",
                    Content = "Loading Frosties v"..FrostiesVersion,
                    SubContent = "Thank you for using Frosties ❤️", -- Optional
                    Duration = 5
                })


                local Window = Flwuent:CreateWindow({
                    Title = "Frosties v" .. FrostiesVersion,
                    SubTitle = "by FrostLua, discord.gg/XUUjpeyc3S",
                    TabWidth = 160,
                    Size = UDim2.fromOffset(550, 280),
                    Acrylic = true,
                    Theme = "Amethyst",
                    MinimizeKey = Enum.KeyCode.LeftControl
                })
                local Tabs = {
                    Menu = Window:AddTab({ Title = "Menu", Icon = "" }),
                    Teleports = Window:AddTab({ Title = "Teleports", Icon = "" }),
                    Credits = Window:AddTab({ Title = "Credits", Icon = "" })
                }
                Window:SelectTab(1)
                    local MenuSection = Tabs.Menu:AddSection("[Spins]")
                    MenuSection:AddButton({
                        Title = "Auto Daily Spins",
                        Description = "Auto Daily Spins",
                        Callback = function()
                            while task.wait() do
                                ReplicatedStorage:WaitForChild("spins_thing_remote"):InvokeServer()
                            end
                        end
                    })

                    local SupremeClans = {"Kamado", "Agatsuma", "Rengoku", "Uzui"}
                    local MythicClans = {"Soyama", "Tokito", "Tomioka", "Hashibira"}
                    local LegendaryClans = {"Shinazugawa", "Kocho", "Sabito", "Tamayo", "Kuwajima", "Makamo"}
                    local RareClans = {"Kanamori", "Haganezuka", "Ubuyashiki", "Urokodaki", "Kanzaki"}
                    local UncommonClans = {"Kaneki", "Nakahara", "Terauchi", "Takada"}
                    local CommonClans = {"Sakurai", "Fujiwara", "Mori", "Hashimoto", "Saito", "Ishida", "Nishimura", "Ando", "Onishi", "Fukuda", "Kurosaki", "Haruno", "Bakugo", "Toka", "Izuku", "Suzuki", "Todoroki"}

                    local AllClans = {}
                    local clanGroups = {SupremeClans, MythicClans, LegendaryClans, RareClans, UncommonClans, CommonClans}

                    for _, group in pairs(clanGroups) do
                        for _, clan in pairs(group) do
                            table.insert(AllClans, clan)
                        end
                    end
                    local WantedClans = {}

                    local ClanSelector = MenuSection:AddDropdown("MultiDropdown", {
                        Title = "Clan Selector",
                        Description = "Select what clan you want to roll. To roll the clan(s) selected please press the button below.",
                        Values = AllClans,
                        Multi = true,
                        Default = {}
                    })

                    ClanSelector:OnChanged(function(Value)
                        for i,v in pairs(Value) do 
                            table.insert(WantedClans, i)
                        end
                    end)


                    MenuSection:AddButton({
                        Title = "Roll Selected Clan(s)",
                        Description = "This will try and roll the clan(s) you have selected above",
                        Callback = function()
                            Window:Dialog({
                                Title = "Are you sure you want to do this?",
                                Content = "This is all luck based, the script doesn't provide any luck boost. It's just more convenient using this than spinning yourself. Also, make sure you have actually selected clans, else this will just waste your spins.",
                                Buttons = {
                                    {
                                        Title = "Yes, I am sure.",
                                        Callback = function()
                                            local SpinText = LocalPlayer.PlayerGui:WaitForChild("Customization").Spin.Spins_Text.Text
                                            local Spins = SpinText:match("(%d+)")
                                            Spins = tonumber(Spins)
                                            print("Confirmed the dialog.")
                                            local clan = ReplicatedStorage.Player_Data[LocalPlayer.Name].Clan
                                            repeat
                                                wait(0.001)
                                                ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin", ReplicatedStorage.Player_Data[LocalPlayer.Name].Spins, clan)
                                            until table.find(WantedClans, clan.Value) or Spins == 0
                                            if table.find(WantedClans, clan.Value) then
                                                Window:Dialog({
                                                    Title = "You got the clan!",
                                                    Content = "You obtained the clan you wanted to obtain!",
                                                    Buttons = {
                                                        {
                                                            Title = "I've read the message.",
                                                            Callback = function()
                                                            end
                                                        }
                                                    }
                                                })
                                            elseif Spins == 0 then
                                                Window:Dialog({
                                                    Title = "You did not get the clan.",
                                                    Content = "You didn't get the clan you specified. We are sorry, It's all just luck based.",
                                                    Buttons = {
                                                        {
                                                            Title = "I've read the message.",
                                                            Callback = function()
                                                            end
                                                        }
                                                    }
                                                })
                                            end
                                        end
                                    },
                                    {
                                        Title = "No, I am not sure.",
                                        Callback = function()
                                            print("Cancelled the dialog.")
                                        end
                                    }
                                }
                            })
                        end
                    })

                local CreditsSection = Tabs.Credits:AddSection("[ Credits ]")

                CreditsSection:AddParagraph({
                    Title = "Credits",
                    Content = "This script was developed by frostlua on discord, if you encounter any bugs. Please report them at our discord server: (discord.gg/XUUjpeyc3S)\nThis is a free script, so don't expect it to be the best. It's just for fun\n Thanks for choosing Frosties!"
                })

                CreditsSection:AddButton({
                    Title = "Copy Discord Link",
                    Description = "This sets our discord server to your clipboard",
                    Callback = function()
                        setclipboard("discord.gg/XUUjpeyc3S")
                    end
                })
                local TeleportSection = Tabs.Teleports:AddSection("[Teleports]")


                TeleportSection:AddButton({
                    Title = "TP to Menu",
                    Description = "Teleport to Menu",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(5956785391)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Map 1",
                    Description = "Teleport to Map 1",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(6152116144)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Map 1 Private Server",
                    Description = "Teleport to Map 1 Private Server",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(13883279773)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Map 2",
                    Description = "Teleport to Map 2",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(13881804983)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Map 2 Private Server",
                    Description = "Teleport to Map 2 Private Server",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(13883059853)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Ouwigahara",
                    Description = "Teleport to Ouwigahara",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(11468075017)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Hub",
                    Description = "Teleport to Hub",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(9321822839)
                    end
                })

                TeleportSection:AddButton({
                    Title = "TP to Trading",
                    Description = "Teleport to Trading",
                    Callback = function()
                        game:GetService('TeleportService'):Teleport(13489082242)
                    end
                })

                TeleportSection:AddButton({
                    Title = "Hop Server",
                    Description = "Hop to another server",
                    Callback = function()
                        Hop()
                    end
                })

                TeleportSection:AddButton({
                    Title = "Join Oldest Server",
                    Description = "Join the oldest server",
                    Callback = function()
                        local AllIDs = {}
                        local foundAnything = ""
                        local actualHour = os.date("!*t").hour
                        local Deleted = false
                        local File = pcall(function()
                            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
                        end)
                        if not File then
                            table.insert(AllIDs, actualHour)
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        end
                        function TPReturner()
                            local Site
                            if foundAnything == "" then
                                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                            else
                                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                            end
                            local ID = ""
                            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                                foundAnything = Site.nextPageCursor
                            end
                            local num = 0
                            for _, v in pairs(Site.data) do
                                local Possible = true
                                ID = CustomToString(v.id)
                                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                                    for _, Existing in pairs(AllIDs) do
                                        if num ~= 0 then
                                            if ID == CustomToString(Existing) then
                                                Possible = false
                                            end
                                        else
                                            if tonumber(actualHour) ~= tonumber(Existing) then
                                                local delFile = pcall(function()
                                                    delfile("NotSameServers.json")
                                                    AllIDs = {}
                                                    table.insert(AllIDs, actualHour)
                                                end)
                                            end
                                        end
                                        num = num + 1
                                    end
                                    if Possible == true then
                                        table.insert(AllIDs, ID)
                                        wait()
                                        pcall(function()
                                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                            wait()
                                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, ID, game.Players.LocalPlayer)
                                        end)
                                        wait(4)
                                    end
                                end
                            end
                        end
                        function Teleport()
                            while wait() do
                                pcall(function()
                                    TPReturner()
                                    if foundAnything ~= "" then
                                        TPReturner();
                                    end
                                end)
                            end
                        end
                        Teleport()
                    end
                })
end

local FinishedTime = tick()

local ElapsedT = FinishedTime - StartingTime

print(string.format("Script fully loaded in %.6f seconds", ElapsedT,"!"))

-- Fluent:ToggleTransparency(true);
-- Fluent:ToggleAcrylic(true);
