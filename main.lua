local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local function sendNotification()
	return pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = "Skip the wait?",
			Text = "Invite 25 friends!",
			Duration = 5,
		})
	end)
end

repeat
	local success, errorMessage = sendNotification()
	if not success then
		wait()
	end
until success

while task.wait(60) do
	
	sendNotification()
end
