if not game:IsLoaded() then 
	repeat task.wait() until game:IsLoaded()
end

if game:GetService("CoreGui"):FindFirstChild("AxiomLibrary") then 
	game:GetService("CoreGui")["AxiomLibrary"]:Destroy()
end 

local UserInputService = game:GetService("UserInputService")

local GetAsset = syn and getsynasset or getcustomasset
local Class = loadstring(game:HttpGet("https://pastebin.com/raw/xCgwCuAn"))()

local Library = {}

function Library:createLibrary(libraryName, Extra)
	libraryName = libraryName or "Axiom"

	-- UI Instances:

	local Converted = {
		["_AxiomLibrary"] = Instance.new("ScreenGui");
		["_MainFrame"] = Instance.new("Frame");
		["_Glow"] = Instance.new("UIStroke");
		["_TabsContainer"] = Instance.new("Frame");
		["_Pattern"] = Instance.new("ImageLabel");
		["_TabsListing"] = Instance.new("ScrollingFrame");
		["_UIListLayout"] = Instance.new("UIListLayout");
		["_UIPadding"] = Instance.new("UIPadding");
		["_Home"] = Instance.new("TextButton");
		["_CategoryType"] = Instance.new("ImageLabel");
		["_UICorner"] = Instance.new("UICorner");
		["_Tab"] = Instance.new("TextLabel");
		["_UIPadding1"] = Instance.new("UIPadding");
		["_UICorner1"] = Instance.new("UICorner");
		["_Server"] = Instance.new("TextButton");
		["_CategoryType1"] = Instance.new("ImageLabel");
		["_UICorner2"] = Instance.new("UICorner");
		["_Tab1"] = Instance.new("TextLabel");
		["_UIPadding2"] = Instance.new("UIPadding");
		["_UICorner3"] = Instance.new("UICorner");
		["_Client"] = Instance.new("TextButton");
		["_CategoryType2"] = Instance.new("ImageLabel");
		["_UICorner4"] = Instance.new("UICorner");
		["_Tab2"] = Instance.new("TextLabel");
		["_UIPadding3"] = Instance.new("UIPadding");
		["_UICorner5"] = Instance.new("UICorner");
		["_Visuals"] = Instance.new("TextButton");
		["_CategoryType3"] = Instance.new("ImageLabel");
		["_UICorner6"] = Instance.new("UICorner");
		["_Tab3"] = Instance.new("TextLabel");
		["_UIPadding4"] = Instance.new("UIPadding");
		["_UICorner7"] = Instance.new("UICorner");
		["_Settings"] = Instance.new("TextButton");
		["_CategoryType4"] = Instance.new("ImageLabel");
		["_UICorner8"] = Instance.new("UICorner");
		["_Tab4"] = Instance.new("TextLabel");
		["_UIPadding5"] = Instance.new("UIPadding");
		["_UICorner9"] = Instance.new("UICorner");
		["_Pattern1"] = Instance.new("ImageLabel");
		["_Line"] = Instance.new("Frame");
		["_TopBar"] = Instance.new("Frame");
		["_InterfaceTitle"] = Instance.new("TextLabel");
		["_UIPadding6"] = Instance.new("UIPadding");
		["_ImageLabel"] = Instance.new("ImageLabel");
		["_Close"] = Instance.new("TextButton");
		["_Minimize"] = Instance.new("TextButton");
		["_PagesContainer"] = Instance.new("Frame");
		["_DefaultTab"] = Instance.new("ScrollingFrame");
		["_ClientProfile"] = Instance.new("ImageLabel");
		["_UICorner10"] = Instance.new("UICorner");
		["_UIStroke"] = Instance.new("UIStroke");
		["_WelcomeMessage"] = Instance.new("TextLabel");
		["_ClientUsername"] = Instance.new("TextLabel");
		["_LabelsContainer"] = Instance.new("Frame");
		["_Message"] = Instance.new("Frame");
		["_UICorner11"] = Instance.new("UICorner");
		["_UIStroke1"] = Instance.new("UIStroke");
		["_MessageText"] = Instance.new("TextLabel");
		["_UICorner12"] = Instance.new("UICorner");
		["_UIPadding7"] = Instance.new("UIPadding");
		["_LocalScript"] = Instance.new("LocalScript");
		["_check"] = Instance.new("ImageLabel");
		["_Information"] = Instance.new("Frame");
		["_UICorner13"] = Instance.new("UICorner");
		["_UIStroke2"] = Instance.new("UIStroke");
		["_InfoText"] = Instance.new("TextLabel");
		["_UICorner14"] = Instance.new("UICorner");
		["_UIPadding8"] = Instance.new("UIPadding");
		["_LocalScript1"] = Instance.new("LocalScript");
		["_ImageLabel1"] = Instance.new("ImageLabel");
		["_ChangeLogs"] = Instance.new("Frame");
		["_UICorner15"] = Instance.new("UICorner");
		["_UIStroke3"] = Instance.new("UIStroke");
		["_ChangeLogText"] = Instance.new("TextLabel");
		["_UICorner16"] = Instance.new("UICorner");
		["_UIPadding9"] = Instance.new("UIPadding");
		["_build"] = Instance.new("ImageLabel");
		["_LocalScript2"] = Instance.new("LocalScript");
		["_UIListLayout1"] = Instance.new("UIListLayout");
		["_UIPadding10"] = Instance.new("UIPadding");
		["_TestTab"] = Instance.new("ScrollingFrame");
		["_Toggle"] = Instance.new("Frame");
		["_UICorner17"] = Instance.new("UICorner");
		["_UIStroke4"] = Instance.new("UIStroke");
		["_ToggleTitle"] = Instance.new("TextLabel");
		["_UICorner18"] = Instance.new("UICorner");
		["_UIPadding11"] = Instance.new("UIPadding");
		["_ToggleDescription"] = Instance.new("TextLabel");
		["_UICorner19"] = Instance.new("UICorner");
		["_UIPadding12"] = Instance.new("UIPadding");
		["_ToggleFunction"] = Instance.new("TextButton");
		["_Circle"] = Instance.new("Frame");
		["_UICorner20"] = Instance.new("UICorner");
		["_UICorner21"] = Instance.new("UICorner");
		["_UIListLayout2"] = Instance.new("UIListLayout");
		["_UIPadding13"] = Instance.new("UIPadding");
		["_Slider"] = Instance.new("Frame");
		["_UICorner22"] = Instance.new("UICorner");
		["_UIStroke5"] = Instance.new("UIStroke");
		["_SliderTitle"] = Instance.new("TextLabel");
		["_UICorner23"] = Instance.new("UICorner");
		["_UIPadding14"] = Instance.new("UIPadding");
		["_SliderContainer"] = Instance.new("Frame");
		["_UICorner24"] = Instance.new("UICorner");
		["_UIStroke6"] = Instance.new("UIStroke");
		["_SliderFrame"] = Instance.new("Frame");
		["_UICorner25"] = Instance.new("UICorner");
		["_MoveSlider"] = Instance.new("TextButton");
		["_SliderValue"] = Instance.new("TextLabel");
		["_UICorner26"] = Instance.new("UICorner");
		["_UIPadding15"] = Instance.new("UIPadding");
		["_DropDown"] = Instance.new("Frame");
		["_UICorner27"] = Instance.new("UICorner");
		["_UIStroke7"] = Instance.new("UIStroke");
		["_DropDownTitle"] = Instance.new("TextLabel");
		["_UICorner28"] = Instance.new("UICorner");
		["_UIPadding16"] = Instance.new("UIPadding");
		["_ImageLabel2"] = Instance.new("ImageLabel");
		["_SelectedItem"] = Instance.new("TextLabel");
		["_UICorner29"] = Instance.new("UICorner");
		["_UIPadding17"] = Instance.new("UIPadding");
		["_DropDownButton"] = Instance.new("TextButton");
		["_ItemsContainer"] = Instance.new("Frame");
		["_UICorner30"] = Instance.new("UICorner");
		["_UIListLayout3"] = Instance.new("UIListLayout");
		["_UIPadding18"] = Instance.new("UIPadding");
		["_DropDownObject"] = Instance.new("Frame");
		["_UICorner31"] = Instance.new("UICorner");
		["_ImageLabel3"] = Instance.new("ImageLabel");
		["_UIStroke8"] = Instance.new("UIStroke");
		["_ItemButton"] = Instance.new("TextButton");
		["_Button"] = Instance.new("Frame");
		["_UICorner32"] = Instance.new("UICorner");
		["_UIStroke9"] = Instance.new("UIStroke");
		["_ImageLabel4"] = Instance.new("ImageLabel");
		["_ButtonFunction"] = Instance.new("TextButton");
		["_UICorner33"] = Instance.new("UICorner");
		["_UIPadding19"] = Instance.new("UIPadding");
		["_Section"] = Instance.new("TextLabel");
		["_UIPadding20"] = Instance.new("UIPadding");
		["_TextBox"] = Instance.new("Frame");
		["_UICorner34"] = Instance.new("UICorner");
		["_UIStroke10"] = Instance.new("UIStroke");
		["_TextBoxTitle"] = Instance.new("TextLabel");
		["_UICorner35"] = Instance.new("UICorner");
		["_UIPadding21"] = Instance.new("UIPadding");
		["_InputtedString"] = Instance.new("TextBox");
		["_UICorner36"] = Instance.new("UICorner");
		["_UIPadding22"] = Instance.new("UIPadding");
		["_ImageLabel5"] = Instance.new("ImageLabel");
		["_KeyBind"] = Instance.new("Frame");
		["_UICorner37"] = Instance.new("UICorner");
		["_UIStroke11"] = Instance.new("UIStroke");
		["_KeyBindTitle"] = Instance.new("TextLabel");
		["_UICorner38"] = Instance.new("UICorner");
		["_UIPadding23"] = Instance.new("UIPadding");
		["_HotKeyInputted"] = Instance.new("TextBox");
		["_UICorner39"] = Instance.new("UICorner");
		["_UIPadding24"] = Instance.new("UIPadding");
		["_SettingsTab"] = Instance.new("ScrollingFrame");
		["_UIPadding25"] = Instance.new("UIPadding");
		["_UIListLayout4"] = Instance.new("UIListLayout");
		["_ThemePicker"] = Instance.new("Frame");
		["_UICorner40"] = Instance.new("UICorner");
		["_Hue"] = Instance.new("Frame");
		["_UICorner41"] = Instance.new("UICorner");
		["_UIStroke12"] = Instance.new("UIStroke");
		["_ImageLabel6"] = Instance.new("ImageLabel");
		["_UICorner42"] = Instance.new("UICorner");
		["_ColorCursor"] = Instance.new("TextButton");
		["_UICorner43"] = Instance.new("UICorner");
		["_Saturation"] = Instance.new("Frame");
		["_UICorner44"] = Instance.new("UICorner");
		["_UIStroke13"] = Instance.new("UIStroke");
		["_UIGradient"] = Instance.new("UIGradient");
		["_SaturationSlider"] = Instance.new("TextButton");
		["_ColorPreview"] = Instance.new("Frame");
		["_UICorner45"] = Instance.new("UICorner");
		["_UIStroke14"] = Instance.new("UIStroke");
		["_ThemeButtonContainer"] = Instance.new("Frame");
		["_UICorner46"] = Instance.new("UICorner");
		["_UIStroke15"] = Instance.new("UIStroke");
		["_ApplyTheme"] = Instance.new("TextButton");
		["_UICorner47"] = Instance.new("UICorner");
		["_DragConfiguration"] = Instance.new("Frame");
		["_UICorner48"] = Instance.new("UICorner");
		["_UIStroke16"] = Instance.new("UIStroke");
		["_DragSpeedTitle"] = Instance.new("TextLabel");
		["_UICorner49"] = Instance.new("UICorner");
		["_UIPadding26"] = Instance.new("UIPadding");
		["_SliderContainer1"] = Instance.new("Frame");
		["_UICorner50"] = Instance.new("UICorner");
		["_UIStroke17"] = Instance.new("UIStroke");
		["_SliderFrame1"] = Instance.new("Frame");
		["_UICorner51"] = Instance.new("UICorner");
		["_MoveSlider1"] = Instance.new("TextButton");
		["_DragSpeedValue"] = Instance.new("TextLabel");
		["_UICorner52"] = Instance.new("UICorner");
		["_UIPadding27"] = Instance.new("UIPadding");
		["_ResetSettingsContainer"] = Instance.new("Frame");
		["_UICorner53"] = Instance.new("UICorner");
		["_UIStroke18"] = Instance.new("UIStroke");
		["_ImageLabel7"] = Instance.new("ImageLabel");
		["_ResetSettingsButton"] = Instance.new("TextButton");
		["_UICorner54"] = Instance.new("UICorner");
		["_UIPadding28"] = Instance.new("UIPadding");
		["_SaveSettingsButton"] = Instance.new("Frame");
		["_UICorner55"] = Instance.new("UICorner");
		["_UIStroke19"] = Instance.new("UIStroke");
		["_ImageLabel8"] = Instance.new("ImageLabel");
		["_SaveSettingsButton1"] = Instance.new("TextButton");
		["_UICorner56"] = Instance.new("UICorner");
		["_UIPadding29"] = Instance.new("UIPadding");
	}

	-- Properties:

	Converted["_AxiomLibrary"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Converted["_AxiomLibrary"].Name = "AxiomLibrary"
	Converted["_AxiomLibrary"].Parent = game:GetService("CoreGui")

	Converted["_MainFrame"].AnchorPoint = Vector2.new(0.5, 0.5)
	Converted["_MainFrame"].BackgroundColor3 = Color3.fromRGB(31.000001952052116, 31.000001952052116, 31.000001952052116)
	Converted["_MainFrame"].BorderSizePixel = 0
	Converted["_MainFrame"].Position = UDim2.new(0.5, 0, 0.5, 0)
	Converted["_MainFrame"].Size = UDim2.new(0, 470, 0, 320)
	Converted["_MainFrame"].Name = "MainFrame"
	Converted["_MainFrame"].Parent = Converted["_AxiomLibrary"]

	Converted["_Glow"].Color = Color3.fromRGB(87.00000241398811, 255, 57.00000040233135)
	Converted["_Glow"].Thickness = 2.200000047683716
	Converted["_Glow"].Name = "Glow"
	Converted["_Glow"].Parent = Converted["_MainFrame"]
	Converted["_Glow"].Transparency = 0.7

	Converted["_TabsContainer"].BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867)
	Converted["_TabsContainer"].BorderSizePixel = 0
	Converted["_TabsContainer"].Position = UDim2.new(0, 0, 0.0843750015, 0)
	Converted["_TabsContainer"].Size = UDim2.new(0, 120, 0, 293)
	Converted["_TabsContainer"].Name = "TabsContainer"
	Converted["_TabsContainer"].Parent = Converted["_MainFrame"]

	Converted["_Pattern"].Image = "rbxassetid://121480522"
	Converted["_Pattern"].ImageTransparency = 0.6000000238418579
	Converted["_Pattern"].ScaleType = Enum.ScaleType.Tile
	Converted["_Pattern"].SliceCenter = Rect.new(0, 256, 0, 256)
	Converted["_Pattern"].TileSize = UDim2.new(0, 45, 0, 45)
	Converted["_Pattern"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Pattern"].BackgroundTransparency = 1
	Converted["_Pattern"].Position = UDim2.new(0, 0, -0.00170648459, 0)
	Converted["_Pattern"].Size = UDim2.new(0, 120, 0, 293)
	Converted["_Pattern"].Name = "Pattern"
	Converted["_Pattern"].Parent = Converted["_TabsContainer"]

	Converted["_TabsListing"].ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_TabsListing"].ScrollBarThickness = 2
	Converted["_TabsListing"].Active = true
	Converted["_TabsListing"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_TabsListing"].BackgroundTransparency = 1
	Converted["_TabsListing"].BorderSizePixel = 0
	Converted["_TabsListing"].Size = UDim2.new(0, 120, 0, 293)
	Converted["_TabsListing"].Name = "TabsListing"
	Converted["_TabsListing"].Parent = Converted["_TabsContainer"]

	Converted["_UIListLayout"].Padding = UDim.new(0, 7)
	Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
	Converted["_UIListLayout"].Parent = Converted["_TabsListing"]

	Converted["_UIPadding"].PaddingLeft = UDim.new(0, 5)
	Converted["_UIPadding"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding"].Parent = Converted["_TabsListing"]

	Converted["_Home"].Text = ""
	Converted["_Home"].BackgroundColor3 = Color3.fromRGB(54.00000058114529, 54.00000058114529, 54.00000058114529)
	Converted["_Home"].BackgroundTransparency = 1
	Converted["_Home"].BorderSizePixel = 0
	Converted["_Home"].Size = UDim2.new(0, 110, 0, 25)
	Converted["_Home"].Name = "Home"
	Converted["_Home"].Parent = Converted["_TabsListing"]
	Converted["_Home"].MouseButton1Down:Connect(function()
		Converted["_PagesContainer"].Visible = true
		for i,v in next, Converted["_PagesContainer"]:GetChildren() do
			v.Visible = false
		end
		Converted["_DefaultTab"].Visible = true

		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
		local TweenService = game:GetService("TweenService")

		for i,v in next, Converted["_TabsListing"]:GetDescendants() do	
			if v:IsA("TextButton") or v:IsA("TextLabel") then 
				TweenService:Create(v, tweenInfo, {BackgroundTransparency = 1}):Play()
				TweenService:Create(v, tweenInfo, {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
			elseif v:IsA("ImageLabel") then
				TweenService:Create(v, tweenInfo, {ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
			end
		end
		TweenService:Create(Converted["_Home"], tweenInfo, {BackgroundTransparency = 0.4}):Play()
		TweenService:Create(Converted["_Tab"], tweenInfo, {TextColor3 = Color3.fromRGB(138, 201, 38)}):Play()
		TweenService:Create(Converted["_CategoryType"], tweenInfo, {ImageColor3 = Color3.fromRGB(138, 201, 38)}):Play()
	end)

	--[[Converted["_Home"].MouseEnter:Connect(function()
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
		local TweenService = game:GetService("TweenService")

		TweenService:Create(Converted["_Tab"], tweenInfo, {TextColor3 = Color3.fromRGB(145, 145, 145)}):Play()
		TweenService:Create(Converted["_CategoryType"], tweenInfo, {ImageColor3 = Color3.fromRGB(145, 145, 145)}):Play()
	end)

	Converted["_Home"].MouseLeave:Connect(function()
		local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
		local TweenService = game:GetService("TweenService")

		TweenService:Create(Converted["_Tab"], tweenInfo, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		TweenService:Create(Converted["_CategoryType"], tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)]]

	Converted["_CategoryType"].Image = "rbxassetid://12351655229"
	Converted["_CategoryType"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_CategoryType"].BackgroundTransparency = 1
	Converted["_CategoryType"].BorderSizePixel = 0
	Converted["_CategoryType"].Position = UDim2.new(0, 10, 0, 5)
	Converted["_CategoryType"].Size = UDim2.new(0, 15, 0, 15)
	Converted["_CategoryType"].Name = "CategoryType"
	Converted["_CategoryType"].Parent = Converted["_Home"]

	Converted["_UICorner"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner"].Parent = Converted["_Home"]

	Converted["_Tab"].Font = Enum.Font.JosefinSans
	Converted["_Tab"].Text = "Home"
	Converted["_Tab"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Tab"].TextSize = 15
	Converted["_Tab"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Tab"].Active = true
	Converted["_Tab"].BackgroundColor3 = Color3.fromRGB(54.00000438094139, 54.00000438094139, 54.00000438094139)
	Converted["_Tab"].BackgroundTransparency = 1
	Converted["_Tab"].BorderSizePixel = 0
	Converted["_Tab"].Position = UDim2.new(0.318181813, 0, 0, 0)
	Converted["_Tab"].Selectable = true
	Converted["_Tab"].Size = UDim2.new(0, 75, 0, 25)
	Converted["_Tab"].Name = "Tab"
	Converted["_Tab"].Parent = Converted["_Home"]

	Converted["_UIPadding1"].PaddingTop = UDim.new(0, 5)
	Converted["_UIPadding1"].Parent = Converted["_Tab"]

	Converted["_UICorner1"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner1"].Parent = Converted["_Tab"]

	Converted["_Server"].Text = ""
	Converted["_Server"].BackgroundColor3 = Color3.fromRGB(54.00000058114529, 54.00000058114529, 54.00000058114529)
	Converted["_Server"].BackgroundTransparency = 1
	Converted["_Server"].BorderSizePixel = 0
	Converted["_Server"].Size = UDim2.new(0, 110, 0, 25)
	Converted["_Server"].Name = "Server"
	Converted["_Server"].Parent = nil

	Converted["_CategoryType1"].Image = "rbxassetid://12383522581"
	Converted["_CategoryType1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_CategoryType1"].BackgroundTransparency = 1
	Converted["_CategoryType1"].BorderSizePixel = 0
	Converted["_CategoryType1"].Position = UDim2.new(0, 10, 0, 5)
	Converted["_CategoryType1"].Size = UDim2.new(0, 15, 0, 15)
	Converted["_CategoryType1"].Name = "CategoryType"
	Converted["_CategoryType1"].Parent = Converted["_Server"]

	Converted["_UICorner2"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner2"].Parent = Converted["_Server"]

	Converted["_Tab1"].Font = Enum.Font.JosefinSans
	Converted["_Tab1"].Text = "Server"
	Converted["_Tab1"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Tab1"].TextSize = 15
	Converted["_Tab1"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Tab1"].Active = true
	Converted["_Tab1"].BackgroundColor3 = Color3.fromRGB(54.00000438094139, 54.00000438094139, 54.00000438094139)
	Converted["_Tab1"].BackgroundTransparency = 1
	Converted["_Tab1"].BorderSizePixel = 0
	Converted["_Tab1"].Position = UDim2.new(0.318181813, 0, 0, 0)
	Converted["_Tab1"].Selectable = true
	Converted["_Tab1"].Size = UDim2.new(0, 75, 0, 25)
	Converted["_Tab1"].Name = "Tab"
	Converted["_Tab1"].Parent = Converted["_Server"]

	Converted["_UIPadding2"].PaddingTop = UDim.new(0, 5)
	Converted["_UIPadding2"].Parent = Converted["_Tab1"]

	Converted["_UICorner3"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner3"].Parent = Converted["_Tab1"]

	Converted["_Client"].Text = ""
	Converted["_Client"].BackgroundColor3 = Color3.fromRGB(54.00000058114529, 54.00000058114529, 54.00000058114529)
	Converted["_Client"].BackgroundTransparency = 1
	Converted["_Client"].BorderSizePixel = 0
	Converted["_Client"].Size = UDim2.new(0, 110, 0, 25)
	Converted["_Client"].Name = "Client"
	Converted["_Client"].Parent = nil

	Converted["_CategoryType2"].Image = "rbxassetid://12383508769"
	Converted["_CategoryType2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_CategoryType2"].BackgroundTransparency = 1
	Converted["_CategoryType2"].BorderSizePixel = 0
	Converted["_CategoryType2"].Position = UDim2.new(0, 10, 0, 5)
	Converted["_CategoryType2"].Size = UDim2.new(0, 15, 0, 15)
	Converted["_CategoryType2"].Name = "CategoryType"
	Converted["_CategoryType2"].Parent = nil

	Converted["_UICorner4"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner4"].Parent = Converted["_Client"]

	Converted["_Tab2"].Font = Enum.Font.JosefinSans
	Converted["_Tab2"].Text = "Client"
	Converted["_Tab2"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Tab2"].TextSize = 15
	Converted["_Tab2"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Tab2"].Active = true
	Converted["_Tab2"].BackgroundColor3 = Color3.fromRGB(54.00000438094139, 54.00000438094139, 54.00000438094139)
	Converted["_Tab2"].BackgroundTransparency = 1
	Converted["_Tab2"].BorderSizePixel = 0
	Converted["_Tab2"].Position = UDim2.new(0.318181813, 0, 0, 0)
	Converted["_Tab2"].Selectable = true
	Converted["_Tab2"].Size = UDim2.new(0, 75, 0, 25)
	Converted["_Tab2"].Name = "Tab"
	Converted["_Tab2"].Parent = nil

	Converted["_UIPadding3"].PaddingTop = UDim.new(0, 5)
	Converted["_UIPadding3"].Parent = Converted["_Tab2"]

	Converted["_UICorner5"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner5"].Parent = Converted["_Tab2"]

	Converted["_Visuals"].Text = ""
	Converted["_Visuals"].BackgroundColor3 = Color3.fromRGB(54.00000058114529, 54.00000058114529, 54.00000058114529)
	Converted["_Visuals"].BackgroundTransparency = 1
	Converted["_Visuals"].BorderSizePixel = 0
	Converted["_Visuals"].Size = UDim2.new(0, 110, 0, 25)
	Converted["_Visuals"].Name = "Visuals"
	Converted["_Visuals"].Parent = nil

	Converted["_CategoryType3"].Image = "rbxassetid://12383498554"
	Converted["_CategoryType3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_CategoryType3"].BackgroundTransparency = 1
	Converted["_CategoryType3"].BorderSizePixel = 0
	Converted["_CategoryType3"].Position = UDim2.new(0, 10, 0, 5)
	Converted["_CategoryType3"].Size = UDim2.new(0, 15, 0, 15)
	Converted["_CategoryType3"].Name = "CategoryType"
	Converted["_CategoryType3"].Parent = Converted["_Visuals"]

	Converted["_UICorner6"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner6"].Parent = Converted["_Visuals"]

	Converted["_Tab3"].Font = Enum.Font.JosefinSans
	Converted["_Tab3"].Text = "Visuals"
	Converted["_Tab3"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Tab3"].TextSize = 15
	Converted["_Tab3"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Tab3"].Active = true
	Converted["_Tab3"].BackgroundColor3 = Color3.fromRGB(54.00000438094139, 54.00000438094139, 54.00000438094139)
	Converted["_Tab3"].BackgroundTransparency = 1
	Converted["_Tab3"].BorderSizePixel = 0
	Converted["_Tab3"].Position = UDim2.new(0.318181813, 0, 0, 0)
	Converted["_Tab3"].Selectable = true
	Converted["_Tab3"].Size = UDim2.new(0, 75, 0, 25)
	Converted["_Tab3"].Name = "Tab"
	Converted["_Tab3"].Parent = Converted["_Visuals"]

	Converted["_UIPadding4"].PaddingTop = UDim.new(0, 5)
	Converted["_UIPadding4"].Parent = Converted["_Tab3"]

	Converted["_UICorner7"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner7"].Parent = Converted["_Tab3"]

	Converted["_Settings"].Text = ""
	Converted["_Settings"].BackgroundColor3 = Color3.fromRGB(54.00000058114529, 54.00000058114529, 54.00000058114529)
	Converted["_Settings"].BackgroundTransparency = 1
	Converted["_Settings"].BorderSizePixel = 0
	Converted["_Settings"].Size = UDim2.new(0, 110, 0, 25)
	Converted["_Settings"].Name = "Settings"
	Converted["_Settings"].Parent = Converted["_TabsListing"]
	Converted["_Settings"].MouseButton1Down:Connect(function()
		Converted["_PagesContainer"].Visible = true
		for i,v in next, Converted["_PagesContainer"]:GetChildren() do
			v.Visible = false
		end
		Converted["_SettingsTab"].Visible = true

		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
		local TweenService = game:GetService("TweenService")

		for i,v in next, Converted["_TabsListing"]:GetDescendants() do	
			if v:IsA("TextButton") or v:IsA("TextLabel") then 
				TweenService:Create(v, tweenInfo, {BackgroundTransparency = 1}):Play()
				TweenService:Create(v, tweenInfo, {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
			elseif v:IsA("ImageLabel") then
				TweenService:Create(v, tweenInfo, {ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
			end
		end
		TweenService:Create(Converted["_Settings"], tweenInfo, {BackgroundTransparency = 0.4}):Play()
		TweenService:Create(Converted["_Tab4"], tweenInfo, {TextColor3 = Color3.fromRGB(138, 201, 38)}):Play()
		TweenService:Create(Converted["_CategoryType4"], tweenInfo, {ImageColor3 = Color3.fromRGB(138, 201, 38)}):Play()
	end)

	--[[Converted["_Settings"].MouseEnter:Connect(function()
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
		local TweenService = game:GetService("TweenService")

		TweenService:Create(Converted["_Tab4"], tweenInfo, {TextColor3 = Color3.fromRGB(145, 145, 145)}):Play()
		TweenService:Create(Converted["_CategoryType4"], tweenInfo, {ImageColor3 = Color3.fromRGB(145, 145, 145)}):Play()
	end)

	Converted["_Settings"].MouseLeave:Connect(function()
		local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
		local TweenService = game:GetService("TweenService")

		TweenService:Create(Converted["_Tab4"], tweenInfo, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		TweenService:Create(Converted["_CategoryType4"], tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)]]

	Converted["_CategoryType4"].Image = "rbxassetid://12382167749"
	Converted["_CategoryType4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_CategoryType4"].BackgroundTransparency = 1
	Converted["_CategoryType4"].BorderSizePixel = 0
	Converted["_CategoryType4"].Position = UDim2.new(0, 10, 0, 5)
	Converted["_CategoryType4"].Size = UDim2.new(0, 15, 0, 15)
	Converted["_CategoryType4"].Name = "CategoryType"
	Converted["_CategoryType4"].Parent = Converted["_Settings"]

	Converted["_UICorner8"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner8"].Parent = Converted["_Settings"]

	Converted["_Tab4"].Font = Enum.Font.JosefinSans
	Converted["_Tab4"].Text = "Settings"
	Converted["_Tab4"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Tab4"].TextSize = 15
	Converted["_Tab4"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Tab4"].Active = true
	Converted["_Tab4"].BackgroundColor3 = Color3.fromRGB(54.00000438094139, 54.00000438094139, 54.00000438094139)
	Converted["_Tab4"].BackgroundTransparency = 1
	Converted["_Tab4"].BorderSizePixel = 0
	Converted["_Tab4"].Position = UDim2.new(0.318181813, 0, 0, 0)
	Converted["_Tab4"].Selectable = true
	Converted["_Tab4"].Size = UDim2.new(0, 75, 0, 25)
	Converted["_Tab4"].Name = "Tab"
	Converted["_Tab4"].Parent = Converted["_Settings"]

	Converted["_UIPadding5"].PaddingTop = UDim.new(0, 5)
	Converted["_UIPadding5"].Parent = Converted["_Tab4"]

	Converted["_UICorner9"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner9"].Parent = Converted["_Tab4"]

	Converted["_Pattern1"].Image = "rbxassetid://2151782136"
	Converted["_Pattern1"].ImageColor3 = Color3.fromRGB(21.000000648200512, 21.000000648200512, 21.000000648200512)
	Converted["_Pattern1"].ImageTransparency = 0.6000000238418579
	Converted["_Pattern1"].ScaleType = Enum.ScaleType.Tile
	Converted["_Pattern1"].SliceCenter = Rect.new(0, 256, 0, 256)
	Converted["_Pattern1"].TileSize = UDim2.new(0, 30, 0, 50)
	Converted["_Pattern1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Pattern1"].BackgroundTransparency = 1
	Converted["_Pattern1"].Position = UDim2.new(0, 0, 0.0843750015, 0)
	Converted["_Pattern1"].Size = UDim2.new(0, 470, 0, 293)
	Converted["_Pattern1"].ZIndex = 0
	Converted["_Pattern1"].Name = "Pattern"
	Converted["_Pattern1"].Parent = Converted["_MainFrame"]

	Converted["_Line"].BackgroundColor3 = Color3.fromRGB(92.00000211596489, 133.00000727176666, 27.000000290572643)
	Converted["_Line"].BorderSizePixel = 0
	Converted["_Line"].Position = UDim2.new(0, 0, 0.078125, 0)
	Converted["_Line"].Size = UDim2.new(0, 470, 0, 2)
	Converted["_Line"].Name = "Line"
	Converted["_Line"].Parent = Converted["_MainFrame"]

	Converted["_TopBar"].BackgroundColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_TopBar"].BorderSizePixel = 0
	Converted["_TopBar"].Size = UDim2.new(0, 470, 0, 25)
	Converted["_TopBar"].Name = "TopBar"
	Converted["_TopBar"].Parent = Converted["_MainFrame"]

	Converted["_InterfaceTitle"].Font = Enum.Font.JosefinSans
	Converted["_InterfaceTitle"].Text = libraryName
	Converted["_InterfaceTitle"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_InterfaceTitle"].TextSize = 17
	Converted["_InterfaceTitle"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_InterfaceTitle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_InterfaceTitle"].BackgroundTransparency = 1
	Converted["_InterfaceTitle"].BorderSizePixel = 0
	Converted["_InterfaceTitle"].Size = UDim2.new(0, 470, 0, 25)
	Converted["_InterfaceTitle"].Name = "InterfaceTitle"
	Converted["_InterfaceTitle"].Parent = Converted["_TopBar"]

	Converted["_UIPadding6"].PaddingLeft = UDim.new(0, 30)
	Converted["_UIPadding6"].PaddingTop = UDim.new(0, 7)
	Converted["_UIPadding6"].Parent = Converted["_InterfaceTitle"]

	Converted["_ImageLabel"].Image = "rbxassetid://12351293656"
	Converted["_ImageLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ImageLabel"].BackgroundTransparency = 1
	Converted["_ImageLabel"].BorderSizePixel = 0
	Converted["_ImageLabel"].Position = UDim2.new(0, 3, 0, 2)
	Converted["_ImageLabel"].Size = UDim2.new(0, 22, 0, 22)
	Converted["_ImageLabel"].Parent = Converted["_TopBar"]

	Converted["_Close"].Font = Enum.Font.Michroma
	Converted["_Close"].Text = "-"
	Converted["_Close"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Close"].TextSize = 47
	Converted["_Close"].TextWrapped = true
	Converted["_Close"].Active = false
	Converted["_Close"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Close"].BackgroundTransparency = 1
	Converted["_Close"].BorderSizePixel = 0
	Converted["_Close"].Position = UDim2.new(0.893617034, 0, 0, 0)
	Converted["_Close"].Selectable = false
	Converted["_Close"].Size = UDim2.new(0, 50, 0, 25)
	Converted["_Close"].Name = "Close"
	Converted["_Close"].Parent = Converted["_TopBar"]

	Converted["_Minimize"].Font = Enum.Font.Michroma
	Converted["_Minimize"].Text = "-"
	Converted["_Minimize"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Minimize"].TextSize = 47
	Converted["_Minimize"].TextWrapped = true
	Converted["_Minimize"].Active = false
	Converted["_Minimize"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Minimize"].BackgroundTransparency = 1
	Converted["_Minimize"].BorderSizePixel = 0
	Converted["_Minimize"].Position = UDim2.new(0.893617034, 0, 0, 0)
	Converted["_Minimize"].Selectable = false
	Converted["_Minimize"].Size = UDim2.new(0, 50, 0, 25)
	Converted["_Minimize"].Name = "Minimize"
	Converted["_Minimize"].Parent = Converted["_TopBar"]

	Converted["_PagesContainer"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_PagesContainer"].BackgroundTransparency = 1
	Converted["_PagesContainer"].BorderSizePixel = 0
	Converted["_PagesContainer"].Position = UDim2.new(0.254999995, 0, 0.0839999989, 0)
	Converted["_PagesContainer"].Size = UDim2.new(0, 350, 0, 292)
	Converted["_PagesContainer"].Name = "PagesContainer"
	Converted["_PagesContainer"].Parent = Converted["_MainFrame"]
	Converted["_PagesContainer"].Visible = false

	Converted["_DefaultTab"].ScrollBarImageColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_DefaultTab"].ScrollBarThickness = 2
	Converted["_DefaultTab"].Active = true
	Converted["_DefaultTab"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_DefaultTab"].BackgroundTransparency = 1
	Converted["_DefaultTab"].BorderSizePixel = 0
	Converted["_DefaultTab"].Size = UDim2.new(0, 350, 0, 292)
	Converted["_DefaultTab"].Visible = true
	Converted["_DefaultTab"].Name = "DefaultTab"
	Converted["_DefaultTab"].Parent = Converted["_PagesContainer"]

	Converted["_ClientProfile"].Image = "https://www.roblox.com/bust-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"
	Converted["_ClientProfile"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ClientProfile"].BackgroundTransparency = 1
	Converted["_ClientProfile"].Position = UDim2.new(0.794285715, 0, 0.0291095898, 0)
	Converted["_ClientProfile"].Size = UDim2.new(0, 50, 0, 50)
	Converted["_ClientProfile"].Name = "ClientProfile"
	Converted["_ClientProfile"].Parent = Converted["_DefaultTab"]

	Converted["_UICorner10"].CornerRadius = UDim.new(0, 50)
	Converted["_UICorner10"].Parent = Converted["_ClientProfile"]

	Converted["_UIStroke"].Color = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_UIStroke"].Thickness = 2.799999952316284
	Converted["_UIStroke"].Parent = Converted["_ClientProfile"]

	Converted["_WelcomeMessage"].Font = Enum.Font.GothamMedium
	Converted["_WelcomeMessage"].Text = "Hello,"
	Converted["_WelcomeMessage"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_WelcomeMessage"].TextSize = 25
	Converted["_WelcomeMessage"].TextWrapped = true
	Converted["_WelcomeMessage"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_WelcomeMessage"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_WelcomeMessage"].BackgroundTransparency = 1
	Converted["_WelcomeMessage"].Position = UDim2.new(0.0600000024, 0, 0.0599315092, 0)
	Converted["_WelcomeMessage"].Size = UDim2.new(0, 100, 0, 35)
	Converted["_WelcomeMessage"].Name = "WelcomeMessage"
	Converted["_WelcomeMessage"].Parent = Converted["_DefaultTab"]

	Converted["_ClientUsername"].Font = Enum.Font.GothamMedium
	Converted["_ClientUsername"].Text = game.Players.LocalPlayer.DisplayName or game.Players.LocalPlayer.Name
	Converted["_ClientUsername"].TextColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_ClientUsername"].TextSize = 25
	Converted["_ClientUsername"].TextWrapped = true
	Converted["_ClientUsername"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_ClientUsername"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ClientUsername"].BackgroundTransparency = 1
	Converted["_ClientUsername"].Position = UDim2.new(0.0601428598, 0, 0.109246582, 0)
	Converted["_ClientUsername"].Size = UDim2.new(0, 257, 0, 35)
	Converted["_ClientUsername"].Name = "ClientUsername"
	Converted["_ClientUsername"].Parent = Converted["_DefaultTab"]

	Converted["_LabelsContainer"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_LabelsContainer"].BackgroundTransparency = 1
	Converted["_LabelsContainer"].BorderSizePixel = 0
	Converted["_LabelsContainer"].Position = UDim2.new(0, 0, 0.16438356, 0)
	Converted["_LabelsContainer"].Size = UDim2.new(0, 350, 0, 350)
	Converted["_LabelsContainer"].Name = "LabelsContainer"
	Converted["_LabelsContainer"].Parent = Converted["_DefaultTab"]

	Converted["_Message"].BackgroundColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_Message"].BackgroundTransparency = 0.6499999761581421
	Converted["_Message"].Position = UDim2.new(0.0599999987, 0, 0.181506842, 0)
	Converted["_Message"].Size = UDim2.new(0, 305, 0, 35)
	Converted["_Message"].Name = "Message"
	Converted["_Message"].Parent = Converted["_LabelsContainer"]

	Converted["_UICorner11"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner11"].Parent = Converted["_Message"]

	Converted["_UIStroke1"].Color = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_UIStroke1"].Parent = Converted["_Message"]

	Converted["_MessageText"].Font = Enum.Font.Gotham
	Converted["_MessageText"].RichText = true
	Converted["_MessageText"].Text = "This is a <b>message</b>"
	Converted["_MessageText"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_MessageText"].TextSize = 14
	Converted["_MessageText"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_MessageText"].TextWrapped = true
	Converted["_MessageText"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_MessageText"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_MessageText"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_MessageText"].BackgroundTransparency = 1
	Converted["_MessageText"].Position = UDim2.new(0.104918033, 0, 0, 0)
	Converted["_MessageText"].Size = UDim2.new(0, 260, 0, 35)
	Converted["_MessageText"].Name = "MessageText"
	Converted["_MessageText"].Parent = Converted["_Message"]

	Converted["_UICorner12"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner12"].Parent = Converted["_MessageText"]

	Converted["_UIPadding7"].PaddingLeft = UDim.new(0, 5)
	Converted["_UIPadding7"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding7"].Parent = Converted["_MessageText"]

	Converted["_check"].Image = "rbxassetid://3926305904"
	Converted["_check"].ImageColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_check"].ImageRectOffset = Vector2.new(312, 4)
	Converted["_check"].ImageRectSize = Vector2.new(24, 24)
	Converted["_check"].Active = true
	Converted["_check"].BackgroundTransparency = 1
	Converted["_check"].Position = UDim2.new(-0.113469571, 0, 0, -5)
	Converted["_check"].Selectable = true
	Converted["_check"].Size = UDim2.new(0, 25, 0, 25)
	Converted["_check"].ZIndex = 2
	Converted["_check"].Name = "check"
	Converted["_check"].Parent = Converted["_MessageText"]

	Converted["_Information"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 111.00000858306885, 177.0000046491623)
	Converted["_Information"].BackgroundTransparency = 0.6499999761581421
	Converted["_Information"].ClipsDescendants = true
	Converted["_Information"].Position = UDim2.new(0.0599999987, 0, 0.400000006, 0)
	Converted["_Information"].Size = UDim2.new(0, 305, 0, 35)
	Converted["_Information"].Name = "Information"
	Converted["_Information"].Parent = Converted["_LabelsContainer"]

	Converted["_UICorner13"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner13"].Parent = Converted["_Information"]

	Converted["_UIStroke2"].Color = Color3.fromRGB(58.00000034272671, 145.00000655651093, 199.0000033378601)
	Converted["_UIStroke2"].Parent = Converted["_Information"]

	Converted["_InfoText"].Font = Enum.Font.Gotham
	Converted["_InfoText"].RichText = true
	Converted["_InfoText"].Text = "This is <b>information</b>"
	Converted["_InfoText"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_InfoText"].TextSize = 14
	Converted["_InfoText"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_InfoText"].TextWrapped = true
	Converted["_InfoText"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_InfoText"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_InfoText"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_InfoText"].BackgroundTransparency = 1
	Converted["_InfoText"].Position = UDim2.new(0.104918033, 0, 0, 0)
	Converted["_InfoText"].Size = UDim2.new(0, 260, 0, 35)
	Converted["_InfoText"].Name = "InfoText"
	Converted["_InfoText"].Parent = Converted["_Information"]

	Converted["_UICorner14"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner14"].Parent = Converted["_InfoText"]

	Converted["_UIPadding8"].PaddingLeft = UDim.new(0, 5)
	Converted["_UIPadding8"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding8"].Parent = Converted["_InfoText"]

	Converted["_ImageLabel1"].Image = "rbxassetid://12372092225"
	Converted["_ImageLabel1"].ImageColor3 = Color3.fromRGB(74.0000031888485, 189.00000393390656, 255)
	Converted["_ImageLabel1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ImageLabel1"].BackgroundTransparency = 1
	Converted["_ImageLabel1"].BorderSizePixel = 0
	Converted["_ImageLabel1"].Position = UDim2.new(-0.104999997, 0, 0, -3)
	Converted["_ImageLabel1"].Size = UDim2.new(0, 22, 0, 22)
	Converted["_ImageLabel1"].Parent = Converted["_InfoText"]

	Converted["_ChangeLogs"].BackgroundColor3 = Color3.fromRGB(44.000001177191734, 44.000001177191734, 44.000001177191734)
	Converted["_ChangeLogs"].BackgroundTransparency = 0.4000000059604645
	Converted["_ChangeLogs"].ClipsDescendants = true
	Converted["_ChangeLogs"].Position = UDim2.new(0.0599999987, 0, 0.300000012, 0)
	Converted["_ChangeLogs"].Size = UDim2.new(0, 305, 0, 35)
	Converted["_ChangeLogs"].Name = "ChangeLogs"
	Converted["_ChangeLogs"].Parent = Converted["_LabelsContainer"]

	Converted["_UICorner15"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner15"].Parent = Converted["_ChangeLogs"]

	Converted["_UIStroke3"].Color = Color3.fromRGB(85.0000025331974, 85.0000025331974, 85.0000025331974)
	Converted["_UIStroke3"].Parent = Converted["_ChangeLogs"]

	Converted["_ChangeLogText"].Font = Enum.Font.Gotham
	Converted["_ChangeLogText"].RichText = true
	Converted["_ChangeLogText"].Text = "<b>Change Logs</b>"

	Converted["_ChangeLogText"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ChangeLogText"].TextSize = 14
	Converted["_ChangeLogText"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_ChangeLogText"].TextWrapped = true
	Converted["_ChangeLogText"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_ChangeLogText"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_ChangeLogText"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ChangeLogText"].BackgroundTransparency = 1
	Converted["_ChangeLogText"].Position = UDim2.new(0.104918033, 0, 0, 0)
	Converted["_ChangeLogText"].Size = UDim2.new(0, 260, 0, 35)
	Converted["_ChangeLogText"].Name = "ChangeLogText"
	Converted["_ChangeLogText"].Parent = Converted["_ChangeLogs"]

	Converted["_UICorner16"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner16"].Parent = Converted["_ChangeLogText"]

	Converted["_UIPadding9"].PaddingLeft = UDim.new(0, 5)
	Converted["_UIPadding9"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding9"].Parent = Converted["_ChangeLogText"]

	Converted["_build"].Image = "rbxassetid://3926307971"
	Converted["_build"].ImageColor3 = Color3.fromRGB(167.00000524520874, 167.00000524520874, 167.00000524520874)
	Converted["_build"].ImageRectOffset = Vector2.new(964, 4)
	Converted["_build"].ImageRectSize = Vector2.new(36, 36)
	Converted["_build"].Active = true
	Converted["_build"].BackgroundTransparency = 1
	Converted["_build"].Position = UDim2.new(-0.104999997, 0, 0, -2)
	Converted["_build"].Selectable = true
	Converted["_build"].Size = UDim2.new(0, 20, 0, 20)
	Converted["_build"].ZIndex = 2
	Converted["_build"].Name = "build"
	Converted["_build"].Parent = Converted["_ChangeLogText"]

	Converted["_UIListLayout1"].Padding = UDim.new(0, 10)
	Converted["_UIListLayout1"].SortOrder = Enum.SortOrder.LayoutOrder
	Converted["_UIListLayout1"].Parent = Converted["_LabelsContainer"]

	Converted["_UIPadding10"].PaddingLeft = UDim.new(0, 20)
	Converted["_UIPadding10"].PaddingTop = UDim.new(0, 5)
	Converted["_UIPadding10"].Parent = Converted["_LabelsContainer"]

	Converted["_TestTab"].ScrollBarImageColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_TestTab"].ScrollBarThickness = 2
	Converted["_TestTab"].Active = true
	Converted["_TestTab"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_TestTab"].BackgroundTransparency = 1
	Converted["_TestTab"].BorderSizePixel = 0
	Converted["_TestTab"].Size = UDim2.new(0, 350, 0, 292)
	Converted["_TestTab"].Name = "TestTab"
	Converted["_TestTab"].Parent = nil

	Converted["_Toggle"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_Toggle"].ClipsDescendants = true
	Converted["_Toggle"].Position = UDim2.new(0.0599999987, 0, 0.300000012, 0)
	Converted["_Toggle"].Size = UDim2.new(0, 305, 0, 50)
	Converted["_Toggle"].Name = "Toggle"
	Converted["_Toggle"].Parent = nil

	Converted["_UICorner17"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner17"].Parent = Converted["_Toggle"]

	Converted["_UIStroke4"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke4"].Parent = Converted["_Toggle"]

	Converted["_ToggleTitle"].Font = Enum.Font.GothamBold
	Converted["_ToggleTitle"].RichText = true
	Converted["_ToggleTitle"].Text = "Test"
	Converted["_ToggleTitle"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ToggleTitle"].TextSize = 14
	Converted["_ToggleTitle"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_ToggleTitle"].TextWrapped = true
	Converted["_ToggleTitle"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_ToggleTitle"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_ToggleTitle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ToggleTitle"].BackgroundTransparency = 1
	Converted["_ToggleTitle"].Size = UDim2.new(0, 170, 0, 25)
	Converted["_ToggleTitle"].Name = "ToggleTitle"
	Converted["_ToggleTitle"].Parent = nil

	Converted["_UICorner18"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner18"].Parent = Converted["_ToggleTitle"]

	Converted["_UIPadding11"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding11"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding11"].Parent = Converted["_ToggleTitle"]

	Converted["_ToggleDescription"].Font = Enum.Font.GothamMedium
	Converted["_ToggleDescription"].RichText = true
	Converted["_ToggleDescription"].Text = "Test"
	Converted["_ToggleDescription"].TextColor3 = Color3.fromRGB(147.00000643730164, 147.00000643730164, 147.00000643730164)
	Converted["_ToggleDescription"].TextSize = 14
	Converted["_ToggleDescription"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_ToggleDescription"].TextWrapped = true
	Converted["_ToggleDescription"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_ToggleDescription"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_ToggleDescription"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ToggleDescription"].BackgroundTransparency = 1
	Converted["_ToggleDescription"].Position = UDim2.new(0, -10, 0, 10)
	Converted["_ToggleDescription"].Size = UDim2.new(0, 170, 0, 25)
	Converted["_ToggleDescription"].Name = "ToggleDescription"
	Converted["_ToggleDescription"].Parent = nil

	Converted["_UICorner19"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner19"].Parent = Converted["_ToggleDescription"]

	Converted["_UIPadding12"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding12"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding12"].Parent = Converted["_ToggleDescription"]

	Converted["_ToggleFunction"].Text = ""
	Converted["_ToggleFunction"].Active = false
	Converted["_ToggleFunction"].BackgroundColor3 = Color3.fromRGB(39.00000147521496, 39.00000147521496, 39.00000147521496)
	Converted["_ToggleFunction"].Position = UDim2.new(1.5, 0, 0.333333343, 0)
	Converted["_ToggleFunction"].Selectable = false
	Converted["_ToggleFunction"].Size = UDim2.new(0, 40, 0, 20)
	Converted["_ToggleFunction"].Name = "ToggleFunction"
	Converted["_ToggleFunction"].Parent = nil

	Converted["_Circle"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Circle"].Size = UDim2.new(0, 20, 0, 20)
	Converted["_Circle"].Name = "Circle"
	Converted["_Circle"].Parent = nil

	Converted["_UICorner20"].CornerRadius = UDim.new(0, 50)
	Converted["_UICorner20"].Parent = Converted["_Circle"]

	Converted["_UICorner21"].CornerRadius = UDim.new(0, 50)
	Converted["_UICorner21"].Parent = Converted["_ToggleFunction"]

	Converted["_UIListLayout2"].Padding = UDim.new(0, 10)
	Converted["_UIListLayout2"].SortOrder = Enum.SortOrder.LayoutOrder
	Converted["_UIListLayout2"].Parent = Converted["_TestTab"]

	Converted["_UIPadding13"].PaddingLeft = UDim.new(0, 20)
	Converted["_UIPadding13"].PaddingTop = UDim.new(0, 20)
	Converted["_UIPadding13"].Parent = Converted["_TestTab"]

	Converted["_Slider"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_Slider"].ClipsDescendants = true
	Converted["_Slider"].Position = UDim2.new(0.0599999987, 0, 0.300000012, 0)
	Converted["_Slider"].Size = UDim2.new(0, 305, 0, 50)
	Converted["_Slider"].Name = "Slider"
	Converted["_Slider"].Parent = nil

	Converted["_UICorner22"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner22"].Parent = Converted["_Slider"]

	Converted["_UIStroke5"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke5"].Parent = Converted["_Slider"]

	Converted["_SliderTitle"].Font = Enum.Font.GothamBold
	Converted["_SliderTitle"].RichText = true
	Converted["_SliderTitle"].Text = "Test"
	Converted["_SliderTitle"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_SliderTitle"].TextSize = 14
	Converted["_SliderTitle"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_SliderTitle"].TextWrapped = true
	Converted["_SliderTitle"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_SliderTitle"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_SliderTitle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_SliderTitle"].BackgroundTransparency = 1
	Converted["_SliderTitle"].Size = UDim2.new(0, 170, 0, 25)
	Converted["_SliderTitle"].Name = "SliderTitle"
	Converted["_SliderTitle"].Parent = Converted["_Slider"]

	Converted["_UICorner23"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner23"].Parent = Converted["_SliderTitle"]

	Converted["_UIPadding14"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding14"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding14"].Parent = Converted["_SliderTitle"]

	Converted["_SliderContainer"].BackgroundColor3 = Color3.fromRGB(26.00000225007534, 26.00000225007534, 26.00000225007534)
	Converted["_SliderContainer"].Position = UDim2.new(0, 0, 0, 20)
	Converted["_SliderContainer"].Size = UDim2.new(0, 285, 0, 10)
	Converted["_SliderContainer"].Name = "SliderContainer"
	Converted["_SliderContainer"].Parent = Converted["_SliderTitle"]

	Converted["_UICorner24"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner24"].Parent = Converted["_SliderContainer"]

	Converted["_UIStroke6"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke6"].Parent = Converted["_SliderContainer"]

	Converted["_SliderFrame"].BackgroundColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_SliderFrame"].Size = UDim2.new(0, 50, 0, 10)
	Converted["_SliderFrame"].Name = "SliderFrame"
	Converted["_SliderFrame"].Parent = Converted["_SliderContainer"]

	Converted["_UICorner25"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner25"].Parent = Converted["_SliderFrame"]

	Converted["_MoveSlider"].Font = Enum.Font.SourceSans
	Converted["_MoveSlider"].Text = ""
	Converted["_MoveSlider"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_MoveSlider"].TextSize = 14
	Converted["_MoveSlider"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_MoveSlider"].BackgroundTransparency = 1
	Converted["_MoveSlider"].BorderSizePixel = 0
	Converted["_MoveSlider"].Size = UDim2.new(0, 285, 0, 10)
	Converted["_MoveSlider"].ZIndex = 2
	Converted["_MoveSlider"].Name = "MoveSlider"
	Converted["_MoveSlider"].Parent = Converted["_SliderFrame"]

	Converted["_SliderValue"].Font = Enum.Font.Gotham
	Converted["_SliderValue"].RichText = true
	Converted["_SliderValue"].Text = "10004"
	Converted["_SliderValue"].TextColor3 = Color3.fromRGB(176.00000470876694, 176.00000470876694, 176.00000470876694)
	Converted["_SliderValue"].TextSize = 14
	Converted["_SliderValue"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_SliderValue"].TextWrapped = true
	Converted["_SliderValue"].TextXAlignment = Enum.TextXAlignment.Right
	Converted["_SliderValue"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_SliderValue"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_SliderValue"].BackgroundTransparency = 1
	Converted["_SliderValue"].Position = UDim2.new(0, 206, 0, 0)
	Converted["_SliderValue"].Size = UDim2.new(0, 100, 0, 25)
	Converted["_SliderValue"].Name = "SliderValue"
	Converted["_SliderValue"].Parent = Converted["_Slider"]

	Converted["_UICorner26"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner26"].Parent = Converted["_SliderValue"]

	Converted["_UIPadding15"].PaddingRight = UDim.new(0, 12)
	Converted["_UIPadding15"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding15"].Parent = Converted["_SliderValue"]

	Converted["_DropDown"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_DropDown"].ClipsDescendants = true
	Converted["_DropDown"].Position = UDim2.new(0.0599999987, 0, 0.300000012, 0)
	Converted["_DropDown"].Size = UDim2.new(0, 305, 0, 100)
	Converted["_DropDown"].Name = "DropDown"
	Converted["_DropDown"].Parent = nil

	Converted["_UICorner27"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner27"].Parent = Converted["_DropDown"]

	Converted["_UIStroke7"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke7"].Parent = Converted["_DropDown"]

	Converted["_DropDownTitle"].Font = Enum.Font.GothamBold
	Converted["_DropDownTitle"].RichText = true
	Converted["_DropDownTitle"].Text = "Test"
	Converted["_DropDownTitle"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_DropDownTitle"].TextSize = 14
	Converted["_DropDownTitle"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_DropDownTitle"].TextWrapped = true
	Converted["_DropDownTitle"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_DropDownTitle"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_DropDownTitle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_DropDownTitle"].BackgroundTransparency = 1
	Converted["_DropDownTitle"].Size = UDim2.new(0, 170, 0, 25)
	Converted["_DropDownTitle"].Name = "DropDownTitle"
	Converted["_DropDownTitle"].Parent = Converted["_DropDown"]

	Converted["_UICorner28"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner28"].Parent = Converted["_DropDownTitle"]

	Converted["_UIPadding16"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding16"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding16"].Parent = Converted["_DropDownTitle"]

	Converted["_ImageLabel2"].Image = "rbxassetid://12379519372"
	Converted["_ImageLabel2"].ImageColor3 = Color3.fromRGB(66.00000366568565, 66.00000366568565, 66.00000366568565)
	Converted["_ImageLabel2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ImageLabel2"].BackgroundTransparency = 1
	Converted["_ImageLabel2"].Position = UDim2.new(0, 270, 0, 0)
	Converted["_ImageLabel2"].Size = UDim2.new(0, 15, 0, 15)
	Converted["_ImageLabel2"].Parent = Converted["_DropDownTitle"]

	Converted["_SelectedItem"].Font = Enum.Font.GothamMedium
	Converted["_SelectedItem"].RichText = true
	Converted["_SelectedItem"].Text = "Selected:"
	Converted["_SelectedItem"].TextColor3 = Color3.fromRGB(147.00000643730164, 147.00000643730164, 147.00000643730164)
	Converted["_SelectedItem"].TextSize = 14
	Converted["_SelectedItem"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_SelectedItem"].TextWrapped = true
	Converted["_SelectedItem"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_SelectedItem"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_SelectedItem"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_SelectedItem"].BackgroundTransparency = 1
	Converted["_SelectedItem"].Position = UDim2.new(0, -10, 0, 10)
	Converted["_SelectedItem"].Size = UDim2.new(0, 170, 0, 25)
	Converted["_SelectedItem"].Name = "SelectedItem"
	Converted["_SelectedItem"].Parent = Converted["_DropDownTitle"]

	Converted["_UICorner29"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner29"].Parent = Converted["_SelectedItem"]

	Converted["_UIPadding17"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding17"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding17"].Parent = Converted["_SelectedItem"]

	Converted["_DropDownButton"].Font = Enum.Font.SourceSans
	Converted["_DropDownButton"].Text = ""
	Converted["_DropDownButton"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_DropDownButton"].TextSize = 14
	Converted["_DropDownButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_DropDownButton"].BackgroundTransparency = 1
	Converted["_DropDownButton"].BorderSizePixel = 0
	Converted["_DropDownButton"].Size = UDim2.new(0, 305, 0, 50)
	Converted["_DropDownButton"].ZIndex = 2
	Converted["_DropDownButton"].Name = "DropDownButton"
	Converted["_DropDownButton"].Parent = Converted["_DropDown"]

	Converted["_ItemsContainer"].Active = true
	Converted["_ItemsContainer"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ItemsContainer"].BackgroundTransparency = 1
	Converted["_ItemsContainer"].BorderSizePixel = 0
	Converted["_ItemsContainer"].ClipsDescendants = true
	Converted["_ItemsContainer"].Position = UDim2.new(0, 0, 0, 45)
	Converted["_ItemsContainer"].Selectable = true
	Converted["_ItemsContainer"].Size = UDim2.new(0, 305, 0, 55)
	Converted["_ItemsContainer"].SelectionGroup = true
	Converted["_ItemsContainer"].Name = "ItemsContainer"
	Converted["_ItemsContainer"].Parent = Converted["_DropDown"]

	Converted["_UICorner30"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner30"].Parent = Converted["_ItemsContainer"]

	Converted["_UIListLayout3"].Padding = UDim.new(0, 5)
	Converted["_UIListLayout3"].SortOrder = Enum.SortOrder.LayoutOrder
	Converted["_UIListLayout3"].Parent = Converted["_ItemsContainer"]

	Converted["_UIPadding18"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding18"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding18"].Parent = Converted["_ItemsContainer"]

	Converted["_DropDownObject"].BackgroundColor3 = Color3.fromRGB(36.00000165402889, 36.00000165402889, 36.00000165402889)
	Converted["_DropDownObject"].Size = UDim2.new(0, 285, 0, 25)
	Converted["_DropDownObject"].Name = "DropDownObject"
	Converted["_DropDownObject"].Parent = Converted["_ItemsContainer"]

	Converted["_UICorner31"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner31"].Parent = Converted["_DropDownObject"]

	Converted["_ImageLabel3"].Image = "rbxassetid://12380382021"
	Converted["_ImageLabel3"].ImageColor3 = Color3.fromRGB(135.00000715255737, 135.00000715255737, 135.00000715255737)
	Converted["_ImageLabel3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ImageLabel3"].BackgroundTransparency = 1
	Converted["_ImageLabel3"].BorderSizePixel = 0
	Converted["_ImageLabel3"].Position = UDim2.new(0, 260, 0, 4)
	Converted["_ImageLabel3"].Size = UDim2.new(0, 17, 0, 17)
	Converted["_ImageLabel3"].Parent = Converted["_DropDownObject"]

	Converted["_UIStroke8"].Color = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997)
	Converted["_UIStroke8"].Parent = Converted["_DropDownObject"]

	Converted["_ItemButton"].Font = Enum.Font.GothamMedium
	Converted["_ItemButton"].Text = "Item"
	Converted["_ItemButton"].TextColor3 = Color3.fromRGB(156.00000590085983, 156.00000590085983, 156.00000590085983)
	Converted["_ItemButton"].TextSize = 14
	Converted["_ItemButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ItemButton"].BackgroundTransparency = 1
	Converted["_ItemButton"].BorderSizePixel = 0
	Converted["_ItemButton"].Size = UDim2.new(0, 285, 0, 25)
	Converted["_ItemButton"].Name = "ItemButton"
	Converted["_ItemButton"].Parent = Converted["_DropDownObject"]

	Converted["_Button"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_Button"].ClipsDescendants = true
	Converted["_Button"].Position = UDim2.new(0.0599999987, 0, 0.300000012, 0)
	Converted["_Button"].Size = UDim2.new(0, 305, 0, 35)
	Converted["_Button"].Name = "Button"
	Converted["_Button"].Parent = nil

	Converted["_UICorner32"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner32"].Parent = Converted["_Button"]

	Converted["_UIStroke9"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke9"].Parent = Converted["_Button"]

	Converted["_ImageLabel4"].Image = "rbxassetid://12380689516"
	Converted["_ImageLabel4"].ImageColor3 = Color3.fromRGB(94.0000019967556, 94.0000019967556, 94.0000019967556)
	Converted["_ImageLabel4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ImageLabel4"].BackgroundTransparency = 1
	Converted["_ImageLabel4"].BorderSizePixel = 0
	Converted["_ImageLabel4"].Position = UDim2.new(0, 275, 0, 10)
	Converted["_ImageLabel4"].Size = UDim2.new(0, 15, 0, 15)
	Converted["_ImageLabel4"].Parent = nil

	Converted["_ButtonFunction"].Font = Enum.Font.GothamBold
	Converted["_ButtonFunction"].RichText = true
	Converted["_ButtonFunction"].TextColor3 = Color3.fromRGB(147.00000643730164, 147.00000643730164, 147.00000643730164)
	Converted["_ButtonFunction"].TextSize = 14
	Converted["_ButtonFunction"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_ButtonFunction"].TextWrapped = true
	Converted["_ButtonFunction"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_ButtonFunction"].Active = false
	Converted["_ButtonFunction"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ButtonFunction"].BackgroundTransparency = 1
	Converted["_ButtonFunction"].Selectable = false
	Converted["_ButtonFunction"].Size = UDim2.new(0, 305, 0, 35)
	Converted["_ButtonFunction"].Name = "ButtonFunction"
	Converted["_ButtonFunction"].Parent = nil

	Converted["_UICorner33"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner33"].Parent = Converted["_ButtonFunction"]

	Converted["_UIPadding19"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding19"].Parent = Converted["_ButtonFunction"]

	Converted["_Section"].Font = Enum.Font.GothamBold
	Converted["_Section"].Text = "Server"
	Converted["_Section"].TextColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_Section"].TextSize = 15
	Converted["_Section"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Section"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Section"].BackgroundTransparency = 1
	Converted["_Section"].BorderSizePixel = 0
	Converted["_Section"].Size = UDim2.new(0, 305, 0, 20)
	Converted["_Section"].Name = "Section"
	Converted["_Section"].Parent = nil

	Converted["_UIPadding20"].PaddingLeft = UDim.new(0, 3)
	Converted["_UIPadding20"].Parent = Converted["_Section"]

	Converted["_TextBox"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_TextBox"].ClipsDescendants = true
	Converted["_TextBox"].Position = UDim2.new(0.0599999987, 0, 0.300000012, 0)
	Converted["_TextBox"].Size = UDim2.new(0, 305, 0, 50)
	Converted["_TextBox"].Name = "TextBox"
	Converted["_TextBox"].Parent = nil

	Converted["_UICorner34"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner34"].Parent = Converted["_TextBox"]

	Converted["_UIStroke10"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke10"].Parent = Converted["_TextBox"]

	Converted["_TextBoxTitle"].Font = Enum.Font.GothamBold
	Converted["_TextBoxTitle"].RichText = true
	Converted["_TextBoxTitle"].Text = "Test"
	Converted["_TextBoxTitle"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_TextBoxTitle"].TextSize = 14
	Converted["_TextBoxTitle"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_TextBoxTitle"].TextWrapped = true
	Converted["_TextBoxTitle"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_TextBoxTitle"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_TextBoxTitle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_TextBoxTitle"].BackgroundTransparency = 1
	Converted["_TextBoxTitle"].Size = UDim2.new(0, 170, 0, 25)
	Converted["_TextBoxTitle"].Name = "TextBoxTitle"
	Converted["_TextBoxTitle"].Parent = Converted["_TextBox"]

	Converted["_UICorner35"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner35"].Parent = Converted["_TextBoxTitle"]

	Converted["_UIPadding21"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding21"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding21"].Parent = Converted["_TextBoxTitle"]

	Converted["_InputtedString"].Font = Enum.Font.GothamMedium
	Converted["_InputtedString"].PlaceholderText = "Enter Value"
	Converted["_InputtedString"].RichText = true
	Converted["_InputtedString"].Text = ""
	Converted["_InputtedString"].TextColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_InputtedString"].TextSize = 14
	Converted["_InputtedString"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_InputtedString"].TextWrapped = true
	Converted["_InputtedString"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_InputtedString"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_InputtedString"].Active = false
	Converted["_InputtedString"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_InputtedString"].BackgroundTransparency = 1
	Converted["_InputtedString"].Position = UDim2.new(0, -10, 0, 10)
	Converted["_InputtedString"].Selectable = false
	Converted["_InputtedString"].Size = UDim2.new(0, 305, 0, 25)
	Converted["_InputtedString"].Name = "InputtedString"
	Converted["_InputtedString"].Parent = Converted["_TextBoxTitle"]

	Converted["_UICorner36"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner36"].Parent = Converted["_InputtedString"]

	Converted["_UIPadding22"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding22"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding22"].Parent = Converted["_InputtedString"]

	Converted["_ImageLabel5"].Image = "rbxassetid://12381304968"
	Converted["_ImageLabel5"].ImageColor3 = Color3.fromRGB(153.00000607967377, 153.00000607967377, 153.00000607967377)
	Converted["_ImageLabel5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ImageLabel5"].BackgroundTransparency = 1
	Converted["_ImageLabel5"].BorderSizePixel = 0
	Converted["_ImageLabel5"].Position = UDim2.new(0, 275, 0, 5)
	Converted["_ImageLabel5"].Size = UDim2.new(0, 20, 0, 20)
	Converted["_ImageLabel5"].Parent = Converted["_TextBox"]

	Converted["_KeyBind"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_KeyBind"].ClipsDescendants = true
	Converted["_KeyBind"].Position = UDim2.new(0.0599999987, 0, 0.300000012, 0)
	Converted["_KeyBind"].Size = UDim2.new(0, 305, 0, 30)
	Converted["_KeyBind"].Name = "KeyBind"
	Converted["_KeyBind"].Parent = nil

	Converted["_UICorner37"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner37"].Parent = Converted["_KeyBind"]

	Converted["_UIStroke11"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke11"].Parent = Converted["_KeyBind"]

	Converted["_KeyBindTitle"].Font = Enum.Font.GothamBold
	Converted["_KeyBindTitle"].RichText = true
	Converted["_KeyBindTitle"].Text = "Test"
	Converted["_KeyBindTitle"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_KeyBindTitle"].TextSize = 14
	Converted["_KeyBindTitle"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_KeyBindTitle"].TextWrapped = true
	Converted["_KeyBindTitle"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_KeyBindTitle"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_KeyBindTitle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_KeyBindTitle"].BackgroundTransparency = 1
	Converted["_KeyBindTitle"].Size = UDim2.new(0, 170, 0, 25)
	Converted["_KeyBindTitle"].Name = "KeyBindTitle"
	Converted["_KeyBindTitle"].Parent = Converted["_KeyBind"]

	Converted["_UICorner38"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner38"].Parent = Converted["_KeyBindTitle"]

	Converted["_UIPadding23"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding23"].PaddingTop = UDim.new(0, 9)
	Converted["_UIPadding23"].Parent = Converted["_KeyBindTitle"]

	Converted["_HotKeyInputted"].Font = Enum.Font.GothamMedium
	Converted["_HotKeyInputted"].PlaceholderText = "..."
	Converted["_HotKeyInputted"].RichText = true
	Converted["_HotKeyInputted"].Text = ""
	Converted["_HotKeyInputted"].TextColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_HotKeyInputted"].TextSize = 14
	Converted["_HotKeyInputted"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_HotKeyInputted"].TextWrapped = true
	Converted["_HotKeyInputted"].TextXAlignment = Enum.TextXAlignment.Right
	Converted["_HotKeyInputted"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_HotKeyInputted"].Active = false
	Converted["_HotKeyInputted"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_HotKeyInputted"].BackgroundTransparency = 1
	Converted["_HotKeyInputted"].Position = UDim2.new(0, 225, 0, 0)
	Converted["_HotKeyInputted"].Selectable = false
	Converted["_HotKeyInputted"].Size = UDim2.new(0, 80, 0, 25)
	Converted["_HotKeyInputted"].Name = "HotKeyInputted"
	Converted["_HotKeyInputted"].Parent = Converted["_KeyBind"]

	Converted["_UICorner39"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner39"].Parent = Converted["_HotKeyInputted"]

	Converted["_UIPadding24"].PaddingRight = UDim.new(0, 15)
	Converted["_UIPadding24"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding24"].Parent = Converted["_HotKeyInputted"]

	Converted["_SettingsTab"].ScrollBarImageColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_SettingsTab"].ScrollBarThickness = 2
	Converted["_SettingsTab"].Active = true
	Converted["_SettingsTab"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_SettingsTab"].BackgroundTransparency = 1
	Converted["_SettingsTab"].BorderSizePixel = 0
	Converted["_SettingsTab"].Size = UDim2.new(0, 350, 0, 292)
	Converted["_SettingsTab"].Visible = false
	Converted["_SettingsTab"].Name = "SettingsTab"
	Converted["_SettingsTab"].Parent = Converted["_PagesContainer"]

	Converted["_UIPadding25"].PaddingLeft = UDim.new(0, 20)
	Converted["_UIPadding25"].PaddingTop = UDim.new(0, 20)
	Converted["_UIPadding25"].Parent = Converted["_SettingsTab"]

	Converted["_UIListLayout4"].Padding = UDim.new(0, 10)
	Converted["_UIListLayout4"].SortOrder = Enum.SortOrder.LayoutOrder
	Converted["_UIListLayout4"].Parent = Converted["_SettingsTab"]

	Converted["_ThemePicker"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ThemePicker"].BackgroundTransparency = 1
	Converted["_ThemePicker"].Position = UDim2.new(0, 0, -0.551470578, 0)
	Converted["_ThemePicker"].Size = UDim2.new(0, 310, 0, 295)
	Converted["_ThemePicker"].Name = "ThemePicker"
	Converted["_ThemePicker"].Parent = Converted["_SettingsTab"]

	Converted["_UICorner40"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner40"].Parent = Converted["_ThemePicker"]

	Converted["_Hue"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_Hue"].ClipsDescendants = true
	Converted["_Hue"].Size = UDim2.new(0, 255, 0, 240)
	Converted["_Hue"].Name = "Hue"
	Converted["_Hue"].Parent = Converted["_ThemePicker"]

	Converted["_UICorner41"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner41"].Parent = Converted["_Hue"]

	Converted["_UIStroke12"].Color = Color3.fromRGB(90.00000223517418, 90.00000223517418, 90.00000223517418)
	Converted["_UIStroke12"].Thickness = 2
	Converted["_UIStroke12"].Parent = Converted["_Hue"]

	Converted["_ImageLabel6"].Image = "http://www.roblox.com/asset/?id=328298876"
	Converted["_ImageLabel6"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ImageLabel6"].Size = UDim2.new(0, 255, 0, 240)
	Converted["_ImageLabel6"].Parent = Converted["_Hue"]

	Converted["_UICorner42"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner42"].Parent = Converted["_ImageLabel6"]

	Converted["_ColorCursor"].Font = Enum.Font.SourceSans
	Converted["_ColorCursor"].Text = ""
	Converted["_ColorCursor"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_ColorCursor"].TextSize = 14
	Converted["_ColorCursor"].BackgroundColor3 = Color3.fromRGB(52.00000450015068, 52.00000450015068, 52.00000450015068)
	Converted["_ColorCursor"].Position = UDim2.new(0.282352954, 0, 0.375, 0)
	Converted["_ColorCursor"].Size = UDim2.new(0, 20, 0, 20)
	Converted["_ColorCursor"].Name = "ColorCursor"
	Converted["_ColorCursor"].Parent = Converted["_Hue"]

	Converted["_UICorner43"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner43"].Parent = Converted["_ColorCursor"]

	Converted["_Saturation"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Saturation"].ClipsDescendants = true
	Converted["_Saturation"].Position = UDim2.new(0, 280, 0, 0)
	Converted["_Saturation"].Size = UDim2.new(0, 25, 0, 240)
	Converted["_Saturation"].Name = "Saturation"
	Converted["_Saturation"].Parent = Converted["_ThemePicker"]

	Converted["_UICorner44"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner44"].Parent = Converted["_Saturation"]

	Converted["_UIStroke13"].Color = Color3.fromRGB(113.00000846385956, 113.00000846385956, 113.00000846385956)
	Converted["_UIStroke13"].Thickness = 2
	Converted["_UIStroke13"].Parent = Converted["_Saturation"]

	Converted["_UIGradient"].Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
	}
	Converted["_UIGradient"].Rotation = 270
	Converted["_UIGradient"].Parent = Converted["_Saturation"]

	Converted["_SaturationSlider"].Font = Enum.Font.SourceSans
	Converted["_SaturationSlider"].Text = ""
	Converted["_SaturationSlider"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_SaturationSlider"].TextSize = 14
	Converted["_SaturationSlider"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Converted["_SaturationSlider"].BorderSizePixel = 0
	Converted["_SaturationSlider"].Position = UDim2.new(0, 0, 0, 50)
	Converted["_SaturationSlider"].Size = UDim2.new(0, 25, 0, 3)
	Converted["_SaturationSlider"].Name = "SaturationSlider"
	Converted["_SaturationSlider"].Parent = Converted["_Saturation"]

	Converted["_ColorPreview"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ColorPreview"].ClipsDescendants = true
	Converted["_ColorPreview"].Position = UDim2.new(0, 280, 0, 260)
	Converted["_ColorPreview"].Size = UDim2.new(0, 25, 0, 25)
	Converted["_ColorPreview"].Name = "ColorPreview"
	Converted["_ColorPreview"].Parent = Converted["_ThemePicker"]

	Converted["_UICorner45"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner45"].Parent = Converted["_ColorPreview"]

	Converted["_UIStroke14"].Color = Color3.fromRGB(113.00000846385956, 113.00000846385956, 113.00000846385956)
	Converted["_UIStroke14"].Thickness = 2
	Converted["_UIStroke14"].Parent = Converted["_ColorPreview"]

	Converted["_ThemeButtonContainer"].Active = true
	Converted["_ThemeButtonContainer"].BackgroundColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_ThemeButtonContainer"].Position = UDim2.new(0, 0, 0, 260)
	Converted["_ThemeButtonContainer"].Selectable = true
	Converted["_ThemeButtonContainer"].Size = UDim2.new(0, 255, 0, 25)
	Converted["_ThemeButtonContainer"].Name = "ThemeButtonContainer"
	Converted["_ThemeButtonContainer"].Parent = Converted["_ThemePicker"]

	Converted["_UICorner46"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner46"].Parent = Converted["_ThemeButtonContainer"]

	Converted["_UIStroke15"].Color = Color3.fromRGB(64.00000378489494, 91.00000217556953, 17.00000088661909)
	Converted["_UIStroke15"].Parent = Converted["_ThemeButtonContainer"]

	Converted["_ApplyTheme"].Font = Enum.Font.GothamBold
	Converted["_ApplyTheme"].Text = "Apply Theme"
	Converted["_ApplyTheme"].TextSize = 15
	Converted["_ApplyTheme"].BackgroundColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_ApplyTheme"].Size = UDim2.new(0, 255, 0, 25)
	Converted["_ApplyTheme"].Name = "ApplyTheme"
	Converted["_ApplyTheme"].Parent = Converted["_ThemeButtonContainer"]

	Converted["_UICorner47"].CornerRadius = UDim.new(0, 10)
	Converted["_UICorner47"].Parent = Converted["_ApplyTheme"]

	Converted["_DragConfiguration"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_DragConfiguration"].ClipsDescendants = true
	Converted["_DragConfiguration"].Position = UDim2.new(0, 0, 0.0477941185, 0)
	Converted["_DragConfiguration"].Size = UDim2.new(0, 305, 0, 50)
	Converted["_DragConfiguration"].Name = "DragConfiguration"
	Converted["_DragConfiguration"].Parent = Converted["_SettingsTab"]

	Converted["_UICorner48"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner48"].Parent = Converted["_DragConfiguration"]

	Converted["_UIStroke16"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke16"].Parent = Converted["_DragConfiguration"]

	Converted["_DragSpeedTitle"].Font = Enum.Font.GothamBold
	Converted["_DragSpeedTitle"].RichText = true
	Converted["_DragSpeedTitle"].Text = "UI Drag Speed"
	Converted["_DragSpeedTitle"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_DragSpeedTitle"].TextSize = 14
	Converted["_DragSpeedTitle"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_DragSpeedTitle"].TextWrapped = true
	Converted["_DragSpeedTitle"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_DragSpeedTitle"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_DragSpeedTitle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_DragSpeedTitle"].BackgroundTransparency = 1
	Converted["_DragSpeedTitle"].Size = UDim2.new(0, 170, 0, 25)
	Converted["_DragSpeedTitle"].Name = "DragSpeedTitle"
	Converted["_DragSpeedTitle"].Parent = Converted["_DragConfiguration"]

	Converted["_UICorner49"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner49"].Parent = Converted["_DragSpeedTitle"]

	Converted["_UIPadding26"].PaddingLeft = UDim.new(0, 10)
	Converted["_UIPadding26"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding26"].Parent = Converted["_DragSpeedTitle"]

	Converted["_SliderContainer1"].BackgroundColor3 = Color3.fromRGB(26.00000225007534, 26.00000225007534, 26.00000225007534)
	Converted["_SliderContainer1"].Position = UDim2.new(0, 0, 0, 20)
	Converted["_SliderContainer1"].Size = UDim2.new(0, 285, 0, 10)
	Converted["_SliderContainer1"].Name = "SliderContainer"
	Converted["_SliderContainer1"].Parent = Converted["_DragSpeedTitle"]

	Converted["_UICorner50"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner50"].Parent = Converted["_SliderContainer1"]

	Converted["_UIStroke17"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke17"].Parent = Converted["_SliderContainer1"]

	Converted["_SliderFrame1"].BackgroundColor3 = Color3.fromRGB(138.00000697374344, 201.00000321865082, 38.0000015348196)
	Converted["_SliderFrame1"].Size = UDim2.new(0, 50, 0, 10)
	Converted["_SliderFrame1"].Name = "SliderFrame"
	Converted["_SliderFrame1"].Parent = Converted["_SliderContainer1"]

	Converted["_UICorner51"].CornerRadius = UDim.new(0, 7)
	Converted["_UICorner51"].Parent = Converted["_SliderFrame1"]

	Converted["_MoveSlider1"].Font = Enum.Font.SourceSans
	Converted["_MoveSlider1"].Text = ""
	Converted["_MoveSlider1"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_MoveSlider1"].TextSize = 14
	Converted["_MoveSlider1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_MoveSlider1"].BackgroundTransparency = 1
	Converted["_MoveSlider1"].BorderSizePixel = 0
	Converted["_MoveSlider1"].Size = UDim2.new(0, 285, 0, 10)
	Converted["_MoveSlider1"].ZIndex = 2
	Converted["_MoveSlider1"].Name = "MoveSlider"
	Converted["_MoveSlider1"].Parent = Converted["_SliderFrame1"]

	Converted["_DragSpeedValue"].Font = Enum.Font.Gotham
	Converted["_DragSpeedValue"].RichText = true
	Converted["_DragSpeedValue"].Text = "50"
	Converted["_DragSpeedValue"].TextColor3 = Color3.fromRGB(176.00000470876694, 176.00000470876694, 176.00000470876694)
	Converted["_DragSpeedValue"].TextSize = 14
	Converted["_DragSpeedValue"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_DragSpeedValue"].TextWrapped = true
	Converted["_DragSpeedValue"].TextXAlignment = Enum.TextXAlignment.Right
	Converted["_DragSpeedValue"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_DragSpeedValue"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_DragSpeedValue"].BackgroundTransparency = 1
	Converted["_DragSpeedValue"].Position = UDim2.new(0, 206, 0, 0)
	Converted["_DragSpeedValue"].Size = UDim2.new(0, 100, 0, 25)
	Converted["_DragSpeedValue"].Name = "DragSpeedValue"
	Converted["_DragSpeedValue"].Parent = Converted["_DragConfiguration"]

	Converted["_UICorner52"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner52"].Parent = Converted["_DragSpeedValue"]

	Converted["_UIPadding27"].PaddingRight = UDim.new(0, 12)
	Converted["_UIPadding27"].PaddingTop = UDim.new(0, 10)
	Converted["_UIPadding27"].Parent = Converted["_DragSpeedValue"]

	Converted["_ResetSettingsContainer"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_ResetSettingsContainer"].ClipsDescendants = true
	Converted["_ResetSettingsContainer"].Position = UDim2.new(0.0599999987, 0, 0.300000012, 0)
	Converted["_ResetSettingsContainer"].Size = UDim2.new(0, 305, 0, 35)
	Converted["_ResetSettingsContainer"].Name = "ResetSettingsContainer"
	Converted["_ResetSettingsContainer"].Parent = Converted["_SettingsTab"]

	Converted["_UICorner53"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner53"].Parent = Converted["_ResetSettingsContainer"]

	Converted["_UIStroke18"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke18"].Parent = Converted["_ResetSettingsContainer"]

	Converted["_ImageLabel7"].Image = "rbxassetid://12380689516"
	Converted["_ImageLabel7"].ImageColor3 = Color3.fromRGB(94.0000019967556, 94.0000019967556, 94.0000019967556)
	Converted["_ImageLabel7"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ImageLabel7"].BackgroundTransparency = 1
	Converted["_ImageLabel7"].BorderSizePixel = 0
	Converted["_ImageLabel7"].Position = UDim2.new(0, 275, 0, 10)
	Converted["_ImageLabel7"].Size = UDim2.new(0, 15, 0, 15)
	Converted["_ImageLabel7"].Parent = Converted["_ResetSettingsContainer"]

	Converted["_ResetSettingsButton"].Font = Enum.Font.GothamBold
	Converted["_ResetSettingsButton"].RichText = true
	Converted["_ResetSettingsButton"].Text = "Reset Settings"
	Converted["_ResetSettingsButton"].TextColor3 = Color3.fromRGB(147.00000643730164, 147.00000643730164, 147.00000643730164)
	Converted["_ResetSettingsButton"].TextSize = 14
	Converted["_ResetSettingsButton"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_ResetSettingsButton"].TextWrapped = true
	Converted["_ResetSettingsButton"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_ResetSettingsButton"].Active = false
	Converted["_ResetSettingsButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ResetSettingsButton"].BackgroundTransparency = 1
	Converted["_ResetSettingsButton"].Selectable = false
	Converted["_ResetSettingsButton"].Size = UDim2.new(0, 305, 0, 35)
	Converted["_ResetSettingsButton"].Name = "ResetSettingsButton"
	Converted["_ResetSettingsButton"].Parent = Converted["_ResetSettingsContainer"]

	Converted["_UICorner54"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner54"].Parent = Converted["_ResetSettingsButton"]

	Converted["_UIPadding28"].PaddingTop = UDim.new(0, 12)
	Converted["_UIPadding28"].Parent = Converted["_ResetSettingsButton"]

	Converted["_SaveSettingsButton"].BackgroundColor3 = Color3.fromRGB(12.000000234693289, 12.000000234693289, 12.000000234693289)
	Converted["_SaveSettingsButton"].ClipsDescendants = true
	Converted["_SaveSettingsButton"].Position = UDim2.new(0.0599999987, 0, 0.300000012, 0)
	Converted["_SaveSettingsButton"].Size = UDim2.new(0, 305, 0, 35)
	Converted["_SaveSettingsButton"].Name = "SaveSettingsButton"
	Converted["_SaveSettingsButton"].Parent = Converted["_SettingsTab"]

	Converted["_UICorner55"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner55"].Parent = Converted["_SaveSettingsButton"]

	Converted["_UIStroke19"].Color = Color3.fromRGB(42.000001296401024, 42.000001296401024, 42.000001296401024)
	Converted["_UIStroke19"].Parent = Converted["_SaveSettingsButton"]

	Converted["_ImageLabel8"].Image = "rbxassetid://12380689516"
	Converted["_ImageLabel8"].ImageColor3 = Color3.fromRGB(94.0000019967556, 94.0000019967556, 94.0000019967556)
	Converted["_ImageLabel8"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_ImageLabel8"].BackgroundTransparency = 1
	Converted["_ImageLabel8"].BorderSizePixel = 0
	Converted["_ImageLabel8"].Position = UDim2.new(0, 275, 0, 10)
	Converted["_ImageLabel8"].Size = UDim2.new(0, 15, 0, 15)
	Converted["_ImageLabel8"].Parent = Converted["_SaveSettingsButton"]

	Converted["_SaveSettingsButton1"].Font = Enum.Font.GothamBold
	Converted["_SaveSettingsButton1"].RichText = true
	Converted["_SaveSettingsButton1"].Text = "Save Configurations"
	Converted["_SaveSettingsButton1"].TextColor3 = Color3.fromRGB(147.00000643730164, 147.00000643730164, 147.00000643730164)
	Converted["_SaveSettingsButton1"].TextSize = 14
	Converted["_SaveSettingsButton1"].TextTruncate = Enum.TextTruncate.AtEnd
	Converted["_SaveSettingsButton1"].TextWrapped = true
	Converted["_SaveSettingsButton1"].TextYAlignment = Enum.TextYAlignment.Top
	Converted["_SaveSettingsButton1"].Active = false
	Converted["_SaveSettingsButton1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_SaveSettingsButton1"].BackgroundTransparency = 1
	Converted["_SaveSettingsButton1"].Selectable = false
	Converted["_SaveSettingsButton1"].Size = UDim2.new(0, 305, 0, 35)
	Converted["_SaveSettingsButton1"].Name = "SaveSettingsButton"
	Converted["_SaveSettingsButton1"].Parent = Converted["_SaveSettingsButton"]

	Converted["_UICorner56"].CornerRadius = UDim.new(0, 12)
	Converted["_UICorner56"].Parent = Converted["_SaveSettingsButton1"]

	Converted["_UIPadding29"].PaddingTop = UDim.new(0, 12)
	Converted["_UIPadding29"].Parent = Converted["_SaveSettingsButton1"]

--[[
	local minHeight = 35
	
	
	local function updateSize()
		textBox.Size = UDim2.new(0, 260, 0, math.max(minHeight, textBox.TextBounds.Y))
		changelogs.Size = UDim2.new(0, 305, 0, math.max(minHeight, textBox.TextBounds.Y + 21))
	end
	
	textBox:GetPropertyChangedSignal("TextBounds"):Connect(updateSize)
]]

	function playSound(soundId, playbackSpeed, volume)
		local SFX = Instance.new("Sound", workspace)
		SFX.SoundId = soundId
		SFX.Volume = volume
		SFX.PlaybackSpeed = playbackSpeed 
		SFX.Name = "SFX"

		repeat task.wait() until SFX.IsLoaded

		SFX:Play()
		task.wait(SFX.TimeLength)
		SFX:Destroy()
	end

	function Library:createTab(tabName, Icon)
		if not tabName then tabName = "New Tab" end
        local TabData = {
            Name = tabName,
            Instances = {},
            HotKeys = {}
        }
        
        UserInputService.InputBegan:Connect(function(Input)
            local Key = UserInputService:GetStringForKeyCode(Input.KeyCode)
            local Callback = TabData.HotKeys[Key]
            if Callback then
                Callback()
            end
        end)
		
		local newTab = Converted["_Client"]:Clone()
		newTab.Parent = Converted["_TabsListing"]
        TabData.Instances.Tab = newTab

		local newPage = Converted["_TestTab"]:Clone()
		newPage.Parent = Converted["_PagesContainer"]
		newPage.Name = tabName
        TabData.Instances.Page = newPage

		local newText = Converted["_Tab2"]:Clone()
		newText.Parent = newTab
		newText.Text = tabName
        TabData.Instances.TabLabel = newText

		local newIcon = Converted["_CategoryType2"]:Clone()
        newIcon.Parent = newTab
        newIcon.Image = Icon
        TabData.Instances.TabIcon = newIcon
        
        -- local TabIcons = Extra.Images.TabIcons
        
        -- local ClientIcon = TabIcons.Client
        -- local ServerIcon = TabIcons.Server
        -- local DefaultIcon = TabIcons.Default
        -- local VisualsIcon = TabIcons.Visuals

        -- if ClientIcon then
        --     ClientIcon = GetAsset(("rath/UI/Assets/%s"):format(ClientIcon))
        -- else
        --     ClientIcon = "rbxassetid://12383508769"
        -- end

        -- if ServerIcon then
        --     ServerIcon = GetAsset(("rath/UI/Assets/%s"):format(ServerIcon))
        -- else
        --     ServerIcon = "rbxassetid://12383522581"
        -- end

        -- if DefaultIcon then
        --     DefaultIcon = GetAsset(("rath/UI/Assets/%s"):format(DefaultIcon))
        -- else
        --     DefaultIcon = "rbxassetid://12351655229"
        -- end

        -- if VisualsIcon then
        --     VisualsIcon = GetAsset(("rath/UI/Assets/%s"):format(VisualsIcon))
        -- else
        --     VisualsIcon = "rbxassetid://12383498554"
        -- end

		-- local tabCategories = {
		-- 	["Client"] = ClientIcon,
		-- 	["Server"] = ServerIcon,
		-- 	["Visuals"] = VisualsIcon,
		-- 	["Default"] = DefaultIcon
		-- }

		-- if tabCategory == "Client" then 
		-- 	newIcon.Image = tabCategories.Client
		-- elseif tabCategory == "Server" then 
		-- 	newIcon.Image = tabCategories.Server
		-- elseif tabCategory == "Visuals" then
		-- 	newIcon.Image = tabCategories.Visuals
		-- else
		-- 	newIcon.Image = tabCategories.Default
		-- end

        local Instances = TabData.Instances

		Instances.Tab.MouseButton1Down:Connect(function()
			Converted["_PagesContainer"].Visible = true

			for i,v in next, Converted["_PagesContainer"]:GetChildren() do 
				v.Visible = false 
			end 
			Instances.Page.Visible = true

			local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
			local TweenService = game:GetService("TweenService")

			for i,v in next, Converted["_TabsListing"]:GetDescendants() do	
				if v:IsA("TextButton") or v:IsA("TextLabel") then 
					TweenService:Create(v, tweenInfo, {BackgroundTransparency = 1}):Play()
					TweenService:Create(v, tweenInfo, {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
				elseif v:IsA("ImageLabel") then
					TweenService:Create(v, tweenInfo, {ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
				end
			end
			TweenService:Create(Instances.Tab, tweenInfo, {BackgroundTransparency = 0.4}):Play()
			TweenService:Create(Instances.TabLabel, tweenInfo, {TextColor3 = Color3.fromRGB(138, 201, 38)}):Play()
			TweenService:Create(Instances.TabIcon, tweenInfo, {ImageColor3 = Color3.fromRGB(138, 201, 38)}):Play()
		end)

        function TabData:Create(Data)
            if Data.Type:lower() == "textbox" then
                Data.Callback = Data.Callback or function() end
                local newTextBox = Converted["_TextBox"]:Clone()
                newTextBox.Parent = Instances.Page
                -- Data.Callback = Data.Callback = function() end
                
                newTextBox.TextBoxTitle.Text = Data.Name or Data.Text or "TextBox"
                local TextBox = newTextBox.TextBoxTitle.InputtedString
                
                TextBox.FocusLost:Connect(function(input)
                    if not input then return end
                    Data.Callback(TextBox.Text)
                end)
                
                return Class({
                    properties = {
                        Text = newTextBox.TextBoxTitle.Text,
                        Value = TextBox.Text,
                        Callback = Data.Callback
                    },
                    callbacks = {
                        Text = function(Value)
                            newTextBox.TextBoxTitle.Text = Value
                        end,
                        Value = function(Value)
                            TextBox.Text = Value
                            Data.Callback(Value)
                        end,
                        Callback = function(Function)
                            Data.Callback = Function
                        end
                    },
                    type = "TextBox"
                })
            end
            if Data.Type:lower() == "keybind" then
                Data.Callback = Data.Callback or function() end
                local newHotkey = Converted["_KeyBind"]
                local hotKeyButton = Instance.new("TextButton", newHotkey)
                hotKeyButton.Text = ""
                hotKeyButton.BackgroundTransparency = 1
                
                hotKeyButton.Size = UDim2.new(1, 0, 1, 0)
                newHotkey.Parent = Instances.Page
                
                local Key = Data.Key or ""
                newHotkey.HotKeyInputted.Text = Key
                
                hotKeyButton.MouseButton1Down:Connect(function()
                    local Connection
                    
                    Connection = UserInputService.InputBegan:Connect(function(Input)
                        TabData.HotKeys[Key] = nil
                        Key = UserInputService:GetStringForKeyCode(Input.KeyCode) or Key
                        if Key ~= "" then
                            TabData.HotKeys[Key] = Data.Callback
                            newHotkey.HotKeyInputted.Text = Key
                            Connection:Disconnect()
                        end
                    end)
                end)
                
                return Class({
                    properties = {
                        Bind = Key,
                        Callback = Data.Callback,
                        Text = Data.Text,
                    },
                    callbacks = {
                        Bind = function(Value)
                            Key = Value
                        end,
                        Callback = function(Function)
                            TabData.HotKeys[Key] = Function
                            Data.Callback = Function
                        end,
                        Text = function(Value)
                            newHotkey.HotKeyInputted.Text = Value
                        end
                    },
                    type = "KeyBind"
                })
            end
            if Data.Type:lower() == "slider" then
                Data.Callback = Data.Callback or function() end
                local newSlider = Converted["_Slider"]:Clone()
                newSlider.Parent = Instances.Page

                local SliderTitle = newSlider.SliderTitle

                local SliderContainer = SliderTitle.SliderContainer

                SliderTitle.Text = Data.Name or Data.Text or "Slider"

                Data.Maximum = Data.Maximum or 100
                Data.Minimum = Data.Minimum or 0

                local MouseDown

                UserInputService.InputEnded:Connect(function(Input)
                    if not Input.UserInputType == Enum.UserInputType.MouseButton1 then return end
                    MouseDown = false
                end)
                
                newSlider.SliderValue.Text = tostring(Data.Value)

                -- local sliderSize = newSlider.AbsoluteSize
                local SliderSize = SliderContainer.SliderFrame.MoveSlider.AbsoluteSize
                local SliderPos = SliderContainer.SliderFrame.MoveSlider.AbsolutePosition
                local PercentValue = Data.Value == 0 and 0 or Data.Maximum / Data.Value

                SliderContainer.SliderFrame.Size = UDim2.new(0, 0, 0, SliderSize.X * PercentValue)

                SliderContainer.SliderFrame.MoveSlider.MouseButton1Down:Connect(function(X)

                    MouseDown = true

                    while true do task.wait()
                        if not MouseDown then break end
                        
                        local X = UserInputService:GetMouseLocation().X
                        local PercentValue = ((X - SliderPos.X) / SliderSize.X)

                        local Value = math.min(math.floor(PercentValue * (Data.Maximum)), Data.Maximum)

                        Data.Value = Value

                        if Value >= Data.Minimum then
                            Data.Callback(Value)
                            newSlider.SliderValue.Text = tostring(Value)
                            SliderContainer.SliderFrame.Size = UDim2.new(0, math.min(SliderSize.X * PercentValue, SliderSize.X), 1, 0)
                        end
                    end
                end)

                return Class({
                    properties = {
                        Value = Data.Value,
                        Callback = Data.Callback,
                        Minimum = Data.Minimum,
                        Maximum = Data.Maximum
                    },
                    callbacks = {
                        Value = function(Value)
                            Data.Value = Value

                            if Value >= Data.Minimum then
                                Data.Callback(Value)
                                newSlider.SliderValue.Text = tostring(Value)
                                SliderContainer.SliderFrame.Size = UDim2.new(0, math.min(SliderSize.X * PercentValue, SliderSize.X), 0.98, 0)
                            end
                        end,
                        Callback = function(Function)
                            Data.Callback = Function
                        end,
                        Maximum = function(Value)
                            Data.Maximum = Value
                        end,
                        Minimum = function(Value)
                            Data.Minimum = Value
                        end
                    },
                    type = "Slider"
                })
            end
            if Data.Type:lower() == "section" then
                if not Data.Text then return end 

                local newSection = Converted["_Section"]:Clone()
                newSection.Parent = Instances.Page
                newSection.Text = Data.Text
                return Class({
                    properties = {
                        Text = Data.Text
                    },
                    callbacks = {
                        Text = function(Text)
                            newSection.Text = Text
                        end
                    },
                    type = "Section"
                })
            end
            if Data.Type:lower() == "button" then
                if not Data.Callback then return end
                if not Data.Name then Data.Name = Data.Text or "Button" end

                local buttonContainer = Converted["_Button"]:Clone()
                buttonContainer.Parent = Instances.Page

                local buttonIcon = Converted["_ImageLabel4"]:Clone()
                buttonIcon.Parent = buttonContainer

				buttonIcon.Image = Data.Icon or buttonIcon.Image

                local newButton = Converted["_ButtonFunction"]:Clone()
                newButton.Parent = buttonContainer
                newButton.Text = Data.Name

                local ButtonClickConnection = newButton.MouseButton1Down:Connect(Data.Callback)

                newButton.MouseEnter:Connect(function()
                    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
                    local TweenService = game:GetService("TweenService")

                    TweenService:Create(buttonContainer, tweenInfo, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
                    TweenService:Create(newButton, tweenInfo, {TextColor3 = Color3.fromRGB(247, 247, 247)}):Play()
                    TweenService:Create(buttonIcon, tweenInfo, {ImageColor3 = Color3.fromRGB(207, 207, 207)}):Play()
                end)

                newButton.MouseLeave:Connect(function()
                    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
                    local TweenService = game:GetService("TweenService")

                    TweenService:Create(buttonContainer, tweenInfo, {BackgroundColor3 = Color3.fromRGB(12, 12, 12)}):Play()
                    TweenService:Create(newButton, tweenInfo, {TextColor3 = Color3.fromRGB(147, 147, 147)}):Play()
                    TweenService:Create(buttonIcon, tweenInfo, {ImageColor3 = Color3.fromRGB(94, 94, 94)}):Play()
                end)

                local function RippleClick(Button, X, Y)
                    task.spawn(function()
                        local Circle = Converted["_Circle"]:Clone()
                        Circle.Parent = buttonContainer
                        Circle.BackgroundTransparency = 0.7
                        Circle.BackgroundColor3 = Color3.fromRGB(126, 126, 126)

                        local NewX = X - Circle.AbsolutePosition.X
                        local NewY = Y - Circle.AbsolutePosition.Y

                        Circle.Position = UDim2.new(0, NewX, 0, NewY)
                                    
                        local ButtonSizeX = Button.AbsoluteSize.X
                        local ButtonSizeY = Button.AbsoluteSize.Y

                        local Time = 0.2
                        Circle:TweenSizeAndPosition(UDim2.new(0, ButtonSizeX - 5, 0, 35), UDim2.new(0.5, -ButtonSizeX/2, 0.5, -ButtonSizeY/2), "Out", "Sine", Time)

                        for i = 1, 12 do
                            Circle.BackgroundTransparency = Circle.BackgroundTransparency + 0.03
                            task.wait(Time/10)
                        end
                        Circle:Destroy()
                    end)
                end
                    
                local Mouse = game.Players.LocalPlayer:GetMouse()
				
                newButton.MouseButton1Click:Connect(function()
                    RippleClick(newButton, Mouse.X, Mouse.Y)
					playSound(Data.Sound or "rbxassetid://4499400560", 2, 2)
                end)

                return Class({
                    properties = {
                        Text = newButton.Text,
                        Callback = Data.Callback
                    },
                    callbacks = {
                        Text = function(Text)
                            newButton.Text = Text
                        end,
                        Callback = function(Function)
                            ButtonClickConnection:Disconnect()
                            ButtonClickConnection = newButton.MouseButton1Click:Connect(Function)
                        end
                    },
                    type = "Button"
                })
            end
            if Data.Type:lower() == "toggle" then
                if not Data.Callback then return end
                if not Data.Name then Data.Name = Data.Text or "Toggle" end
                if not Data.Description then Data.Description = "Description" end
    
                local callback = Data.Callback
    
                local newToggle = Converted["_Toggle"]:Clone()
                newToggle.Parent = Instances.Page
    
                local toggleTitle = Converted["_ToggleTitle"]:Clone()
                toggleTitle.Parent = newToggle
                toggleTitle.Text = Data.Name
    
                local toggleDescription = Converted["_ToggleDescription"]:Clone()
                toggleDescription.Parent = toggleTitle
                toggleDescription.Text = Data.Description
    
                local toggleButton = Converted["_ToggleFunction"]:Clone()
                toggleButton.Parent = toggleTitle
    
                local circleDuplicate = Converted["_Circle"]:Clone()
                circleDuplicate.Parent = toggleButton
    
                local toggleCallback = false
    
                toggleButton.MouseButton1Down:Connect(function()
                    if not toggleCallback then
                        toggleCallback = true
                        pcall(callback, true)
                    elseif toggleCallback then
                        toggleCallback = not toggleCallback
                        pcall(callback, false)
                    end
    
                    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
                    local TweenService = game:GetService("TweenService")
                    
                    local tweenOn = {}
                    tweenOn.AnchorPoint = Vector2.new(1,0)
                    tweenOn.Position = UDim2.new(1,0,0,0)
                    
                    local tweenOff = {}
                    tweenOff.AnchorPoint = Vector2.new(0,0)
                    tweenOff.Position = UDim2.new(0,0,0,0)
                    
                    if toggleCallback then 
                        TweenService:Create(circleDuplicate, tweenInfo, tweenOn):Play()
                        TweenService:Create(toggleButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(138, 201, 38)}):Play()
                    else
                        TweenService:Create(circleDuplicate, tweenInfo, tweenOff):Play()
                        TweenService:Create(toggleButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(39, 39, 39)}):Play()
                    end
                end)

                return Class({
                    properties = {
                        Text = toggleTitle.Text,
                        Description = toggleDescription.Text,
                        Callback = Data.Callback
                    },
                    callbacks = {
                        Text = function(Text)
                            toggleTitle.Text = Text
                        end,
                        Description = function(Text)
                            toggleDescription.Text = Text
                        end,
                        Callback = function(Function)
                            callback = Function
                        end
                    },
                    type = "Toggle"
                })
            end

        end

        return TabData

	end
	return Library
end

local lib = Library:createLibrary(nil)

local ServerTab = lib:createTab("Server", "rbxassetid://12383508769")
local ClientTab = lib:createTab("Client", "rbxassetid://12383522581")

ServerTab:Create({
    Type = "keybind",
    Name = "Test keybind",
    Callback = function()
        print("wowza")
    end
    -- Value = 0,
    -- Minimum = 0,
    -- Maximum = 100,
})

-- ServerTab:Create({
--     Type = "section",
--     Text = "Test"
-- })

-- local Toggle = ServerTab:Create({
--     Type = "toggle",
--     Name = "Test Toggle",
--     Description = "Test Desc",
--     Callback = function(state)
--         print(state)
--     end
-- })

-- Toggle.Callback = function(state)
--     print("e", state)
-- end

-- ServerTab:Create({
--     Type = "button",
--     Name = "Test Button",
--     Callback = function()
--         print("Button pressed")
--     end
-- })

-- ClientTab:Create({
--     Type = "section",
--     Text = "Test"
-- })

-- ClientTab:Create({
--     Type = "toggle",
--     Name = "Test Toggle",
--     Description = "Test Desc",
--     Callback = function(state)
--         print(state)
--     end
-- })

-- ClientTab:Create({
--     Type = "button",
--     Name = "Test Button",
--     Callback = function()
--         print("Button pressed")
--     end
-- })


-- lib:createSection("Test")

-- lib:createToggle("Test Toggle", "Test Desc", function(state)
-- 	print(state)
-- end)

-- lib:createButton("Test Button", function()
-- 	workspace.remote.loadchar:InvokeServer()
-- end)

-- lib:createTab("Visuals", "Visuals")

-- lib:createToggle("cool", "cheese", function(state)
-- 	print(state)
-- end)

-- lib:createSection("Yes!")

return Library