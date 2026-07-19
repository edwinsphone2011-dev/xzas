-- Troll Stand Script

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════════════════
--  THEMES
-- ══════════════════════════════════════════════════════════════
local themes = {
	["Orange Sunshine"] = {
		bgDark      = Color3.fromRGB(45, 34, 26),
		bgMid       = Color3.fromRGB(62, 48, 36),
		bgLight     = Color3.fromRGB(78, 62, 48),
		accent      = Color3.fromRGB(245, 171, 74),
		accentDark  = Color3.fromRGB(210, 140, 50),
		text        = Color3.fromRGB(245, 240, 235),
		textDim     = Color3.fromRGB(195, 175, 155),
		hover       = Color3.fromRGB(85, 68, 52),
		tabActive   = Color3.fromRGB(245, 171, 74),
		tabInactive = Color3.fromRGB(62, 48, 36),
		titleText   = Color3.fromRGB(245, 235, 220),
		subtitleText= Color3.fromRGB(210, 190, 170),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
	["Ocean Blue"] = {
		bgDark      = Color3.fromRGB(18, 32, 52),
		bgMid       = Color3.fromRGB(26, 47, 75),
		bgLight     = Color3.fromRGB(35, 62, 98),
		accent      = Color3.fromRGB(66, 165, 245),
		accentDark  = Color3.fromRGB(40, 130, 210),
		text        = Color3.fromRGB(225, 240, 255),
		textDim     = Color3.fromRGB(140, 175, 210),
		hover       = Color3.fromRGB(40, 70, 110),
		tabActive   = Color3.fromRGB(66, 165, 245),
		tabInactive = Color3.fromRGB(26, 47, 75),
		titleText   = Color3.fromRGB(200, 230, 255),
		subtitleText= Color3.fromRGB(150, 190, 230),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
	["Midnight Navy"] = {
		bgDark      = Color3.fromRGB(15, 18, 30),
		bgMid       = Color3.fromRGB(22, 27, 45),
		bgLight     = Color3.fromRGB(30, 37, 60),
		accent      = Color3.fromRGB(100, 130, 200),
		accentDark  = Color3.fromRGB(70, 95, 160),
		text        = Color3.fromRGB(210, 220, 240),
		textDim     = Color3.fromRGB(120, 135, 165),
		hover       = Color3.fromRGB(35, 42, 68),
		tabActive   = Color3.fromRGB(100, 130, 200),
		tabInactive = Color3.fromRGB(22, 27, 45),
		titleText   = Color3.fromRGB(200, 215, 245),
		subtitleText= Color3.fromRGB(140, 160, 200),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
	["Lavender Purple"] = {
		bgDark      = Color3.fromRGB(32, 26, 48),
		bgMid       = Color3.fromRGB(45, 36, 65),
		bgLight     = Color3.fromRGB(58, 48, 82),
		accent      = Color3.fromRGB(180, 140, 220),
		accentDark  = Color3.fromRGB(145, 105, 185),
		text        = Color3.fromRGB(235, 225, 245),
		textDim     = Color3.fromRGB(165, 145, 190),
		hover       = Color3.fromRGB(62, 50, 88),
		tabActive   = Color3.fromRGB(180, 140, 220),
		tabInactive = Color3.fromRGB(45, 36, 65),
		titleText   = Color3.fromRGB(230, 220, 245),
		subtitleText= Color3.fromRGB(180, 160, 210),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
	["Cherry Red"] = {
		bgDark      = Color3.fromRGB(48, 20, 22),
		bgMid       = Color3.fromRGB(68, 28, 30),
		bgLight     = Color3.fromRGB(88, 38, 40),
		accent      = Color3.fromRGB(230, 60, 70),
		accentDark  = Color3.fromRGB(190, 40, 50),
		text        = Color3.fromRGB(245, 225, 225),
		textDim     = Color3.fromRGB(190, 130, 135),
		hover       = Color3.fromRGB(95, 42, 45),
		tabActive   = Color3.fromRGB(230, 60, 70),
		tabInactive = Color3.fromRGB(68, 28, 30),
		titleText   = Color3.fromRGB(255, 230, 230),
		subtitleText= Color3.fromRGB(210, 150, 155),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(255, 100, 100),
	},
	["Golden Amber"] = {
		bgDark      = Color3.fromRGB(42, 32, 18),
		bgMid       = Color3.fromRGB(58, 44, 25),
		bgLight     = Color3.fromRGB(75, 58, 32),
		accent      = Color3.fromRGB(245, 190, 60),
		accentDark  = Color3.fromRGB(200, 155, 40),
		text        = Color3.fromRGB(245, 235, 215),
		textDim     = Color3.fromRGB(195, 175, 140),
		hover       = Color3.fromRGB(82, 62, 35),
		tabActive   = Color3.fromRGB(245, 190, 60),
		tabInactive = Color3.fromRGB(58, 44, 25),
		titleText   = Color3.fromRGB(255, 240, 210),
		subtitleText= Color3.fromRGB(210, 190, 150),
		orange      = Color3.fromRGB(255, 180, 50),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
	["Rose Pink"] = {
		bgDark      = Color3.fromRGB(45, 25, 32),
		bgMid       = Color3.fromRGB(62, 34, 44),
		bgLight     = Color3.fromRGB(80, 44, 56),
		accent      = Color3.fromRGB(240, 140, 170),
		accentDark  = Color3.fromRGB(200, 110, 140),
		text        = Color3.fromRGB(245, 230, 235),
		textDim     = Color3.fromRGB(190, 150, 165),
		hover       = Color3.fromRGB(88, 50, 64),
		tabActive   = Color3.fromRGB(240, 140, 170),
		tabInactive = Color3.fromRGB(62, 34, 44),
		titleText   = Color3.fromRGB(255, 235, 240),
		subtitleText= Color3.fromRGB(215, 170, 185),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
	["Arctic White"] = {
		bgDark      = Color3.fromRGB(38, 40, 45),
		bgMid       = Color3.fromRGB(52, 55, 62),
		bgLight     = Color3.fromRGB(68, 72, 80),
		accent      = Color3.fromRGB(170, 210, 240),
		accentDark  = Color3.fromRGB(130, 175, 210),
		text        = Color3.fromRGB(240, 242, 248),
		textDim     = Color3.fromRGB(160, 170, 185),
		hover       = Color3.fromRGB(75, 80, 90),
		tabActive   = Color3.fromRGB(170, 210, 240),
		tabInactive = Color3.fromRGB(52, 55, 62),
		titleText   = Color3.fromRGB(245, 248, 255),
		subtitleText= Color3.fromRGB(190, 200, 215),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
	["Forest Green"] = {
		bgDark      = Color3.fromRGB(20, 32, 22),
		bgMid       = Color3.fromRGB(28, 45, 30),
		bgLight     = Color3.fromRGB(38, 58, 40),
		accent      = Color3.fromRGB(76, 175, 80),
		accentDark  = Color3.fromRGB(56, 142, 60),
		text        = Color3.fromRGB(225, 240, 225),
		textDim     = Color3.fromRGB(140, 175, 145),
		hover       = Color3.fromRGB(48, 68, 50),
		tabActive   = Color3.fromRGB(76, 175, 80),
		tabInactive = Color3.fromRGB(28, 45, 30),
		titleText   = Color3.fromRGB(210, 240, 215),
		subtitleText= Color3.fromRGB(160, 200, 165),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
	["Cyber Cyan"] = {
		bgDark      = Color3.fromRGB(15, 30, 35),
		bgMid       = Color3.fromRGB(22, 42, 50),
		bgLight     = Color3.fromRGB(30, 55, 65),
		accent      = Color3.fromRGB(0, 230, 230),
		accentDark  = Color3.fromRGB(0, 190, 190),
		text        = Color3.fromRGB(220, 245, 245),
		textDim     = Color3.fromRGB(120, 180, 185),
		hover       = Color3.fromRGB(38, 65, 75),
		tabActive   = Color3.fromRGB(0, 230, 230),
		tabInactive = Color3.fromRGB(22, 42, 50),
		titleText   = Color3.fromRGB(200, 255, 255),
		subtitleText= Color3.fromRGB(140, 200, 205),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
	["Slate Gray"] = {
		bgDark      = Color3.fromRGB(28, 30, 36),
		bgMid       = Color3.fromRGB(40, 43, 52),
		bgLight     = Color3.fromRGB(52, 56, 68),
		accent      = Color3.fromRGB(140, 160, 200),
		accentDark  = Color3.fromRGB(110, 130, 170),
		text        = Color3.fromRGB(230, 235, 245),
		textDim     = Color3.fromRGB(150, 160, 180),
		hover       = Color3.fromRGB(60, 65, 78),
		tabActive   = Color3.fromRGB(140, 160, 200),
		tabInactive = Color3.fromRGB(40, 43, 52),
		titleText   = Color3.fromRGB(235, 240, 250),
		subtitleText= Color3.fromRGB(170, 180, 205),
		orange      = Color3.fromRGB(255, 167, 38),
		white       = Color3.fromRGB(255, 255, 255),
		red         = Color3.fromRGB(229, 115, 115),
	},
}

local themeNames = { "Orange Sunshine", "Ocean Blue", "Midnight Navy", "Lavender Purple", "Cherry Red", "Golden Amber", "Rose Pink", "Arctic White", "Forest Green", "Cyber Cyan", "Slate Gray" }
local currentThemeName = "Orange Sunshine"
local C = themes[currentThemeName]

-- ══════════════════════════════════════════════════════════════
--  THEME TRACKING
-- ══════════════════════════════════════════════════════════════
local themeElements = {}

local function registerTheme(obj, prop, key)
	if not themeElements[obj] then
		themeElements[obj] = {}
	end
	table.insert(themeElements[obj], { prop = prop, key = key })
end

local function applyTheme(name)
	local t = themes[name]
	if not t then return end
	currentThemeName = name
	C = t
	for obj, entries in pairs(themeElements) do
		if obj and obj.Parent then
			for _, entry in ipairs(entries) do
				obj[entry.prop] = t[entry.key]
			end
		else
			themeElements[obj] = nil
		end
	end
end

-- ══════════════════════════════════════════════════════════════
--  HELPER
-- ══════════════════════════════════════════════════════════════
local function new(class, props, children)
	local inst = Instance.new(class)
	for k, v in pairs(props) do
		if k ~= "Parent" then
			inst[k] = v
		end
	end
	if children then
		for _, ch in ipairs(children) do
			ch.Parent = inst
		end
	end
	if props.Parent then inst.Parent = props.Parent end
	return inst
end

local function tween(obj, info, goals)
	return TweenService:Create(obj, info or TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goals):Play()
end

local function addCorner(parent, radius)
	return new("UICorner", { CornerRadius = UDim.new(0, radius or 8), Parent = parent })
end

local function addStroke(parent, color, thickness)
	return new("UIStroke", { Color = color or C.accent, Thickness = thickness or 1.5, Parent = parent })
end

local function addPadding(parent, t, b, l, r)
	return new("UIPadding", {
		PaddingTop    = UDim.new(0, t or 6),
		PaddingBottom = UDim.new(0, b or 6),
		PaddingLeft   = UDim.new(0, l or 8),
		PaddingRight  = UDim.new(0, r or 8),
		Parent        = parent,
	})
end

-- ══════════════════════════════════════════════════════════════
--  SCREEN GUI
-- ══════════════════════════════════════════════════════════════
local screenGui = new("ScreenGui", {
	Name = "TrollStandScript",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	IgnoreGuiInset = true,
	DisplayOrder = 999,
	Parent = playerGui,
})

-- ══════════════════════════════════════════════════════════════
--  MAIN FRAME
-- ══════════════════════════════════════════════════════════════
local mainFrame = new("Frame", {
	Name = "Main",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, 0),
	Size = UDim2.new(0, 520, 0, 360),
	BackgroundColor3 = C.bgDark,
	BorderSizePixel = 0,
	ClipsDescendants = true,
	Parent = screenGui,
})
addCorner(mainFrame, 10)
local mainStroke = addStroke(mainFrame, C.accent, 2)
registerTheme(mainFrame, "BackgroundColor3", "bgDark")
registerTheme(mainStroke, "Color", "accent")

local shadow = new("ImageLabel", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, 4),
	Size = UDim2.new(1, 30, 1, 30),
	BackgroundTransparency = 1,
	Image = "rbxassetid://5554236805",
	ImageColor3 = Color3.fromRGB(0, 0, 0),
	ImageTransparency = 0.6,
	ScaleType = Enum.ScaleType.Slice,
	SliceCenter = Rect.new(23, 23, 277, 277),
	Parent = mainFrame,
})
mainFrame.ZIndex = shadow.ZIndex + 1

-- ══════════════════════════════════════════════════════════════
--  TITLE BAR
-- ══════════════════════════════════════════════════════════════
local titleBar = new("TextButton", {
	Name = "TitleBar",
	Size = UDim2.new(1, 0, 0, 42),
	BackgroundColor3 = C.bgMid,
	BorderSizePixel = 0,
	Text = "",
	ZIndex = 2,
	Parent = mainFrame,
})
registerTheme(titleBar, "BackgroundColor3", "bgMid")

new("Frame", {
	Size = UDim2.new(1, 0, 0, 10),
	Position = UDim2.new(0, 0, 0, 0),
	BackgroundColor3 = C.bgMid,
	BorderSizePixel = 0,
	ZIndex = 2,
	Parent = mainFrame,
})
registerTheme(mainFrame, "BackgroundColor3", "bgDark")

new("Frame", {
	Size = UDim2.new(1, 0, 0, 12),
	Position = UDim2.new(0, 0, 1, -12),
	BackgroundColor3 = C.bgMid,
	BorderSizePixel = 0,
	ZIndex = 2,
	Parent = mainFrame,
})

new("TextLabel", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, -3),
	Size = UDim2.new(0.7, 0, 0, 18),
	BackgroundTransparency = 1,
	Text = "Troll Stand Script",
	TextColor3 = C.titleText,
	Font = Enum.Font.GothamMedium,
	TextSize = 15,
	TextXAlignment = Enum.TextXAlignment.Center,
	ZIndex = 3,
	Parent = titleBar,
})
registerTheme(titleBar, "BackgroundColor3", "bgMid")

new("TextLabel", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, 11),
	Size = UDim2.new(0.8, 0, 0, 12),
	BackgroundTransparency = 1,
	Text = "Choose your stand and cause chaos",
	TextColor3 = C.subtitleText,
	Font = Enum.Font.SourceSans,
	TextSize = 11,
	TextXAlignment = Enum.TextXAlignment.Center,
	ZIndex = 3,
	Parent = titleBar,
})

-- ── MINIMIZE BUTTON ──
local minimizeBtn = new("TextButton", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -12, 0.5, 0),
	Size = UDim2.new(0, 26, 0, 26),
	BackgroundColor3 = C.hover,
	BorderSizePixel = 0,
	Text = "—",
	TextColor3 = C.text,
	Font = Enum.Font.GothamMedium,
	TextSize = 14,
	ZIndex = 4,
	Parent = titleBar,
})
addCorner(minimizeBtn, 6)
registerTheme(minimizeBtn, "BackgroundColor3", "hover")
registerTheme(minimizeBtn, "TextColor3", "text")

