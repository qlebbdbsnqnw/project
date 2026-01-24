-- Gui to Lua
-- Version: 3.2

-- Instances:

-- <<by k1llm3sixy>>

local TranslatorGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TitleLabel = Instance.new("TextLabel")
local InputFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local InputBox = Instance.new("TextBox")
local OutputFrame = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local OutputBox = Instance.new("TextBox")
local ButtonsFrame = Instance.new("Frame")
local CopyBtn = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local CopyIcon = Instance.new("ImageLabel")
local TranslateBtn = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TranslateIcon = Instance.new("ImageLabel")
local SendChatBtn = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local SendChatIcon = Instance.new("ImageLabel")
local SelectLangBtn = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local LangIcon = Instance.new("ImageLabel")
local CloseBtn = Instance.new("ImageButton")
local OutputLang = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding_4 = Instance.new("UIPadding")
local UICorner_7 = Instance.new("UICorner")
local Template = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local DragDetector = Instance.new("UIDragDetector")
local LangLabel = Instance.new("TextLabel")
local OutputLabel = Instance.new("TextLabel")
local InputLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")
local Stroke = Instance.new("UIStroke")
local Stroke_2 = Instance.new("UIStroke")
local Gradient = Instance.new("UIGradient")
local TitleStroke = Instance.new("UIStroke")
local ButtonsStroke = Instance.new("UIStroke")

--Properties:

TranslatorGui.Name = "TranslatorGui"
TranslatorGui.Parent = game.CoreGui
TranslatorGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TranslatorGui.ResetOnSpawn = false
TranslatorGui.IgnoreGuiInset = true

MainFrame.Name = "MainFrame"
MainFrame.Parent = TranslatorGui
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.31957528, -15, 0.186707824, 25)
MainFrame.Size = UDim2.new(0, 450, 0, 570)

Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(45, 45, 55)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 40))
})
Gradient.Rotation = 45
Gradient.Parent = MainFrame

DragDetector.Name = "DragDetector"
DragDetector.Parent = MainFrame

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1.000
TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.BorderSizePixel = 0
TitleLabel.Position = UDim2.new(0.23, 0, 0.01, 0)
TitleLabel.Size = UDim2.new(0, 240, 0, 50)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "🌍 Translator"
TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
TitleLabel.TextSize = 28.000
TitleLabel.TextStrokeTransparency = 0.8

TitleStroke.Name = "TitleStroke"
TitleStroke.Parent = TitleLabel
TitleStroke.Color = Color3.fromRGB(100, 100, 180)
TitleStroke.Thickness = 1.5
TitleStroke.Transparency = 0.7

LangLabel.Name = "LangLabel"
LangLabel.Parent = MainFrame
LangLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LangLabel.BackgroundTransparency = 1.000
LangLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
LangLabel.BorderSizePixel = 0
LangLabel.Position = UDim2.new(0.68, 0, 0.92, 0)
LangLabel.Size = UDim2.new(0, 100, 0, 22)
LangLabel.Font = Enum.Font.GothamMedium
LangLabel.Text = "English"
LangLabel.TextColor3 = Color3.fromRGB(180, 180, 220)
LangLabel.TextSize = 14
LangLabel.TextXAlignment = Enum.TextXAlignment.Right

StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.BackgroundTransparency = 1
StatusLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
StatusLabel.BorderSizePixel = 0
StatusLabel.Position = UDim2.new(0.25, 0, 0.5, 0)
StatusLabel.Size = UDim2.new(0, 200, 0, 60)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "Translating..."
StatusLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
StatusLabel.TextSize = 24
StatusLabel.ZIndex = 3
StatusLabel.Visible = false

InputFrame.Name = "InputFrame"
InputFrame.Parent = MainFrame
InputFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
InputFrame.BorderSizePixel = 0
InputFrame.Position = UDim2.new(0.05, 0, 0.12, 0)
InputFrame.Size = UDim2.new(0, 400, 0, 150)

