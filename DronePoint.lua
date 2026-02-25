-- DronePoint Script vFINAL (кнопки должны работать)
-- Created by ABOBUS_AMOGUS228902

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local guiParent = player:WaitForChild("PlayerGui")

local bulletSpeed = 920
local leadMultiplier = 1.08

local droneNames = {
    "harpaid","harpai","hday","hnight","hrp","hrpb","merlin",
    "l-311","lancet","m23","mnbombs","mday","misil","mnight","moln","morok","r-360","reb-1","rocket",
    "sh1d","sh1n","super","switchblade","uav","ub-16","uv-2","umpb5","ztk","zu-23","zala","bbrd","bbrn","ger","f1",
    "fpv","fireparts","gasbarrel","gecamo","geday","genight","grbr","grbrbl","h-22","h55","h59","h6","h65","igla",
    "iskan","italm","itlms","krr","krrwbomb","238","2day","2night","3day","3night","and","airborne","arop","arsh",
    "b-13","batyar","bird","c20","cluster","droner","experimental","fp-", "droneday", "dronenight"
}

local activeESP = {}
local targetData = {}
local espEnabled = false
local autoAimEnabled = false

local function isDrone(name)
    name = name:lower()
    for _, v in ipairs(droneNames) do
        if name:find(v, 1, true) then return true end
    end
    return false
end

-- ==================== ESP & PREDICTION ====================
local function createESP(model)
    if activeESP[model] or model:FindFirstChildOfClass("Humanoid") then return end

    if not model.PrimaryPart then
        for _, p in ipairs(model:GetDescendants()) do
            if p:IsA("BasePart") then model.PrimaryPart = p break end
        end
    end
    if not model.PrimaryPart then return end

    local hl = Instance.new("Highlight")
    hl.Adornee = model
    hl.FillColor = Color3.fromRGB(80,180,255)
    hl.OutlineColor = Color3.fromRGB(40,120,255)
    hl.FillTransparency = 0.4
    hl.OutlineTransparency = 0.15
    hl.Parent = model

    activeESP[model] = hl
    targetData[model] = {
        lastPos = model.PrimaryPart.Position,
        lastTime = tick(),
        velocity = Vector3.new()
    }
end

local function removeESP()
    for _, hl in pairs(activeESP) do if hl then hl:Destroy() end end
    activeESP = {}
    targetData = {}
end

-- ==================== UPDATE LOOP ====================
RunService.RenderStepped:Connect(function()
    for model, data in pairs(targetData) do
        if model.PrimaryPart then
            local now = tick()
            local dt = now - data.lastTime
            if dt > 0.001 then
                local nv = (model.PrimaryPart.Position - data.lastPos) / dt
                data.velocity = data.velocity:Lerp(nv, 0.75)
            end
            data.lastPos = model.PrimaryPart.Position
            data.lastTime = now
        end
    end

    if autoAimEnabled then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local closest, minDist = nil, math.huge
            for m in pairs(activeESP) do
                if m.PrimaryPart then
                    local d = (m.PrimaryPart.Position - root.Position).Magnitude
                    if d < minDist then minDist = d closest = m end
                end
            end
            if closest and closest.PrimaryPart then
                local cam = workspace.CurrentCamera
                local cp = cam.CFrame.Position
                local tp = closest.PrimaryPart.Position
                local data = targetData[closest]

                local to = tp - cp
                local a = data.velocity.Magnitude^2 - bulletSpeed^2
                local b = 2 * to:Dot(data.velocity)
                local c = to.Magnitude^2

                local t = to.Magnitude / bulletSpeed
                if math.abs(a) > 1e-6 then
                    local disc = b*b - 4*a*c
                    if disc >= 0 then
                        local sd = math.sqrt(disc)
                        local t1 = (-b + sd)/(2*a)
                        local t2 = (-b - sd)/(2*a)
                        if t1 > 0 then t = math.min(t, t1) end
                        if t2 > 0 then t = math.min(t, t2) end
                    end
                end

                local pred = tp + data.velocity * (t * leadMultiplier)
                cam.CFrame = CFrame.lookAt(cp, pred)
            end
        end
    end
end)

