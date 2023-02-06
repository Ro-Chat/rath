if game.CoreGui:FindFirstChild("Axiom") then
	game.CoreGui["Axiom"]:Destroy()
end

local GetAsset = syn and getsynasset or getcustomasset

---------------- Imports ----------------

local Theme = Import("Theme")

---------------- Command Bar ----------------

local Axiom = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local SideLine = Instance.new("Frame")
local ButtonsHolder = Instance.new("Frame")
local home = Instance.new("ImageButton")
local OutputButton = Instance.new("TextButton")
local code = Instance.new("ImageButton")
local HomeButton = Instance.new("TextButton")
local Shadows = Instance.new("Frame")
local penumbraShadow = Instance.new("ImageLabel")
local InputedCommands = Instance.new("TextBox")
local UIPadding = Instance.new("UIPadding")

Axiom.Name = "Axiom"
Axiom.Parent = game.CoreGui
Axiom.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local CommandBar = Theme.CommandBar

local Home = CommandBar.Home
local Code = CommandBar.Code

local HomeColors = Home.Colors
local CodeColors = Code.Colors
local CommandBarColors = CommandBar.Colors

local MainIdleColor = CommandBarColors.Background.Idle
local AccentIdleColor = CommandBarColors.Accent.Idle
local ButtonHolderIdleColor = CommandBarColors.ButtonSection.Idle

local HomeIdleColor = HomeColors.Idle
local CodeIdleColor = CodeColors.Idle

Main.Name = "Main"
Main.Parent = Axiom
Main.AnchorPoint = Vector2.new(0.5, 0)
Main.BackgroundColor3 = Color3.fromRGB(MainIdleColor[1], MainIdleColor[2], MainIdleColor[3])
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.899999976, 0)
Main.Size = UDim2.new(0, 450, 0, 45)
Main.ClipsDescendants = true

SideLine.Name = "SideLine"
SideLine.Parent = Main
SideLine.BackgroundColor3 = Color3.fromRGB(AccentIdleColor[1], AccentIdleColor[2], AccentIdleColor[3])
SideLine.BorderSizePixel = 0
SideLine.Size = UDim2.new(0, 3, 0, 45)

ButtonsHolder.Name = "ButtonsHolder"
ButtonsHolder.Parent = Main
ButtonsHolder.BackgroundColor3 = Color3.fromRGB(ButtonHolderIdleColor[1], ButtonHolderIdleColor[2], ButtonHolderIdleColor[3])
ButtonsHolder.BorderSizePixel = 0
ButtonsHolder.Position = UDim2.new(0.775791943, 0, 0, 0)
ButtonsHolder.Size = UDim2.new(0, 101, 0, 45)
ButtonsHolder.ZIndex = 0

home.Name = "home"
home.Parent = ButtonsHolder
home.AnchorPoint = Vector2.new(0.5, 0.5)
home.BackgroundTransparency = 1.000
home.Position = UDim2.new(0.29207921, 0, 0.5, 0)
home.Size = UDim2.new(0, 25, 0, 25)
home.ZIndex = 2
home.ImageColor3 = Color3.fromRGB(HomeIdleColor[1], HomeIdleColor[2], HomeIdleColor[3])

if not Theme.CommandBar.Home.Image then
    home.Image = "rbxassetid://3926305904"
    home.ImageRectOffset = Vector2.new(964, 204)
    home.ImageRectSize = Vector2.new(36, 36)
else
    home.Image = GetAsset(("Rath/UI/Assets/%s"):format(Theme.CommandBar.Home.Image))
end

OutputButton.Name = "OutputButton"
OutputButton.Parent = home
OutputButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OutputButton.BackgroundTransparency = 1
OutputButton.BorderSizePixel = 0
OutputButton.Position = UDim2.new(-0.4, 0,-0.4, 0)
OutputButton.Size = UDim2.new(0, 45,0, 45)
OutputButton.ZIndex = 2
OutputButton.Font = Enum.Font.SourceSans
OutputButton.Text = ""
OutputButton.TextColor3 = Color3.fromRGB(0, 0, 0)
OutputButton.TextSize = 14.000

code.Name = "code"
code.Parent = ButtonsHolder
code.AnchorPoint = Vector2.new(0.5, 0.5)
code.BackgroundTransparency = 1.000
code.Position = UDim2.new(0.677343249, 0, 0.5, 0)
code.Size = UDim2.new(0, 25, 0, 25)
code.ZIndex = 2
code.ImageColor3 = Color3.fromRGB(CodeIdleColor[1], CodeIdleColor[2], CodeIdleColor[3])

if not Theme.CommandBar.Code.Image then
    code.Image = "rbxassetid://3926305904"
    code.ImageRectOffset = Vector2.new(404, 844)
    code.ImageRectSize = Vector2.new(36, 36)
else
    home.Image = GetAsset(("Rath/UI/Assets/%s"):format(Theme.CommandBar.Home.Image))
end
HomeButton.Name = "HomeButton"
HomeButton.Parent = code
HomeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HomeButton.BackgroundTransparency = 1
HomeButton.BorderSizePixel = 0
HomeButton.Position = UDim2.new(-0.02, 0,-0.44, 0)
HomeButton.Size = UDim2.new(0, 45, 0, 45)
HomeButton.ZIndex = 2
HomeButton.Font = Enum.Font.SourceSans
HomeButton.Text = ""
HomeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
HomeButton.TextSize = 14.000

