local Chunks = {
	Chunk1 = {"Chunk2","Chunk3"},
	Chunk2 = {"Chunk1","Chunk4","Chunk6"},
	Chunk3 = {"Chunk1","Chunk4","Chunk5"},
	Chunk4 = {"Chunk2","Chunk3","Chunk5","Chunk6"},
	Chunk5 = {"Chunk3","Chunk4","Chunk7"},
	Chunk6 = {"Chunk2","Chunk4","Chunk7"},
	Chunk7 = {"Chunk5","Chunk6"},	
}

local LoadedChunks = 0
local Distance = 7

local Table = {}
local Instances = 0
local Iteration = 1

for i,v in pairs(workspace:GetDescendants()) do
	if v.ClassName == "Model" or v.ClassName == "Part" or v.ClassName == "MeshPart" then
		if v.Parent.ClassName ~= "Model" or v.ClassName == "Model" and (v.Parent.Name ~= game:GetService("Players").LocalPlayer.Name or v.Name ~= game:GetService("Players").LocalPlayer.Name) then
			if (v.Locked.Parent ~= true) and (v.ClassName == "Part" or v.ClassName == "MeshPart") and (v.Parent.ClassName == "Part" or v.Parent.ClassName == "MeshPart") or v.ClassName == "Model" then
				Instances += 1
				table.insert(Table, v)
			elseif (v.Locked ~= true) and (v.ClassName == "Part" or v.ClassName == "MeshPart") or v.ClassName == "Model" then
				Instances += 1
				table.insert(Table, v)
			end
		end
	end
end

local Chunk = Instance.new("Model")
local ChunkGroup = Chunk:Clone()
ChunkGroup.Name = "Chunks"
ChunkGroup.Parent = workspace

for index = 1,Distance do
	local Chunk_ = Chunk:Clone()
	Chunk_.Name = "Chunk"..index
	Chunk_.Parent = ChunkGroup
end

local function IterateNumber()
	spawn(function()
		while true do
			wait()
			if Iteration > (Distance-1) then Iteration = 0 end
			Iteration = Iteration + 1
		end
	end)
end

local function GenerateChunks()
	IterateNumber()

	for i,v in pairs(Table) do
		wait()
		if i < math.floor((Instances/Distance)*Iteration) then
			v.Parent = ChunkGroup["Chunk"..Iteration]
			LoadedChunks += 1
		elseif i > math.floor((Instances/Distance)*Iteration) then
			v.Parent = ChunkGroup["Chunk"..Iteration]
			LoadedChunks += 1
		end
	end
end

GenerateChunks()

repeat wait() until LoadedChunks == Instances or LoadedChunks >= Instances-1

local ReverseChunks = {}
local ChunkBounds = {}
local ChunksVisible = {}
local ChunkModels = {}
local LastChunk = ""

local ChunksModel = ChunkGroup
local Camera = workspace.CurrentCamera
local HumanoidRootPart

for Name,ChunkTable in pairs(Chunks) do
	local Model = ChunksModel:WaitForChild(Name)
	ChunkModels[Name] = Model
	ChunksVisible[Name] = true
	ReverseChunks[Name] = {}
	for _,ChunkId in pairs(ChunkTable) do
		ReverseChunks[Name][ChunkId] = true
	end

	local Position,Size = Model:GetModelCFrame().p,Model:GetExtentsSize()
	local PosX,PosZ = Position.X,Position.Z
	local SizeX,SizeZ = Size.X/2,Size.Z/2
	ChunkBounds[Name] = {PosX - SizeX,PosZ - SizeZ,PosX + SizeX,PosZ + SizeZ}
end

local function GetCameraInChunk()
	if not HumanoidRootPart then return end
	local Position = HumanoidRootPart.Position
	local PosX,PosZ = Position.X,Position.Z
	for ChunkName,Bounds in pairs(ChunkBounds) do
		local X1,Z1,X2,Z2 = Bounds[1],Bounds[2],Bounds[3],Bounds[4]
		if PosX > X1 and PosZ > Z1 and PosX < X2 and PosZ < Z2 then
			return ChunkName
		end 
	end
end

local function SetChunkVisible(ChunkName,Visible)
	ChunksVisible[ChunkName] = (Visible == true and true or nil)
	ChunkModels[ChunkName].Parent = (Visible == true and ChunksModel or nil)
end

local function UpdateRenderedChunks(ChunkName)
	local ChunkData = ReverseChunks[ChunkName]
	for OtherChunkName,Visible in pairs(ChunksVisible) do
		if Visible == true and ChunkData[OtherChunkName] ~= true then
			SetChunkVisible(OtherChunkName,false)
		end
	end

	for OtherChunkName,_ in pairs(ChunkData) do
		if ChunksVisible[OtherChunkName] ~= true then
			SetChunkVisible(OtherChunkName,true)
		end
	end

	if ChunksVisible[ChunkName] ~= true then
		SetChunkVisible(ChunkName,true)
	end
end

local Player = game.Players.LocalPlayer
local function CharacterAdded(Character)
	if Character then
		HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	end
end
CharacterAdded(Player.Character)
Player.CharacterAdded:connect(CharacterAdded)

while true do
	local ChunkName = GetCameraInChunk()
	if ChunkName and ChunkName ~= LastChunk then
		LastChunk = ChunkName
		UpdateRenderedChunks(ChunkName)
	end
	wait()
end