InputLabel.Name = "InputLabel"
InputLabel.Parent = InputFrame
InputLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InputLabel.BackgroundTransparency = 1.000
InputLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
InputLabel.BorderSizePixel = 0
InputLabel.Position = UDim2.new(0.03, 0, -0.2, 0)
InputLabel.Size = UDim2.new(0, 80, 0, 22)
InputLabel.Font = Enum.Font.GothamMedium
InputLabel.Text = "📝 Input"
InputLabel.TextColor3 = Color3.fromRGB(180, 180, 220)
InputLabel.TextSize = 14
InputLabel.TextXAlignment = Enum.TextXAlignment.Left

Stroke.Name = "Stroke"
Stroke.Parent = InputFrame
Stroke.Color = Color3.fromRGB(80, 80, 120)
Stroke.Thickness = 2

UICorner_2.CornerRadius = UDim.new(0, 15)
UICorner_2.Parent = InputFrame

InputBox.Name = "InputBox"
InputBox.Parent = InputFrame
InputBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InputBox.BackgroundTransparency = 1.000
InputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
InputBox.BorderSizePixel = 0
InputBox.Position = UDim2.new(0.03, 0, 0.07, 0)
InputBox.Size = UDim2.new(0, 375, 0, 125)
InputBox.ClearTextOnFocus = false
InputBox.Font = Enum.Font.Gotham
InputBox.MultiLine = true
InputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 180)
InputBox.PlaceholderText = "Type text and press Enter to translate & send..."
InputBox.TextColor3 = Color3.fromRGB(220, 220, 255)
InputBox.TextSize = 15.000
InputBox.Text = ""
InputBox.TextWrapped = true
InputBox.TextXAlignment = Enum.TextXAlignment.Left
InputBox.TextYAlignment = Enum.TextYAlignment.Top

OutputFrame.Name = "OutputFrame"
OutputFrame.Parent = MainFrame
OutputFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
OutputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
OutputFrame.BorderSizePixel = 0
OutputFrame.Position = UDim2.new(0.05, 0, 0.45, 0)
OutputFrame.Size = UDim2.new(0, 400, 0, 150)

OutputLabel.Name = "OutputLabel"
OutputLabel.Parent = OutputFrame
OutputLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OutputLabel.BackgroundTransparency = 1.000
OutputLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
OutputLabel.BorderSizePixel = 0
OutputLabel.Position = UDim2.new(0.03, 0, -0.2, 0)
OutputLabel.Size = UDim2.new(0, 80, 0, 22)
OutputLabel.Font = Enum.Font.GothamMedium
OutputLabel.Text = "💬 Output"
OutputLabel.TextColor3 = Color3.fromRGB(180, 180, 220)
OutputLabel.TextSize = 14
OutputLabel.TextXAlignment = Enum.TextXAlignment.Left

Stroke_2.Name = "Stroke"
Stroke_2.Parent = OutputFrame
Stroke_2.Color = Color3.fromRGB(80, 80, 120)
Stroke_2.Thickness = 2

UICorner_3.CornerRadius = UDim.new(0, 15)
UICorner_3.Parent = OutputFrame

OutputBox.Name = "OutputBox"
OutputBox.Parent = OutputFrame
OutputBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OutputBox.BackgroundTransparency = 1.000
OutputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
OutputBox.BorderSizePixel = 0
OutputBox.Position = UDim2.new(0.03, 0, 0.07, 0)
OutputBox.Size = UDim2.new(0, 375, 0, 125)
OutputBox.ClearTextOnFocus = false
OutputBox.Font = Enum.Font.Gotham
OutputBox.MultiLine = true
OutputBox.TextColor3 = Color3.fromRGB(220, 220, 255)
OutputBox.TextSize = 15.000
OutputBox.Text = ""
OutputBox.TextWrapped = true
OutputBox.TextXAlignment = Enum.TextXAlignment.Left
OutputBox.TextYAlignment = Enum.TextYAlignment.Top
OutputBox.TextEditable = false

ButtonsFrame.Name = "ButtonsFrame"
ButtonsFrame.Parent = MainFrame
ButtonsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ButtonsFrame.BackgroundTransparency = 0.5
ButtonsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ButtonsFrame.BorderSizePixel = 0
ButtonsFrame.Position = UDim2.new(0.05, 0, 0.8, 0)
ButtonsFrame.Size = UDim2.new(0, 400, 0, 80)

ButtonsStroke.Name = "ButtonsStroke"
ButtonsStroke.Parent = ButtonsFrame
ButtonsStroke.Color = Color3.fromRGB(80, 80, 120)
ButtonsStroke.Thickness = 2

