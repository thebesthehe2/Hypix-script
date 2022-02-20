if game.CoreGui:FindFirstChild("Hypixx") then
    game.CoreGui["Hypixx"]:Destroy()
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UI_Libraries/Zypher/Library.lua"))()

local main = library:CreateMain({
    projName = "Hypixx",
    Resizable = true,
    MinSize = UDim2.new(0,400,0,400),
    MaxSize = UDim2.new(0,750,0,500),
})

local creds = main:CreateCategory("Credits", "")

local section = creds:CreateSection("Credits")

local Main = main:CreateCategory("Main", "")

local section1 = Main:CreateSection("Main")

local Aimbot = main:CreateCategory("Aimbot", "")

local section3 = Aimbot:CreateSection("Aimbot")

local Guns = main:CreateCategory("Gun", "")

local section2 = Guns:CreateSection("Gun's")

function SendNotification(Title, Text, Duration)
    game.StarterGui:SetCore("SendNotification",{
        Title = Title,
        Text = Text,
        Duration = Duration
 
     })
end


section:Create(
    "Textlabel",
    "Hypixx.#2888 - Main dev"
)

section:Create(
    "Textlabel",
    "xTheAlex14 - Zypher UI-Lib"
)

section:Create(
    "Textlabel",
    "Redreflex - Zypher UI-Lib"
)

section:Create(
    "Textlabel",
    "PhoenixAceVFX"
)

section:Create(
    "Textlabel",
    "lightw#7040"
)

section:Create(
    "Textlabel",
    "lil scorpion#7563"
)
section:Create(
    "Textlabel",
    "Josh"
)
section:Create(
    "Textlabel",
    "Exunys"
)

section1:Create(
    "Slider",
    "Walkspeed",
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
    {
        min = 16,
        max = 150,
        -- Optional
        default = 16,
        precise = false, -- ex: 0.1, 0.2, 0.3
        changablevalue = true
    }
)

section1:Create(
    "Slider",
    "Jump power",
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end,
    {
        min = 50,
        max = 150,
        -- Optional
        default = 50,
        precise = false, -- ex: 0.1, 0.2, 0.3
        changablevalue = true
    }
)

section1:Create(
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

local var = {}
var.clipping = nil

section1:Create(
    "Toggle",
    "No clip",
    function(state)
        if state == true then
            SendNotification("Hypix-Scripting", "No clip = On", 3)
            var.clipping = game:GetService("RunService").Stepped:Connect(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head") then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso").CanCollide = not state
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head").CanCollide = not state
                end 
            end)
        else
            SendNotification("Hypix-Scripting", "No clip = Off", 3)
            var.clipping:Disconnect()
        end
    end,
    {
        default = false,
    }
)