minimizeBtn.MouseEnter:Connect(function()
	tween(minimizeBtn, nil, { BackgroundColor3 = C.accent, TextColor3 = C.bgDark })
end)
minimizeBtn.MouseLeave:Connect(function()
	tween(minimizeBtn, nil, { BackgroundColor3 = C.hover, TextColor3 = C.text })
end)

-- ── SETTINGS BUTTON ──
local settingsBtn = new("TextButton", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -44, 0.5, 0),
	Size = UDim2.new(0, 26, 0, 26),
	BackgroundColor3 = C.hover,
	BorderSizePixel = 0,
	Text = "⚙",
	TextColor3 = C.text,
	Font = Enum.Font.GothamMedium,
	TextSize = 14,
	ZIndex = 4,
	Parent = titleBar,
})
addCorner(settingsBtn, 6)
registerTheme(settingsBtn, "BackgroundColor3", "hover")
registerTheme(settingsBtn, "TextColor3", "text")

settingsBtn.MouseEnter:Connect(function()
	tween(settingsBtn, nil, { BackgroundColor3 = C.accent, TextColor3 = C.bgDark })
end)
settingsBtn.MouseLeave:Connect(function()
	tween(settingsBtn, nil, { BackgroundColor3 = C.hover, TextColor3 = C.text })
end)

