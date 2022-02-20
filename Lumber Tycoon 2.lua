if game.CoreGui:FindFirstChild("Lumber") then
    game.CoreGui["Lumber"]:Destroy()
end
    
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/teppyboy/RbxScripts/master/Misc/UI_Libraries/Zypher/Library.lua"))()

local main = library:CreateMain({
    projName = "Lumber",
    Resizable = true,
    MinSize = UDim2.new(0,400,0,400),
    MaxSize = UDim2.new(0,750,0,500),
})

local catorgoryCredits = main:CreateCategory("Credits", "Credits")

local sectionCredits = catorgoryCredits:CreateSection("Credits")

local categoryMain = main:CreateCategory("Main", "Main")

local sectionMain = categoryMain:CreateSection("Main")

local catorgoryTeleport = main:CreateCategory("Teleports", "Teleports")

local sectionTeleportToPlayer = catorgoryTeleport:CreateSection("Teleport to player")

local sectionTeleportToPlayerBase = catorgoryTeleport:CreateSection("Teleport to players base")

local sectionTeleportStores = catorgoryTeleport:CreateSection("Store teleports")

local sectionTeleportTrees = catorgoryTeleport:CreateSection("Tree teleports")

local sectionTeleportPOI = catorgoryTeleport:CreateSection("Point of interest teleports")

local catorgoryBase = main:CreateCategory("Base", "Base")

local sectionBase = catorgoryBase:CreateSection("Base")

local catorgoryDuping = main:CreateCategory("Dupe", "Dupe")

local sectionDuping = catorgoryDuping:CreateSection("Duping")

local catorgoryTree = main:CreateCategory("Tree", "Tree")

local sectionTree = catorgoryTree:CreateSection("Tree")



--send notfication if play leaves/joins and says welcome message
local funcs = {}
function SendNotification(Title, Text, Duration)
    game.StarterGui:SetCore("SendNotification",{
        Title = Title,
        Text = Text,
        Duration = Duration
 
     })
end

--end

--tables
local tabs = {}
local sec = {}
local var = {}
local funcs = {}
--end

--variables
var.plr = game.Players.LocalPlayer
var.chr = var.plr.Character
var.dayTime = false
var.nightTime = false
var.fogStatus = false
var.bridgeLowered = false
var.walkSpeed = 16
var.walkEnabled = nil
var.clipping = nil
var.SellSpot = CFrame.new()
--end


--section credits   
sectionCredits:Create(
    "Textlabel",
    "Hypixx.#2888 - Main dev"
)

sectionCredits:Create(
    "Textlabel",
    "lil scorpion#7563 - Co dev"
)

sectionCredits:Create(
    "Textlabel",
    "CynMod#7113 - video tutorial"
)

sectionCredits:Create(
    "Textlabel",
    "xTheAlex14 - Zypher UI-Lib"
)

sectionCredits:Create(
    "Textlabel",
    "Redreflex - Zypher UI-Lib"
)


--end

--section main

