-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BolovardFlinger"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")
-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 460) -- Increased height for blacklist UI
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -230)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
-- Corner radius
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame
-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame
local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8)
TitleBarCorner.Parent = TitleBar
-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "BOLOVARD'S RAGEBAIT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar
-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Position = UDim2.new(1, -35, 0.5, -12)
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Red button
CloseButton.BorderSizePixel = 0
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = TitleBar
local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(1, 0)
CloseButtonCorner.Parent = CloseButton
-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Position = UDim2.new(0, 15, 0, 50)
StatusLabel.Size = UDim2.new(1, -30, 0, 20)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Select targets to fling"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame
-- Player Selection Frame
local SelectionFrame = Instance.new("Frame")
SelectionFrame.Position = UDim2.new(0, 15, 0, 80)
SelectionFrame.Size = UDim2.new(1, -30, 0, 220)
SelectionFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
SelectionFrame.BorderSizePixel = 0
SelectionFrame.Parent = MainFrame
local SelectionCorner = Instance.new("UICorner")
SelectionCorner.CornerRadius = UDim.new(0, 6)
SelectionCorner.Parent = SelectionFrame
-- Player List ScrollFrame
local PlayerScrollFrame = Instance.new("ScrollingFrame")
PlayerScrollFrame.Position = UDim2.new(0, 5, 0, 5)
PlayerScrollFrame.Size = UDim2.new(1, -10, 1, -10)
PlayerScrollFrame.BackgroundTransparency = 1
PlayerScrollFrame.BorderSizePixel = 0
PlayerScrollFrame.ScrollBarThickness = 6
PlayerScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScrollFrame.Parent = SelectionFrame
-- Start Fling Button
local StartButton = Instance.new("TextButton")
StartButton.Position = UDim2.new(0, 15, 0, 310)
StartButton.Size = UDim2.new(0.5, -20, 0, 40)
StartButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Red button
StartButton.BorderSizePixel = 0
StartButton.Text = "START FLING"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 16
StartButton.Parent = MainFrame
local StartButtonCorner = Instance.new("UICorner")
StartButtonCorner.CornerRadius = UDim.new(0, 6)
StartButtonCorner.Parent = StartButton
-- Stop Fling Button
local StopButton = Instance.new("TextButton")
StopButton.Position = UDim2.new(0.5, 5, 0, 310)
StopButton.Size = UDim2.new(0.5, -20, 0, 40)
StopButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Red button
StopButton.BorderSizePixel = 0
StopButton.Text = "STOP FLING"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 16
StopButton.Parent = MainFrame
local StopButtonCorner = Instance.new("UICorner")
StopButtonCorner.CornerRadius = UDim.new(0, 6)
StopButtonCorner.Parent = StopButton
-- Select/Deselect Buttons
local SelectAllButton = Instance.new("TextButton")
SelectAllButton.Position = UDim2.new(0, 15, 0, 360)
SelectAllButton.Size = UDim2.new(0.5, -20, 0, 30)
SelectAllButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Red button
SelectAllButton.BorderSizePixel = 0
SelectAllButton.Text = "SELECT ALL"
SelectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
SelectAllButton.Font = Enum.Font.Gotham
SelectAllButton.TextSize = 14
SelectAllButton.Parent = MainFrame
local SelectAllCorner = Instance.new("UICorner")
SelectAllCorner.CornerRadius = UDim.new(0, 6)
SelectAllCorner.Parent = SelectAllButton
local DeselectAllButton = Instance.new("TextButton")
DeselectAllButton.Position = UDim2.new(0.5, 5, 0, 360)
DeselectAllButton.Size = UDim2.new(0.5, -20, 0, 30)
DeselectAllButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Red button
DeselectAllButton.BorderSizePixel = 0
DeselectAllButton.Text = "DESELECT ALL"
DeselectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
DeselectAllButton.Font = Enum.Font.Gotham
DeselectAllButton.TextSize = 14
DeselectAllButton.Parent = MainFrame
local DeselectAllCorner = Instance.new("UICorner")
DeselectAllCorner.CornerRadius = UDim.new(0, 6)
DeselectAllCorner.Parent = DeselectAllButton
-- Blacklist TextBox
local BlacklistTextBox = Instance.new("TextBox")
BlacklistTextBox.Position = UDim2.new(0, 15, 0, 400)
BlacklistTextBox.Size = UDim2.new(1, -30, 0, 30)
BlacklistTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
BlacklistTextBox.BorderSizePixel = 0
BlacklistTextBox.Text = "Enter player name"
BlacklistTextBox.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
BlacklistTextBox.TextSize = 14
BlacklistTextBox.Font = Enum.Font.Gotham
BlacklistTextBox.TextXAlignment = Enum.TextXAlignment.Left
BlacklistTextBox.ClearTextOnFocus = true
BlacklistTextBox.Parent = MainFrame
local BlacklistTextBoxCorner = Instance.new("UICorner")
BlacklistTextBoxCorner.CornerRadius = UDim.new(0, 6)
BlacklistTextBoxCorner.Parent = BlacklistTextBox
-- Add to Blacklist Button
local AddBlacklistButton = Instance.new("TextButton")
AddBlacklistButton.Position = UDim2.new(0, 15, 0, 435)
AddBlacklistButton.Size = UDim2.new(0.5, -20, 0, 30)
AddBlacklistButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Red button
AddBlacklistButton.BorderSizePixel = 0
AddBlacklistButton.Text = "ADD TO BLACKLIST"
AddBlacklistButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
AddBlacklistButton.Font = Enum.Font.Gotham
AddBlacklistButton.TextSize = 14
AddBlacklistButton.Parent = MainFrame
local AddBlacklistCorner = Instance.new("UICorner")
AddBlacklistCorner.CornerRadius = UDim.new(0, 6)
AddBlacklistCorner.Parent = AddBlacklistButton
-- Remove from Blacklist Button
local RemoveBlacklistButton = Instance.new("TextButton")
RemoveBlacklistButton.Position = UDim2.new(0.5, 5, 0, 435)
RemoveBlacklistButton.Size = UDim2.new(0.5, -20, 0, 30)
RemoveBlacklistButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Red button
RemoveBlacklistButton.BorderSizePixel = 0
RemoveBlacklistButton.Text = "REMOVE FROM BLACKLIST"
RemoveBlacklistButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
RemoveBlacklistButton.Font = Enum.Font.Gotham
RemoveBlacklistButton.TextSize = 14
RemoveBlacklistButton.Parent = MainFrame
local RemoveBlacklistCorner = Instance.new("UICorner")
RemoveBlacklistCorner.CornerRadius = UDim.new(0, 6)
RemoveBlacklistCorner.Parent = RemoveBlacklistButton
-- Variables
local SelectedTargets = {}
local PlayerCheckboxes = {}
local FlingActive = false
local FlingConnection = nil
local Blacklist = {} -- Table to store blacklisted player names
getgenv().OldPos = nil
getgenv().FPDH = workspace.FallenPartsDestroyHeight
-- Function to update player list
local function RefreshPlayerList()
    -- Clear existing player entries
    for _, child in pairs(PlayerScrollFrame:GetChildren()) do
        child:Destroy()
    end
    PlayerCheckboxes = {}
    
    -- Get players and sort them
    local PlayerList = Players:GetPlayers()
    table.sort(PlayerList, function(a, b) return a.Name:lower() < b.Name:lower() end)
    
    -- Create entries for each player
    local yPosition = 5
    for _, player in ipairs(PlayerList) do
        if player ~= Player then -- Don't include yourself
            -- Create player entry frame
            local PlayerEntry = Instance.new("Frame")
            PlayerEntry.Size = UDim2.new(1, -10, 0, 30)
            PlayerEntry.Position = UDim2.new(0, 5, 0, yPosition)
            PlayerEntry.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
            PlayerEntry.BorderSizePixel = 0
            PlayerEntry.Parent = PlayerScrollFrame
            local PlayerEntryCorner = Instance.new("UICorner")
            PlayerEntryCorner.CornerRadius = UDim.new(0, 4)
            PlayerEntryCorner.Parent = PlayerEntry
            
            -- Create checkbox
            local Checkbox = Instance.new("TextButton")
            Checkbox.Size = UDim2.new(0, 20, 0, 20)
            Checkbox.Position = UDim2.new(0, 5, 0.5, -10)
            Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
            Checkbox.BorderSizePixel = 0
            Checkbox.AutoButtonColor = false
            Checkbox.Text = ""
            Checkbox.Parent = PlayerEntry
            local CheckboxCorner = Instance.new("UICorner")
            CheckboxCorner.CornerRadius = UDim.new(0, 4)
            CheckboxCorner.Parent = Checkbox
            
            -- Checkmark (initially invisible)
            local Checkmark = Instance.new("TextLabel")
            Checkmark.Size = UDim2.new(1, 0, 1, 0)
            Checkmark.BackgroundTransparency = 1
            Checkmark.Text = "✓"
            Checkmark.TextColor3 = Color3.fromRGB(255, 255, 255) -- White checkmark
            Checkmark.TextSize = 16
            Checkmark.Font = Enum.Font.GothamBold
            Checkmark.Visible = SelectedTargets[player.Name] ~= nil
            Checkmark.Parent = Checkbox
            
            -- Player name label
            local NameLabel = Instance.new("TextLabel")
            NameLabel.Size = UDim2.new(1, -35, 1, 0)
            NameLabel.Position = UDim2.new(0, 30, 0, 0)
            NameLabel.BackgroundTransparency = 1
            NameLabel.Text = player.Name
            NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
            NameLabel.TextSize = 14
            NameLabel.Font = Enum.Font.Gotham
            NameLabel.TextXAlignment = Enum.TextXAlignment.Left
            NameLabel.Parent = PlayerEntry
            
            -- Make entire entry clickable
            local ClickArea = Instance.new("TextButton")
            ClickArea.Size = UDim2.new(1, 0, 1, 0)
            ClickArea.BackgroundTransparency = 1
            ClickArea.Text = ""
            ClickArea.ZIndex = 2
            ClickArea.Parent = PlayerEntry
            
            -- Selection toggle on click
            ClickArea.MouseButton1Click:Connect(function()
                if SelectedTargets[player.Name] then
                    SelectedTargets[player.Name] = nil
                    Checkmark.Visible = false
                    Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black when unselected
                else
                    SelectedTargets[player.Name] = player
                    Checkmark.Visible = true
                    Checkbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Slightly lighter black when selected
                end
                
                UpdateStatus()
            end)
            
            -- Store reference to this player's UI
            PlayerCheckboxes[player.Name] = {
                Entry = PlayerEntry,
                Checkmark = Checkmark,
                Checkbox = Checkbox
            }
            
            yPosition = yPosition + 35
        end
    end
    
    -- Update scrollframe canvas size
    PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPosition + 5)