CopyBtn.Name = "CopyBtn"
CopyBtn.Parent = ButtonsFrame
CopyBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
CopyBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
CopyBtn.BorderSizePixel = 0
CopyBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
CopyBtn.Size = UDim2.new(0, 70, 0, 50)
CopyBtn.AutoButtonColor = false
CopyBtn.Font = Enum.Font.GothamMedium
CopyBtn.Text = "Copy"
CopyBtn.TextColor3 = Color3.fromRGB(240, 240, 255)
CopyBtn.TextSize = 14.000

UICorner_4.CornerRadius = UDim.new(0, 12)
UICorner_4.Parent = CopyBtn

CopyIcon.Name = "CopyIcon"
CopyIcon.Parent = CopyBtn
CopyIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CopyIcon.BackgroundTransparency = 1.000
CopyIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
CopyIcon.BorderSizePixel = 0
CopyIcon.Position = UDim2.new(0.2, 0, -0.4, 0)
CopyIcon.Size = UDim2.new(0, 20, 0, 20)
CopyIcon.Image = "rbxassetid://96265482350413"
CopyIcon.ImageColor3 = Color3.fromRGB(240, 240, 255)

TranslateBtn.Name = "TranslateBtn"
TranslateBtn.Parent = ButtonsFrame
TranslateBtn.BackgroundColor3 = Color3.fromRGB(80, 180, 100)
TranslateBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
TranslateBtn.BorderSizePixel = 0
TranslateBtn.Position = UDim2.new(0.3, 0, 0.2, 0)
TranslateBtn.Size = UDim2.new(0, 70, 0, 50)
TranslateBtn.AutoButtonColor = false
TranslateBtn.Font = Enum.Font.GothamMedium
TranslateBtn.Text = "Translate"
TranslateBtn.TextColor3 = Color3.fromRGB(240, 240, 255)
TranslateBtn.TextSize = 14.000

UICorner_5.CornerRadius = UDim.new(0, 12)
UICorner_5.Parent = TranslateBtn

TranslateIcon.Name = "TranslateIcon"
TranslateIcon.Parent = TranslateBtn
TranslateIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TranslateIcon.BackgroundTransparency = 1.000
TranslateIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
TranslateIcon.BorderSizePixel = 0
TranslateIcon.Position = UDim2.new(0.2, 0, -0.4, 0)
TranslateIcon.Size = UDim2.new(0, 20, 0, 20)
TranslateIcon.Image = "rbxassetid://87926987916881"
TranslateIcon.ImageColor3 = Color3.fromRGB(240, 240, 255)

SendChatBtn.Name = "SendChatBtn"
SendChatBtn.Parent = ButtonsFrame
SendChatBtn.BackgroundColor3 = Color3.fromRGB(180, 100, 220)
SendChatBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
SendChatBtn.BorderSizePixel = 0
SendChatBtn.Position = UDim2.new(0.55, 0, 0.2, 0)
SendChatBtn.Size = UDim2.new(0, 70, 0, 50)
SendChatBtn.AutoButtonColor = false
SendChatBtn.Font = Enum.Font.GothamMedium
SendChatBtn.Text = "Send to Chat"
SendChatBtn.TextColor3 = Color3.fromRGB(240, 240, 255)
SendChatBtn.TextSize = 12.000

UICorner_9.CornerRadius = UDim.new(0, 12)
UICorner_9.Parent = SendChatBtn

SendChatIcon.Name = "SendChatIcon"
SendChatIcon.Parent = SendChatBtn
SendChatIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SendChatIcon.BackgroundTransparency = 1.000
SendChatIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
SendChatIcon.BorderSizePixel = 0
SendChatIcon.Position = UDim2.new(0.2, 0, -0.4, 0)
SendChatIcon.Size = UDim2.new(0, 20, 0, 20)
SendChatIcon.Image = "rbxassetid://6031075938"
SendChatIcon.ImageColor3 = Color3.fromRGB(240, 240, 255)