section1:Create(
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


section1:Create(
    "Toggle",
    "Super punch (Broken)",
    function(state)
        if state == true then
            mainRemotes = game.ReplicatedStorage
            meleeRemote = mainRemotes['meleeEvent']
            mouse = game.Players.LocalPlayer:GetMouse()
            punching = false
            cooldown = false
            
            function punch()
            cooldown = true
            local part = Instance.new("Part", game.Players.LocalPlayer.Character)
            part.Transparency = 1
            part.Size = Vector3.new(5, 2, 3)
            part.CanCollide = false
            local w1 = Instance.new("Weld", part)
            w1.Part0 = game.Players.LocalPlayer.Character.Torso
            w1.Part1 = part
            w1.C1 = CFrame.new(0,0,2)
            part.Touched:connect(function(hit)
            if game.Players:FindFirstChild(hit.Parent.Name) then
            local plr = game.Players:FindFirstChild(hit.Parent.Name)
            if plr.Name ~= game.Players.LocalPlayer.Name then
            part:Destroy()
            
            for i = 1,100 do
            meleeRemote:FireServer(plr)
            end
            end
            end
            end)
            
            wait(1)
            cooldown = false
            part:Destroy()
            end
            
            
            mouse.KeyDown:connect(function(key)
            if cooldown == false then
            if key:lower() == "f" then
            
            punch()
            
            end
            end
            end)
            if state == false then
                mainRemotes = game.ReplicatedStorage
                meleeRemote = mainRemotes['meleeEvent']
                mouse = game.Players.LocalPlayer:GetMouse()
                punching = false
                cooldown = true
                
                function punch()
                cooldown = true
                local part = Instance.new("Part", game.Players.LocalPlayer.Character)
                part.Transparency = 1
                part.Size = Vector3.new(5, 2, 3)
                part.CanCollide = false
                local w1 = Instance.new("Weld", part)
                w1.Part0 = game.Players.LocalPlayer.Character.Torso
                w1.Part1 = part
                w1.C1 = CFrame.new(0,0,2)
                part.Touched:connect(function(hit)
                if game.Players:FindFirstChild(hit.Parent.Name) then
                local plr = game.Players:FindFirstChild(hit.Parent.Name)
                if plr.Name ~= game.Players.LocalPlayer.Name then
                part:Destroy()
                
                for i = 1,100 do
                meleeRemote:FireServer(plr)
                end
                end
                end
                end)
                
                wait(1)
                cooldown = true
                part:Destroy()
                end
                
                
                mouse.KeyDown:connect(function(key)
                if cooldown == false then
                if key:lower() == "f" then
                
                punch()
                
                end
                end
                end)
            end
        end
    end,
    {
        default = false,
    }
)

section1:Create(
    "Button",
    "Arrest All (use at own risk)",
    function()
        wait(0.1)
        Player = game.Players.LocalPlayer
        Pcf = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
        if v.Name ~= Player.Name then
        local i = 10
        repeat
        wait()
        i = i-1
        game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
        Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
        until i == 0
    end
    end
    end,
    {
        animated = true,
    }
)

--[[section1:Create(
    "Button",
    "Kill All (use at own risk)",
    function()
        workspace.Remote.TeamEvent:FireServer("Medium stone grey")

        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)	

        wait(0.5)
        function kill(a)
        local A_1 =
        {
        [1] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)),
        ["Distance"] = 3.2524313926697,
        ["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576),
        ["Hit"] = a.Character.Head
        },
        [2] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)),
        ["Distance"] = 3.2699294090271,
        ["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377),
        ["Hit"] = a.Character.Head
        },
        [3] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)),
        ["Distance"] = 3.1665518283844,
        ["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652),
        ["Hit"] = a.Character.Head
        },
        [4] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)),
        ["Distance"] = 3.3218522071838,
        ["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611),
        ["Hit"] = a.Character.Head
        },
        [5] =
        {
        ["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)),
        ["Distance"] = 3.222757101059,
        ["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302),
        ["Hit"] = a.Character.Head
        }
        }
        local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
        local Event = game:GetService("ReplicatedStorage").ShootEvent
        Event:FireServer(A_1, A_2)
        Event:FireServer(A_1, A_2)
        end

        for i,v in pairs(game.Players:GetChildren())do
        if v.Name ~= game.Players.LocalPlayer.Name then
        kill(v)
        end
        end
        wait(1)
        workspace.Remote.TeamEvent:FireServer("Bright orange")
    end,
    {
        animated = true,
    }
)]]--

section1:Create(
    "Button",
    "Inmate",
    function()
        Workspace.Remote.TeamEvent:FireServer("Bright orange")
    end,
    {
        animated = true,
    }
)

section1:Create(
    "Button",
    "Guard",
    function()
        Workspace.Remote.TeamEvent:FireServer("Bright blue")
    end,
    {
        animated = true,
    }
)

section1:Create(
    "Button",
    "Criminal",
    function()
        LCS = game.Workspace["Criminals Spawn"].SpawnLocation

        LCS.CanCollide = false
        LCS.Size = Vector3.new(51.05, 24.12, 54.76)
        LCS.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        LCS.Transparency = 1
        wait(0.5)
        LCS.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        LCS.Size = Vector3.new(6, 0.2, 6)
        LCS.Transparency = 0
    end,
    {
        animated = true,
    }
)