end
-- Count selected targets
local function CountSelectedTargets()
    local count = 0
    for _ in pairs(SelectedTargets) do
        count = count + 1
    end
    return count
end
-- Update status display
local function UpdateStatus()
    local count = CountSelectedTargets()
    if FlingActive then
        StatusLabel.Text = "Flinging " .. count .. " target(s)"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50) -- Red text when flinging
    else
        StatusLabel.Text = count .. " target(s) selected" 
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text normally
    end
end
-- Function to select/deselect all players, respecting blacklist
local function ToggleAllPlayers(select)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Player and not Blacklist[player.Name] then -- Skip blacklisted players
            local checkboxData = PlayerCheckboxes[player.Name]
            if checkboxData then
                if select then
                    SelectedTargets[player.Name] = player
                    checkboxData.Checkmark.Visible = true
                    checkboxData.Checkbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Slightly lighter black
                else
                    SelectedTargets[player.Name] = nil
                    checkboxData.Checkmark.Visible = false
                    checkboxData.Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
                end
            end
        end
    end
    
    UpdateStatus()
end
-- Show notification
local function Message(Title, Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = Title,
        Text = Text,
        Duration = Time or 5
    })
end
-- Blacklist management functions
local function AddToBlacklist(playerName)
    if playerName == "" or playerName == Player.Name then
        Message("Error", "Invalid player name or cannot blacklist self", 2)
        return
    end
    local player = Players:FindFirstChild(playerName)
    if player then
        Blacklist[playerName] = true
        SelectedTargets[playerName] = nil -- Deselect if currently selected
        local checkbox = PlayerCheckboxes[playerName]
        if checkbox then
            checkbox.Checkmark.Visible = false
            checkbox.Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
        end
        Message("Blacklist", playerName .. " added to blacklist", 2)
    else
        Message("Error", "Player '" .. playerName .. "' not found", 2)
    end
    BlacklistTextBox.Text = "Enter player name"
    UpdateStatus()
