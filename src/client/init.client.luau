print("Hello world, from client!")
local PlayerService = game:GetService("Players");
local player = PlayerService.LocalPlayer;
local PlayerGui = player.PlayerGui

local ScreenGui = Instance.new("ScreenGui");
local backgroundImage = Instance.new("ImageLabel");

local gameUI = PlayerGui:WaitForChild("GameUI")
local logoUI = PlayerGui:WaitForChild("LogoUI");
local gameUIFrame = gameUI:WaitForChild("Frame");
local questionBGFrame = logoUI:WaitForChild("QuestionBGFrame");

--WE MIGHT HAVE TO PUT THIS IN A CHARACTER ADDED FUNCTION
local stringValue = Instance.new("StringValue")
stringValue.Name = "ChosenGameMode"
stringValue.Parent = player

ScreenGui.IgnoreGuiInset = true;
ScreenGui.Parent = PlayerGui;

gameUIFrame.Visible = true;
gameUIFrame.Position = UDim2.new(0.5, 0,0.5, 0)

backgroundImage.Name = "SkyBackground";
backgroundImage.AnchorPoint = Vector2.new(0.5, 0.5);
backgroundImage.Size = UDim2.new(1, 0, 1, 0);
backgroundImage.Position = UDim2.new(0.5, 0, 0.5, 0);
backgroundImage.Image = "rbxassetid://93477754383363";
backgroundImage.Parent = ScreenGui;

print(gameUIFrame.Position)
print(gameUIFrame.Visible)

