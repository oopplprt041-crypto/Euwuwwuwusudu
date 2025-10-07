-- 📦 GUI ยิงทุก 0.1 วิ + ลากได้
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoShootGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- ปุ่มเปิด/ปิดยิง
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 120, 0, 50)
toggleButton.Position = UDim2.new(0.05, 0, 0.5, -25)
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.Text = "🚀 เริ่มยิง"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Arcade
toggleButton.TextSize = 20
toggleButton.Active = true
toggleButton.Draggable = true
toggleButton.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = toggleButton

-- ฟังก์ชันยิง
local shooting = false
local function fireItem()
    local args = {
        [1] = 0.18123873074849448
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("Net"):WaitForChild("RE/UseItem"):FireServer(unpack(args))
end

-- ลูปยิงอัตโนมัติ
task.spawn(function()
    while true do
        if shooting then
            fireItem()
        end
        task.wait(0.1) -- ยิงทุก 0.1 วิ
    end
end)

-- ปุ่มสลับสถานะยิง
toggleButton.MouseButton1Click:Connect(function()
    shooting = not shooting
    if shooting then
        toggleButton.Text = "🛑 หยุดยิง"
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    else
        toggleButton.Text = "🚀 เริ่มยิง"
        toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end
end)
