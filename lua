local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MozilScriptGUI"
gui.ResetOnSpawn = false

-- Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 0.1
frame.Active = true
frame.Draggable = true

-- UI Corner
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

-- Title
local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0, 60)
label.BackgroundTransparency = 1
label.Text = "Join Mozil Scripts for more scripts"
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.GothamBold
label.TextSize = 18

-- Discord Button
local discordBtn = Instance.new("TextButton", frame)
discordBtn.Size = UDim2.new(0.7, 0, 0, 40)
discordBtn.Position = UDim2.new(0.15, 0, 0.5, 0)
discordBtn.Text = "Join Discord"
discordBtn.TextColor3 = Color3.new(1, 1, 1)
discordBtn.Font = Enum.Font.Gotham
discordBtn.TextSize = 16
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)

local discordCorner = Instance.new("UICorner", discordBtn)
discordCorner.CornerRadius = UDim.new(0, 8)

-- X Button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)

local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(1, 0)

-- Button Functionality
closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

discordBtn.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/YZvgUjddk8") -- Replace with your link
	game.StarterGui:SetCore("SendNotification", {
		Title = "Copied!",
		Text = "Discord invite copied to clipboard.",
		Duration = 4
	})
end)
