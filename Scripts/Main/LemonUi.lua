local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Baodzvip/edit/main/Scripts/Main/Fluent.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Baodzvip/edit/main/Scripts/Main/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Baodzvip/edit/main/Scripts/Main/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Lemon Hub " ,
    SubTitle = "by baodzvip",
    TabWidth = 150,
    Size = UDim2.fromOffset(500, 320),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "airplay" }),
    AutoFarm = Window:AddTab({ Title = "Farm", Icon = "citrus" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Lemon Hub",
        SubContent = "By baodzvip", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



    Tabs.Main:AddParagraph({
        Title = "Lemon Hub",
        Content = "Best Script"
    })



    Tabs.Main:AddButton({
        Title = "Fly",
        Description = "You Want Fly?",
        Callback = function()
            Window:Dialog({
                Title = "Fly",
                Content = "Yes or No?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Baodzvip/Free/main/Scripts/LemonHub.lua"))()
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("No Fly")
                        end
                    }
                }
            })
        end
    })


    Tabs.Main:AddButton({
        Title = "AUTO RAID",
        Description = "AUTO RAID 100% RIEL NO FAKE",
        Callback = function()
                game.Players.LocalPlayer:Kick("Hãy thử lại 🤡")
            end 
        })

            
    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Spam", Default = false })

    Toggle:OnChanged(function()
        print("spam", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)
    
-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("LemonHub")
SaveManager:SetFolder("LemonHub/Games")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Lemon Hub",
    Content = "The script has been loaded.",
    Duration = 7
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
