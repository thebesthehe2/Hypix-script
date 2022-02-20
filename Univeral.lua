if game.CoreGui:FindFirstChild("UILib") then
    game.CoreGui["UILib"]:Destroy()
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

local category1 = main:CreateCategory("Teleport", "Teleport")

local teleport = category1:CreateSection("Teleport")

local category2 = main:CreateCategory("View", "View")

local viewPlayer = category2:CreateSection("View Player")

local category3 = main:CreateCategory("Test", "Test")

local test = category3:CreateSection("Test")








--variables--
local HIPHEIGHTSTART = game.Players.LocalPlayer.Character.Humanoid.HipHeight
local WALKSPEEDSTART = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local JUMPOWERSTART = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local ORIGCFRAME = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

local funcs = {}
--end
--notification-- 
function SendNotification(Title, Text, Duration)
    game.StarterGui:SetCore("SendNotification",{
        Title = Title,
        Text = Text,
        Duration = Duration
 
     })
end
--end--
--main things
mainThings:Create(
    "Slider",
    "Walkspeed",
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
    {
        min = WALKSPEEDSTART,
        max = 250,
        -- Optional
        default = WALKSPEEDSTART,
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
        min = JUMPOWERSTART,
        max = 200,
        -- Optional
        default = JUMPOWERSTART,
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
        min = HIPHEIGHTSTART,
        max = 150,
        -- Optional
        default = HIPHEIGHTSTART,
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
--end of main things


mainThings:Create(
    "Toggle",
    "Turn on/off player joined and player left",
    function(state)
        if state == true then
            SendNotification("Hypix", "Player Join/Left = On", 3)
            funcs.plrJoin = game.Players.PlayerAdded:Connect(function(joinPlr)
                    SendNotification("Hypix", tostring(joinPlr).. "has just joined the game", 5)
            end)
            
            funcs.plrLeave = game.Players.PlayerRemoving:Connect(function(leavePlr)
                    SendNotification("Hypix", tostring(leavePlr).. "has just left the game", 5)
            end)
        end
        if state == false then
            SendNotification("Hypix", "Player Join/Left = Off", 3)
            funcs.plrJoin:Disconnect()
            funcs.plrLeave:Disconnect()
        end
    end,
    {
        default = false,
    }
)



--noclip test

local var = {}
var.clipping = nil

mainThings:Create(
    "Toggle",
    "No clip",
    function(state)
        if state == true then
            SendNotification("Hypix", "No-Clip = On", 3)
            var.clipping = game:GetService("RunService").Stepped:Connect(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head") then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso").CanCollide = not state
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head").CanCollide = not state
                end 
            end)
        else
            SendNotification("Hypix", "No-Clip = Off", 3)
            var.clipping:Disconnect()
        end
    end,
    {
        default = false,
    }
)
--end

teleport:Create(
    "DropDown",
    "Teleport to player", 
    function(current)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[current].Character.HumanoidRootPart.CFrame
    end,
    {
        playerlist = true
    }
)

teleport:Create(
    "Button",
    "Teleport Back",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ORIGCFRAME
    end,
    {
        animated = true,
    }
)

viewPlayer:Create(
    "DropDown",
    "View Player", 
    function(current)
        game.Workspace.CurrentCamera.CameraSubject = game.Players[current].Character.Humanoid
    end,
    {
        playerlist = true
    }
)

viewPlayer:Create(
    "Button",
    "Reset",
    function()
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
    end,
    {
        animated = true,
    }
)

mainThings:Create(
    "Toggle",
    "Chat Spy",
    function(state)
        if state == true then
            SendNotification("Hypix", "Chat Spy = On", 3)
            enabled = true
            spyOnMyself = false
            public = false
            publicItalics = true
            privateProperties = {
                Color = Color3.fromRGB(0,255,255); 
                Font = Enum.Font.SourceSansBold;
                TextSize = 18;
            }
            --////////////////////////////////////////////////////////////////
            local StarterGui = game:GetService("StarterGui")
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
            local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
            local instance = (_G.chatSpyInstance or 0) + 1
            _G.chatSpyInstance = instance
            
            local function onChatted(p,msg)
                if _G.chatSpyInstance == instance then
                    if p==player and msg:lower():sub(1,4)=="/spy" then
                        enabled = not enabled
                        wait(0.3)
                        privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
                        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                    elseif enabled and (spyOnMyself==true or p~=player) then
                        msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
                        local hidden = true
                        local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
                            if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
                                hidden = false
                            end
                        end)
                        wait(1)
                        conn:Disconnect()
                        if hidden and enabled then
                            if public then
                                saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
                            else
                                privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
                                StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                            end
                        end
                    end
                end
            end
            
            for _,p in ipairs(Players:GetPlayers()) do
                p.Chatted:Connect(function(msg) onChatted(p,msg) end)
            end
            Players.PlayerAdded:Connect(function(p)
                p.Chatted:Connect(function(msg) onChatted(p,msg) end)
            end)
            privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
            StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
            local chatFrame = player.PlayerGui.Chat.Frame
            chatFrame.ChatChannelParentFrame.Visible = true
            chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
        end
        if state == false then
            SendNotification("Hypix", "Chat Spy = Off", 3)
            --This script reveals ALL hidden messages in the default chat
            --chat "/spy" to toggle!
            enabled = false
            --if true will check your messages too
            spyOnMyself = false
            --if true will chat the logs publicly (fun, risky)
            public = false
            --if true will use /me to stand out
            publicItalics = false
            --customize private logs
            privateProperties = {
                Color = Color3.fromRGB(0,255,255); 
                Font = Enum.Font.SourceSansBold;
                TextSize = 18;
            }
            --////////////////////////////////////////////////////////////////
            local StarterGui = game:GetService("StarterGui")
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
            local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
            local instance = (_G.chatSpyInstance or 0) + 1
            _G.chatSpyInstance = instance
            
            local function onChatted(p,msg)
                if _G.chatSpyInstance == instance then
                    if p==player and msg:lower():sub(1,4)=="/spy" then
                        enabled = not enabled
                        wait(0.3)
                        privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
                        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                    elseif enabled and (spyOnMyself==true or p~=player) then
                        msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
                        local hidden = true
                        local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
                            if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
                                hidden = false
                            end
                        end)
                        wait(1)
                        conn:Disconnect()
                        if hidden and enabled then
                            if public then
                                saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
                            else
                                privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
                                StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                            end
                        end
                    end
                end
            end
            
            for _,p in ipairs(Players:GetPlayers()) do
                p.Chatted:Connect(function(msg) onChatted(p,msg) end)
            end
            Players.PlayerAdded:Connect(function(p)
                p.Chatted:Connect(function(msg) onChatted(p,msg) end)
            end)
            privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
            StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
            local chatFrame = player.PlayerGui.Chat.Frame
            chatFrame.ChatChannelParentFrame.Visible = true
            chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
        end
    end,
    {
        default = false,
    }
)

--notification