end
local function RemoveFromBlacklist(playerName)
    if Blacklist[playerName] then
        Blacklist[playerName] = nil
        Message("Blacklist", playerName .. " removed from blacklist", 2)
    else
        Message("Error", "Player '" .. playerName .. "' not in blacklist", 2)
    end
    BlacklistTextBox.Text = "Enter player name"
end
-- Modified fling function to ensure consistent flinging
local function SkidFling(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart
    local TCharacter = TargetPlayer.Character
    if not TCharacter then return end
    
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle
    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessory and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end
    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        
        if THumanoid and THumanoid.Sit then
            return Message("Error", TargetPlayer.Name .. " is sitting", 2)
        end
        
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        
        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(1e7, 1e7, 1e7) -- Reduced for stability, still strong
            RootPart.RotVelocity = Vector3.new(1e8, 1e8, 1e8)
        end
        
        local SFBasePart = function(BasePart)
            local TimeToWait = 1.5 -- Reduced time for faster flings
            local Time = tick()
            local Angle = 0
            repeat
                if RootPart and THumanoid then
                    Angle = Angle + 90
                    -- Position very close to target, above and slightly offset
                    FPos(BasePart, CFrame.new(0, 2, -1), CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait(0.05) -- Faster updates for smoother tracking
                    FPos(BasePart, CFrame.new(0, 2, -1), CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait(0.05)
                end
            until Time + TimeToWait < tick() or not FlingActive
        end
        
        workspace.FallenPartsDestroyHeight = 0/0
        
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(0, 0, 0)
        BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        
        if TRootPart then
            SFBasePart(TRootPart)
        elseif THead then
            SFBasePart(THead)
        elseif Handle then
            SFBasePart(Handle)
        else
            return Message("Error", TargetPlayer.Name .. " has no valid parts", 2)
        end
        
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
        
        -- Reset character position
        if getgenv().OldPos then
            repeat
                RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                Humanoid:ChangeState("GettingUp")
                for _, part in pairs(Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Velocity, part.RotVelocity = Vector3.new(), Vector3.new()
                    end
                end
                task.wait()
            until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
            workspace.FallenPartsDestroyHeight = getgenv().FPDH
        end
    else
        return Message("Error", "Your character is not ready", 2)
    end
end
-- Start flinging selected targets
local function StartFling()
    if FlingActive then return end
    
    local count = CountSelectedTargets()
    if count == 0 then
        StatusLabel.Text = "No targets selected!"
        wait(1)
        StatusLabel.Text = "Select targets to fling"
        return
    end
    
    FlingActive = true
    UpdateStatus()
    Message("Started", "Flinging " .. count .. " targets", 2)
    
    -- Start flinger in separate thread
    spawn(function()
        while FlingActive do
            local validTargets = {}
            
            -- Process all targets first to determine which are valid
            for name, player in pairs(SelectedTargets) do
                if player and player.Parent then
                    validTargets[name] = player
                else
                    -- Remove players who left
                    SelectedTargets[name] = nil
                    local checkbox = PlayerCheckboxes[name]
                    if checkbox then
                        checkbox.Checkmark.Visible = false
                        checkbox.Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
                    end
                end
            end
            
            -- Then attempt to fling each valid target
            for _, player in pairs(validTargets) do
                if FlingActive then
                    SkidFling(player)
                    -- Brief wait between targets to allow movement to reset
                    wait(0.1)
                else
                    break
                end
            end
            
            -- Update status periodically
            UpdateStatus()
            
            -- Wait a moment before starting next fling cycle
            wait(0.5)
        end
    end)
end
-- Stop flinging
local function StopFling()
    if not FlingActive then return end
    
    FlingActive = false
    
    UpdateStatus()
    Message("Stopped", "Fling has been stopped", 2)
end
-- Set up button connections
StartButton.MouseButton1Click:Connect(StartFling)
StopButton.MouseButton1Click:Connect(StopFling)
SelectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(true) end)
DeselectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(false) end)
CloseButton.MouseButton1Click:Connect(function()
    StopFling()
    ScreenGui:Destroy()
end)
AddBlacklistButton.MouseButton1Click:Connect(function()
    AddToBlacklist(BlacklistTextBox.Text)
end)
RemoveBlacklistButton.MouseButton1Click:Connect(function()
    RemoveFromBlacklist(BlacklistTextBox.Text)
end)
-- Button hover effects
local function SetupButtonHover(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = hoverColor
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = normalColor
    end)
end
SetupButtonHover(StartButton, Color3.fromRGB(200, 0, 0), Color3.fromRGB(255, 50, 50)) -- Red to brighter red
SetupButtonHover(StopButton, Color3.fromRGB(200, 0, 0), Color3.fromRGB(255, 50, 50)) -- Red to brighter red
SetupButtonHover(SelectAllButton, Color3.fromRGB(200, 0, 0), Color3.fromRGB(255, 50, 50)) -- Red to brighter red
SetupButtonHover(DeselectAllButton, Color3.fromRGB(200, 0, 0), Color3.fromRGB(255, 50, 50)) -- Red to brighter red
SetupButtonHover(CloseButton, Color3.fromRGB(200, 0, 0), Color3.fromRGB(255, 50, 50)) -- Red to brighter red
SetupButtonHover(AddBlacklistButton, Color3.fromRGB(200, 0, 0), Color3.fromRGB(255, 50, 50)) -- Red to brighter red
SetupButtonHover(RemoveBlacklistButton, Color3.fromRGB(200, 0, 0), Color3.fromRGB(255, 50, 50)) -- Red to brighter red
-- Handle player joining/leaving
Players.PlayerAdded:Connect(RefreshPlayerList)
Players.PlayerRemoving:Connect(function(player)
    if SelectedTargets[player.Name] then
        SelectedTargets[player.Name] = nil
    end
    RefreshPlayerList()
    UpdateStatus()
end)
-- Initialize
RefreshPlayerList()
UpdateStatus()
-- Success message
Message("Loaded", "Bolovard's Ragebait Fling GUI loaded!", 3)
