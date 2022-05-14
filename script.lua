-- Gui to Lua
-- Version: 3.2

-- Instances:

local executor = Instance.new("ScreenGui")
local scriptexecutor = Instance.new("Frame")
local ExecuteClient = Instance.new("TextButton")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Clear = Instance.new("TextButton")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local close = Instance.new("TextButton")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local Frame = Instance.new("Frame")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local ScrollingFrame = Instance.new("ScrollingFrame")
local scriptbox = Instance.new("TextBox")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")

--Properties:

executor.Name = "executor"
executor.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
executor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

scriptexecutor.Name = "scriptexecutor"
scriptexecutor.Parent = executor
scriptexecutor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptexecutor.Position = UDim2.new(0.164733157, 0, 0.182879373, 0)
scriptexecutor.Size = UDim2.new(0.618097484, 0, 0.630350173, 0)
scriptexecutor.Draggable = true

ExecuteClient.Name = "ExecuteClient"
ExecuteClient.Parent = scriptexecutor
ExecuteClient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ExecuteClient.Position = UDim2.new(0.0674157217, 0, 0.814814806, 0)
ExecuteClient.Size = UDim2.new(0.277777761, 0, 0.154320985, 0)
ExecuteClient.Font = Enum.Font.SourceSansLight
ExecuteClient.Text = "Execute"
ExecuteClient.TextColor3 = Color3.fromRGB(0, 0, 0)
ExecuteClient.TextScaled = true
ExecuteClient.TextSize = 28.000
ExecuteClient.TextWrapped = true
ExecuteClient.MouseButton1Click:Connect(function()
	local networkbypass = [[Bypass = "death"
FELOADLIBRARY = {}
loadstring(game:GetObjects("rbxassetid://5209815302")[1].Source)()
loadstring(game:GetObjects("rbxassetid://5325226148")[1].Source)()

local IsDead = false
local StateMover = true
 
local playerss = workspace.non
local bbv,bullet
if Bypass == "death" then
	bullet = game.Players.LocalPlayer.Character["HumanoidRootPart"]
	bullet.Transparency = 0
	bullet.Massless = true
	if bullet:FindFirstChildOfClass("Attachment") then
		for _,v in pairs(bullet:GetChildren()) do
			if v:IsA("Attachment") then
				v:Destroy()
			end
		end
	end
 
	bbv = Instance.new("BodyPosition",bullet)
    bbv.Position = playerss.Torso.CFrame.p
end
 
 
playerss.Torso.WaistBackAttachment.Position = Vector3.new(-0, -0, 0.6)
playerss.Torso.WaistBackAttachment.Orientation = Vector3.new(-4.16, -179.28, 99.8)
 
if Bypass == "death" then
coroutine.wrap(function()
	while true do
		if not playerss or not playerss:FindFirstChildOfClass("Humanoid") or playerss:FindFirstChildOfClass("Humanoid").Health <= 0 then IsDead = true; return end
		if StateMover then
			bbv.Position = playerss.Torso.CFrame.p
    		bullet.Position = playerss.Torso.CFrame.p
		end
		game:GetService("RunService").RenderStepped:wait()
	end
end)()
end
 
local CDDF = {}
local DamageFling = function(DmgPer)
	if IsDead or Bypass ~= "death" or (DmgPer.Name == playerss.Name and DmgPer.Name == "non") or CDDF[DmgPer] or not DmgPer or not DmgPer:FindFirstChildOfClass("Humanoid") or DmgPer:FindFirstChildOfClass("Humanoid").Health <= 0 then return end
	CDDF[DmgPer] = true; StateMover = false
	local PosFling = (DmgPer:FindFirstChild("HumanoidRootPart") and DmgPer:FindFirstChild("HumanoidRootPart") .CFrame.p) or (DmgPer:FindFirstChildOfClass("Part") and DmgPer:FindFirstChildOfClass("Part").CFrame.p)
    bbav = Instance.new("BodyAngularVelocity",bullet)
    bbav.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
    bbav.P = 1000000000000000000000000000
    bbav.AngularVelocity = Vector3.new(10000000000000000000000000000000,100000000000000000000000000,100000000000000000)
    game:GetService("Debris"):AddItem(bbav,0.1)
    bullet.Rotation = playerss.Torso.Rotation
	for _=1,15 do
		bbv.Position = PosFling
		bullet.Position = PosFling
		wait(0.03)
	end
	bbv.Position = playerss.Torso.CFrame.p
    bullet.Position = playerss.Torso.CFrame.p
	CDDF[DmgPer] = false; StateMover = true
end]]

	loadstring(networkbypass .. "\n" .. (script.Text))
end)