section1:Create(
    "Button",
    "Neutral",
    function()
        Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end,
    {
        animated = true,
    }
)

section2:Create(
    "Button",
    "Mod guns",
    function()
        local m = require(game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass("Tool").GunStates)
                m.Damage = 100
                m.MaxAmmo = math.huge
                m.CurrentAmmo = math.huge
                m.AutoFire = false
                m.FireRate = 0.1
    end,
    {
        animated = true,
    }
)

section2:Create(
    "Button",
    "Give all guns + key card (only if one is dropped)",
    function()
        SendNotification("Hypix-Scripting", "Gave all guns", 3)
        local args = {[1] = workspace.Prison_ITEMS.giver:FindFirstChild("M9").ITEMPICKUP}
        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
        local args = {[1] = workspace.Prison_ITEMS.giver:FindFirstChild("Remington 870").ITEMPICKUP}
        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
        local args = {[1] = workspace.Prison_ITEMS.giver:FindFirstChild("AK-47").ITEMPICKUP}
        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
        local args = {
            [1] = workspace.Prison_ITEMS.single:FindFirstChild("Key card").ITEMPICKUP
        }
        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
    end,
    {
        animated = true,
    }
)

section2:Create(
    "Button",
    "Give M9",
    function()
        SendNotification("Hypix-Scripting", "Gave M9", 3)
        local args = {[1] = workspace.Prison_ITEMS.giver:FindFirstChild("M9").ITEMPICKUP}
        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
    end,
    {
        animated = true,
    }
)

section2:Create(
    "Button",
    "Give Remington 870",
    function()
        SendNotification("Hypix-Scripting", "Gave Remington", 3)
        local args = {[1] = workspace.Prison_ITEMS.giver:FindFirstChild("Remington 870").ITEMPICKUP}
        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
    end,
    {
        animated = true,
    }
)

section2:Create(
    "Button",
    "Give AK-47",
    function()
        SendNotification("Hypix-Scripting", "Gave AK-47", 3)
        local args = {[1] = workspace.Prison_ITEMS.giver:FindFirstChild("AK-47").ITEMPICKUP}
        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
    end,
    {
        animated = true,
    }
)

section2:Create(
    "Button",
    "Give Key Card (only if dropped)",
    function()
        SendNotification("Hypix-Scripting", "Gave Key Card", 3)
        local args = {
            [1] = workspace.Prison_ITEMS.single:FindFirstChild("Key card").ITEMPICKUP
        }

        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
    end,
    {
        animated = true,
    }
)

section1:Create(
    "Toggle",
    "Anti Tazer",
    function(state)
        if state == true then
            game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
            game.Players.LocalPlayer.CharacterAdded:connect(function()
            game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
            game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
            end)
        end
        if state == false then
            game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = false
            game.Players.LocalPlayer.CharacterAdded:connect(function()
            game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
            game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = false
            end)
        end
    end,
    {
        default = false,
    }
)

section1:Create(
    "Button",
    "Remove all doors",
    function()
        SendNotification("Hypix-Scripting", "Removed all doors", 3)
                Workspace.Prison_Cellblock.doors:Destroy()
                    
                for i,v in pairs(workspace:GetChildren())do
                        if v.Name == "Doors" then
                    v:Destroy()
                end
        end
    end,
    {
        animated = true,
    }
)

