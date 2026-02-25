local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local guiParent = player:WaitForChild("PlayerGui")

local baseBulletSpeed     = 920
local minLeadMultiplier   = 0.95
local maxLeadMultiplier   = 2.15
local speedForMaxLead     = 280

local smoothingFactor     = 0.18

local highlightFill       = Color3.fromRGB(80, 180, 255)
local highlightOutline    = Color3.fromRGB(40, 120, 255)

local droneNames = {
    "harpaid","harpai","hday","hnight","hrp","hrpb","merlin",
    "l-311","lancet","m23","mnbombs","mday","misil","mnight","moln","morok","r-360","reb-1","rocket",
    "sh1d","sh1n","super","switchblade","uav","ub-16","uv-2","umpb5","ztk","zu-23","zala","bbrd","bbrn","ger","f1",
    "fpv","fireparts","gasbarrel","gecamo","geday","genight","grbr","grbrbl","h-22","h55","h59","h6","h65","igla",
    "iskan","italm","itlms","krr","krrwbomb","238","2day","2night","3day","3night","and","airborne","arop","arsh",
    "b-13","batyar","bird","c20","cluster","droner","experimental","fp-"
}

local activeESP    = {}
local targetData   = {}
local espEnabled   = false
local autoAimEnabled = false

local ScreenGui = nil
local notifications = {}

local function isDrone(name)
    name = name:lower()
    for _, pattern in ipairs(droneNames) do
        if name:find(pattern, 1, true) then return true end
    end
    return false
end

local function getCenterPart(model)
    if not model then return nil end
    local best = nil
    local bestY = -math.huge
    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("MeshPart") then
            if part.Position.Y > bestY then
                bestY = part.Position.Y
                best = part
            end
        end
    end
    return best or model.PrimaryPart
end

local function getDynamicLeadMultiplier(velocityMagnitude)
    local normalized = math.clamp(velocityMagnitude / speedForMaxLead, 0, 1)
    return minLeadMultiplier + (maxLeadMultiplier - minLeadMultiplier) * normalized
end

local function getLeadTime(camPos, targetPos, targetVel, bulletSpeed)
    local to = targetPos - camPos
    local a = targetVel.Magnitude^2 - bulletSpeed^2
    local b = 2 * to:Dot(targetVel)
    local c = to.Magnitude^2
    if math.abs(a) < 1e-6 then return math.sqrt(c) / bulletSpeed end
    local disc = b*b - 4*a*c
    if disc < 0 then return to.Magnitude / bulletSpeed end
    local sd = math.sqrt(disc)
    local t1 = (-b + sd)/(2*a)
    local t2 = (-b - sd)/(2*a)
    local t = math.huge
    if t1 > 0 then t = math.min(t, t1) end
    if t2 > 0 then t = math.min(t, t2) end
    return t == math.huge and (to.Magnitude / bulletSpeed) or t
end

local function createESP(model)
    if activeESP[model] then return end
    if model:FindFirstChildOfClass("Humanoid") then return end
    if not model.PrimaryPart then
        for _, p in model:GetDescendants() do
            if p:IsA("BasePart") then model.PrimaryPart = p break end
        end
    end
    if not model.PrimaryPart then return end
    local hl = Instance.new("Highlight")
    hl.Adornee = model
    hl.FillColor = highlightFill
    hl.OutlineColor = highlightOutline
    hl.FillTransparency = 0.35
    hl.OutlineTransparency = 0.12
    hl.Parent = model
    activeESP[model] = hl
    targetData[model] = {
        lastPos = model.PrimaryPart.Position,
        lastTime = tick(),
        velocity = Vector3.new()
    }
end

local function removeAllESP()
    for _, hl in pairs(activeESP) do pcall(function() hl:Destroy() end) end
    table.clear(activeESP)
    table.clear(targetData)
end

