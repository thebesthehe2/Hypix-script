wait(1)
if game.CoreGui:FindFirstChild("UILib") then
    game.CoreGui["UILib"]:Destroy()
end
    

function SendNotification(Title, Text, Duration)
    game.StarterGui:SetCore("SendNotification",{
        Title = Title,
        Text = Text,
        Duration = Duration
 
     })
end


local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UI_Libraries/Zypher/Library.lua"))()

local main = library:CreateMain({
    projName = "UILib",
    Resizable = true,
    MinSize = UDim2.new(0,400,0,400),
    MaxSize = UDim2.new(0,750,0,500),
})

local category = main:CreateCategory("Main", "Main")

local mainThings = category:CreateSection("Main")

local category1 = main:CreateCategory("Teleports", "Teleports")

local blue = category1:CreateSection("Blue")

local yellow = category1:CreateSection("Yellow")

local red = category1:CreateSection("Red")

local green = category1:CreateSection("Green")

local yellow_top = CFrame.new(107, 129, -2)

local yellow_bottom = CFrame.new(131, 24, -1)

local green_top = CFrame.new(0.2, 129, -109)

local green_bottom = CFrame.new(0.07, 24.8, -131.35)

local blue_top = CFrame.new(-0.42, 129.94, 106.6)

local blue_bottom = CFrame.new(-5.3, 25.36, 132.206)

local red_top = CFrame.new(-101.34, 129.41, 0.32)

local red_bottom = CFrame.new(-131, 24.7, 1.909)

mainThings:Create(
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

mainThings:Create(
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

mainThings:Create(
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

mainThings:Create(
    "Button",
    "Fly (press e)",
    function()
        repeat wait()
        until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
     local mouse = game.Players.LocalPlayer:GetMouse()
     repeat wait() until mouse
     local plr = game.Players.LocalPlayer
     local torso = plr.Character.Torso
     local flying = true
     local deb = true
     local ctrl = {f = 0, b = 0, l = 0, r = 0}
     local lastctrl = {f = 0, b = 0, l = 0, r = 0}
     local maxspeed = 50
     local speed = 0
     
     function Fly()
     local bg = Instance.new("BodyGyro", torso)
     bg.P = 9e4
     bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
     bg.cframe = torso.CFrame
     local bv = Instance.new("BodyVelocity", torso)
     bv.velocity = Vector3.new(0,0.1,0)
     bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
     repeat wait()
     plr.Character.Humanoid.PlatformStand = true
     if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
     speed = speed+.5+(speed/maxspeed)
     if speed > maxspeed then
     speed = maxspeed
     end
     elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
     speed = speed-1
     if speed < 0 then
     speed = 0
     end
     end
     if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
     bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
     lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
     elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
     bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
     else
     bv.velocity = Vector3.new(0,0.1,0)
     end
     bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
     until not flying
     ctrl = {f = 0, b = 0, l = 0, r = 0}
     lastctrl = {f = 0, b = 0, l = 0, r = 0}
     speed = 0
     bg:Destroy()
     bv:Destroy()
     plr.Character.Humanoid.PlatformStand = false
     end
     mouse.KeyDown:connect(function(key)
     if key:lower() == "e" then
     if flying then flying = false
     else
     flying = true
     Fly()
     end
     elseif key:lower() == "w" then
     ctrl.f = 1
     elseif key:lower() == "s" then
     ctrl.b = -1
     elseif key:lower() == "a" then
     ctrl.l = -1
     elseif key:lower() == "d" then
     ctrl.r = 1
     end
     end)
     mouse.KeyUp:connect(function(key)
     if key:lower() == "w" then
     ctrl.f = 0
     elseif key:lower() == "s" then
     ctrl.b = 0
     elseif key:lower() == "a" then
     ctrl.l = 0
     elseif key:lower() == "d" then
     ctrl.r = 0
     end
     end)
     Fly()
    end,
    {
        animated = true,
    }
)

blue:Create(
    "Button",
    "Top",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = blue_top
    end,
    {
        animated = true,
    }
)

blue:Create(
    "Button",
    "Bottom",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = blue_bottom
    end,
    {
        animated = true,
    }
)

green:Create(
    "Button",
    "Top",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = green_top
    end,
    {
        animated = true,
    }
)

green:Create(
    "Button",
    "Bottom",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = green_bottom
    end,
    {
        animated = true,
    }
)

yellow:Create(
    "Button",
    "Top",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = yelllow_top
    end,
    {
        animated = true,
    }
)

yellow:Create(
    "Button",
    "Bottom",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = yellow_bottom
    end,
    {
        animated = true,
    }
)

red:Create(
    "Button",
    "Top",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = red_top
    end,
    {
        animated = true,
    }
)

red:Create(
    "Button",
    "Bottom",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = red_bottom
    end,
    {
        animated = true,
    }
)

--send notification things