-- ==================== LOADING + GUI ====================
local function createLoadingAndGUI()
    local sg = Instance.new("ScreenGui")
    sg.Name = "DronePoint"
    sg.ResetOnSpawn = false
    sg.Parent = guiParent

    -- Загрузочный фрейм (точно такой же размер/позиция)
    local loadFrame = Instance.new("Frame")
    loadFrame.Size = UDim2.new(0, 360, 0, 220)
    loadFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
    loadFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
    loadFrame.BorderSizePixel = 0
    loadFrame.Parent = sg

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = loadFrame

    local loadText = Instance.new("TextLabel")
    loadText.Size = UDim2.new(1, 0, 1, 0)
    loadText.BackgroundTransparency = 1
    loadText.Text = "Loading DronePoint..."
    loadText.TextColor3 = Color3.fromRGB(180, 210, 255)
    loadText.Font = Enum.Font.GothamSemibold
    loadText.TextSize = 28
    loadText.Parent = loadFrame

    -- Пульсация текста
    TweenService:Create(loadText, TweenInfo.new(1.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        TextTransparency = 0.4
    }):Play()

    -- Через 2 секунды убираем загрузку и показываем GUI
    task.delay(2, function()
        if not loadFrame.Parent then return end

        TweenService:Create(loadText, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
        TweenService:Create(loadFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()

        task.delay(0.9, function()
            loadFrame:Destroy()

            -- Теперь создаём основное меню
            local mainFrame = Instance.new("Frame")
            mainFrame.Size = UDim2.new(0, 360, 0, 220)
            mainFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
            mainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
            mainFrame.BorderSizePixel = 0
            mainFrame.Active = true
            mainFrame.Draggable = true
            mainFrame.Parent = sg

            Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

            local title = Instance.new("TextLabel", mainFrame)
            title.Size = UDim2.new(1, 0, 0, 50)
            title.BackgroundTransparency = 1
            title.Text = "DronePoint"
            title.TextColor3 = Color3.fromRGB(210, 230, 255)
            title.Font = Enum.Font.GothamBlack
            title.TextSize = 26

            local cred = Instance.new("TextLabel", mainFrame)
            cred.Size = UDim2.new(1, 0, 0, 20)
            cred.Position = UDim2.new(0, 0, 1, -24)
            cred.BackgroundTransparency = 1
            cred.Text = "Created by ABOBUS_AMOGUS228902"
            cred.TextColor3 = Color3.fromRGB(130, 150, 190)
            cred.Font = Enum.Font.Gotham
            cred.TextSize = 13

            local closeBtn = Instance.new("TextButton", mainFrame)
            closeBtn.Size = UDim2.new(0, 38, 0, 38)
            closeBtn.Position = UDim2.new(1, -46, 0, 6)
            closeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            closeBtn.Text = "X"
            closeBtn.TextColor3 = Color3.fromRGB(230, 230, 240)
            closeBtn.Font = Enum.Font.GothamBold
            closeBtn.TextSize = 22
            Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 10)

            closeBtn.Activated:Connect(function()
                sg:Destroy()
                espEnabled = false
                autoAimEnabled = false
                removeESP()
            end)

            -- Кнопки
            local espBtn = Instance.new("TextButton", mainFrame)
            espBtn.Size = UDim2.new(0.92, 0, 0, 48)
            espBtn.Position = UDim2.new(0.04, 0, 0, 70)
            espBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
            espBtn.Text = "ESP (OFF)"
            espBtn.TextColor3 = Color3.fromRGB(210, 230, 255)
            espBtn.Font = Enum.Font.GothamBold
            espBtn.TextSize = 18
            espBtn.BorderSizePixel = 0
            Instance.new("UICorner", espBtn).CornerRadius = UDim.new(0, 12)

            espBtn.Activated:Connect(function()
                print("[DronePoint] ESP button pressed!")
                espEnabled = not espEnabled
                espBtn.Text = "ESP (" .. (espEnabled and "ON" or "OFF") .. ")"
                if espEnabled then
                    for _, obj in ipairs(workspace:GetChildren()) do
                        if obj:IsA("Model") and isDrone(obj.Name) then
                            createESP(obj)
                        end
                    end
                else
                    removeESP()
                end
            end)

            local aimBtn = Instance.new("TextButton", mainFrame)
            aimBtn.Size = UDim2.new(0.92, 0, 0, 48)
            aimBtn.Position = UDim2.new(0.04, 0, 0, 130)
            aimBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 50)
            aimBtn.Text = "Air Defense (OFF)"
            aimBtn.TextColor3 = Color3.fromRGB(210, 230, 255)
            aimBtn.Font = Enum.Font.GothamBold
            aimBtn.TextSize = 18
            aimBtn.BorderSizePixel = 0
            Instance.new("UICorner", aimBtn).CornerRadius = UDim.new(0, 12)

            aimBtn.Activated:Connect(function()
                print("[DronePoint] Air Defense button pressed!")
                autoAimEnabled = not autoAimEnabled
                aimBtn.Text = "Air Defense (" .. (autoAimEnabled and "ON" or "OFF") .. ")"
            end)

            -- Лёгкая анимация появления основного GUI
            mainFrame.BackgroundTransparency = 1
            TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
        end)
    end)
end

-- ==================== SPAWN ====================
workspace.ChildAdded:Connect(function(child)
    if espEnabled and child:IsA("Model") and isDrone(child.Name) then
        task.wait(0.08)
        createESP(child)
        -- можно добавить уведомление, если хочешь
    end
end)

createLoadingAndGUI()

print("DronePoint launched — check console for button presses")
