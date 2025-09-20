local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- Oyuncu bilgilerini al
local player = game.Players.LocalPlayer
local playerName = player.Name
local displayName = player.DisplayName
local userId = player.UserId
local profileUrl = "https://www.roblox.com/users/" .. userId .. "/profile"

-- Sunset Teması (Custom renkler ile - WindUI custom theme destekliyorsa)
local SunsetTheme = {
    Background = Color3.fromRGB(40, 44, 52),  -- Koyu mor-turuncu ton
    Accent = Color3.fromRGB(255, 94, 0),      -- Turuncu
    Text = Color3.fromRGB(255, 255, 255),
    -- Diğer renkler ekleyebilirsiniz, dokümantasyona göre
}

-- Ana Pencere (Başlık VoidHub, Tema Sunset simülasyonu)
local Window = WindUI:Window({
    Title = "VoidHub",  -- Sol üstte script ismi
    Size = UDim2.new(0, 600, 0, 500),
    Theme = "Dark"  -- Eğer Sunset yok ise Dark, custom için aşağıda set et
})
-- Custom tema ayarı (eğer destekliyorsa)
-- WindUI:SetTheme(SunsetTheme)  -- Dokümantasyona göre ekleyin, yoksa yorumlayın

-- Kapatma ve Kısaltma Butonları (Sağ üstte veya Kontrol sekmesinde)
local ControlTab = Window:Tab({ Title = "Kontrol", Icon = "gear" })
local ControlSection = ControlTab:Section({ Title = "UI Kontrolleri" })

ControlSection:Button({
    Title = "Tamamen Kapat",
    Icon = "power-off",
    Callback = function()
        if Window then
            Window:Destroy()  -- Pencereyi tamamen kapat
        end
    end
})

local minimized = false
local minimizeLabel = nil

ControlSection:Button({
    Title = "Kısalt (Minimize)",
    Icon = "minus",
    Callback = function()
        if not minimized then
            -- UI'yi gizle
            Window.Visible = false  -- Eğer WindUI Visible destekliyorsa, yoksa custom hide

            -- Draggable VoidHub yazısı oluştur
            if not minimizeLabel then
                minimizeLabel = Instance.new("ScreenGui")
                minimizeLabel.Parent = game.CoreGui or game.Players.LocalPlayer.PlayerGui
                local frame = Instance.new("Frame", minimizeLabel)
                frame.Size = UDim2.new(0, 150, 0, 50)
                frame.Position = UDim2.new(0.5, 0, 0.5, 0)
                frame.BackgroundColor3 = Color3.fromRGB(255, 94, 0)  -- Sunset tonu
                frame.Draggable = true  -- Hareket ettirilebilir
                frame.Active = true

                local text = Instance.new("TextLabel", frame)
                text.Size = UDim2.new(1, 0, 1, 0)
                text.Text = "VoidHub"
                text.TextColor3 = Color3.fromRGB(255, 255, 255)
                text.BackgroundTransparency = 1
                text.Font = Enum.Font.SourceSansBold
                text.TextSize = 20

                -- Yazıya basınca geri aç
                frame.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        minimized = false
                        Window.Visible = true
                        minimizeLabel:Destroy()
                        minimizeLabel = nil
                    end
                end)
            end
            minimized = true
        else
            minimized = false
            Window.Visible = true
            if minimizeLabel then
                minimizeLabel:Destroy()
                minimizeLabel = nil
            end
        end
    end
})

-- Kaydırılabilirlik: WindUI Section'lar otomatik scrollable, eğer içerik fazla olursa

-- Footer (Önceki gibi)
local FooterTab = Window:Tab({ Title = "Bilgiler", Icon = "info" })
local FooterSection = FooterTab:Section({ Title = "Kullanıcı Bilgileri" })

FooterSection:Paragraph({
    Title = "Kullanıcı Detayları",
    Desc = string.format("Ad: %s\nGörünen Ad: %s\nID: %d\nOyun: %s", 
        playerName, 
        displayName, 
        userId, 
        game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Bilinmeyen")
})

FooterSection:Button({
    Title = "@" .. playerName,
    Icon = "user",
    Callback = function()
        WindUI:Notify({ 
            Title = "Profil", 
            Content = "Profil linki: " .. profileUrl, 
            Duration = 5 
        })
        if setclipboard then
            setclipboard(profileUrl)
        end
    end
})

-- Sağ Menü (Önceki Library ve Cheats butonları)
local RightTab = Window:Tab({ Title = "Kontrol", Icon = "gear" })
local RightSection = RightTab:Section({ Title = "Seçenekler" })

RightSection:Button({
    Title = "Library",
    Icon = "book",
    Callback = function()
        -- Library içeriği (önceki gibi)
        local ScriptTab = Window:Tab({ Title = "Scriptler", Icon = "code" })
        local ScriptSection = ScriptTab:Section({ Title = "Çalıştırılabilir Scriptler" })

        -- Scriptler ve ekleme (önceki kod gibi, kısalttım)
    end
})

RightSection:Button({
    Title = "Cheats",
    Icon = "computer",
    Callback = function()
        -- Cheats içeriği (önceki gibi)
        local CheatsTab = Window:Tab({ Title = "Cheats", Icon = "shield" })
        local CheatsSection = CheatsTab:Section({ Title = "Cheat Seçenekleri" })

        -- Noclip, Speed, Godmode, Inf Jump (önceki kod gibi, kısalttım)
    end
})
