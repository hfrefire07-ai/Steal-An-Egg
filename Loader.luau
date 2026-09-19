local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- ==============================
-- GUI SETUP (DISEÑO INTACTO + ALTURA AJUSTADA)
-- ==============================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Loader_Transparente"
ScreenGui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BackgroundTransparency = 0.4
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -145, 0.5, -130)
MainFrame.Size = UDim2.new(0, 290, 0, 314)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

-- Sonido de Interfaz
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://256986421"
ClickSound.Volume = 1
ClickSound.Parent = MainFrame

-- Borde Arcoíris (Rainbow)
local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Thickness = 2
task.spawn(function()
    local hue = 0
    while RunService.Heartbeat:Wait() do
        hue = hue + 0.005
        if hue >= 1 then hue = 0 end
        Stroke.Color = Color3.fromHSV(hue, 1, 1)
    end
end)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 36)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
Title.BackgroundTransparency = 0.5
Title.BorderSizePixel = 0
Title.Font = Enum.Font.GothamBold
Title.Text = "Script Loader Universal"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

-- Botón Cerrar
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -28, 0, 6)
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
CloseBtn.TextSize = 13
CloseBtn.MouseButton1Click:Connect(function()
    ClickSound:Play()
    task.wait(0.1)
    ScreenGui:Destroy()
end)

-- Botón Minimizar
local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.BackgroundTransparency = 1
MinBtn.Position = UDim2.new(1, -55, 0, 6)
MinBtn.Size = UDim2.new(0, 22, 0, 22)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "—"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 13

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    ClickSound:Play()
    minimized = not minimized
    if minimized then
        MainFrame.Size = UDim2.new(0, 290, 0, 36)
    else
        MainFrame.Size = UDim2.new(0, 290, 0, 314)
    end
end)

-- Status Text
local StatusLabel = Instance.new("TextLabel", MainFrame)
StatusLabel.Position = UDim2.new(0, 10, 0, 286)
StatusLabel.Size = UDim2.new(1, -20, 0, 20)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusLabel.TextSize = 12
StatusLabel.Text = "Esperando selección..."

-- ==============================
-- BOTONES DE SCRIPTS
-- ==============================

-- 1. Botón Server Hop
local ServerHopBtn = Instance.new("TextButton", MainFrame)
ServerHopBtn.Position = UDim2.new(0, 10, 0, 50)
ServerHopBtn.Size = UDim2.new(0, 270, 0, 40)
ServerHopBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 180)
ServerHopBtn.BackgroundTransparency = 0.3
ServerHopBtn.BorderSizePixel = 0
ServerHopBtn.Font = Enum.Font.GothamBold
ServerHopBtn.Text = "Cargar Server Hop"
ServerHopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerHopBtn.TextSize = 13
Instance.new("UICorner", ServerHopBtn).CornerRadius = UDim.new(0, 6)

-- 2. Botón Lennon
local LennonBtn = Instance.new("TextButton", MainFrame)
LennonBtn.Position = UDim2.new(0, 10, 0, 97)
LennonBtn.Size = UDim2.new(0, 270, 0, 40)
LennonBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
LennonBtn.BackgroundTransparency = 0.3
LennonBtn.BorderSizePixel = 0
LennonBtn.Font = Enum.Font.GothamBold
LennonBtn.Text = "Cargar Lennon"
LennonBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LennonBtn.TextSize = 13
Instance.new("UICorner", LennonBtn).CornerRadius = UDim.new(0, 6)

-- 3. Botón Miranda
local MirandaBtn = Instance.new("TextButton", MainFrame)
MirandaBtn.Position = UDim2.new(0, 10, 0, 144)
MirandaBtn.Size = UDim2.new(0, 270, 0, 40)
MirandaBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
MirandaBtn.BackgroundTransparency = 0.3
MirandaBtn.BorderSizePixel = 0
MirandaBtn.Font = Enum.Font.GothamBold
MirandaBtn.Text = "Cargar Miranda"
MirandaBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MirandaBtn.TextSize = 13
Instance.new("UICorner", MirandaBtn).CornerRadius = UDim.new(0, 6)