Shadows.Name = "Shadows"
Shadows.Parent = Main
Shadows.BackgroundTransparency = 1.000
Shadows.Size = UDim2.new(1, 0, 1, 0)
Shadows.ZIndex = 0

penumbraShadow.Name = "penumbraShadow"
penumbraShadow.Parent = Shadows
penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
penumbraShadow.BackgroundTransparency = 1.000
penumbraShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
penumbraShadow.Size = UDim2.new(1, 2, 1, 2)
penumbraShadow.ZIndex = 0
penumbraShadow.Image = "rbxassetid://1316045217"
penumbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
penumbraShadow.ImageTransparency = 0.880
penumbraShadow.ScaleType = Enum.ScaleType.Slice
penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

InputedCommands.Name = "InputedCommands"
InputedCommands.Parent = Main
InputedCommands.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InputedCommands.BackgroundTransparency = 1.000
InputedCommands.BorderSizePixel = 0
InputedCommands.Position = UDim2.new(0.00425531901, 0, -0.0222222228, 0)
InputedCommands.Size = UDim2.new(0, 348, 0, 45)
InputedCommands.Font = Enum.Font.GothamMedium
InputedCommands.Text = ""
InputedCommands.TextColor3 = Color3.fromRGB(225, 225, 225)
InputedCommands.TextSize = 17.000
InputedCommands.TextWrapped = true
InputedCommands.TextXAlignment = Enum.TextXAlignment.Left

UIPadding.Parent = InputedCommands
UIPadding.PaddingLeft = UDim.new(0, 5)

local function loadBar(toggled)
  local TweenService = game:GetService("TweenService")
  local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0 ,false, 0)

  if toggled then
    InputedCommands.Visible = true
    InputedCommands.Text = ""
    Main:TweenSize(UDim2.new(0, 450, 0, 45), "Out", "Sine", 0.25, false)
    for index, value in pairs(game.CoreGui["Axiom"]:GetDescendants()) do
      if value:IsA("Frame") or value:IsA("TextLabel") then
        if value.Name == "SideLine" or value.Name == "Main" or value.Name == "ButtonsHolder" then
          TweenService:Create(value, tweenInfo, {BackgroundTransparency = 0}):Play()
        end
      end
      for index, value in pairs(game.CoreGui["Axiom"].Main.ButtonsHolder:GetDescendants()) do
        if value:IsA("ImageLabel") or value:IsA("ImageButton") then
          if value.Name == "code" or value.Name == "home" then
            TweenService:Create(value, tweenInfo, {ImageTransparency = 0}):Play()
          end
        end
        for index, value in pairs(game.CoreGui["Axiom"].Main.Shadows:GetDescendants()) do
          if value:IsA("ImageLabel") or value:IsA("ImageButton") then
            TweenService:Create(value, tweenInfo, {ImageTransparency = 0.8}):Play()
          end
        end
      end
      Main:TweenPosition(UDim2.new(0.5, 0, 0.9, 0), "Out", "Sine", 0.7, true)
      task.wait(0.02)
      InputedCommands:CaptureFocus()
    end
  else
    for index, value in pairs(game.CoreGui["Axiom"]:GetDescendants()) do
      if value:IsA("Frame") or value:IsA("TextLabel") and value.Name ~= "Shadows" then
        TweenService:Create(value, tweenInfo, {BackgroundTransparency = 1}):Play()
      elseif value:IsA("ImageLabel") or value:IsA("ImageButton") then
        TweenService:Create(value, tweenInfo, {ImageTransparency = 1}):Play()
      end
      Main:TweenPosition(UDim2.new(0.5, 0, 0.9, 50), "In", "Quad", 1.5, true)
    end
    InputedCommands.Text = "" 
    InputedCommands.Visible = false
    task.wait(0.4)
    Main:TweenSize(UDim2.new(0, 0, 0, 45), "In", "Quad", 0.25, false)
  end
end

game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(Key)
	if Key == CommandBar.HotKey then
        loadBar(true)
    end
end)

local LocalPlayer = game:GetService("Players").LocalPlayer

InputedCommands.FocusLost:Connect(function(input)
    if input then
        local Message = InputedCommands.Text

        if Message ~= "" then

            local PlayerData = Admin.Admins[LocalPlayer]

            local Command = Message:lower():match("^(%w+)%s?")
            Command = Admin.Commands[Command]

            local Args = Message:split(" ")

            -- if PlayerData.Prefix:match("%s") then
            --     for _ = 1, #PlayerData.Prefix:split(" ") do
            --         table.remove(Args, 1)
            --     end
            -- end

            table.remove(Args, 1)
            table.insert(Args, 1, LocalPlayer)

            if not Command or Command and not table.find(Command.Whitelisted, LocalPlayer) and Command.Rank > PlayerData.Rank then return end

            local ArgCount = debug.getinfo(Command.Callback).numparams

            if #Args > ArgCount then
                local tmpArgs = {}
                for i = 1, #Args - ArgCount do
                    table.insert(tmpArgs, Args[i + ArgCount])
                    table.remove(Args, i + ArgCount)
                end
                local Arg = Args[ArgCount] .. " " .. table.concat(tmpArgs, " ")
                table.remove(Args, ArgCount)
                table.insert(Args, ArgCount, Arg)
            end

            Command.Callback(table.unpack(Args))
        end
        loadBar(false)
    end
end)