local function showDroneNotification(name)
    if not ScreenGui then return end
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 280, 0, 56)
    notif.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    notif.BackgroundTransparency = 0.15
    notif.BorderSizePixel = 0
    notif.Parent = ScreenGui
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = notif
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(80, 160, 255)
    stroke.Thickness = 1.8
    stroke.Transparency = 0.4
    stroke.Parent = notif
    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 38, 0, 38)
    icon.Position = UDim2.new(0, 12, 0.5, -19)
    icon.BackgroundTransparency = 1
    icon.Text = "✈"
    icon.TextSize = 32
    icon.TextColor3 = Color3.fromRGB(120, 220, 255)
    icon.Font = Enum.Font.GothamBold
    icon.Parent = notif
    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1, -70, 1, 0)
    txt.Position = UDim2.new(0, 58, 0, 0)
    txt.BackgroundTransparency = 1
    txt.Text = "Дрон обнаружен\n" .. name
    txt.TextColor3 = Color3.fromRGB(220, 240, 255)
    txt.Font = Enum.Font.GothamSemibold
    txt.TextSize = 15
    txt.TextXAlignment = Enum.TextXAlignment.Left
    txt.Parent = notif
    local index = #notifications + 1
    local baseY = -80
    local spacing = 64
    notif.Position = UDim2.new(1, 340, 1, baseY - (index-1)*spacing)
    notif.BackgroundTransparency = 1
    notif.Visible = true
    table.insert(notifications, notif)
    TweenService:Create(notif, TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -300, 1, baseY - (index-1)*spacing),
        BackgroundTransparency = 0.15
    }):Play()
    task.delay(4.2, function()
        if not notif.Parent then return end
        TweenService:Create(notif, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {
            Position = UDim2.new(1, 340, 1, notif.Position.Y.Offset),
            BackgroundTransparency = 1
        }):Play()
        task.delay(0.8, function()
            for i, n in ipairs(notifications) do
                if n == notif then
                    table.remove(notifications, i)
                    break
                end
            end
            if notif then notif:Destroy() end
        end)
    end)
end

RunService.RenderStepped:Connect(function(delta)
    for model, data in pairs(targetData) do
        if model.PrimaryPart then
            local now = tick()
            local dt = now - data.lastTime
            if dt > 0.001 then
                local newVel = (model.PrimaryPart.Position - data.lastPos) / dt
                data.velocity = data.velocity:Lerp(newVel, 0.74)
            end
            data.lastPos = model.PrimaryPart.Position
            data.lastTime = now
        end
    end
    if autoAimEnabled then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local closest = nil
            local minDist = math.huge
            for model in pairs(activeESP) do
                local center = getCenterPart(model)
                if center then
                    local dist = (center.Position - root.Position).Magnitude
                    if dist < minDist then
                        minDist = dist
                        closest = model
                    end
                end
            end
            if closest then
                local center = getCenterPart(closest)
                if center and targetData[closest] then
                    local data = targetData[closest]
                    local camPos = camera.CFrame.Position
                    local targetPos = center.Position
                    local velMag = data.velocity.Magnitude
                    local currentLead = getDynamicLeadMultiplier(velMag)
                    local timeToHit = getLeadTime(camPos, targetPos, data.velocity, baseBulletSpeed)
                    local predicted = targetPos + data.velocity * (timeToHit * currentLead)
                    local targetCFrame = CFrame.lookAt(camPos, predicted)
                    camera.CFrame = camera.CFrame:Lerp(targetCFrame, smoothingFactor)
                end
            end
        end
    end
end)

workspace.ChildAdded:Connect(function(child)
    if espEnabled and child:IsA("Model") and isDrone(child.Name) then
        task.wait(0.08)
        createESP(child)
        showDroneNotification(child.Name)
    end
end)

