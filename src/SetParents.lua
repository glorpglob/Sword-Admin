script.Parent:WaitForChild("Assets_").Parent = game.ReplicatedStorage
script.Parent:WaitForChild("Events_").Parent = game.ReplicatedStorage
script.Parent:WaitForChild("CharacterScripts_").Parent = game.ReplicatedStorage
script.Parent:WaitForChild("Server_").Parent = game.ServerScriptService

local Settings = require(game:FindFirstChild("Sword_Admin" , true).Settings)
if Settings.advertising == false then
	script.Parent.GUIs_.Advertisment:Destroy()
end

local function SetGuis(Player)
	for _, v in pairs(script.Parent.GUIs_:GetChildren()) do
		v:Clone().Parent = Player.PlayerGui
	end
	local Clone = script.Parent.Client_:Clone()
	Clone.Parent = Player.PlayerGui
end

for _, Player in pairs(game.Players:GetPlayers()) do 
	SetGuis(Player)
end

game.Players.PlayerAdded:Connect(function(Player)
	SetGuis(Player)
end)