SelectLangBtn.Name = "SelectLangBtn"
SelectLangBtn.Parent = ButtonsFrame
SelectLangBtn.BackgroundColor3 = Color3.fromRGB(220, 120, 80)
SelectLangBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
SelectLangBtn.BorderSizePixel = 0
SelectLangBtn.Position = UDim2.new(0.8, 0, 0.2, 0)
SelectLangBtn.Size = UDim2.new(0, 70, 0, 50)
SelectLangBtn.AutoButtonColor = false
SelectLangBtn.Font = Enum.Font.GothamMedium
SelectLangBtn.Text = "Language"
SelectLangBtn.TextColor3 = Color3.fromRGB(240, 240, 255)
SelectLangBtn.TextSize = 12.000

UICorner_6.CornerRadius = UDim.new(0, 12)
UICorner_6.Parent = SelectLangBtn

LangIcon.Name = "LangIcon"
LangIcon.Parent = SelectLangBtn
LangIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LangIcon.BackgroundTransparency = 1.000
LangIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
LangIcon.BorderSizePixel = 0
LangIcon.Position = UDim2.new(0.2, 0, -0.4, 0)
LangIcon.Size = UDim2.new(0, 20, 0, 20)
LangIcon.Image = "rbxassetid://7744394226"
LangIcon.ImageColor3 = Color3.fromRGB(240, 240, 255)

CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
CloseBtn.BackgroundTransparency = 0.5
CloseBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(0.92, 0, 0.02, 0)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Image = "rbxassetid://92186614586776"
CloseBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)

OutputLang.Name = "OutputLang"
OutputLang.Parent = MainFrame
OutputLang.Active = true
OutputLang.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
OutputLang.BorderColor3 = Color3.fromRGB(0, 0, 0)
OutputLang.BorderSizePixel = 0
OutputLang.Position = UDim2.new(1.02, 0, 0.12, 0)
OutputLang.Size = UDim2.new(0, 120, 0, 300)
OutputLang.ScrollBarThickness = 6
OutputLang.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 150)
OutputLang.AutomaticCanvasSize = Enum.AutomaticSize.Y
OutputLang.Visible = false

UIListLayout.Parent = OutputLang
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIPadding_4.Parent = OutputLang
UIPadding_4.PaddingLeft = UDim.new(0, 5)
UIPadding_4.PaddingTop = UDim.new(0, 5)
UIPadding_4.PaddingBottom = UDim.new(0, 5)

UICorner_7.CornerRadius = UDim.new(0, 15)
UICorner_7.Parent = OutputLang

Template.Name = "Template"
Template.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderSizePixel = 0
Template.Size = UDim2.new(0, 100, 0, 35)
Template.AutoButtonColor = false
Template.Font = Enum.Font.Gotham
Template.TextColor3 = Color3.fromRGB(220, 220, 255)
Template.TextSize = 12.000

UICorner_8.CornerRadius = UDim.new(0, 8)
UICorner_8.Parent = Template

-- Script
local httpService = game:GetService("HttpService")
local tweenService = game:GetService("TweenService")
local textService = game:GetService("TextService")
local players = game:GetService("Players")
local player = players.LocalPlayer

local btns = {
	SelectLangBtn,
	TranslateBtn,
	CopyBtn,
	SendChatBtn
}

