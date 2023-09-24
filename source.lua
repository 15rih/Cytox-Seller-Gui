if getgenv().CYTOXSELLERGUI_Loaded then
    return
else
    getgenv().CYTOXSELLERGUI_Loaded = true
end

repeat task.wait() until game:IsLoaded()
repeat task.wait() until game:GetService("Workspace").Players:FindFirstChild(game:GetService("Players").LocalPlayer.Name)

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


getgenv()._SETTINGS_ = {
    FPS = 30, -- fps cap amount here
    NotifyOnPlayerJoin = true, -- self explanitory
    MaskOnExecution = false, -- set this to true if you want to mask on execution.
    LowGFXMode = true, -- safes cpu usage
}

setfpscap(tonumber(getgenv()._SETTINGS_.FPS))

if getgenv()._SETTINGS_.LowGFXMode == true then
    loadstring(game:HttpGet("https://pastebin.com/raw/rePnrZ7V"))
end

if getgenv()._SETTINGS_.MaskOnExecution == true then
    local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i,v in pairs(game:GetService("Workspace").Ignored.Shop["[Surgeon Mask] - $26"]:GetChildren()) do
        if v.Name == "Head" and v:IsA("Part") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 5, 0)
            task.wait(1)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Surgeon Mask] - $26"].ClickDetector)
            task.wait(1)
            game.Players.LocalPlayer.Backpack:FindFirstChild("[Mask]").Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Character:FindFirstChild("[Mask]"):Activate()
            task.wait(1)
            game.Players.LocalPlayer.Character:FindFirstChild("[Mask]").Parent = game.Players.LocalPlayer.Backpack
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
        else
            if game.Players.LocalPlayer.DataFolder.Currency.Value < 26 then
                print("Not Enough Cash [POORON]")
            end
        end
    end
end

if getgenv().NotifyOnPlayerJoin == true then
    
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("cytox's seller gui", "DarkTheme")


local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("")

MainSection:NewButton("Fly [X]", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/15rih/Random-Scripts/main/xfly.lua"))()
end)

MainSection:NewToggle("Auto Drop", "", function(autodroplOL)
    if autodroplOL then
        getgenv().Auto_DROP = true
        while Auto_DROP == true do
            task.wait(0.5)
            local dropamt = 10000
            if game.Players.LocalPlayer.DataFolder.Currency.Value > 10000 then
                dropamt = 10000
            else
                dropamt = tostring(game.Players.LocalPlayer.DataFolder.Currency.Value)
            end
            local args = {
                [1] = "DropMoney",
                [2] = dropamt
            }
            game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
        end
    else
        getgenv().Auto_DROP = false
    end
end)

MainSection:NewToggle("Cash Aura", "", function(CASH_AurAA)
    if CASH_AurAA then
        getgenv()._CASH_AurAA_ = true
        while getgenv()._CASH_AurAA_ == true do
            task.wait(0.0000001)
                for _,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                    if v:IsA("Part") and v.Name == "MoneyDrop" then
                    if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 13.5 then
                        fireclickdetector(v:FindFirstChild("ClickDetector"))
                    end
                end
            end
        end
    else
        getgenv()._CASH_AurAA_ = false
    end
end)

MainSection:NewButton("Buy Mask", "", function()
    for i,v in pairs(game:GetService("Workspace").Ignored.Shop["[Surgeon Mask] - $26"]:GetChildren()) do
        if v.Name == "Head" and v:IsA("Part") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 5, 0)
            task.wait(1)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Surgeon Mask] - $26"].ClickDetector)
            task.wait(1)
            game.Players.LocalPlayer.Backpack:FindFirstChild("[Mask]").Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Character:FindFirstChild("[Mask]"):Activate()
            task.wait(1)
            game.Players.LocalPlayer.Character:FindFirstChild("[Mask]").Parent = game.Players.LocalPlayer.Backpack
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
        else
            if game.Players.LocalPlayer.DataFolder.Currency.Value < 26 then
                print("you dont have enough cash...")
            end
        end
    end
end)



-- selling stuff
local SellTab = Window:NewTab("Misc")
local SellSection = SellTab:NewSection("")

SellSection:NewButton("IKU Cash Counter", "ButtonInfo", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/OG5/IkuScripts/main/DH/MoneyCounter', true))()
end)

SellSection:NewLabel("FPS []")

SellSection:NewDropdown("FPS", "", {"5 FPS", "10 FPS", "15 FPS", "20 FPS", "30 FPS", "60 FPS", "120 FPS"}, function(currentOption)
    if currentOption == "5 FPS" then
        setfpscap(5)
    elseif currentOption == "10 FPS" then
        setfpscap(10)
    elseif currentOption == "15 FPS" then
        setfpscap(15)
    elseif currentOption == "20 FPS" then
        setfpscap(20)
    elseif currentOption == "30 FPS" then
        setfpscap(30)
    elseif currentOption == "60 FPS" then
        setfpscap(60)
    elseif currentOption == "120 FPS" then
        setfpscap(120)
    end
end)


local PTab = Window:NewTab("Teleports")
local PSection = PTab:NewSection("Teleports")

PSection:NewButton("Admin", "", function()
    pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-870.497986, -32.6492119, -650.14032)
    end)
end)

PSection:NewButton("Bank", "", function()
    pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-452.785065, 39.0213928, -283.838135)
    end)
end)

PSection:NewButton("Train", "", function()
    pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(623.961731, 47.9999886, -90.3687897)
    end)
end)

PSection:NewButton("Basketball", "", function()
    pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-931.784546, 22.0998154, -483.82132)
    end)
end)

-- credits
local CTab = Window:NewTab("Credits")
local CSection = CTab:NewSection("@cytox.txt / cytox - creator")