local function initGUI()
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DronePointGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = guiParent
    local loadFrame = Instance.new("Frame")
    loadFrame.Size = UDim2.new(0,360,0,220)
    loadFrame.Position = UDim2.new(0.5,-180,0.5,-110)
    loadFrame.BackgroundColor3 = Color3.fromRGB(24,24,34)
    loadFrame.BorderSizePixel = 0
    loadFrame.Parent = ScreenGui
    Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0,16)
    local loadTxt = Instance.new("TextLabel", loadFrame)
    loadTxt.Size = UDim2.new(1,0,1,0)
    loadTxt.BackgroundTransparency = 1
    loadTxt.Text = "Загрузка DronePoint..."
    loadTxt.TextColor3 = Color3.fromRGB(180,210,255)
    loadTxt.Font = Enum.Font.GothamSemibold
    loadTxt.TextSize = 26
    TweenService:Create(loadTxt, TweenInfo.new(1.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        TextTransparency = 0.35
    }):Play()
    task.delay(2.3, function()
        TweenService:Create(loadTxt, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
        TweenService:Create(loadFrame, TweenInfo.new(1.0, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
        task.delay(1.1, function()
            loadFrame:Destroy()
            local mainFrame = Instance.new("Frame")
            mainFrame.Size = UDim2.new(0,360,0,220)
            mainFrame.Position = UDim2.new(0.5,-180,0.5,-110)
            mainFrame.BackgroundColor3 = Color3.fromRGB(24,24,34)
            mainFrame.BorderSizePixel = 0
            mainFrame.Active = true
            mainFrame.Draggable = true
            mainFrame.Parent = ScreenGui
            Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0,16)
            local title = Instance.new("TextLabel", mainFrame)
            title.Size = UDim2.new(1,0,0,50)
            title.BackgroundTransparency = 1
            title.Text = "DronePoint"
            title.TextColor3 = Color3.fromRGB(210,230,255)
            title.Font = Enum.Font.GothamBlack
            title.TextSize = 26
            local cred = Instance.new("TextLabel", mainFrame)
            cred.Size = UDim2.new(1,0,0,20)
            cred.Position = UDim2.new(0,0,1,-24)
            cred.BackgroundTransparency = 1
            cred.Text = "Created by ABOBUS_AMOGUS228902"
            cred.TextColor3 = Color3.fromRGB(130,150,190)
            cred.Font = Enum.Font.Gotham
            cred.TextSize = 13
            local closeBtn = Instance.new("TextButton", mainFrame)
            closeBtn.Size = UDim2.new(0,38,0,38)
            closeBtn.Position = UDim2.new(1,-46,0,6)
            closeBtn.BackgroundColor3 = Color3.fromRGB(50,50,60)
            closeBtn.Text = "X"
            closeBtn.TextColor3 = Color3.fromRGB(230,230,240)
            closeBtn.Font = Enum.Font.GothamBold
            closeBtn.TextSize = 22
            Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,10)
            closeBtn.MouseButton1Click:Connect(function()
                if ScreenGui then ScreenGui:Destroy() end
                espEnabled = false
                autoAimEnabled = false
                removeAllESP()
            end)
            local espBtn = Instance.new("TextButton", mainFrame)
            espBtn.Size = UDim2.new(0.92,0,0,48)
            espBtn.Position = UDim2.new(0.04,0,0,70)
            espBtn.BackgroundColor3 = Color3.fromRGB(38,38,50)
            espBtn.Text = "ESP (OFF)"
            espBtn.TextColor3 = Color3.fromRGB(210,230,255)
            espBtn.Font = Enum.Font.GothamBold
            espBtn.TextSize = 18
            espBtn.BorderSizePixel = 0
            Instance.new("UICorner", espBtn).CornerRadius = UDim.new(0,12)
            espBtn.MouseButton1Click:Connect(function()
                espEnabled = not espEnabled
                espBtn.Text = "ESP (" .. (espEnabled and "ON" or "OFF") .. ")"
                if espEnabled then
                    for _, obj in ipairs(workspace:GetChildren()) do
                        if obj:IsA("Model") and isDrone(obj.Name) then
                            createESP(obj)
                        end
                    end
                else
                    removeAllESP()
                end
            end)
            local aimBtn = Instance.new("TextButton", mainFrame)
            aimBtn.Size = UDim2.new(0.92,0,0,48)
            aimBtn.Position = UDim2.new(0.04,0,0,130)
            aimBtn.BackgroundColor3 = Color3.fromRGB(38,38,50)
            aimBtn.Text = "Air Defense (OFF)"
            aimBtn.TextColor3 = Color3.fromRGB(210,230,255)
            aimBtn.Font = Enum.Font.GothamBold
            aimBtn.TextSize = 18
            aimBtn.BorderSizePixel = 0
            Instance.new("UICorner", aimBtn).CornerRadius = UDim.new(0,12)
            aimBtn.MouseButton1Click:Connect(function()
                autoAimEnabled = not autoAimEnabled
                aimBtn.Text = "Air Defense (" .. (autoAimEnabled and "ON" or "OFF") .. ")"
            end)
            mainFrame.BackgroundTransparency = 1
            TweenService:Create(mainFrame, TweenInfo.new(0.65), {BackgroundTransparency = 0}):Play()
        end)
    end)
end

initGUI()
