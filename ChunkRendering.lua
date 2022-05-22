local Table = {}
local Chunks = {}
local Instances = 0
local Distance = 10

for i,v in pairs(workspace:GetDescendants()) do
	Instances += 1
	table.insert(Table, v)
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

for i,v in pairs(Table) do
	for index = 1,Distance do
		if i < (Instances/Distance)*index then
			v.Parent = ChunkGroup["Chunk"..index]
		end
	end
end

repeat wait() until ChunkGroup:GetChildren()[Distance]

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