-- 4. Botón Chilli Hub
local ChilliBtn = Instance.new("TextButton", MainFrame)
ChilliBtn.Position = UDim2.new(0, 10, 0, 191)
ChilliBtn.Size = UDim2.new(0, 270, 0, 40)
ChilliBtn.BackgroundColor3 = Color3.fromRGB(210, 100, 40)
ChilliBtn.BackgroundTransparency = 0.3
ChilliBtn.BorderSizePixel = 0
ChilliBtn.Font = Enum.Font.GothamBold
ChilliBtn.Text = "Cargar Chilli Hub"
ChilliBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ChilliBtn.TextSize = 13
Instance.new("UICorner", ChilliBtn).CornerRadius = UDim.new(0, 6)

-- 5. Botón Executar Auto Grab
local GrabBtn = Instance.new("TextButton", MainFrame)
GrabBtn.Position = UDim2.new(0, 10, 0, 238)
GrabBtn.Size = UDim2.new(0, 270, 0, 40)
GrabBtn.BackgroundColor3 = Color3.fromRGB(140, 60, 200)
GrabBtn.BackgroundTransparency = 0.3
GrabBtn.BorderSizePixel = 0
GrabBtn.Font = Enum.Font.GothamBold
GrabBtn.Text = "Executar Auto Grab"
GrabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GrabBtn.TextSize = 13
Instance.new("UICorner", GrabBtn).CornerRadius = UDim.new(0, 6)

-- ==============================
-- LÓGICA DE EJECUCIÓN (LOADSTRINGS ACTUALIZADOS)
-- ==============================

ServerHopBtn.MouseButton1Click:Connect(function()
    ClickSound:Play()
    StatusLabel.Text = "Ejecutando Server Hop..."
    StatusLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hfrefire07-ai/Steal-An-Egg/main/ServerHop"))()
    end)
    if success then
        StatusLabel.Text = "✓ Server Hop cargado exitosamente."
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
    else
        StatusLabel.Text = "Error al cargar Server Hop."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
    end
end)

LennonBtn.MouseButton1Click:Connect(function()
    ClickSound:Play()
    StatusLabel.Text = "Ejecutando Lennon..."
    StatusLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lennonxscripts/lennonhubv3/main/stealanegg.lua"))()
    end)
    if success then
        StatusLabel.Text = "✓ Lennon cargado exitosamente."
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
    else
        StatusLabel.Text = "Error al cargar Lennon."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
    end
end)

MirandaBtn.MouseButton1Click:Connect(function()
    ClickSound:Play()
    StatusLabel.Text = "Ejecutando Miranda..."
    StatusLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/miirandahub/loader/main/stealaeggs"))()
    end)
    if success then
        StatusLabel.Text = "✓ Miranda cargado exitosamente."
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
    else
        StatusLabel.Text = "Error al cargar Miranda."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
    end
end)

ChilliBtn.MouseButton1Click:Connect(function()
    ClickSound:Play()
    StatusLabel.Text = "Ejecutando Chilli Hub..."
    StatusLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    end)
    if success then
        StatusLabel.Text = "✓ Chilli Hub cargado exitosamente."
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
    else
        StatusLabel.Text = "Error al cargar Chilli Hub."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
    end
end)

GrabBtn.MouseButton1Click:Connect(function()
    ClickSound:Play()
    StatusLabel.Text = "Ejecutando Auto Grab..."
    StatusLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hfrefire07-ai/Steal-An-Egg/refs/heads/main/Autograb"))()
    end)
    if success then
        StatusLabel.Text = "✓ Auto Grab cargado exitosamente."
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 100)
    else
        StatusLabel.Text = "Error al cargar Auto Grab."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
    end
end)