-- ══════════════════════════════════════════════════════════════
--  CONTENT AREA
-- ══════════════════════════════════════════════════════════════
local contentFrame = new("Frame", {
	Name = "Content",
	Position = UDim2.new(0, 0, 0, 42),
	Size = UDim2.new(1, 0, 1, -42),
	BackgroundTransparency = 1,
	ZIndex = 2,
	Parent = mainFrame,
})

-- ══════════════════════════════════════════════════════════════
--  TAB BAR
-- ══════════════════════════════════════════════════════════════
local tabBar = new("Frame", {
	Name = "TabBar",
	Size = UDim2.new(1, 0, 0, 36),
	BackgroundColor3 = C.bgMid,
	BorderSizePixel = 0,
	ZIndex = 2,
	Parent = contentFrame,
})
registerTheme(tabBar, "BackgroundColor3", "bgMid")

local tabNames = { "Stand", "Keybinds", "Float Position" }
local tabButtons = {}
local tabPages = {}
local activeTab = 1
local settingsMode = false

local pageContainer = new("Frame", {
	Name = "Pages",
	Position = UDim2.new(0, 0, 0, 36),
	Size = UDim2.new(1, 0, 1, -36),
	BackgroundColor3 = C.bgDark,
	BorderSizePixel = 0,
	ZIndex = 2,
	Parent = contentFrame,
})
registerTheme(pageContainer, "BackgroundColor3", "bgDark")

for i, name in ipairs(tabNames) do
	local tabBtn = new("TextButton", {
		Name = "Tab_" .. i,
		Position = UDim2.new((i - 1) / #tabNames, 0, 0, 0),
		Size = UDim2.new(1 / #tabNames, 0, 1, 0),
		BackgroundColor3 = i == 1 and C.tabActive or C.tabInactive,
		BorderSizePixel = 0,
		Text = name,
		TextColor3 = i == 1 and C.bgDark or C.textDim,
		Font = Enum.Font.SourceSans,
		TextSize = 14,
		ZIndex = 3,
		Parent = tabBar,
	})
	tabButtons[i] = tabBtn
	registerTheme(tabBtn, "BackgroundColor3", i == 1 and "tabActive" or "tabInactive")
	registerTheme(tabBtn, "TextColor3", i == 1 and "bgDark" or "textDim")

	local page = new("ScrollingFrame", {
		Name = "Page_" .. i,
		Size = UDim2.new(1, -16, 1, -8),
		Position = UDim2.new(0, 8, 0, 4),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = C.accent,
		ZIndex = 3,
		Parent = pageContainer,
	})
	addPadding(page, 4, 4, 4, 4)
	registerTheme(page, "ScrollBarImageColor3", "accent")

	local list = new("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 8),
		Parent = page,
	})
	list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		page.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 12)
	end)

	tabPages[i] = page
end

-- ══════════════════════════════════════════════════════════════
--  SETTINGS PAGE (gear button)
-- ══════════════════════════════════════════════════════════════
local settingsPage = new("ScrollingFrame", {
	Name = "SettingsPage",
	Size = UDim2.new(1, -16, 1, -8),
	Position = UDim2.new(0, 8, 0, 4),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Visible = false,
	ScrollBarThickness = 4,
	ScrollBarImageColor3 = C.accent,
	ZIndex = 10,
	Parent = pageContainer,
})
addPadding(settingsPage, 4, 4, 4, 4)
registerTheme(settingsPage, "ScrollBarImageColor3", "accent")

local settingsList = new("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 8),
	Parent = settingsPage,
})
settingsList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	settingsPage.CanvasSize = UDim2.new(0, 0, 0, settingsList.AbsoluteContentSize.Y + 12)
end)

-- ══════════════════════════════════════════════════════════════
--  TAB / SETTINGS NAVIGATION
-- ══════════════════════════════════════════════════════════════
local function deactivateAllTabs()
	for i, btn in ipairs(tabButtons) do
		btn.BackgroundColor3 = C.tabInactive
		btn.TextColor3 = C.textDim
		registerTheme(btn, "BackgroundColor3", "tabInactive")
		registerTheme(btn, "TextColor3", "textDim")
	end
end

local function activateTab(idx)
	deactivateAllTabs()
	settingsMode = false
	settingsBtn.TextColor3 = C.text
	tabButtons[idx].BackgroundColor3 = C.tabActive
	tabButtons[idx].TextColor3 = C.bgDark
	registerTheme(tabButtons[idx], "BackgroundColor3", "tabActive")
	registerTheme(tabButtons[idx], "TextColor3", "bgDark")
	settingsPage.Visible = false
	for i, page in ipairs(tabPages) do
		page.Visible = (i == idx)
	end
	activeTab = idx
end

local function showSettings()
	settingsMode = true
	deactivateAllTabs()
	settingsBtn.TextColor3 = C.accent
	for _, page in ipairs(tabPages) do
		page.Visible = false
	end
	settingsPage.Visible = true
end

for i = 1, #tabNames do
	tabButtons[i].MouseButton1Click:Connect(function() activateTab(i) end)
end

settingsBtn.MouseButton1Click:Connect(function()
	if settingsMode then
		activateTab(activeTab)
	else
		showSettings()
	end
end)

activateTab(1)

-- ══════════════════════════════════════════════════════════════
--  TOGGLE BUTTON HELPER
-- ══════════════════════════════════════════════════════════════
local function makeToggle(parent, text, default, callback)
	local toggled = default or false

	local frame = new("Frame", {
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundColor3 = C.bgMid,
		BorderSizePixel = 0,
		ZIndex = 4,
		Parent = parent,
	})
	addCorner(frame, 6)
	registerTheme(frame, "BackgroundColor3", "bgMid")

	new("TextLabel", {
		Position = UDim2.new(0, 12, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0.65, 0, 0, 20),
		BackgroundTransparency = 1,
		Text = text,
		TextColor3 = C.text,
		Font = Enum.Font.SourceSans,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 5,
		Parent = frame,
	})

	local track = new("Frame", {
		Position = UDim2.new(1, -46, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0, 36, 0, 20),
		BackgroundColor3 = C.bgLight,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = frame,
	})
	addCorner(track, 10)

	local circle = new("Frame", {
		Position = UDim2.new(0, 10, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0, 16, 0, 16),
		BackgroundColor3 = C.white,
		BorderSizePixel = 0,
		ZIndex = 6,
		Parent = track,
	})
	addCorner(circle, 8)

	local function updateVisual()
		track.BackgroundColor3 = toggled and C.tabActive or C.bgLight
		circle.BackgroundColor3 = C.white
		tween(circle, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = toggled and UDim2.new(1, -10, 0.5, 0) or UDim2.new(0, 10, 0.5, 0),
		})
	end

	updateVisual()

	local btn = new("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 7,
		Parent = frame,
	})

	btn.MouseButton1Click:Connect(function()
		toggled = not toggled
		updateVisual()
		if callback then callback(toggled) end
	end)

	return {
		frame = frame,
		get = function() return toggled end,
		set = function(v) toggled = v; updateVisual() end,
		toggle = function()
			toggled = not toggled
			updateVisual()
			if callback then callback(toggled) end
		end,
	}
end