sectionMain:Create(
    "Slider",
    "Walkspeed",
    function(value)
        var.walkSpeed = value
        var.plr = game.Players.LocalPlayer
        if var.walkSpeed > 16 then 
            var.walkEnabled = game:GetService("RunService").RenderStepped:Connect(function()
                if var.plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed ~= 0 then
                    var.plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = var.walkSpeed
                end
            end)
        else
            if var.walkEnabled then
                var.walkEnabled:Disconnect()
            end
        end
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

sectionMain:Create(
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

sectionMain:Create(
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

sectionMain:Create(
    "Slider",
    "Camera distance",
    function(value)
        var.plr.CameraMaxZoomDistance = value
    end,
    {
        min = 120,
        max = 1750,
        default = 120,
        precise = false, -- ex: 0.1, 0.2, 0.3
        changablevalue = true
    }
)

sectionMain:Create(
    "Toggle",
    "No clip",
    function(state)
        if state == true then
            SendNotification("Hypix-Scripting", "No Clip = On", 3)
            var.clipping = game:GetService("RunService").Stepped:Connect(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head") then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso").CanCollide = not state
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head").CanCollide = not state
                end 
            end)
        else
            SendNotification("Hypix-Scripting", "No Clip = Off", 3)
            var.clipping:Disconnect()
        end
    end,
    {
        default = false,
    }
)



sectionMain:Create(
    "Toggle",
    "Always day",
    function(state)
        var.dayTime = not var.dayTime
        if var.dayTime then 
            SendNotification("Hypix-Scripting", "Always day = On", 3)
            var.dayConnect = game.Lighting.Changed:Connect(function()
                game.Lighting.TimeOfDay = "12:00:00"
                game.Lighting.Brightness = 2
            end)
        else
            SendNotification("Hypix-Scripting", "Always day = Off", 3)
            var.dayConnect:Disconnect()
        end
    end,
    {
        default = false,
    }
)

sectionMain:Create(
    "Toggle",
    "Always night",
    function(state)
        var.nightTime = not var.nightTime
        if var.nightTime then 
            SendNotification("Hypix-Scripting", "Always night = On", 3)
            var.nightConnect = game.Lighting.Changed:Connect(function()
                game.Lighting.TimeOfDay = "0:00:00"
                game.Lighting.Brightness = -2
            end)
        else
            SendNotification("Hypix-Scripting", "Always night = Off", 3)
            var.nightConnect:Disconnect()
        end
    end,
    {
        default = false,
    }
)

sectionMain:Create(
    "Toggle",
    "No fog",
    function(state)
        var.fogStatus = not var.fogStatus
        if var.fogStatus then
            SendNotification("Hypix-Scripting", "Fog = On", 3)
            var.fogDisable = game.Lighting.Changed:Connect(function()
            game.Lighting.FogEnd = 10000
            end)
        else
            SendNotification("Hypix-Scripting", "Fog = Off", 3)
            var.fogDisable:Disconnect()
        end
    end,
    {
        default = false,
    }
)

sectionMain:Create(
    "Button",
    "Safe suicide (dont lose axes)",
    function()
        if var.plr.Character:FindFirstChild("Head") then
            var.plr.Character.Head:remove()
           end
    end,
    {
        animated = true,
    }
)

sectionMain:Create(
    "Toggle",
    "Shadows (reduces lag)",
    function(state)
        game:GetService("Lighting").GlobalShadows = state
    end,
    {
        default = true,
    }
)

sectionMain:Create(
    "Toggle",
    "Lift bridge",
    function(state)
        if state == true then
            for i, v in pairs(game.Workspace.Bridge.VerticalLiftBridge.Lift:GetChildren()) do
                v.CFrame = v.CFrame + Vector3.new(0, -26, 0 )
                var.bridgeLowered = true
            end
        else
            for i, v in pairs(game.Workspace.Bridge.VerticalLiftBridge.Lift:GetChildren()) do
                v.CFrame = v.CFrame + Vector3.new(0, 26, 0 )
                var.bridgeLowered = false
            end   
        end
    end,
    {
        default = false,
    }
)

sectionMain:Create(
    "Button",
    "Leaked items",
    function()
        for i, v in pairs(game.Workspace.PlayerModels:GetChildren()) do
            if not v:FindFirstChild("Owner") then
                v:Destroy()
            end
        end
            game.ReplicatedStorage.Purchasables:Clone().Parent = game.Workspace.PlayerModels
            SendNotification("Hypix", "All items are now viewable", 5 )
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(155, 5, 75)
    end,
    {
        animated = true,
    }
)



sectionMain:Create(
    "Button",
    "Delete snow boulders (temporarily)",
    function()
        for i, v in pairs(game.Workspace.Region_Snow:FindFirstChild("PartSpawner"):GetChildren()) do
            if v ~= nil then
                v:Destroy()
            end
        end 
    end,
    {
        animated = true,
    }
)






--end 

--section teleport
sectionTeleportToPlayer:Create(
    "DropDown",
    "Teleport to player", 
    function(selected)
        selCharacter = selected
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[selCharacter].Character.HumanoidRootPart.CFrame
        SendNotification("Hypix-Scripting", "Teleported", 3)
    end,
    {
        playerlist = true
    })

sectionTeleportToPlayerBase:Create(
    "DropDown",
    "Teleport to players base ", 
    function(selected)
        SendNotification("Hypix-Scripting", "Teleported", 3)
        local playerlastposition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        selectedPlayer = selected
        local foundPlot = false
    for i, v in pairs(game.Workspace.Properties:GetChildren()) do
        if v:FindFirstChild("Owner") then
             if tostring(v.Owner.Value) == tostring(selectedPlayer) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame + Vector3.new(0, 2, 0)
                foundPlot = true
                break
            end  
        end
    end
 
    if foundPlot == false then
        SendNotification("Hypix-Scripting", "This person does not have a plot loaded" , 5)
    end
    end,
    {
        playerlist = true
    })



sectionTeleportStores:Create(
    "DropDown",
    "Teleport to stores", 
    function(selStore)
        if selStore == "Wood R' Us" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(249, 4, 58) end
        if selStore == "Land Store" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(241, 4, -99) end
        if selStore == "Fancy Furnishings" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(491, 13, -1720) end
        if selStore == "Boxed Cars" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(510, 4, -1471) end
        if selStore == "Links Logic" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4609, 9, -773) end
        if selStore == "Fine Arts" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5207, -156, 719) end
        if selStore == "Bob's Shack" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(260, 10, -2542) end
    end,
    {
        options = {
            "Wood R' Us",
            "Land Store",
            "Fancy Furnishings",
            "Boxed Cars",
            "Links Logic",
            "Fine Arts",
            "Bob's Shack"
        },
         -- Optional
        default = "Wood R' Us",
        search = true
    }
)

