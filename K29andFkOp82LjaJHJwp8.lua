local cloneref = (cloneref or clonereference or function(instance)
        return instance
end)
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local RunService = cloneref(game:GetService("RunService"))

local WindUI

do
        local ok, result = pcall(function()
                return require("./src/Init")
        end)

        if ok then
                WindUI = result
        else
                if RunService:IsStudio() or not writefile then
                        WindUI = require(ReplicatedStorage:WaitForChild("WindUI"):WaitForChild("Init"))
                else
                        WindUI =
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
                end
        end
end

--WindUI.TransparencyValue = .9
local ThemeName = "Plant"

local Window = WindUI:CreateWindow({
        Title = "GS Hub", -- Virgül eklendi
        Author = "by ethan",
        Icon = "solar:compass-big-bold",
        Theme = ThemeName,
        NewElements = true,
        Transparent = true,
        ToggleKey = Enum.KeyCode.F,
        Acrylic = true,
})

local patchTag = Window:Tag({
        Title = "Unpatched",
        Color = Color3.fromHex("#00FF00")
})

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "computer",
})

local uniTab = Window:Tab({
    Title = "Universal scripts",
    Icon = "solar:verified-check-bold",
})

local gamesTab = Window:Tab({
    Title = "Games",
    Icon = "solar:gamepad-bold",
})

uniTab:Paragraph({Title = "There are the Universal scripts"})
MainTab:Paragraph({Title = "This script made by alexander (alexandriuslang on discord)"})
MainTab:Paragraph({Title = "Script Status : Unpatched"})
MainTab:Paragraph({Title = "Version : v1.0.0"})

uniTab:Section({Title = "XVC Hub", Icon = "atom"})

local xvcButton = uniTab:Button({
    Title = "XVC Hub (170+ Games)",
    Callback = function()
        loadstring(game:HttpGet("https://rayfield.xvchubontop.workers.dev/"))()
    end
})

uniTab:Section({Title = "Dex++", Icon = "solar:folder-2-bold-duotone"})
uniTab:Paragraph({Title = "a better dex"})
uniTab:Button({
    Title = "Dex++",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
    end
})

uniTab:Section({Title = "Silent Spy", Icon = "solar:eye-scan-outline"})
uniTab:Paragraph({Title = "best silent spy"})
uniTab:Button({
    Title = "Silent Spy",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/NkIy84eP/raw"))()
    end
})

gamesTab:Section({Title = "99 Nights", Icon = "solar:bonfire-bold"})
gamesTab:Section({Title = "VoidWare", Icon = "solar:flash-drive-bold-duotone"})
gamesTab:Button({
    Title = "Voidware",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/loader.lua", true))()
    end
})

gamesTab:Section({Title = "İnfinite Saplings", Icon = "solar:flash-drive-bold-duotone"})
gamesTab:Button({
	Title = "İnfinite Saplings",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DeadlyScripts/Deadly-Scripts/refs/heads/main/DS_INF_SAPLINGS.Lua"))()
    end
})

gamesTab:Section({Title = "Super Leauge Soccer", Icon = "solar:football-bold"})
gamesTab:Section({Title = "Esan Hub", Icon = "solar:flash-drive-bold-duotone"})
gamesTab:Button({
	Title = "Esan Hub (Magnet)",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DechatornX/Esan-HUB/refs/heads/main/Esan%20HUB"))()
    end
})

gamesTab:Section({Title = "Extras", Icon = "solar:flash-drive-bold-duotone"})
gamesTab:Button({
	Title = "Extras",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Joshingtonn123/JoshScript/refs/heads/main/SGXFIFASUPERSOCCERV2"))()
    end
})
