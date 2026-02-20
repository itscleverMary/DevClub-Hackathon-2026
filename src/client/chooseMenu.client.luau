local PlayerService = game:GetService("Players");
local player = PlayerService.LocalPlayer;
local PlayerGui = player.PlayerGui;
local gameUI = PlayerGui:WaitForChild("GameUI");
local logoUI = PlayerGui:WaitForChild("LogoUI");
local frame = gameUI.Frame;

local questionBGFrame = logoUI:WaitForChild("QuestionBGFrame");

--Menu Buttons
local easyButton = frame.EasyButton;
local mediumButton = frame.MediumButton;
local hardButton = frame.HardButton;
local closeButton = questionBGFrame.CloseButton

--Debounces
local easyButtonDebounce = false;

easyButton.MouseButton1Click:Connect(function()
    if not easyButtonDebounce then
        frame.Visible = false
        questionBGFrame.Visible = true
        questionBGFrame:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.6)
        task.wait(0.7)
        easyButtonDebounce = true
    end
end)