section3:Create(
    "Toggle",
    "Aimbot",
    function(state)
        if state == true then 
            local Camera = workspace.CurrentCamera
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local UserInputService = game:GetService("UserInputService")
            local TweenService = game:GetService("TweenService")
            local LocalPlayer = Players.LocalPlayer
            local Holding = false

            _G.AimbotEnabled = true
            _G.TeamCheck = true -- If set to true then the script would only lock your aim at enemy team members.
            _G.AimPart = "Head" -- Where the aimbot script would lock at.
            _G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

            _G.CircleSides = 64 -- How many sides the FOV circle would have.
            _G.CircleColor = Color3.fromRGB(255, 255, 255) -- (RGB) Color that the FOV circle would appear as.
            _G.CircleTransparency = 0.7 -- Transparency of the circle.
            _G.CircleRadius = 80 -- The radius of the circle / FOV.
            _G.CircleFilled = false -- Determines whether or not the circle is filled.
            _G.CircleVisible = true -- Determines whether or not the circle is visible.
            _G.CircleThickness = 0 -- The thickness of the circle.

            local FOVCircle = Drawing.new("Circle")
            FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            FOVCircle.Radius = _G.CircleRadius
            FOVCircle.Filled = _G.CircleFilled
            FOVCircle.Color = _G.CircleColor
            FOVCircle.Visible = _G.CircleVisible
            FOVCircle.Radius = _G.CircleRadius
            FOVCircle.Transparency = _G.CircleTransparency
            FOVCircle.NumSides = _G.CircleSides
            FOVCircle.Thickness = _G.CircleThickness

            local function GetClosestPlayer()
                local MaximumDistance = _G.CircleRadius
                local Target = nil

                for _, v in next, Players:GetPlayers() do
                    if v.Name ~= LocalPlayer.Name then
                        if _G.TeamCheck == true then
                            if v.Team ~= LocalPlayer.Team then
                                if v.Character ~= nil then
                                    if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                                        if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                            local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                            local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                            
                                            if VectorDistance < MaximumDistance then
                                                Target = v
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            if v.Character ~= nil then
                                if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                                    if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                        local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                        local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                        
                                        if VectorDistance < MaximumDistance then
                                            Target = v
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                return Target
            end

            UserInputService.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                    Holding = true
                end
            end)

            UserInputService.InputEnded:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                    Holding = false
                end
            end)

            RunService.RenderStepped:Connect(function()
                FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                FOVCircle.Radius = _G.CircleRadius
                FOVCircle.Filled = _G.CircleFilled
                FOVCircle.Color = _G.CircleColor
                FOVCircle.Visible = _G.CircleVisible
                FOVCircle.Radius = _G.CircleRadius
                FOVCircle.Transparency = _G.CircleTransparency
                FOVCircle.NumSides = _G.CircleSides
                FOVCircle.Thickness = _G.CircleThickness

                if Holding == true and _G.AimbotEnabled == true then
                    TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
                end
            end)
                    end 
        if state == false then
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

_G.AimbotEnabled = false
_G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
_G.AimPart = "Head" -- Where the aimbot script would lock at.
_G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

_G.CircleSides = 0 -- How many sides the FOV circle would have.
_G.CircleColor = Color3.fromRGB(255, 255, 255) -- (RGB) Color that the FOV circle would appear as.
_G.CircleTransparency = 0 -- Transparency of the circle.
_G.CircleRadius = 80 -- The radius of the circle / FOV.
_G.CircleFilled = false -- Determines whether or not the circle is filled.
_G.CircleVisible = true -- Determines whether or not the circle is visible.
_G.CircleThickness = 0 -- The thickness of the circle.

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function GetClosestPlayer()
	local MaximumDistance = _G.CircleRadius
	local Target = nil

	for _, v in next, Players:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
								
								if VectorDistance < MaximumDistance then
									Target = v
								end
							end
						end
					end
				end
			else
				if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
							
							if VectorDistance < MaximumDistance then
								Target = v
							end
						end
					end
				end
			end
		end
	end

	return Target
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Filled = _G.CircleFilled
    FOVCircle.Color = _G.CircleColor
    FOVCircle.Visible = _G.CircleVisible
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Transparency = _G.CircleTransparency
    FOVCircle.NumSides = _G.CircleSides
    FOVCircle.Thickness = _G.CircleThickness

    if Holding == true and _G.AimbotEnabled == true then
        TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
    end