local cfg = {
	lang = "en",
	url = "https://ftapi.pythonanywhere.com/translate?dl=%s&text=%s",
	loading = false,
	autoSendToChat = true,
	languages = {
		{name = "Afrikaans", code = "af"},
		{name = "Albanian", code = "sq"},
		{name = "Amharic", code = "am"},
		{name = "Arabic", code = "ar"},
		{name = "Armenian", code = "hy"},
		{name = "Azerbaijani", code = "az"},
		{name = "Basque", code = "eu"},
		{name = "Belarusian", code = "be"},
		{name = "Bengali", code = "bn"},
		{name = "Bosnian", code = "bs"},
		{name = "Bulgarian", code = "bg"},
		{name = "Catalan", code = "ca"},
		{name = "Cebuano", code = "ceb"},
		{name = "Chichewa", code = "ny"},
		{name = "Chinese", code = "zh-cn"},
		{name = "Corsican", code = "co"},
		{name = "Croatian", code = "hr"},
		{name = "Czech", code = "cs"},
		{name = "Danish", code = "da"},
		{name = "Dutch", code = "nl"},
		{name = "English", code = "en"},
		{name = "Esperanto", code = "eo"},
		{name = "Estonian", code = "et"},
		{name = "Filipino", code = "tl"},
		{name = "Finnish", code = "fi"},
		{name = "French", code = "fr"},
		{name = "Frisian", code = "fy"},
		{name = "Galician", code = "gl"},
		{name = "Georgian", code = "ka"},
		{name = "German", code = "de"},
		{name = "Greek", code = "el"},
		{name = "Gujarati", code = "gu"},
		{name = "Haitian", code = "ht"},
		{name = "Hausa", code = "ha"},
		{name = "Hawaiian", code = "haw"},
		{name = "Hindi", code = "hi"},
		{name = "Hmong", code = "hmn"},
		{name = "Hungarian", code = "hu"},
		{name = "Icelandic", code = "is"},
		{name = "Igbo", code = "ig"},
		{name = "Indonesian", code = "id"},
		{name = "Irish", code = "ga"},
		{name = "Italian", code = "it"},
		{name = "Japanese", code = "ja"},
		{name = "Javanese", code = "jw"},
		{name = "Kannada", code = "kn"},
		{name = "Kazakh", code = "kk"},
		{name = "Khmer", code = "km"},
		{name = "Korean", code = "ko"},
		{name = "Kurdish", code = "ku"},
		{name = "Kyrgyz", code = "ky"},
		{name = "Lao", code = "lo"},
		{name = "Latin", code = "la"},
		{name = "Latvian", code = "lv"},
		{name = "Lithuanian", code = "lt"},
		{name = "Luxembourgish", code = "lb"},
		{name = "Macedonian", code = "mk"},
		{name = "Malagasy", code = "mg"},
		{name = "Malay", code = "ms"},
		{name = "Malayalam", code = "ml"},
		{name = "Maltese", code = "mt"},
		{name = "Maori", code = "mi"},
		{name = "Marathi", code = "mr"},
		{name = "Mongolian", code = "mn"},
		{name = "Myanmar", code = "my"},
		{name = "Nepali", code = "ne"},
		{name = "Norwegian", code = "no"},
		{name = "Odia", code = "or"},
		{name = "Pashto", code = "ps"},
		{name = "Persian", code = "fa"},
		{name = "Polish", code = "pl"},
		{name = "Portuguese", code = "pt"},
		{name = "Punjabi", code = "pa"},
		{name = "Romanian", code = "ro"},
		{name = "Russian", code = "ru"},
		{name = "Samoan", code = "sm"},
		{name = "Scots Gaelic", code = "gd"},
		{name = "Serbian", code = "sr"},
		{name = "Sesotho", code = "st"},
		{name = "Shona", code = "sn"},
		{name = "Sindhi", code = "sd"},
		{name = "Sinhala", code = "si"},
		{name = "Slovak", code = "sk"},
		{name = "Slovenian", code = "sl"},
		{name = "Somali", code = "so"},
		{name = "Spanish", code = "es"},
		{name = "Sundanese", code = "su"},
		{name = "Swahili", code = "sw"},
		{name = "Swedish", code = "sv"},
		{name = "Tajik", code = "tg"},
		{name = "Tamil", code = "ta"},
		{name = "Telugu", code = "te"},
		{name = "Thai", code = "th"},
		{name = "Turkish", code = "tr"},
		{name = "Ukrainian", code = "uk"},
		{name = "Urdu", code = "ur"},
		{name = "Uyghur", code = "ug"},
		{name = "Uzbek", code = "uz"},
		{name = "Vietnamese", code = "vi"},
		{name = "Welsh", code = "cy"},
		{name = "Xhosa", code = "xh"},
		{name = "Yiddish", code = "yi"},
		{name = "Yoruba", code = "yo"},
		{name = "Zulu", code = "zu"}
	}
}

