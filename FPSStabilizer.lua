-- script created by lemonsxeedd
repeat wait() until game:IsLoaded()

local c = tick()
local t = {}
local af = 0
local tf = 0
local i = 1

--// amount of times it averages fps
local ca = 10

local function getaverageFPS()
	if af > 0 then return af end
	
	for count = 1,ca do
		table.insert(t, workspace:GetRealPhysicsFPS())
		wait(1)
	end

	for count = 1,ca do
		tf += tonumber(t[i])
		i += 1
	end

	af = tf/ca
	return af
end

getaverageFPS()

repeat wait() until af > 0

while true do
	while c + 1 / af > tick() do end
	game:GetService('RunService').RenderStepped:wait()
	c = tick()
end
