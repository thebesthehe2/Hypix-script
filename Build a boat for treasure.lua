--yep
if game.CoreGui:FindFirstChild("UILib") then
    game.CoreGui["UILib"]:Destroy()
end
--end 




--Lbary things
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UI_Libraries/Zypher/Library.lua"))()

local main = library:CreateMain({
    projName = "UILib",
    Resizable = true,
    MinSize = UDim2.new(0,400,0,400),
    MaxSize = UDim2.new(0,750,0,500),
})
--end
local category3 = main:CreateCategory("Credits", "Credits")

local creds = category3:CreateSection("Credits")
--credits

--end

--main 
local category = main:CreateCategory("Main", "Main")

local MAIN = category:CreateSection("Main")
--end 





--auto farm
local category2 = main:CreateCategory("Auto farm", "Auto farm")

local autofarm = category2:CreateSection("Auto farm")
--end





--Position CFrames for auto farm
local stage1 = CFrame.new(-85, 52, 1367)
local stage2 = CFrame.new(-90, 53, 2140)
local stage3 = CFrame.new(-110, 57, 2904)
local stage4 = CFrame.new(-58, 35, 3671)
local stage5 = CFrame.new(-137, 63, 3683)
local stage6 = CFrame.new(-104, 66, 5223)
local stage7 = CFrame.new(-118, 41, 5899)
local stage8 = CFrame.new(-39, 54, 6762)
local stage9 = CFrame.new(-137, 81, 7524)
local stage10 = CFrame.new(-128, 78, 8292)
local stage11 = CFrame.new(-27, 65, 8673)
local stage12 = CFrame.new(-47, -270, 8702)
local stage13 = CFrame.new(-46, -360, 9434)
local stage14 = CFrame.new(-52, -357, 9496)
local spawn = CFrame.new(-482, -9, 293)
--end

--Credits
creds:Create(
    "Textlabel",
    "Hypixx.#2888 - Main Dev"
)

creds:Create(
    "Textlabel",
    "lil scorpion#7563 - Co Dev"
)

creds:Create(
    "Textlabel",
    "xTheAlex14  - Zypher UI Libary"
)

creds:Create(
    "Textlabel",
    "Redreflex - Zyther UI Libary"
)
--end


--MAIN

MAIN:Create(
    "Button",
    "Location",
    function()
        print(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end,
    {
        animated = true,
    }
)


MAIN:Create(
    "Slider",
    "Walkspeed",
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
    {
        min = 16,
        max = 250,
        -- Optional
        default = 16,
        precise = false, -- ex: 0.1, 0.2, 0.3
        changablevalue = true
    }
)

MAIN:Create(
    "Slider",
    "Jump power",
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end,
    {
        min = 50,
        max = 200,
        -- Optional
        default = 50,
        precise = false, -- ex: 0.1, 0.2, 0.3
        changablevalue = true
    }
)

MAIN:Create(
    "Slider",
    "Hip height",
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = value
    end,
    {
        min = 2.19,
        max = 150,
        -- Optional
        default = 2.19,
        precise = false, -- ex: 0.1, 0.2, 0.3
        changablevalue = true
    }
)

MAIN:Create(
    "Toggle",
    "Noclip (created by lil scorpion#7563)",
    function(state)
        local noclip = state -- Gets if you want the noclip
        char = game.Players.LocalPlayer.Character -- Gets your player
        while true do -- Make sure someone is in game
            if noclip == true then
                for _,v in pairs(char:children()) do
                    pcall(function()
                        if v.className == "Part" then
                            v.CanCollide = false
                        end
                    end)
                end
            end
            if noclip == false then
                for _,v in pairs(char:children()) do
                    pcall(function()
                        if v.className == "Part" then
                            v.CanCollide = true
                        end
                    end)
                end
            end
        game:service("RunService").Stepped:wait()
        end
    end,
    {
    default = false
    }
)


MAIN:Create(
    "Button",
    "No damage in water",
    function()
        game.Players.LocalPlayer.Character.WaterDetector:Destroy()
    end,
    {
        animated = true,
    }
)

--end




--Auto farm
autofarm:Create(
    "Toggle",
    "Auto Farm (made by me/ may be a bit buggy)",
    function(state)
        if state == true then
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage1
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage2
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage3 
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage4 
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage5
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage6
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage7
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage8
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage9
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage10
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage11
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage12
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage13
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = stage14
            wait(20)
        end
        if state == false then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spawn
        end
    end,
    {
        default = false,
    }
)
--end

--loop to delete water detector 
while game.Players.LocalPlayer.Character.WaterDetector do
    game.Players.LocalPlayer.Character.WaterDetector:Destroy()
   wait(0.1)
end
--end

--send notification things
local funcs = {}
function SendNotification(Title, Text, Duration)
    game.StarterGui:SetCore("SendNotification",{
        Title = Title,
        Text = Text,
        Duration = Duration
 
     })
end


funcs.plrJoin = game.Players.PlayerAdded:Connect(function(joinPlr)
        SendNotification("Hypix", tostring(joinPlr).. "has just joined the game", 5)
end)



funcs.plrLeave = game.Players.PlayerRemoving:Connect(function(leavePlr)
        SendNotification("Hypix", tostring(leavePlr).. "has just left the game", 5)
    end)
--end