-- Анимация для кнопок
function addAnim(btn)
	local info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local orgSize = btn.Size
	local hoverSize = UDim2.new(orgSize.X.Scale, orgSize.X.Offset + 5, orgSize.Y.Scale, orgSize.Y.Offset + 5)
	local orgColor = btn.BackgroundColor3
	local hoverColor = Color3.fromRGB(
		math.min(255, orgColor.R * 255 + 30),
		math.min(255, orgColor.G * 255 + 30),
		math.min(255, orgColor.B * 255 + 30)
	)

	local function playAnim(size, color)
		tweenService:Create(btn, info, {Size = size, BackgroundColor3 = color}):Play()
	end

	btn.MouseEnter:Connect(function()
		playAnim(hoverSize, hoverColor)
	end)
	
	btn.MouseLeave:Connect(function()
		playAnim(orgSize, orgColor)
	end)
	
	btn.MouseButton1Down:Connect(function()
		tweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(orgColor.R * 255 - 30, orgColor.G * 255 - 30, orgColor.B * 255 - 30)}):Play()
	end)
	
	btn.MouseButton1Up:Connect(function()
		tweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = hoverColor}):Play()
	end)
end

-- Уведомления
function addNotify(text)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "🌍 Translator",
		Text = text,
		Duration = 3,
		Icon = "rbxassetid://87926987916881"
	})
end

-- Получение ввода
function getInput()
	local input = InputBox.Text
	if input ~= nil and input ~= "" then
		return httpService:UrlEncode(input)
	else
		return nil
	end
end

-- Добавление языков
function addLangs()
	for _, v in pairs(cfg.languages) do
		local button = Template:Clone()
		button.Name = v.code
		button.Text = v.name
		button.Parent = OutputLang

		button.MouseButton1Click:Connect(function()
			cfg.lang = button.Name
			LangLabel.Text = button.Text
			OutputLang.Visible = false
			
			-- Анимация выбора языка
			local originalColor = button.BackgroundColor3
			tweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 180, 100)}):Play()
			wait(0.3)
			tweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
		end)
		
		-- Анимация для кнопок языков
		button.MouseEnter:Connect(function()
			tweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 100)}):Play()
		end)
		
		button.MouseLeave:Connect(function()
			tweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 80)}):Play()
		end)
	end
end

-- Отправка в чат
function sendToChat()
    local text = OutputBox.Text
    if text and text ~= "" then
        local success = pcall(function()
            -- Пытаемся использовать стандартный чат Roblox
            local events = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
            if events then
                local sayMessage = events:FindFirstChild("SayMessageRequest")
                if sayMessage then
                    -- Ограничиваем длину сообщения
                    if #text > 200 then
                        text = text:sub(1, 200) .. "..."
                    end
                    
                    sayMessage:FireServer(text, "All")
                    addNotify("✓ Sent to chat!")
                    return true
                end
            end
            
            -- Пробуем TextChatService (новый чат)
            local textChatService = game:GetService("TextChatService")
            if textChatService then
                local textChannels = textChatService:FindFirstChild("TextChannels")
                if textChannels then
                    local generalChannel = textChannels:FindFirstChild("RBXGeneral")
                    if generalChannel then
                        generalChannel:SendAsync(text)
                        addNotify("✓ Sent to chat!")
                        return true
                    end
                end
            end
            
            return false
        end)
        
        if not success then
            -- Системное сообщение как запасной вариант
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                Text = "[🌍 Translator]: " .. text,
                Color = Color3.fromRGB(120, 200, 255),
                Font = Enum.Font.GothamMedium,
                TextSize = 16
            })
            addNotify("✓ Sent as system message!")
        end
    else
        addNotify("No text to send!")
    end
end

-- Автоматический перевод и отправка
function autoTranslateAndSend()
    if cfg.loading then return end
    
    local inputText = InputBox.Text
    if not inputText or inputText == "" then
        addNotify("Please enter text to translate!")
        return
    end
    
    -- Показываем статус
    cfg.loading = true
    StatusLabel.Visible = true
    StatusLabel.Text = "Translating..."
    
    -- Анимация кнопки
    tweenService:Create(TranslateBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 140, 80)}):Play()
    
    local encodedInput = httpService:UrlEncode(inputText)
    
    -- Запрос перевода
    local success, response = pcall(function()
        return game:HttpGetAsync(string.format(cfg.url, cfg.lang, encodedInput))
    end)
    
    cfg.loading = false
    StatusLabel.Visible = false
    tweenService:Create(TranslateBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(80, 180, 100)}):Play()
    
    if success then
        local decoded = httpService:JSONDecode(response)
        if decoded and decoded["destination-text"] then
            local translatedText = decoded["destination-text"]
            OutputBox.Text = translatedText
            
            -- Анимация появления текста
            OutputBox.TextTransparency = 0.5
            tweenService:Create(OutputBox, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
            
            -- Автоматическая отправка в чат
            if cfg.autoSendToChat then
                wait(0.2) -- Небольшая задержка перед отправкой
                StatusLabel.Visible = true
                StatusLabel.Text = "Sending to chat..."
                
                -- Анимация кнопки отправки
                tweenService:Create(SendChatBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(160, 80, 220)}):Play()
                
                sendToChat()
                
                wait(0.3)
                StatusLabel.Visible = false
                tweenService:Create(SendChatBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(180, 100, 220)}):Play()
            end
        else
            addNotify("Error decoding translation!")
        end
    else
        addNotify("Translation request failed!")
    end
