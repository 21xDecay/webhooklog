local CurrentVersion = "Insurgent Hub | Pixel Incremental"

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/InsurgenceHub/IncurgenceHub.github.io/main/MurcuryUi.lua"))()

local GUI = Mercury:Create{
    Name = CurrentVersion,
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/InsurgentHub/Best-Scripts"
}

-- Credits
GUI:Credit{
	Name = "Bat | TrilogScripts on YouTube",
	Description = "Developer",
	Discord = "21xdecay"
}

GUI:Credit{
	Name = "Chris",
	Description = "Developer",
	Discord = "chrissypants77"
}


local function AutoBuy(What, amount)
    local args = {
        [1] = What,
        [2] = amount
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("OnUpgrade"):FireServer(unpack(args))
end

-- Auto Farm Tab:
local AutoFarmTab = GUI:Tab{
    Name = "AutoFarm",
    Icon = "rbxassetid://9087232897"
}

-- Warning Label 
AutoFarmTab:Label{
    Text = "Must stand on grey platform for auto collect to work",
    Description = " ",
}


local AutoFarmPixels = false

AutoFarmTab:Toggle{
    Name = "AutoFarm Pixels",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        AutoFarmPixels = state
        while AutoFarmPixels do
            local pixels = game:GetService("Workspace").Pixels:GetChildren()
            for i, v in pixels do
                local args = {
                    [1] = tostring(v.Name)
                }
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("OnPixelTouched"):FireServer(unpack(args))
                wait(0.001)
                v:destroy()
            end
            wait(0.1)
        end
    end
}

-- Auto Buy Tiers
AutoFarmTab:Toggle{
    Name = "AutoBuy Tiers",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyTiers = state
        while _G.AutoBuyTiers do
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("CheckTierPrice"):FireServer()
            wait()
        end
    end
}

-- Sub Pixellize (Prestige 1) tab
local SubPixellizeTab = GUI:Tab{
    Name = "Sub Pixellize (Prestige 1)",
    CurrentValue = false,
    Icon = "rbxassetid://6034996695"
}

SubPixellizeTab:Toggle{
    Name = "AutoBuy Sub Pixellize",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuySubPixellize = state
        while _G.AutoBuySubPixellize do
            local args = {
                [1] = "SubPixellize"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("OnStatBuy"):FireServer(unpack(args))
            wait(1)
        end
    end
}

-- AutoBuy SubPixel Colors
SubPixellizeTab:Toggle{
    Name = "AutoBuy SubPixel Colors",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuySubPixelColors = state
        while _G.AutoBuySubPixelColors do
            AutoBuy("SubPixelColors", 1)
            wait(1)
        end
    end
}

-- AutoBuy SubPixel Luck
SubPixellizeTab:Toggle{
    Name = "AutoBuy SubPixel Luck",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuySubPixelLuck = state
        while _G.AutoBuySubPixelLuck do
            AutoBuy("SubPixelLuck", 1)
            wait(1)
        end
    end
}

-- AutoBuy SubPixel Pixel
SubPixellizeTab:Toggle{
    Name = "AutoBuy SubPixel Pixel",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuySubPixelPixel = state
        while _G.AutoBuySubPixelPixel do
            AutoBuy("SubPixelPixel", 1)
            wait(1)
        end
    end
}

-- AutoBuy SubPixel XP
SubPixellizeTab:Toggle{
    Name = "AutoBuy SubPixel XP",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuySubPixelXP = state
        while _G.AutoBuySubPixelXP do
            AutoBuy("SubPixelXP", 1)
            wait(1)
        end
    end
}

-- Colorize (Prestige 2) Tab
local ColorizeTab = GUI:Tab{
    Name = "Colorize (Prestige 2)",
    CurrentValue = false,
    Icon = "rbxassetid://6034996695"
}

-- Auto Buy Colorize
ColorizeTab:Toggle{
    Name = "AutoBuy Colorize",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyColorize = state
        while _G.AutoBuyColorize do
            local args = {
                [1] = "Colorize"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("OnStatBuy"):FireServer(unpack(args))
            wait(1)
        end
    end
}

-- Auto Buy Colorize Sub Pixels
ColorizeTab:Toggle{
    Name = "AutoBuy Colorize SubPixels",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyColorizeSubPixels = state
        while _G.AutoBuyColorizeSubPixels do
            AutoBuy("ColorizeSubPixels", 1)
            wait(1)
        end
    end
}

-- Auto Buy Colorize Pixel
ColorizeTab:Toggle{
    Name = "AutoBuy Colorize Pixel",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyColorizePixel = state
        while _G.AutoBuyColorizePixel do
            AutoBuy("ColorizePixel", 1)
            wait(1)
        end
    end
}

-- Auto Buy Colorize XP
ColorizeTab:Toggle{
    Name = "AutoBuy Colorize XP",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyColorizeXP = state
        while _G.AutoBuyColorizeXP do
            AutoBuy("ColorizeXP", 1)
            wait(1)
        end
    end
}

-- Auto Buy Tab
local AutoBuyTab = GUI:Tab{
    Name = "Pixels (Starting Currency)",
    CurrentValue = false,
    Icon = "rbxassetid://6034996695"
}

--Auto Buy Pixel Luck
AutoBuyTab:Toggle{
    Name = "AutoBuy Pixel Luck",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPixelLuck = state
        while _G.AutoBuyPixelLuck do
            AutoBuy("PixelLuck", "max")
            wait(1)
        end
    end
}

--Auto Buy Pixel Pixel
AutoBuyTab:Toggle{
    Name = "AutoBuy Pixel Pixel",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPixelPixel = state
        while _G.AutoBuyPixelPixel do
            AutoBuy("PixelPixel", "max")
            wait(1)
        end
    end
}

--Auto Buy Pixel XP
AutoBuyTab:Toggle{
    Name = "AutoBuy Pixel XP",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPixelXP = state
        while _G.AutoBuyPixelXP do
            AutoBuy("PixelXP", "max")
            wait(1)
        end
    end
}

--Auto Buy Pixel Delay
AutoBuyTab:Toggle{
    Name = "AutoBuy Pixel Delay",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPixelDelay = state
        while _G.AutoBuyPixelDelay do
            AutoBuy("PixelDelay", "max")
            wait(1)
        end
    end
}

--Auto Buy Pixel Max
AutoBuyTab:Toggle{
    Name = "AutoBuy Pixel Max",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPixelMax = state
        while _G.AutoBuyPixelMax do
            AutoBuy("PixelMax", "max")
            wait(1)
        end
    end
}

-- Auto Buy Sub-Pixels Upgrade
AutoBuyTab:Toggle{
    Name = "AutoBuy Sub-Pixels Upgrade",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuySubPixels = state
        while _G.AutoBuySubPixels do
            AutoBuy("PixelSubPixels", "max")
            wait(1)
        end
    end
}

-- Level Point Upgrades Tab
local LevelsTab = GUI:Tab{
    Name = "Levels (Point Upgrades)",
    CurrentValue = false,
    Icon = "rbxassetid://6034996695"
}

-- Auto Buy Points Luck
LevelsTab:Toggle{
    Name = "AutoBuy Points Luck",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPointsLuck = state
        while _G.AutoBuyPointsLuck do
            AutoBuy("PointsLuck", 1)
            wait(1)
        end
    end
}

-- Auto Buy Points Pixel
LevelsTab:Toggle{
    Name = "AutoBuy Points Pixel",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPointsPixel = state
        while _G.AutoBuyPointsPixel do
            AutoBuy("PointsPixel", 1)
            wait(1)
        end
    end
}

-- Auto Buy Points Walkspeed
LevelsTab:Toggle{
    Name = "AutoBuy Points Walkspeed",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPointsWalkspeed = state
        while _G.AutoBuyPointsWalkspeed do
            AutoBuy("PointsWalkspeed", 1)
            wait(1)
        end
    end
}

-- Auto Buy Points Range
LevelsTab:Toggle{
    Name = "AutoBuy Points Range",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPointsRange = state
        while _G.AutoBuyPointsRange do
            AutoBuy("Range", 1)
            wait(1)
        end
    end
}

-- Auto Buy Points Roll Speed
LevelsTab:Toggle{
    Name = "AutoBuy Points Roll Speed",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyPointsRollSpeed = state
        while _G.AutoBuyPointsRollSpeed do
            AutoBuy("PointsRollSpeed", 1)
            wait(1)
        end
    end
}

-- RGB (RGB Upgrades) Tab
local RGBTab = GUI:Tab{
    Name = "RGB (RGB Upgrades)",
    CurrentValue = false,
    Icon = "rbxassetid://6034996695"
}

-- Auto Buy RGB Rune Speed
RGBTab:Toggle{
    Name = "AutoBuy RGB Rune Speed",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyRGBRuneSpeed = state
        while _G.AutoBuyRGBRuneSpeed do
            AutoBuy("RGBRuneSpeed", 1)
            wait(1)
        end
    end
}

-- Auto Buy RGB Luck
RGBTab:Toggle{
    Name = "AutoBuy RGB Luck",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyRGBLuck = state
        while _G.AutoBuyRGBLuck do
            AutoBuy("RGBLuck", 1)
            wait(1)
        end
    end
}

-- Auto Buy Pixel
RGBTab:Toggle{
    Name = "AutoBuy RGB Pixel",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyRGBPixel = state
        while _G.AutoBuyRGBPixel do
            AutoBuy("RGBPixel", 1)
            wait(1)
        end
    end
}

-- Auto Buy RGB XP
RGBTab:Toggle{
    Name = "AutoBuy RGB XP",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoBuyRGBXP = state
        while _G.AutoBuyRGBXP do
            AutoBuy("RGBXP", 1)
            wait(1)
        end
    end
}