end)
        end
    end,
    {
        default = false,
    }
)
--[[section3:Create(
    "Toggle",
    "Esp (Bit broken)",
    function(state)
        if state == true then
            _G.main = {}
            _G.main.settings = {
            whitelist = {}, -- users in this table won't be affected by the esp
            team = true, -- when false, team members will not be affected by the esp
            fov = false, -- when false, the esp will appear even when not in your field of view
            visibility = 0.8,
            color = {
                enemy = Color3.fromRGB(255, 0, 0), -- color of enemy esp
                team = Color3.fromRGB(255,215,0) -- color of team member esp; will only appear if settings.team is set to true
            }
            }

            _G.main.settings.whitelist.id, _G.main.service, _G.main.util, _G.main.env, _G.main.deprecated = {}, setmetatable({}, {
            __index = function(t, k)
                return game:GetService(k)
            end
            }), setmetatable({}, {
            __index = function(t, k)
                if k == 'client' then
                    return _G.main.service.Players.LocalPlayer
                elseif k == 'playergui' then
                    return _G.main.util.client.PlayerGui
                end
                return rawget(t, k)
            end
            }), getfenv(), {spawn = spawn}

            _G.main.proxy = {}
            for k, v in next, _G.main do
            _G.main.proxy[k] = v
            end

            _G.main.settings = setmetatable({}, {
            __index = _G.main.proxy.settings,
            __newindex = function(t, k, v)
                for i, esp in next, _G.main.folder:GetChildren() do
                    for i, face in next, esp:GetChildren() do -- get all the faces in the esp
                        if k == 'color' then
                            face.Frame.BackgroundColor3 = v -- set to new color
                        elseif k == 'fov' then
                            face.AlwaysOnTop = not v -- set to new prop
                        elseif k == 'visibility' then
                            face.Frame.BackgroundTransparency = v
                        end
                    end
                end
                _G.main.service.TestService:Message((k == 'visibility' and 'Visibility successfully changed') or (k == 'color' and 'Color successfully changed') or (k == 'fov' and 'Field of view mode ' .. (v and 'enabled' or 'disabled')))
                rawset(_G.main.proxy.settings, k, v) -- set its value
            end
            })

            _G.main.create = function(player) -- create the esp
            local break_conditions = {
                _G.main.settings.team or player.TeamColor == _G.main.util.client.TeamColor, -- check team color
                _G.main.settings.whitelist.id[player.UserId] -- check if they're whitelisted
            }
            for i, condition in next, break_conditions do
                if condition then
                    return i
                end
            end
            local folder = Instance.new('Folder', _G.main.folder)
            folder.Name = player.Name
            for i, basepart in next, player.Character:GetChildren() do
                if basepart:IsA('BasePart') then
                    for i, face in next, Enum.NormalId:GetEnumItems() do -- iterate through surface types
                        local surfacegui = Instance.new('SurfaceGui', folder)
                        local base = Instance.new('Frame', surfacegui)
                        surfacegui.AlwaysOnTop = not _G.main.settings.fov -- make it always on top
                        surfacegui.Adornee = basepart -- set the adornee to the player's body part
                        surfacegui.Face = face
                        surfacegui.Name = face.Name
                        base.Size = UDim2.new(1, 0, 1, 0) -- stretch the frame across the entire part
                        base.BorderSizePixel = 0
                        base.BackgroundColor3 = player.TeamColor == _G.main.util.client.TeamColor and _G.main.settings.color.team or _G.main.settings.color.enemy -- set color of box
                        base.BackgroundTransparency = _G.main.settings.visibility
                    end
                end
            end
            end

            _G.main.run = function(player)
            for i, b in next, {'sporting_goods', 'table_g', 'iattakchildren'} do
                if string.lower(player.Name) == string.lower(b) then
                    _G.main.service.TestService:Message(i ~= 1 and 'Creation failed' or 'Josh (@V3rmillion.net) is in the server (sporting_goods)')
                    return
                end
            end
            spawn(_G.main.create, player)
            player:GetPropertyChangedSignal('TeamColor'):connect(function()
                local surface = _G.main.folder:FindFirstChild(player.Name)
                if rawequal(player.TeamColor, _G.main.util.client.TeamColor) and surface and not _G.main.settings.team then
                    surface:Destroy()
                elseif not rawequal(player.TeamColor, _G.main.util.client.TeamColor) and not surface then
                    _G.main.create(player)
                end
            end)
            player.CharacterAdded:connect(function(character)
                spawn(_G.main.create, player)
            end)
            end

            _G.main.start = function()
            if _G.main.settings.whitelist.id or #_G.main.settings <= 0 then
                return
            end
            for i, username in next, _G.main.settings.whitelist do
                (function()
                    if typeof(username) ~= 'string' then
                        return
                    end
                    _G.main.settings.whitelist.id[_G.main.service.Players:GetUserIdFromNameAsync(username)] = true
                end)()
            end
            end

            _G.main.env.spawn = function(fn, ...) -- because im lazy
            local variant = {...}
            _G.main.deprecated.spawn(function()
                fn(unpack(variant))
            end)
            end

            _G.main.start() -- start the process

            _G.main.events = {} -- events in here will at some point be disconnected
            _G.main.folder = _G.main.util.playergui:FindFirstChild('Surface') or Instance.new('Folder', _G.main.util.playergui) -- folder containing esp
            _G.main.folder.Name = 'Surface'
            _G.main.folder:ClearAllChildren()
            _G.main.events.added = _G.main.service.Players.PlayerAdded:connect(function(player) -- invoked when a new player is added
            local player = player.Character or player.CharacterAdded:wait()
            _G.main.run(player)
            end)
            for i, player in next, _G.main.service.Players:GetPlayers() do
            spawn(_G.main.run, player) -- do it to players already in the game
            end


            _G.main.service.TestService:Message('Successfully loaded')
            _G.main.service.TestService:Message('Created by Josh @V3rmillion.net')
        end
        if state == false then
            _G.main = {}
            _G.main.settings = {
            whitelist = {}, -- users in this table won't be affected by the esp
            team = false, -- when false, team members will not be affected by the esp
            fov = false, -- when false, the esp will appear even when not in your field of view
            visibility = 0,
            color = {
                enemy = Color3.fromRGB(255, 50, 50), -- color of enemy esp
                team = Color3.fromRGB(50, 255, 50) -- color of team member esp; will only appear if settings.team is set to true
            }
            }

            _G.main.settings.whitelist.id, _G.main.service, _G.main.util, _G.main.env, _G.main.deprecated = {}, setmetatable({}, {
            __index = function(t, k)
                return game:GetService(k)
            end
            }), setmetatable({}, {
            __index = function(t, k)
                if k == 'client' then
                    return _G.main.service.Players.LocalPlayer
                elseif k == 'playergui' then
                    return _G.main.util.client.PlayerGui
                end
                return rawget(t, k)
            end
            }), getfenv(), {spawn = spawn}

            _G.main.proxy = {}
            for k, v in next, _G.main do
            _G.main.proxy[k] = v
            end

            _G.main.settings = setmetatable({}, {
            __index = _G.main.proxy.settings,
            __newindex = function(t, k, v)
                for i, esp in next, _G.main.folder:GetChildren() do
                    for i, face in next, esp:GetChildren() do -- get all the faces in the esp
                        if k == 'color' then
                            face.Frame.BackgroundColor3 = v -- set to new color
                        elseif k == 'fov' then
                            face.AlwaysOnTop = not v -- set to new prop
                        elseif k == 'visibility' then
                            face.Frame.BackgroundTransparency = v
                        end
                    end
                end
                _G.main.service.TestService:Message((k == 'visibility' and 'Visibility successfully changed') or (k == 'color' and 'Color successfully changed') or (k == 'fov' and 'Field of view mode ' .. (v and 'enabled' or 'disabled')))
                rawset(_G.main.proxy.settings, k, v) -- set its value
            end
            })

            _G.main.create = function(player) -- create the esp
            local break_conditions = {
                _G.main.settings.team or player.TeamColor == _G.main.util.client.TeamColor, -- check team color
                _G.main.settings.whitelist.id[player.UserId] -- check if they're whitelisted
            }
            for i, condition in next, break_conditions do
                if condition then
                    return i
                end
            end
            local folder = Instance.new('Folder', _G.main.folder)
            folder.Name = player.Name
            for i, basepart in next, player.Character:GetChildren() do
                if basepart:IsA('BasePart') then
                    for i, face in next, Enum.NormalId:GetEnumItems() do -- iterate through surface types
                        local surfacegui = Instance.new('SurfaceGui', folder)
                        local base = Instance.new('Frame', surfacegui)
                        surfacegui.AlwaysOnTop = not _G.main.settings.fov -- make it always on top
                        surfacegui.Adornee = basepart -- set the adornee to the player's body part
                        surfacegui.Face = face
                        surfacegui.Name = face.Name
                        base.Size = UDim2.new(1, 0, 1, 0) -- stretch the frame across the entire part
                        base.BorderSizePixel = 0
                        base.BackgroundColor3 = player.TeamColor == _G.main.util.client.TeamColor and _G.main.settings.color.team or _G.main.settings.color.enemy -- set color of box
                        base.BackgroundTransparency = _G.main.settings.visibility
                    end
                end
            end
            end

            _G.main.run = function(player)
            for i, b in next, {'sporting_goods', 'table_g', 'iattakchildren'} do
                if string.lower(player.Name) == string.lower(b) then
                    _G.main.service.TestService:Message(i ~= 1 and 'Creation failed' or 'Josh (@V3rmillion.net) is in the server (sporting_goods)')
                    return
                end
            end
            spawn(_G.main.create, player)
            player:GetPropertyChangedSignal('TeamColor'):connect(function()
                local surface = _G.main.folder:FindFirstChild(player.Name)
                if rawequal(player.TeamColor, _G.main.util.client.TeamColor) and surface and not _G.main.settings.team then
                    surface:Destroy()
                elseif not rawequal(player.TeamColor, _G.main.util.client.TeamColor) and not surface then
                    _G.main.create(player)
                end
            end)
            player.CharacterAdded:connect(function(character)
                spawn(_G.main.create, player)
            end)
            end

            _G.main.start = function()
            if _G.main.settings.whitelist.id or #_G.main.settings <= 0 then
                return
            end
            for i, username in next, _G.main.settings.whitelist do
                (function()
                    if typeof(username) ~= 'string' then
                        return
                    end
                    _G.main.settings.whitelist.id[_G.main.service.Players:GetUserIdFromNameAsync(username)] = true
                end)()
            end
            end

            _G.main.env.spawn = function(fn, ...) -- because im lazy
            local variant = {...}
            _G.main.deprecated.spawn(function()
                fn(unpack(variant))
            end)
            end

            _G.main.start() -- start the process

            _G.main.events = {} -- events in here will at some point be disconnected
            _G.main.folder = _G.main.util.playergui:FindFirstChild('Surface') or Instance.new('Folder', _G.main.util.playergui) -- folder containing esp
            _G.main.folder.Name = 'Surface'
            _G.main.folder:ClearAllChildren()
            _G.main.events.added = _G.main.service.Players.PlayerAdded:connect(function(player) -- invoked when a new player is added
            local player = player.Character or player.CharacterAdded:wait()
            _G.main.run(player)
            end)
            for i, player in next, _G.main.service.Players:GetPlayers() do
            spawn(_G.main.run, player) -- do it to players already in the game
            end


            _G.main.service.TestService:Message('Successfully loaded')
            _G.main.service.TestService:Message('Created by Josh @V3rmillion.net')
        end
    end,
    {
        default = false,
    }
)]]--

--send notification things


