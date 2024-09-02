local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
-- GAME: Training Simulator by Sun Day Studios
local Window = Rayfield:CreateWindow({
   Name = "🌎 OptiHub | 💪 Training Simulator",
   LoadingTitle = " 🌎 OptiNex Studios 🌎",
   LoadingSubtitle = "by OptiNex",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = OptiHubTS,
      FileName = "OptiHubTS"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "OptiHub",
      Subtitle = "Key System",
      Note = "Key in Discord server!!",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {""} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- Local variables
local isFarmingWins = false
local isAutoRebirth = false
local isEB = false
local isAutoHatch1 = false
local isAutoHatch2 = false
local isAutoHatch3 = false


-------------------------------------------------------------------- Creating Train Tab
local TrainTab = Window:CreateTab("Game") -- Title, Image
local Section = TrainTab:CreateSection("Train") 
-- Auto Lift Toggle
local Toggle = TrainTab:CreateToggle({
   Name = "🏋 Auto Lift ",
   CurrentValue = false,
   Flag = "AutoLift", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       isFarmingWins = Value
       while isFarmingWins do 
       local args = {
    [1] = "S_Tools_Activate",
    [2] = {}
}

game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
wait(1)
       end
   end,
})

-------------------------------------------------------------------------- Auto Rebirth Toggle
local Section = TrainTab:CreateSection("Level")
local Toggle = TrainTab:CreateToggle({
 Name = "👑 Auto Rebirth ",
 CurrentValue = false,
 Flag = "AutoRebirth", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
 Callback = function(Value)
     isAutoRebirth = Value
     while isAutoRebirth do
     local args = {
[1] = "S_Rebirth_Request",
[2] = {}
}

game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
wait(2)
     end
  end,
})
local Toggle = TrainTab:CreateToggle({
   Name = "🏅 Auto Equip Best Pet ",
   CurrentValue = false,
   Flag = "EQB", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      isEB = Value
      while isEB do
      local args = {
  [1] = "S_Pets_Equip_Best",
  [2] = {}
  }
  
  game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
  wait(1)
      end
       
    end,
  })

-------------------------------------------------------------------------- Auto Buy Egg Toggles
local Section = TrainTab:CreateSection("Eggs")
-- Starter Egg
local Toggle = TrainTab:CreateToggle({
   Name = " 🔰 Auto Hatch Starter Egg ",
   CurrentValue = false,
   Flag = "StarterTog", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      isAutoHatch1 = Value
      while isAutoHatch1 do
      local args = {
    [1] = "S_Eggs_Open",
    [2] = {
        [1] = "Starter",
        [2] = 1
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
wait(5)
      end
   end,
})
-- Insects Egg
local Toggle = TrainTab:CreateToggle({
   Name = "🦋 Auto Hatch Insects Egg ",
   CurrentValue = false,
   Flag = "InsectTog", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      isAutoHatch2 = Value
      while isAutoHatch2 do
      local args = {
    [1] = "S_Eggs_Open",
    [2] = {
        [1] = "Insects",
        [2] = 1
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
wait(5)
      end
   end,
})
-- Farm Egg
local Toggle = TrainTab:CreateToggle({
   Name = "🌾 Auto Hatch Farm Egg ",
   CurrentValue = false,
   Flag = "FarmTog", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      isAutoHatch3 = Value
      while isAutoHatch3 do
      local args = {
    [1] = "S_Eggs_Open",
    [2] = {
        [1] = "Farm",
        [2] = 1
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
wait(5)
      end
   end,
})

-------------------------------------------------------------------- Creating Player Tab
local PlayerTab = Window:CreateTab("Player") -- Title, Image
local Section = PlayerTab:CreateSection("Local Modifiers")
local WSlider = PlayerTab:CreateSlider({
   Name = "💨 Walk Speed ",
   Range = {0, 200},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "walkspeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})
local JSlider = PlayerTab:CreateSlider({
   Name = "🦘 Jump Height ",
   Range = {0, 200},
   Increment = 1,
   Suffix = "Height",
   CurrentValue = 50,
   Flag = "Jump Height", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local HSlider = PlayerTab:CreateSlider({
   Name = "🦒 Hip Height ",
   Range = {0, 200},
   Increment = 1,
   Suffix = "Height",
   CurrentValue = 2,
   Flag = "Hip Height", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.HipHeight = Value
   end,
})

local ResetButton = PlayerTab:CreateButton({
   Name = "↩️ Reset ALL Modifiers to Default",
   Callback = function()
       WSlider:Set(16)
       JSlider:Set(50)
       HSlider:Set(2)
   end,
})

Rayfield:LoadConfiguration()