sectionTeleportTrees:Create(
    "DropDown",
    "Teleport to tree", 
    function(selTree)
        if selTree == "Birch" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-395, 244, 1275) end
        if selTree == "Cave Crawler" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3488, -199, 519) end
        if selTree == "Cherry" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(220, 59, 1305) end
        if selTree == "Frost" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1448, 413, 3185) end
        if selTree == "Koa" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5022, 6, -503) end
        if selTree == "Lava" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1585, 622, 1140) end
        if selTree == "Palm" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2549, -5, -42) end
        if selTree == "Pine" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1284, 59, 2135) end
        if selTree == "Snow Glow" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1105, -6, -894) end
        if selTree == "Swamp" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1209, 132, -881) end
        if selTree == "Walnut" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-282, 8, -1555) end
    end,
    {
        options = {
            "Birch",
            "Cave Crawler",
            "Cherry",
            "Frost",
            "Koa",
            "Lava",
            "Palm",
            "Pine",
            "Snow Glow",
            "Swamp",
            "Walnut"
        },
         -- Optional
        default = "Birch",
        search = true
    }
)

sectionTeleportPOI:Create(
    "DropDown",
    "Teleport to POI", 
    function(selPois)
        if selPois == "Spawnpoint" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(155, 5, 75) end
        if selPois == "Dock" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1114, 3, -197) end
        if selPois == "Bridge" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113, 15, -977) end
    end,
    {
        options = {
            "Spawnpoint",
            "Dock",
            "Bridge"
        },
         -- Optional
        default = "Spawnpoint",
        search = true
    }
)

sectionBase:Create(
    "Button",
    "Free land",
    function()
        for i, v in pairs(game.Workspace.Properties:GetChildren()) do
            if v:FindFirstChild("Owner") and v:FindFirstChild("OriginSquare") and v.Owner.Value == nil then
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientPurchasedProperty:FireServer(v, v.OriginSquare.OriginCFrame.Value.p + Vector3.new(0, 3, 0))
                wait(0.5)
                Instance.new("RemoteEvent", game:service'ReplicatedStorage'.Interaction).Name = "Ban"
                for a, b in pairs(game.Workspace.Properties:GetChildren()) do
                    if b:FindFirstChild("Owner") and b.Owner.Value == game.Players.LocalPlayer then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = b.OriginSquare.CFrame + Vector3.new(0, 3, 0)
                    end
                end
                break
            end
        end
        SendNotification("Hypix-Scripting", "Your free land has arrived", 5)
    end,
    {
        animated = true,
    }
)