UITextSizeConstraint.Parent = ExecuteClient
UITextSizeConstraint.MaxTextSize = 28

UIAspectRatioConstraint.Parent = ExecuteClient
UIAspectRatioConstraint.AspectRatio = 2.960

Clear.Name = "Clear"
Clear.Parent = scriptexecutor
Clear.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Clear.Position = UDim2.new(0.365168542, 0, 0.814814806, 0)
Clear.Size = UDim2.new(0.277777761, 0, 0.154320985, 0)
Clear.Font = Enum.Font.SourceSansLight
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(0, 0, 0)
Clear.TextScaled = true
Clear.TextSize = 28.000
Clear.TextWrapped = true
Clear.MouseButton1Click:Connect(function()
	scriptbox.Text = ""
end)

UITextSizeConstraint_2.Parent = Clear
UITextSizeConstraint_2.MaxTextSize = 28

UIAspectRatioConstraint_2.Parent = Clear
UIAspectRatioConstraint_2.AspectRatio = 2.960

close.Name = "close"
close.Parent = scriptexecutor
close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundTransparency = 1.000
close.Position = UDim2.new(0.94194752, 0, 0, 0)
close.Size = UDim2.new(0.0544294231, 0, 0.0833333358, 0)
close.Font = Enum.Font.SourceSansLight
close.Text = "X"
close.TextColor3 = Color3.fromRGB(0, 0, 0)
close.TextScaled = true
close.TextSize = 14.000
close.TextWrapped = true
close.MouseButton1Click:Connect(function()
	scriptexecutor.Visible = false
end)

UIAspectRatioConstraint_3.Parent = close
UIAspectRatioConstraint_3.AspectRatio = 1.074

UITextSizeConstraint_3.Parent = close
UITextSizeConstraint_3.MaxTextSize = 27

Frame.Parent = scriptexecutor
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Size = UDim2.new(1.0022521, 0, 0.0864197537, 0)
Frame.ZIndex = -1

UIAspectRatioConstraint_4.Parent = Frame
UIAspectRatioConstraint_4.AspectRatio = 19.071

ScrollingFrame.Parent = scriptexecutor
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.Position = UDim2.new(0.0674157217, 0, 0.0862255469, 0)
ScrollingFrame.Size = UDim2.new(0.876501441, 0, 0.703703701, 0)

scriptbox.Name = "scriptbox"
scriptbox.Parent = ScrollingFrame
scriptbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptbox.BorderColor3 = Color3.fromRGB(255, 255, 255)
scriptbox.Position = UDim2.new(0.0128479656, 0, 0, 0)
scriptbox.Size = UDim2.new(0, 448, 0, 221)
scriptbox.ClearTextOnFocus = false
scriptbox.Font = Enum.Font.SourceSansLight
scriptbox.Text = "-- script here"
scriptbox.TextColor3 = Color3.fromRGB(0, 0, 0)
scriptbox.TextScaled = true
scriptbox.TextSize = 30.000
scriptbox.TextWrapped = true
scriptbox.TextXAlignment = Enum.TextXAlignment.Left
scriptbox.TextYAlignment = Enum.TextYAlignment.Top

UITextSizeConstraint_4.Parent = scriptbox
UITextSizeConstraint_4.MaxTextSize = 30

UIAspectRatioConstraint_5.Parent = scriptbox
UIAspectRatioConstraint_5.AspectRatio = 2.027

UIAspectRatioConstraint_6.Parent = ScrollingFrame
UIAspectRatioConstraint_6.AspectRatio = 2.048

UIAspectRatioConstraint_7.Parent = scriptexecutor
UIAspectRatioConstraint_7.AspectRatio = 1.644
