--[[
CHANGE LOG!:
1.2.0
Fixed auto get worlds hardest badge banning you
Added immume mode!
Read license to know your rights!
]]

local autoFarmEnabled = false
local device

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

local scriptversion = "1.2.0 "
local discord = "discord.gg/XUUjpeyc3S "
local credit = "made by _shqiperia_ on dc"
local Window = Library.CreateLib("Frosties " .. scriptversion .. discord, "GrapeTheme")

local Main = Window:NewTab("Main")
local Credits = Window:NewTab("Credits")
local MainSection1 = Main:NewSection("Main")
local CreditsSection1 = Credits:NewSection("Credits")

MainSection1:NewButton("Complete Game", "This will automatically complete the game for you!", function()
    local player = game.Players.LocalPlayer
    if player and player.leaderstats then
        local level
        repeat
            level = player.leaderstats.Level.Value
            if level >= 1 and level <= 32 then
                local args = {level + 1}
                game:GetService("ReplicatedStorage"):WaitForChild("Win"):FireServer(unpack(args))
            end
            wait(0.2)
        until level == 32
        game:GetService("ReplicatedStorage").badger:FireServer("Hello")
    end

    for i = 1, 15 do
        print("discord.gg/XUUjpeyc3S")
        wait(.1) 
    end
end)

MainSection1:NewButton("Get World Hardest Badge", "This will give you the  World Hardest Badge badge", function()
    for i = 1, 3 do
        game:GetService("ReplicatedStorage").badger:FireServer("hello2", "📖🎈🎆")
    end
end)

MainSection1:NewButton("Become Immume", "This will make you immume to dying.", function()
    game:GetService("ReplicatedStorage"):FindFirstChild("Death"):Destroy()
end)


CreditsSection1:NewLabel("Made and fully developed, by _shqiperia_ on discord")
CreditsSection1:NewLabel("Discord Invite: discord.gg/XUUjpeyc3S")
CreditsSection1:NewLabel("Made with love by FrostLua ;)")

