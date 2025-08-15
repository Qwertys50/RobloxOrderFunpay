local player = game:GetService("Players").LocalPlayer
local ms = game:GetService("MarketplaceService")
local guiService = game:GetService("GuiService")

local game_pass_id = {
	[23452343423] = true
}

local product_id = {
	[45234523452] = true
}

local function getRandomKey(t)
	local keys = {}
	for k in pairs(t) do keys[#keys+1] = k end
	return keys[math.random(#keys)] or nil
end

local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")

	humanoid.Died:Connect(function()
		local choice = math.random(1, 2)
		
		print(choice)
		
		if choice == 1 then
			local randomGamePassId = getRandomKey(game_pass_id)
			if randomGamePassId then
				ms:PromptGamePassPurchase(player, randomGamePassId)
			end
		else
			local randomProductId = getRandomKey(product_id)
			if randomProductId then
				ms:PromptProductPurchase(player, randomProductId)
			end
		end
	end)
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
	onCharacterAdded(player.Character)
end