-- ══════════════════════════════════════════════════════════════
--  DROPDOWN HELPER
-- ══════════════════════════════════════════════════════════════
local function makeDropdown(parent, text, options, default, callback)
	local selected = default or options[1]
	local isOpen = false

	local frame = new("Frame", {
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundColor3 = C.bgMid,
		BorderSizePixel = 0,
		ZIndex = 4,
		Parent = parent,
	})
	addCorner(frame, 6)
	registerTheme(frame, "BackgroundColor3", "bgMid")

	new("TextLabel", {
		Position = UDim2.new(0, 12, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0.35, 0, 0, 20),
		BackgroundTransparency = 1,
		Text = text,
		TextColor3 = C.text,
		Font = Enum.Font.SourceSans,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 5,
		Parent = frame,
	})

	local dropBtn = new("TextButton", {
		Position = UDim2.new(0.38, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0.58, 0, 0, 28),
		BackgroundColor3 = C.bgLight,
		BorderSizePixel = 0,
		Text = "",
		ZIndex = 5,
		Parent = frame,
	})
	addCorner(dropBtn, 6)
	registerTheme(dropBtn, "BackgroundColor3", "bgLight")

	local selectedLabel = new("TextLabel", {
		Position = UDim2.new(0, 10, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0.85, 0, 0, 20),
		BackgroundTransparency = 1,
		Text = selected,
		TextColor3 = C.text,
		Font = Enum.Font.SourceSans,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 6,
		Parent = dropBtn,
	})
	registerTheme(selectedLabel, "TextColor3", "text")

	local arrow = new("TextLabel", {
		Position = UDim2.new(1, -10, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		Size = UDim2.new(0, 16, 0, 16),
		BackgroundTransparency = 1,
		Text = "▼",
		TextColor3 = C.textDim,
		Font = Enum.Font.GothamMedium,
		TextSize = 10,
		ZIndex = 6,
		Parent = dropBtn,
	})
	registerTheme(arrow, "TextColor3", "textDim")

	local optionsFrame = new("ScrollingFrame", {
		Size = UDim2.new(0, 0, 0, math.min(#options * 30 + 10, 180)),
		BackgroundColor3 = C.bgMid,
		BorderSizePixel = 0,
		Visible = false,
		ZIndex = 200,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = C.accent,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		CanvasSize = UDim2.new(0, 0, 0, #options * 30 + 10),
		Parent = screenGui,
	})
	addCorner(optionsFrame, 6)
	addStroke(optionsFrame, C.accent, 1)
	registerTheme(optionsFrame, "BackgroundColor3", "bgMid")

	new("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 3),
		Parent = optionsFrame,
	})
	addPadding(optionsFrame, 4, 4, 4, 4)

	local function buildOptions()
		for _, child in ipairs(optionsFrame:GetChildren()) do
			if child:IsA("TextButton") then child:Destroy() end
		end
		for i, opt in ipairs(options) do
			local isSelected = opt == selected
			local optBtn = new("TextButton", {
				Name = "Opt_" .. i,
				Size = UDim2.new(1, -8, 0, 27),
				BackgroundColor3 = isSelected and C.tabActive or C.bgLight,
				BorderSizePixel = 0,
				Text = "",
				ZIndex = 201,
				Parent = optionsFrame,
			})
			addCorner(optBtn, 4)

			new("TextLabel", {
				Position = UDim2.new(0, 10, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0.9, 0, 0, 18),
				BackgroundTransparency = 1,
				Text = opt,
				TextColor3 = isSelected and C.bgDark or C.text,
				Font = Enum.Font.SourceSans,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 202,
				Parent = optBtn,
			})

			optBtn.MouseEnter:Connect(function()
				if opt ~= selected then
					tween(optBtn, nil, { BackgroundColor3 = C.hover })
				end
			end)
			optBtn.MouseLeave:Connect(function()
				if opt ~= selected then
					tween(optBtn, nil, { BackgroundColor3 = C.bgLight })
				end
			end)

			optBtn.MouseButton1Click:Connect(function()
				selected = opt
				selectedLabel.Text = opt
				isOpen = false
				optionsFrame.Visible = false
				arrow.Text = "▼"
				if callback then callback(opt) end
			end)
		end
	end

	buildOptions()

	dropBtn.MouseButton1Click:Connect(function()
		isOpen = not isOpen
		if isOpen then
			local absPos = dropBtn.AbsolutePosition
			local absSize = dropBtn.AbsoluteSize
			optionsFrame.Position = UDim2.new(0, absPos.X, 0, absPos.Y + absSize.Y + 4)
			optionsFrame.Size = UDim2.new(0, absSize.X, 0, math.min(#options * 30 + 10, 180))
			optionsFrame.CanvasSize = UDim2.new(0, 0, 0, #options * 30 + 10)
			buildOptions()
		end
		optionsFrame.Visible = isOpen
		arrow.Text = isOpen and "▲" or "▼"
	end)

	return {
		frame = frame,
		get = function() return selected end,
		set = function(v)
			selected = v
			selectedLabel.Text = v
			buildOptions()
		end,
		updateOptions = function(newOptions)
			options = newOptions
			if not table.find(options, selected) then
				selected = options[1] or "None"
				selectedLabel.Text = selected
			end
			optionsFrame.CanvasSize = UDim2.new(0, 0, 0, #options * 30 + 10)
			buildOptions()
		end,
	}
end

-- ══════════════════════════════════════════════════════════════
--  SLIDER HELPER
-- ══════════════════════════════════════════════════════════════
local function makeSlider(parent, text, min, max, default, suffix)
	local value = default or min
	local suf = suffix or "s"

	local frame = new("Frame", {
		Size = UDim2.new(1, 0, 0, 52),
		BackgroundColor3 = C.bgMid,
		BorderSizePixel = 0,
		ZIndex = 4,
		Parent = parent,
	})
	addCorner(frame, 6)
	registerTheme(frame, "BackgroundColor3", "bgMid")

	new("TextLabel", {
		Position = UDim2.new(0, 12, 0, 8),
		Size = UDim2.new(0.6, 0, 0, 18),
		BackgroundTransparency = 1,
		Text = text,
		TextColor3 = C.text,
		Font = Enum.Font.SourceSans,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 5,
		Parent = frame,
	})

	local valueLabel = new("TextLabel", {
		Position = UDim2.new(1, -12, 0, 8),
		AnchorPoint = Vector2.new(1, 0),
		Size = UDim2.new(0, 40, 0, 18),
		BackgroundTransparency = 1,
		Text = tostring(value) .. suf,
		TextColor3 = C.accent,
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Right,
		ZIndex = 5,
		Parent = frame,
	})
	registerTheme(valueLabel, "TextColor3", "accent")

	local barBg = new("Frame", {
		Position = UDim2.new(0, 12, 0, 34),
		Size = UDim2.new(1, -24, 0, 8),
		BackgroundColor3 = C.bgLight,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = frame,
	})
	addCorner(barBg, 4)
	registerTheme(barBg, "BackgroundColor3", "bgLight")

	local fill = new("Frame", {
		Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
		BackgroundColor3 = C.tabActive,
		BorderSizePixel = 0,
		ZIndex = 6,
		Parent = barBg,
	})
	addCorner(fill, 4)
	registerTheme(fill, "BackgroundColor3", "tabActive")

	local handle = new("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new((value - min) / (max - min), 0, 0.5, 0),
		Size = UDim2.new(0, 14, 0, 14),
		BackgroundColor3 = C.white,
		BorderSizePixel = 0,
		ZIndex = 7,
		Parent = barBg,
	})
	addCorner(handle, 7)

	local dragging = false

	local hitbox = new("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 8,
		Parent = barBg,
	})

	local function updateSlider(inputX)
		local absPos = barBg.AbsolutePosition.X
		local absSize = barBg.AbsoluteSize.X
		local pct = math.clamp((inputX - absPos) / absSize, 0, 1)
		value = math.floor((min + pct * (max - min)) * 10 + 0.5) / 10
		fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
		handle.Position = UDim2.new((value - min) / (max - min), 0, 0.5, 0)
		valueLabel.Text = tostring(value) .. suf
	end

	hitbox.MouseButton1Down:Connect(function()
		dragging = true
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			updateSlider(input.Position.X)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	return {
		frame = frame,
		get = function() return value end,
		set = function(v)
			value = math.clamp(v, min, max)
			fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
			handle.Position = UDim2.new((value - min) / (max - min), 0, 0.5, 0)
			valueLabel.Text = tostring(value) .. suf
		end,
	}
end

-- ══════════════════════════════════════════════════════════════
--  ACTION BUTTON HELPER
-- ══════════════════════════════════════════════════════════════
local function makeButton(parent, text, color, callback)
	local frame = new("TextButton", {
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundColor3 = color or C.accent,
		BorderSizePixel = 0,
		Text = "",
		ZIndex = 4,
		Parent = parent,
	})
	addCorner(frame, 6)

	new("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = text,
		TextColor3 = C.bgDark,
		Font = Enum.Font.GothamMedium,
		TextSize = 14,
		ZIndex = 5,
		Parent = frame,
	})

	frame.MouseEnter:Connect(function()
		tween(frame, nil, { BackgroundColor3 = Color3.new(
			math.clamp(color.R * 0.8, 0, 1),
			math.clamp(color.G * 0.8, 0, 1),
			math.clamp(color.B * 0.8, 0, 1)
		) })
	end)
	frame.MouseLeave:Connect(function()
		tween(frame, nil, { BackgroundColor3 = color })
	end)

	frame.MouseButton1Click:Connect(function()
		if callback then callback() end
	end)

	return frame
end

-- ══════════════════════════════════════════════════════════════
--  KEYBIND BUTTON HELPER
-- ══════════════════════════════════════════════════════════════
local function makeKeybind(parent, text, default, callback)
	local currentKey = default

	local frame = new("Frame", {
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundColor3 = C.bgMid,
		BorderSizePixel = 0,
		ZIndex = 4,
		Parent = parent,
	})
	addCorner(frame, 6)
	registerTheme(frame, "BackgroundColor3", "bgMid")

	new("TextLabel", {
		Position = UDim2.new(0, 12, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0.6, 0, 0, 20),
		BackgroundTransparency = 1,
		Text = text,
		TextColor3 = C.text,
		Font = Enum.Font.SourceSans,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 5,
		Parent = frame,
	})

	local keyBtn = new("TextButton", {
		Position = UDim2.new(1, -12, 0.5, 0),
		AnchorPoint = Vector2.new(1, 0.5),
		Size = UDim2.new(0, 50, 0, 26),
		BackgroundColor3 = C.bgLight,
		BorderSizePixel = 0,
		Text = currentKey and currentKey.Name or "None",
		TextColor3 = C.accent,
		Font = Enum.Font.GothamMedium,
		TextSize = 12,
		ZIndex = 5,
		Parent = frame,
	})
	addCorner(keyBtn, 4)
	addStroke(keyBtn, C.accent, 1)
	registerTheme(keyBtn, "BackgroundColor3", "bgLight")
	registerTheme(keyBtn, "TextColor3", "accent")

	local listening = false

	keyBtn.MouseButton1Click:Connect(function()
		listening = true
		keyBtn.Text = "..."
	end)

	return {
		frame = frame,
		getKey = function() return currentKey end,
		setKey = function(k)
			currentKey = k
			keyBtn.Text = k and k.Name or "None"
		end,
		isListening = function() return listening end,
		stopListening = function()
			listening = false
		end,
		callback = callback,
	}
end

-- ══════════════════════════════════════════════════════════════
--  TAB 1 - STAND (player dropdown + toggle + animations)
-- ══════════════════════════════════════════════════════════════

-- Float position (assigned later in Tab 3, used by equip toggle)
local posX, posY, posZ

local function getPlayerNames()
	local names = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= Players.LocalPlayer then
			table.insert(names, p.Name)
		end
	end
	if #names == 0 then
		table.insert(names, "No players found")
	end
	return names
end

local playerDropdown = makeDropdown(tabPages[1], "Player", getPlayerNames(), getPlayerNames()[1], function(choice)
	print("Selected player: " .. choice)
end)

makeButton(tabPages[1], "Refresh Players", C.accent, function()
	local newNames = getPlayerNames()
	playerDropdown.updateOptions(newNames)
	playerDropdown.set(newNames[1])
end)

-- ══════════════════════════════════════════════════════════════
--  STAND ANIMATIONS
-- ══════════════════════════════════════════════════════════════

local animPunch = Instance.new("Animation")
animPunch.AnimationId = "rbxassetid://119071024301062"

local animStandIdle = Instance.new("Animation")
animStandIdle.AnimationId = "rbxassetid://137704682075613"

local animStandIdle2 = Instance.new("Animation")
animStandIdle2.AnimationId = "rbxassetid://97532637410256"

local animStandIdle3 = Instance.new("Animation")
animStandIdle3.AnimationId = "rbxassetid://135373056067761"

local animStandBlock = Instance.new("Animation")
animStandBlock.AnimationId = "rbxassetid://140370328642993"

local idleOptions = {
	{ name = "Idle 1", anim = animStandIdle },
	{ name = "Idle 2", anim = animStandIdle2 },
	{ name = "Idle 3", anim = animStandIdle3 },
}
local currentIdleIndex = 1
local currentIdleAnim = idleOptions[1].anim

local cachedTracks = {}
local cachedAnimator = nil

local loopedAnims = {
	[animStandIdle] = true,
	[animStandIdle2] = true,
	[animStandIdle3] = true,
}

local function playAnim(animObj, speed, time, looped)
	local char = Players.LocalPlayer.Character
	if not char then return end
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end
	local animator = humanoid:FindFirstChildOfClass("Animator")
	if not animator then return end

	if cachedAnimator ~= animator then
		for _, t in pairs(cachedTracks) do
			pcall(function() t:Stop(0) t:Destroy() end)
		end
		cachedTracks = {}
		cachedAnimator = animator
	end

	local track = cachedTracks[animObj]
	if not track then
		track = animator:LoadAnimation(animObj)
		cachedTracks[animObj] = track
	end

	local shouldLoop = looped or loopedAnims[animObj] or false
	track.Looped = shouldLoop
	track:Play(0.1, 1, speed or 1)
	return track
end

local standIdleTrack = nil

local idleNames = { "Idle 1", "Idle 2", "Idle 3" }
local idleDropdown = makeDropdown(tabPages[1], "Idle", idleNames, idleNames[1], function(choice)
	local idx = table.find(idleNames, choice)
	if idx then
		currentIdleIndex = idx
		currentIdleAnim = idleOptions[idx].anim
		if standIdleTrack and standIdleTrack.IsPlaying then
			standIdleTrack:Stop(0)
			standIdleTrack = playAnim(currentIdleAnim, 1, 0, true)
			if standIdleTrack then
				standIdleTrack.Priority = Enum.AnimationPriority.Action4
			end
		end
	end
end)

new("TextLabel", {
	Size = UDim2.new(1, 0, 0, 22),
	BackgroundTransparency = 1,
	Text = "Stand Animations",
	TextColor3 = C.accent,
	Font = Enum.Font.GothamMedium,
	TextSize = 13,
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 4,
	Parent = tabPages[1],
})

local animBtnFrame = new("Frame", {
	Size = UDim2.new(1, 0, 0, 44),
	BackgroundColor3 = C.bgMid,
	BorderSizePixel = 0,
	ZIndex = 4,
	Parent = tabPages[1],
})
addCorner(animBtnFrame, 6)
registerTheme(animBtnFrame, "BackgroundColor3", "bgMid")

local animBtnLayout = new("UIGridLayout", {
	CellSize = UDim2.new(0, 115, 0, 32),
	CellPadding = UDim2.new(0, 6, 0, 6),
	SortOrder = Enum.SortOrder.LayoutOrder,
	Parent = animBtnFrame,
})
new("UIPadding", {
	PaddingTop = UDim.new(0, 6),
	PaddingLeft = UDim.new(0, 6),
	Parent = animBtnFrame,
})

local animBtns = {
	{ name = "Block", anim = animStandBlock },
}

local currentAnimTrack = nil

for i, btnData in ipairs(animBtns) do
	local ab = new("TextButton", {
		Name = "Anim_" .. btnData.name,
		BackgroundColor3 = C.bgLight,
		BorderSizePixel = 0,
		Text = btnData.name,
		TextColor3 = C.text,
		Font = Enum.Font.SourceSans,
		TextSize = 13,
		ZIndex = 5,
		Parent = animBtnFrame,
	})
	addCorner(ab, 4)
	registerTheme(ab, "BackgroundColor3", "bgLight")
	registerTheme(ab, "TextColor3", "text")

	ab.MouseEnter:Connect(function()
		tween(ab, nil, { BackgroundColor3 = C.hover })
	end)
	ab.MouseLeave:Connect(function()
		tween(ab, nil, { BackgroundColor3 = C.bgLight })
	end)
	ab.MouseButton1Click:Connect(function()
		if currentAnimTrack then
			pcall(function() currentAnimTrack:Stop(0.2) end)
			currentAnimTrack = nil
		end
		local track = playAnim(btnData.anim, 1, 0.5)
		if track then
			currentAnimTrack = track
		end
	end)
end

-- ══════════════════════════════════════════════════════════════
--  TOUCH FLING (no GUI, clean start/stop)
-- ══════════════════════════════════════════════════════════════
local hiddenfling = false
local flingThread = nil
local flingActive = false

local function startFling()
	if flingActive then return end
	flingActive = true
	if not ReplicatedStorage:FindFirstChild("juisdfj0i32i0eidsuf0iok") then
		local detection = Instance.new("Decal")
		detection.Name = "juisdfj0i32i0eidsuf0iok"
		detection.Parent = ReplicatedStorage
	end
	hiddenfling = true
	flingThread = coroutine.create(function()
		local lp = Players.LocalPlayer
		local hrp, c, vel, movel = nil, nil, nil, 0.1
		while hiddenfling do
			RunService.Heartbeat:Wait()
			c = lp.Character
			hrp = c and c:FindFirstChild("HumanoidRootPart")
			if hiddenfling then
				while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
					RunService.Heartbeat:Wait()
					c = lp.Character
					hrp = c and c:FindFirstChild("HumanoidRootPart")
				end
			end
			if hiddenfling then
				vel = hrp.Velocity
				hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
				RunService.RenderStepped:Wait()
				if c and c.Parent and hrp and hrp.Parent then
					hrp.Velocity = vel
				end
				RunService.Stepped:Wait()
				if c and c.Parent and hrp and hrp.Parent then
					hrp.Velocity = vel + Vector3.new(0, movel, 0)
					movel = -movel
				end
			end
		end
	end)
	coroutine.resume(flingThread)
end

local function stopFling()
	hiddenfling = false
	flingActive = false
end

-- ══════════════════════════════════════════════════════════════
--  PUNCH FUNCTION
-- ══════════════════════════════════════════════════════════════
local flying = false
local flyConn = nil
local standToggle
local punchCooldown = false
local function doPunch()
	if punchCooldown then return end
	punchCooldown = true

	local targetName = playerDropdown.get()
	if targetName == "No players found" then punchCooldown = false return end
	local targetPlayer = Players:FindFirstChild(targetName)
	if not targetPlayer or not targetPlayer.Character then punchCooldown = false return end
	local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
	local myChar = Players.LocalPlayer.Character
	local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
	if not targetHRP or not myHRP then punchCooldown = false return end

	local wasFlying = flying
	if flying then
		flying = false
		if flyConn then flyConn:Disconnect() flyConn = nil end
		for _, c in ipairs(myHRP:GetChildren()) do
			if c:IsA("BodyPosition") or c:IsA("BodyGyro") then c:Destroy() end
		end
	end

	if standIdleTrack and standIdleTrack.IsPlaying then
		pcall(function() standIdleTrack:Stop(0) end)
		standIdleTrack = nil
	end

	local approachCF = targetHRP.CFrame * CFrame.new(0, 0, -5.3)
	pcall(function() removeCollisions(myChar, targetPlayer.Character) end)
	myHRP.CFrame = approachCF
	task.wait(0.3)

	local punchTrack = playAnim(animPunch, 1.2, 0)
	if punchTrack then
		punchTrack.Priority = Enum.AnimationPriority.Action4
	end

	startFling()
	task.wait(1.0)
	stopFling()
	pcall(function() restoreCollisions() end)
	task.wait(0.2)

	if punchTrack then
		pcall(function() punchTrack:Stop(0.1) end)
	end

	standIdleTrack = playAnim(currentIdleAnim, 1, 0, true)
	if standIdleTrack then
		standIdleTrack.Priority = Enum.AnimationPriority.Action4
	end

	if wasFlying then
		flying = true
		local targetPlayer2 = Players:FindFirstChild(targetName)
		if not targetPlayer2 or not targetPlayer2.Character then punchCooldown = false return end
		local newChar = Players.LocalPlayer.Character
		local newHRP = newChar and newChar:FindFirstChild("HumanoidRootPart")
		if not newHRP then punchCooldown = false return end

		pcall(function() removeCollisions(newChar, targetPlayer2.Character) end)

		local flyBodyPos = Instance.new("BodyPosition")
		flyBodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		flyBodyPos.D = 120
		flyBodyPos.P = 8000
		flyBodyPos.Position = newHRP.Position
		flyBodyPos.Parent = newHRP

		local flyBodyGyro = Instance.new("BodyGyro")
		flyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		flyBodyGyro.D = 80
		flyBodyGyro.P = 8000
		flyBodyGyro.Parent = newHRP

		flyConn = game:GetService("RunService").Heartbeat:Connect(function()
			if not flying then return end
			local tHRP2 = targetPlayer2.Character and targetPlayer2.Character:FindFirstChild("HumanoidRootPart")
			local myNewHRP = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			if not tHRP2 or not myNewHRP then return end
			local offset = Vector3.new(posX.get(), posY.get(), posZ.get())
			local targetCF = tHRP2.CFrame * CFrame.new(offset)
			flyBodyPos.Position = targetCF.Position
			flyBodyGyro.CFrame = tHRP2.CFrame
		end)
	end

	punchCooldown = false
end

-- ══════════════════════════════════════════════════════════════
--  EQUIP STAND TOGGLE
-- ══════════════════════════════════════════════════════════════

-- ══════════════════════════════════════════════════════════════
--  ORBIT (smooth via BodyPosition)
-- ══════════════════════════════════════════════════════════════
local orbiting = false
local orbitConn = nil
local orbitBodyPos = nil
local orbitBodyGyro = nil

local function startOrbit()
	if orbiting then return end
	local targetName = playerDropdown.get()
	if targetName == "No players found" then return end
	local targetPlayer = Players:FindFirstChild(targetName)
	if not targetPlayer or not targetPlayer.Character then return end

	standToggle.set(false)
	flying = false
	if flyConn then flyConn:Disconnect() flyConn = nil end

	local myHRPPre = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if myHRPPre then
		for _, c in ipairs(myHRPPre:GetChildren()) do
			if c:IsA("BodyPosition") or c:IsA("BodyGyro") then c:Destroy() end
		end
	end

	orbiting = true
	local angle = 0
	local radius = 5
	local speed = 2

	local myChar = Players.LocalPlayer.Character
	local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
	if not myHRP then orbiting = false return end

	orbitBodyPos = Instance.new("BodyPosition")
	orbitBodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	orbitBodyPos.D = 120
	orbitBodyPos.P = 8000
	orbitBodyPos.Position = myHRP.Position
	orbitBodyPos.Parent = myHRP

	orbitBodyGyro = Instance.new("BodyGyro")
	orbitBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	orbitBodyGyro.D = 80
	orbitBodyGyro.P = 8000
	orbitBodyGyro.Parent = myHRP

	orbitConn = game:GetService("RunService").Heartbeat:Connect(function(dt)
		if not orbiting then return end
		local tHRP = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not tHRP then return end
		local myNewHRP = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not myNewHRP then
			stopOrbit()
			return
		end
		angle = angle + dt * speed
		local orbitCF = tHRP.CFrame * CFrame.new(math.cos(angle) * radius, 2, math.sin(angle) * radius)
		orbitBodyPos.Position = orbitCF.Position
		orbitBodyGyro.CFrame = CFrame.lookAt(orbitCF.Position, tHRP.Position)
	end)
end

local function stopOrbit()
	orbiting = false
	if orbitConn then orbitConn:Disconnect() orbitConn = nil end
	if orbitBodyPos then orbitBodyPos:Destroy() orbitBodyPos = nil end
	if orbitBodyGyro then orbitBodyGyro:Destroy() orbitBodyGyro = nil end
end

local function doOrbit()
	if orbiting then
		stopOrbit()
	else
		startOrbit()
	end
end

local antiSitActive = false
local antiSitConn = nil

local antiSitToggle = makeToggle(tabPages[1], "Anti Sit", false, function(state)
	antiSitActive = state
	if state then
		local char = Players.LocalPlayer.Character
		if char then
			local humanoid = char:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.Sit = false
			end
		end
		antiSitConn = Players.LocalPlayer.CharacterAdded:Connect(function(char)
			if not antiSitActive then return end
			local humanoid = char:WaitForChild("Humanoid", 5)
			if humanoid and antiSitActive then
				humanoid.Sit = false
				humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
					if antiSitActive and humanoid.Sit then
						humanoid.Sit = false
					end
				end)
			end
		end)
		local humanoid = char and char:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Sit = false
			humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
				if antiSitActive and humanoid.Sit then
					humanoid.Sit = false
				end
			end)
		end
	else
		if antiSitConn then antiSitConn:Disconnect() antiSitConn = nil end
	end
end)

local noCollisionConstraints = {}

local function removeCollisions(char1, char2)
	if not char1 or not char2 then return end
	local parts1 = char1:GetDescendants()
	local parts2 = char2:GetDescendants()
	for _, p1 in ipairs(parts1) do
		if p1:IsA("BasePart") then
			for _, p2 in ipairs(parts2) do
				if p2:IsA("BasePart") then
					local ncc = Instance.new("NoCollisionConstraint")
					ncc.Part0 = p1
					ncc.Part1 = p2
					ncc.Parent = p1
					table.insert(noCollisionConstraints, ncc)
				end
			end
		end
	end
end

local function restoreCollisions()
	for _, ncc in ipairs(noCollisionConstraints) do
		pcall(function() ncc:Destroy() end)
	end
	noCollisionConstraints = {}
end

standToggle = makeToggle(tabPages[1], "Equip Stand", false, function(state)
	local targetName = playerDropdown.get()
	if targetName == "No players found" then return end

	if state then
		stopOrbit()
		flying = true
		local targetPlayer = Players:FindFirstChild(targetName)
		if not targetPlayer or not targetPlayer.Character then return end

		local myChar = Players.LocalPlayer.Character
		local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
		if not myHRP then flying = false return end

		removeCollisions(myChar, targetPlayer.Character)

		standIdleTrack = playAnim(currentIdleAnim, 1, 0, true)
		if standIdleTrack then
			standIdleTrack.Priority = Enum.AnimationPriority.Action4
		end

		local flyBodyPos = Instance.new("BodyPosition")
		flyBodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		flyBodyPos.D = 120
		flyBodyPos.P = 8000
		flyBodyPos.Position = myHRP.Position
		flyBodyPos.Parent = myHRP

		local flyBodyGyro = Instance.new("BodyGyro")
		flyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		flyBodyGyro.D = 80
		flyBodyGyro.P = 8000
		flyBodyGyro.Parent = myHRP

		flyConn = game:GetService("RunService").Heartbeat:Connect(function()
			if not flying then return end
			local tHRP = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
			local myNewHRP = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			if not tHRP or not myNewHRP then return end
			local offset = Vector3.new(posX.get(), posY.get(), posZ.get())
			local targetCF = tHRP.CFrame * CFrame.new(offset)
			flyBodyPos.Position = targetCF.Position
			flyBodyGyro.CFrame = tHRP.CFrame
		end)
		print("Flying next to " .. targetName)
	else
		flying = false
		if flyConn then flyConn:Disconnect() flyConn = nil end
		if standIdleTrack then
			pcall(function() standIdleTrack:Stop(0.2) end)
			standIdleTrack = nil
		end
		restoreCollisions()
		local myHRP = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if myHRP then
			for _, c in ipairs(myHRP:GetChildren()) do
				if c:IsA("BodyPosition") or c:IsA("BodyGyro") then c:Destroy() end
			end
		end
		print("Stopped flying")
	end
end)

-- ══════════════════════════════════════════════════════════════
--  TAB 2 - KEYBINDS
-- ══════════════════════════════════════════════════════════════
local keybinds = {
	makeKeybind(tabPages[2], "Equip Stand", Enum.KeyCode.X, function()
		standToggle.toggle()
	end),
	makeKeybind(tabPages[2], "Orbit", Enum.KeyCode.Z, function()
		doOrbit()
	end),
	makeKeybind(tabPages[2], "Punch", Enum.KeyCode.C, function()
		doPunch()
	end),
}

-- ══════════════════════════════════════════════════════════════
--  TAB 3 - STAND SETTINGS (float position)
-- ══════════════════════════════════════════════════════════════
posX = makeSlider(tabPages[3], "X Offset", -50, 50, -2.5)
posY = makeSlider(tabPages[3], "Y Offset", -50, 50, 1.7)
posZ = makeSlider(tabPages[3], "Z Offset", -50, 50, 1.9)

makeButton(tabPages[3], "Reset Position", C.red, function()
	posX.set(-2.5)
	posY.set(1.7)
	posZ.set(1.9)
	print("Position reset")
end)

-- ══════════════════════════════════════════════════════════════
--  SETTINGS PAGE CONTENT (gear button)
-- ══════════════════════════════════════════════════════════════
new("TextLabel", {
	Size = UDim2.new(1, 0, 0, 28),
	BackgroundTransparency = 1,
	Text = "⚙  Settings",
	TextColor3 = C.accent,
	Font = Enum.Font.GothamMedium,
	TextSize = 16,
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 11,
	Parent = settingsPage,
})

local kbFrame = new("Frame", {
	Size = UDim2.new(1, 0, 0, 36),
	BackgroundColor3 = C.bgMid,
	BorderSizePixel = 0,
	ZIndex = 11,
	Parent = settingsPage,
})
addCorner(kbFrame, 6)
addPadding(kbFrame, 0, 0, 10, 10)
registerTheme(kbFrame, "BackgroundColor3", "bgMid")

new("TextLabel", {
	Size = UDim2.new(0.6, 0, 1, 0),
	BackgroundTransparency = 1,
	Text = "Toggle UI Keybind",
	TextColor3 = C.text,
	Font = Enum.Font.SourceSans,
	TextSize = 14,
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 12,
	Parent = kbFrame,
})

local currentToggleKey = Enum.KeyCode.K
local rebinding = false

local kbLabel = new("TextButton", {
	Size = UDim2.new(0, 40, 0, 26),
	Position = UDim2.new(1, -46, 0.5, 0),
	AnchorPoint = Vector2.new(0, 0.5),
	BackgroundColor3 = C.bgLight,
	BorderSizePixel = 0,
	Text = "K",
	TextColor3 = C.accent,
	Font = Enum.Font.GothamMedium,
	TextSize = 14,
	ZIndex = 12,
	Parent = kbFrame,
})
addCorner(kbLabel, 4)
addStroke(kbLabel, C.accent, 1)
registerTheme(kbLabel, "BackgroundColor3", "bgLight")
registerTheme(kbLabel, "TextColor3", "accent")

kbLabel.MouseButton1Click:Connect(function()
	rebinding = true
	kbLabel.Text = "..."
end)

new("TextLabel", {
	Size = UDim2.new(1, 0, 0, 24),
	BackgroundTransparency = 1,
	Text = "UI Theme",
	TextColor3 = C.text,
	Font = Enum.Font.GothamMedium,
	TextSize = 13,
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 11,
	Parent = settingsPage,
})

local dropdownOpen = false

local dropdownFrame = new("Frame", {
	Size = UDim2.new(1, 0, 0, 36),
	BackgroundColor3 = C.bgMid,
	BorderSizePixel = 0,
	ZIndex = 11,
	Parent = settingsPage,
})
addCorner(dropdownFrame, 6)
registerTheme(dropdownFrame, "BackgroundColor3", "bgMid")

local dropdownBtn = new("TextButton", {
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundColor3 = C.bgLight,
	BorderSizePixel = 0,
	Text = "",
	ZIndex = 12,
	Parent = dropdownFrame,
})
addCorner(dropdownBtn, 6)
registerTheme(dropdownBtn, "BackgroundColor3", "bgLight")

local dropdownLabel = new("TextLabel", {
	Position = UDim2.new(0, 10, 0.5, 0),
	AnchorPoint = Vector2.new(0, 0.5),
	Size = UDim2.new(0.85, 0, 0, 20),
	BackgroundTransparency = 1,
	Text = currentThemeName,
	TextColor3 = C.text,
	Font = Enum.Font.SourceSans,
	TextSize = 14,
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 13,
	Parent = dropdownBtn,
})
registerTheme(dropdownLabel, "TextColor3", "text")

local dropdownArrow = new("TextLabel", {
	Position = UDim2.new(1, -12, 0.5, 0),
	AnchorPoint = Vector2.new(1, 0.5),
	Size = UDim2.new(0, 20, 0, 20),
	BackgroundTransparency = 1,
	Text = "▼",
	TextColor3 = C.textDim,
	Font = Enum.Font.GothamMedium,
	TextSize = 10,
	ZIndex = 13,
	Parent = dropdownBtn,
})
registerTheme(dropdownArrow, "TextColor3", "textDim")

local dropdownOptions = new("ScrollingFrame", {
	Size = UDim2.new(0, 0, 0, math.min(#themeNames * 32 + 16, 300)),
	BackgroundColor3 = C.bgMid,
	BorderSizePixel = 0,
	Visible = false,
	ZIndex = 200,
	ScrollBarThickness = 4,
	ScrollBarImageColor3 = C.accent,
	ScrollingDirection = Enum.ScrollingDirection.Y,
	CanvasSize = UDim2.new(0, 0, 0, #themeNames * 32 + 16),
	Parent = screenGui,
})
addCorner(dropdownOptions, 6)
addStroke(dropdownOptions, C.accent, 1)
registerTheme(dropdownOptions, "BackgroundColor3", "bgMid")

new("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 4),
	Parent = dropdownOptions,
})
addPadding(dropdownOptions, 4, 4, 4, 4)

local function buildDropdownOptions()
	for _, child in ipairs(dropdownOptions:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end

	for i, name in ipairs(themeNames) do
		local isSelected = name == currentThemeName
		local optBtn = new("TextButton", {
			Name = "Option_" .. i,
			Size = UDim2.new(1, -8, 0, 28),
			BackgroundColor3 = isSelected and C.tabActive or C.bgLight,
			BorderSizePixel = 0,
			Text = "",
			ZIndex = 201,
			Parent = dropdownOptions,
		})
		addCorner(optBtn, 4)

		local swatch = new("Frame", {
			Position = UDim2.new(0, 8, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.new(0, 16, 0, 16),
			BackgroundColor3 = themes[name].accent,
			BorderSizePixel = 0,
			ZIndex = 202,
			Parent = optBtn,
		})
		addCorner(swatch, 4)

		new("TextLabel", {
			Position = UDim2.new(0, 32, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.new(0.8, 0, 0, 20),
			BackgroundTransparency = 1,
			Text = name,
			TextColor3 = isSelected and C.bgDark or C.text,
			Font = Enum.Font.SourceSans,
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 202,
			Parent = optBtn,
		})

		optBtn.MouseEnter:Connect(function()
			if name ~= currentThemeName then
				tween(optBtn, nil, { BackgroundColor3 = C.hover })
			end
		end)
		optBtn.MouseLeave:Connect(function()
			if name ~= currentThemeName then
				tween(optBtn, nil, { BackgroundColor3 = C.bgLight })
			end
		end)

		optBtn.MouseButton1Click:Connect(function()
			currentThemeName = name
			C = themes[name]
			applyTheme(name)
			dropdownLabel.Text = name
			dropdownOpen = false
			dropdownOptions.Visible = false
			dropdownArrow.Text = "▼"
			if settingsMode then
				showSettings()
			else
				activateTab(activeTab)
			end
			buildDropdownOptions()
		end)
	end
end

buildDropdownOptions()

dropdownBtn.MouseButton1Click:Connect(function()
	dropdownOpen = not dropdownOpen
	if dropdownOpen then
		local absPos = dropdownBtn.AbsolutePosition
		local absSize = dropdownBtn.AbsoluteSize
		dropdownOptions.Position = UDim2.new(0, absPos.X, 0, absPos.Y + absSize.Y + 4)
		dropdownOptions.Size = UDim2.new(0, absSize.X, 0, math.min(#themeNames * 32 + 16, 300))
		dropdownOptions.CanvasSize = UDim2.new(0, 0, 0, #themeNames * 32 + 16)
	end
	dropdownOptions.Visible = dropdownOpen
	dropdownArrow.Text = dropdownOpen and "▲" or "▼"
end)

new("TextLabel", {
	Size = UDim2.new(1, 0, 0, 24),
	BackgroundTransparency = 1,
	Text = "Troll Stand Script v1.0",
	TextColor3 = C.textDim,
	Font = Enum.Font.SourceSans,
	TextSize = 12,
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 11,
	Parent = settingsPage,
})

local destroyBtn = new("TextButton", {
	Size = UDim2.new(1, 0, 0, 38),
	BackgroundColor3 = C.red,
	BorderSizePixel = 0,
	Text = "✕  Destroy UI",
	TextColor3 = C.white,
	Font = Enum.Font.GothamMedium,
	TextSize = 14,
	ZIndex = 11,
	Parent = settingsPage,
})
addCorner(destroyBtn, 6)

destroyBtn.MouseEnter:Connect(function()
	tween(destroyBtn, nil, { BackgroundColor3 = Color3.fromRGB(200, 80, 80) })
end)
destroyBtn.MouseLeave:Connect(function()
	tween(destroyBtn, nil, { BackgroundColor3 = C.red })
end)

destroyBtn.MouseButton1Click:Connect(function()
	stopFling()
	stopOrbit()
	restoreCollisions()
	if flyConn then flyConn:Disconnect() flyConn = nil end
	flying = false
	local myHRP = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if myHRP then
		for _, c in ipairs(myHRP:GetChildren()) do
			if c:IsA("BodyPosition") or c:IsA("BodyGyro") then c:Destroy() end
		end
	end
	tween(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
	})
	task.delay(0.35, function()
		screenGui:Destroy()
	end)
end)

-- ══════════════════════════════════════════════════════════════
--  HIDE / TOGGLE (K key + keybind tab)
-- ══════════════════════════════════════════════════════════════
local hidden = false

local function toggleUI()
	hidden = not hidden
	mainFrame.Visible = not hidden
end

minimizeBtn.MouseButton1Click:Connect(toggleUI)

UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end

	-- Handle keybind rebinding from Tab 2
	for _, kb in ipairs(keybinds) do
		if kb.isListening() then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				kb.setKey(input.KeyCode)
				kb.stopListening()
				if kb.callback then kb.callback(input.KeyCode) end
			end
			return
		end
	end

	-- Handle settings page toggle key rebinding
	if rebinding then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			currentToggleKey = input.KeyCode
			kbLabel.Text = input.KeyCode.Name
			rebinding = false
		end
		return
	end

	-- Handle keybind tab actions
	for _, kb in ipairs(keybinds) do
		if kb.getKey() and kb.getKey() == input.KeyCode and kb.callback then
			kb.callback()
		end
	end

	if input.KeyCode == currentToggleKey then
		toggleUI()
	end
end)

-- ══════════════════════════════════════════════════════════════
--  DRAGGABLE
-- ══════════════════════════════════════════════════════════════
do
	local dragging, dragStart, startPos

	titleBar.MouseButton1Down:Connect(function()
		dragging = true
		dragStart = UserInputService:GetMouseLocation()
		startPos = mainFrame.Position
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local current = UserInputService:GetMouseLocation()
			local delta = current - dragStart
			mainFrame.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

-- ══════════════════════════════════════════════════════════════
--  ENTRANCE ANIMATION
-- ══════════════════════════════════════════════════════════════
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundTransparency = 1
task.delay(0.1, function()
	tween(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 520, 0, 360),
		BackgroundTransparency = 0,
	})
end)