sectionBase:Create(
    "Button",
    "Max Land",
    function()
        local base
        for i, v in pairs(game.Workspace.Properties:GetChildren()) do
            if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
            base = v
            break
            end
        end
        function createBaseSpot(position)
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(base, position)         
        end
        local bPos = base.OriginSquare.Position
        createBaseSpot(CFrame.new(bPos.X + 40, bPos.Y, bPos.Z))
        createBaseSpot(CFrame.new(bPos.X - 40, bPos.Y, bPos.Z))
        createBaseSpot(CFrame.new(bPos.X, bPos.Y, bPos.Z + 40))
        createBaseSpot(CFrame.new(bPos.X, bPos.Y, bPos.Z - 40))
        createBaseSpot(CFrame.new(bPos.X + 40, bPos.Y, bPos.Z + 40))
        createBaseSpot(CFrame.new(bPos.X + 40, bPos.Y, bPos.Z - 40))
        createBaseSpot(CFrame.new(bPos.X - 40, bPos.Y, bPos.Z + 40))
        createBaseSpot(CFrame.new(bPos.X - 40, bPos.Y, bPos.Z - 40))
        createBaseSpot(CFrame.new(bPos.X + 80, bPos.Y, bPos.Z))
        createBaseSpot(CFrame.new(bPos.X - 80, bPos.Y, bPos.Z))
        createBaseSpot(CFrame.new(bPos.X, bPos.Y, bPos.Z + 80))
        createBaseSpot(CFrame.new(bPos.X, bPos.Y, bPos.Z - 80))
     
        createBaseSpot(CFrame.new(bPos.X + 80, bPos.Y, bPos.Z + 80))
        createBaseSpot(CFrame.new(bPos.X + 80, bPos.Y, bPos.Z - 80))
        createBaseSpot(CFrame.new(bPos.X - 80, bPos.Y, bPos.Z + 80))
        createBaseSpot(CFrame.new(bPos.X - 80, bPos.Y, bPos.Z - 80))
     
        createBaseSpot(CFrame.new(bPos.X + 40, bPos.Y, bPos.Z + 80))
        createBaseSpot(CFrame.new(bPos.X - 40, bPos.Y, bPos.Z + 80))
        createBaseSpot(CFrame.new(bPos.X + 80, bPos.Y, bPos.Z + 40))
        createBaseSpot(CFrame.new(bPos.X + 80, bPos.Y, bPos.Z - 40))
        createBaseSpot(CFrame.new(bPos.X - 80, bPos.Y, bPos.Z + 40))
        createBaseSpot(CFrame.new(bPos.X - 80, bPos.Y, bPos.Z - 40))
        createBaseSpot(CFrame.new(bPos.X + 40, bPos.Y, bPos.Z - 80))
        createBaseSpot(CFrame.new(bPos.X - 40, bPos.Y, bPos.Z - 80))
        wait(2)
        SendNotification("Hypix-Scripting", "Your max land has arrived")
    end,
    {
        animated = true,
    }
)

sectionBase:Create(
    "Button",
    "Load Base",
    function()
        if isLoadAvail() == false then
            SendNotification("Hypix-Scripting", "You may not load it this time", 5)
        else
            if game.Players.LocalPlayer.CurrentSaveSlot.Value == -1 then
                SendNotification("Hypix-Scripting", "You do not have a slot loaded", 5)
            else
                game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(game.Players.LocalPlayer.CurrentSaveSlot.Value)
            end
        end
    end,
    {
        animated = true,
    }
)

sectionDuping:Create(
    "Button",
    "Money Dupe",
    function()
        if game.Players.LocalPlayer.CurrentSaveSlot.Value ~= -1 then
            SendNotification("Hypix-Scripting", "Use the load base in the script to reload", 5)
        game:GetService("ReplicatedStorage").Transactions.ClientToServer.Donate:InvokeServer(game.Players.LocalPlayer, game.Players.LocalPlayer.leaderstats.Money.Value, game.Players.LocalPlayer.CurrentSaveSlot.Value)
        wait(1)
        SendNotification("Hypix-Scripting", "Your Money is available, please save your slot", 5)
        else 
            SendNotification("Hypix-Scripting", "You do not have a slot loaded", 5)
        end
    end,
    {
        animated = true,
    }
)