end

-- Обработка нажатия Enter в поле ввода
InputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        autoTranslateAndSend()
    end
end)

-- Ручной перевод
function manualTranslate()
    if cfg.loading then return end
    
    local inputText = InputBox.Text
    if not inputText or inputText == "" then
        addNotify("Please enter text to translate!")
        return
    end
    
    cfg.loading = true
    StatusLabel.Visible = true
    StatusLabel.Text = "Translating..."
    
    tweenService:Create(TranslateBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 140, 80)}):Play()
    
    local encodedInput = httpService:UrlEncode(inputText)
    
    local success, response = pcall(function()
        return game:HttpGetAsync(string.format(cfg.url, cfg.lang, encodedInput))
    end)
    
    cfg.loading = false
    StatusLabel.Visible = false
    tweenService:Create(TranslateBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(80, 180, 100)}):Play()
    
    if success then
        local decoded = httpService:JSONDecode(response)
        if decoded and decoded["destination-text"] then
            local translatedText = decoded["destination-text"]
            OutputBox.Text = translatedText
            
            OutputBox.TextTransparency = 0.5
            tweenService:Create(OutputBox, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
            
            addNotify("✓ Translation complete!")
        else
            addNotify("Error decoding translation!")
        end
    else
        addNotify("Translation request failed!")
    end
end

-- Инициализация
task.spawn(addLangs)

for _, button in pairs(btns) do 
	addAnim(button) 
end

-- Анимация появления интерфейса
MainFrame.Position = UDim2.new(0.31957528, -15, 0.1, 25)
MainFrame.BackgroundTransparency = 1
tweenService:Create(MainFrame, TweenInfo.new(0.5), {
	Position = UDim2.new(0.31957528, -15, 0.186707824, 25),
	BackgroundTransparency = 0
}):Play()

-- Обработчики событий
CloseBtn.MouseButton1Click:Connect(function()
	tweenService:Create(MainFrame, TweenInfo.new(0.5), {
		Position = UDim2.new(0.31957528, -15, 0.1, 25),
		BackgroundTransparency = 1
	}):Play()
	wait(0.5)
	TranslatorGui:Destroy()
end)

SelectLangBtn.MouseButton1Click:Connect(function() 
	OutputLang.Visible = not OutputLang.Visible 
	-- Анимация появления списка языков
	if OutputLang.Visible then
		OutputLang.Position = UDim2.new(1.05, 0, 0.12, 0)
		tweenService:Create(OutputLang, TweenInfo.new(0.3), {Position = UDim2.new(1.02, 0, 0.12, 0)}):Play()
	end
end)

CopyBtn.MouseButton1Click:Connect(function()
	if OutputBox.Text and OutputBox.Text ~= "" then
		setclipboard(OutputBox.Text)
		addNotify("✓ Text copied!")
		-- Анимация подтверждения
		tweenService:Create(CopyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 180, 100)}):Play()
		wait(0.3)
		tweenService:Create(CopyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 120, 200)}):Play()
	else
		addNotify("No text to copy!")
	end
end)

TranslateBtn.MouseButton1Click:Connect(function() 
	manualTranslate()
end)

SendChatBtn.MouseButton1Click:Connect(function()
	sendToChat()
end)

-- Добавляем обработку Enter даже при нажатии клавиши
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Return or input.KeyCode == Enum.KeyCode.KeypadEnter then
        if InputBox:IsFocused() then
            autoTranslateAndSend()
        end
    end
end)

-- Информация при запуске
wait(1)
addNotify("Type text and press Enter to auto-translate & send to chat!")
