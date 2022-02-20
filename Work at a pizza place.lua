--Destroys script when you execute again
if game.CoreGui:FindFirstChild("UILib") then
    game.CoreGui["UILib"]:Destroy()
end
--end 


--Notification---
function SendNotification(Title, Text, Duration)
    game.StarterGui:SetCore("SendNotification",{
        Title = Title,
        Text = Text,
        Duration = Duration
 
     })
end
--end--




--Libary things
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UI_Libraries/Zypher/Library.lua"))()

local main = library:CreateMain({
    projName = "UILib",
    Resizable = true,
    MinSize = UDim2.new(0,400,0,400),
    MaxSize = UDim2.new(0,750,0,500),
})
--end






--Credits 
local category3 = main:CreateCategory("Credits", "Credits")

local section3 = category3:CreateSection("Credits")
--end 






--Main
local category = main:CreateCategory("Main", "Main")

local section = category:CreateSection("Main")

local sectionv2 = category:CreateSection("Useless things")

--end






--Autofarm
local category1 = main:CreateCategory("Auto farm", "Auto farm")

local section1 = category1:CreateSection("Auto farm")
--end





--Teleports
local category2 = main:CreateCategory("Teleport", "Teleport")

local section2 = category2:CreateSection("Teleports")
--end





--Credits(section 3)
section3:Create(
    "Textlabel",
    "Hypixx.#2888 - Main dev"
)
section3:Create(
    "Textlabel",
    "lil scorpion#7563 - Co dev"
)
section3:Create(
    "Textlabel",
    "xTheAlex14 - Zypher UI Libary"
)
section3:Create(
    "Textlabel",
    "Redreflex - Zypher UI Libary"
)
--end





--teleport location cframes
local cashier = CFrame.new(48, 4, 88)
local chef = CFrame.new(40, 3.8, 57.21)
local boxer = CFrame.new(59.02, 3.799, 14.323)
local remMan = CFrame.new(13.09, 3.9, 21.3)
local delDri = CFrame.new(20.6, 8.6, -18.87)
local delDri1 = CFrame.new(7.15, 12.999, -1028.07)
local manager = CFrame.new(37.02, 3.7999, 6.683)
local carSpawn = CFrame.new(74.9, 3.3999, -72.7)
--end





--Main (section)

section:Create(
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

section:Create(
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

section:Create(
    "Slider",
    "Hip height",
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = value
    end,
    {
        min = 0,
        max = 150,
        -- Optional
        default = 0,
        precise = false, -- ex: 0.1, 0.2, 0.3
        changablevalue = true
    }
)

sectionv2:Create(
    "Button",
    "Get fire extinguisher",
    function()
        SendNotification("Hypix-Scripting", "Got fire extingisher", 3)
        workspace.Extinguisher.Extinguisher.ClickDetector.Detector:FireServer()
    end,
    {
        animated = true,
    }
)

section:Create(
    "Button",
    "Fly (press e)",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/ePiuUv6t",true))()
    end,
    {
        animated = true,
    }
)

section:Create(
    "Toggle",
    "No Clip",
    function(state)
        game:GetService("RunService").Stepped:Connect(function()
            if state == true then
                SendNotification("Hypix-Scripting", "No clip = On", 3)
                game.Players.LocalPlayer.Character.Head.CanCollide = false
                game.Players.LocalPlayer.Character.Torso.CanCollide = false
            end
  
        end)
            if state == false then
                SendNotification("Hypix-Scripting", "No clip = Off", 3)
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end
    end,
    {
        default = false,
    }
)






--Teleports(section 2 )
section2:Create(
    "DropDown",
    "Teleports", 
    function(current)
        if current == "Cashier" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cashier
        else if current == "Chef" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chef
        else if current == "Boxer" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boxer
        else if current == "Remove manager" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = remMan
        else if current == "Supplier (load out)" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = delDri
        else if current == "Supplier (load in)" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = delDri1
        else if current == "Manager" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = manager
        else if current == "Car Spawn" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = carSpawn
    end
    end
    end
    end
    end
    end
    end
    end
    end,
    {
        options = {
            "Cashier",
            "Chef",
            "Manager",
            "Boxer",
            "Car Spawn",
            "Supplier (load out)",
            "Supplier (load in)",
            "Remove manager"
        },
        default = "Cashier",
        search = false
    }
)

section2:Create(
    "TextBox",
    "Teleport to player",
    function(input)
        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
        local pl2 = input 
        pl.CFrame = game.Players[pl2].Character.HumanoidRootPart.CFrame
    end,
    {
        text = "Enter name of player"
    }
)
--end



