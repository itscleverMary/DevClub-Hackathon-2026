local PlayerService = game:GetService("Players");
local player = PlayerService.LocalPlayer;
local PlayerGui = player.PlayerGui;
local gameUI = PlayerGui:WaitForChild("GameUI");
local frame = gameUI.Frame

--Menu Buttons
local easyButton = frame.easyButton;
local mediumButton = frame.mediumButton;
local hardButton = frame.hardButton;

--Debounces


easyButton.MouseButton1Click:Connect(function()

end)