sectionDuping:Create(
    "Button",
    "Axe dupe",
    function()
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        local charLoc = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local emptyBackpack = true
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name ~= "BlueprintTool" then
                emptyBackpack = false
                break
            end 
        end 
        if emptyBackpack == true then
            SendNotification("Hypix-Scripting", "You dont have any axes in ur backpack", 5)
        else
            if game.Players.LocalPlayer.Character:FindFirstChild("Head") then
                game.Players.LocalPlayer.Character.Head:Destroy()
                wait(0.2)
                game.Players.LocalPlayer.Character:Destroy()
                wait(0.5)
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name ~= "BlueprintTool" then
                       game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(v, "Drop tool", charLoc)
                    end
                end
            end
        end
    
    end,
    {
        animated = true,
    }
)


--end
--[[local selTree = nil
local origPos = nil
local foundTree = nil
local axe = nil

sectionTree:Create(
    "DropDown",
    "Get Tree", 
    function(current)
        
    end,
    {
        options = {
            "Birch",
            "Volcano",
            "Koa"

        },
         -- Optional
        default = "Birch",
        search = true
    }
)

sectionTree:Create(
    "Button",
    "Get Tree",
    function()
        origPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v.Name == "TreeRegion" then
                for a, b in pairs(v:GetChildren()) do
                    if b.Name == "Model" then
                        if b:FindFirstChild("TreeClass") then
                            if b.TreeClass.Value == selTree then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(b:FindFirstChild("WoodSection").CFrame.p) + Vector3.new(2, 2, 2)
                                foundTree = b
                                break
                            end
                        end
                    end
                end
            end
        end
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for i, v in pairs(game.Players.LocalPlayer.BackPack:GetChildren()) do
            if v:IsA("Tool") and v.Name ~= "BlueprintTool" then
                axe = v
            end
        end
        wait(0.1)
        function chopTree()
            local args = {
                [1] = foundTree.CutEvent,
                [2] = {
                    ["tool"] = axe,
                    ["faceVector"] = Vector3.new(0, 0, 1),
                    ["height"] = 0.32,
                    ["sectionId"] = 1,
                    ["hitPoints"] = 6.35,
                    ["cooldown"] = 0.307
                    ["cuttingClass"] = "Axe"

                }
            }
            game:GetService("ReplicatedStorage").Interaction.RemoteProxy:FireServer(unpack(args))
        end
    end,
    {
        animated = true,
    }
)]]


--disconnect
var.closeScript = game:GetService("CoreGui").ChildRemoved:Connect(function()
    --WORLD closing--
        if funcs.plrJoin then
            funcs.plrJoin:Disconnect()
        end
        if funcs.plrLeave then
            funcs.plrLeave:Disconnect()
        end
        var.dayTime = false
        if var.dayConnect then
            var.dayConnect:Disconnect()
        end
        var.fogStatus = false
        if var.fogDisable then
            var.fogDisable:Disconnect()
        end
        var.nightTime = false
        if var.nightConnect then
            var.nightConnect:Disconnect()
        end
        game:GetService("Lighting").GlobalShadows = true
        if var.bridgeLowered == true then
            for i, v in pairs(game.Workspace.Bridge.VerticalLiftBridge.Lift:GetChildren()) do
                v.CFrame = v.CFrame + Vector3.new(0, 26, 0 )
                var.bridgeLowered = false
            end
        end
        waterWalk(false)
    --end WORLD closing--
     
    --CHARACTER closing--
        var.walkSpeed = 16
        if var.walkEnabled then
            var.walkEnabled:Disconnect()
        end
     
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head") then
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso").CanCollide = true
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head").CanCollide = true
        end 
    --end CHARACTER closing--
    end)
     
    --end disconnect--
