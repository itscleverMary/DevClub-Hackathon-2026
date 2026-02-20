print("Hello world, from client!")
local PlayerService = game:GetService("Players");
local player = PlayerService.LocalPlayer;
local PlayerGui = player.PlayerGui

local ScreenGui = Instance.new("ScreenGui");
ScreenGui.IgnoreGuiInset = true;
ScreenGui.Parent = PlayerGui;
local backgroundImage = Instance.new("ImageLabel");
backgroundImage.Name = "SkyBackground";
backgroundImage.AnchorPoint = Vector2.new(0.5, 0.5);
backgroundImage.Size = UDim2.new(1, 0, 1, 0);
backgroundImage.Position = UDim2.new(0.5, 0, 0.5, 0);
backgroundImage.Image = "rbxassetid://93477754383363";
backgroundImage.Parent = ScreenGui;

