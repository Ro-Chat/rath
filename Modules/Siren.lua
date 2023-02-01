local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Remote = workspace:WaitForChild("Remote")
local toggleSiren = Remote:WaitForChild("toggleSiren")
local sirenToggleScript = toggleSiren:WaitForChild("sirenToggleScript")
local Prison_ITEMS = workspace:WaitForChild("Prison_ITEMS")

local PingStat = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
local PingValue = 0

RunService.Heartbeat:Connect(function()
    PingValue = PingStat:GetValue()
end)


local sirenLib = {
    Locked = false,
    Disabled = {},
    GetSound = function()
        workspace.Remote.ItemHandler:InvokeServer(Prison_ITEMS.giver.M9.ITEMPICKUP)
        repeat task.wait() until LocalPlayer.Backpack:FindFirstChild("M9") or LocalPlayer.Character:FindFirstChild("M9")
        local m9 = LocalPlayer.Backpack:FindFirstChild("M9") or LocalPlayer.Character:FindFirstChild("M9")
        m9.Parent = LocalPlayer.Backpack
        return m9:WaitForChild("Handle"):FindFirstChildOfClass("Sound")
    end,
    Loop = function(self, instance)
        toggleSiren:FireServer({
            Part4 = {
                Part_Weld = true,
                l = instance
            },
            Part3 = {
                Part_Weld = true,
                l = instance
            },
            Part2 = {
                Part_Weld = true,
                l = instance
            },
            Part1 = {
                Part_Weld = true,
                l = instance
            },
            isOn = LocalPlayer.Status.isArrested,
            Speaker = {
                Part_Weld = true,
                Sound = self.GetSound()
            }
        })
    end,
    Lock = function(self, instance)
        local InstanceDisabled;
        local Locked;

        task.delay(0.5, function()
            if InstanceDisabled then
                InstanceDisabled:Disconnect();
            end
        end)

        InstanceDisabled = instance:GetPropertyChangedSignal("Enabled"):Connect(function()
            if instance.Enabled then return end
            InstanceDisabled:Disconnect();
            Locked = true
        end)

        task.wait(0.5);

        if Locked then return Locked end

        self:Loop(instance)

        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end,
    Enable = function (self, instance)
        local Connection;
        
        Connection = sirenToggleScript:GetPropertyChangedSignal("Enabled"):Connect(function()
            local Enabled = sirenToggleScript.Enabled
            
            if Enabled then
                if instance.Enabled then
                    Connection:Disconnect()
                    return
                end
                self:Loop(instance)
                Connection:Disconnect()
            end
        end)
    end,
    Bool = function(instance, bool)
        local Connection
        
        Connection = sirenToggleScript:GetPropertyChangedSignal("Enabled"):Connect(function()
            local enabled = sirenToggleScript.Enabled
            
            if enabled then
                if instance.Value == bool then
                    Connection:Disconnect()
                    return
                end
                toggleSiren:FireServer({
                    isOn = instance
                })
            end
        end)
    end,
    BreakJoints = function(self, Model)
        for _, Weld in next, Model:GetDescendants() do
            if Weld:IsA("JointInstance") then
                table.insert(self.Disabled, Weld)
            end
        end
    end,
    Play = function(self, sound)
        if sound.IsPlaying then return end
        toggleSiren:FireServer({
            isOn = LocalPlayer.Status.isArrested,
            Speaker = {
                Part_Weld = true,
                Sound = sound
            }
        })
    end,
    Stop = function(self, sound)
        if not sound.IsPlaying then return end
        toggleSiren:FireServer({
            isOn = LocalPlayer.Status.isArrested,
            Speaker = {
                Part_Weld = true,
                Sound = sound
            }
        })
    end,
    Disable = function(self, instance)
        task.spawn(function()
            local stop = false

            local HeartbeatConnecton

            if not instance then return end

            task.delay(0.3, function()
                stop = true
                if not instance or not instance.Parent then return end
                HeartbeatConnecton:Disconnect()
                task.wait(0.45)
                if not instance or not instance.Parent or not instance.Enabled then return end
                print("not disabled", instance:GetFullName())
                self:Disable(instance)
            end)

            HeartbeatConnecton = RunService.Heartbeat:Connect(function()
                if not instance or not instance.Parent or stop or not instance.Enabled then
                    HeartbeatConnecton:Disconnect()
                    return
                end

                if not sirenToggleScript.Enabled then
                    sirenToggleScript:GetPropertyChangedSignal("Enabled"):Wait()
                end

                RunService.RenderStepped:Wait()

                toggleSiren:FireServer({
                    Part1 = {
                        Part_Weld = true,
                        l = instance
                    },
                    isOn = LocalPlayer.Status.isArrested,
                    Speaker = {
                        Part_Weld = true,
                        Sound = self.GetSound()
                    }
                })
            end)
        end)
    end
}

sirenLib.DisableQueue = coroutine.create(function()
    while true do task.wait()
        for i, instance in next, sirenLib.Disabled do
            if i % 5 == 0 then task.wait(0.5) end
            if instance then
                sirenLib:Disable(instance)
            end
            table.remove(sirenLib.Disabled, i)
        end
    end
end)


if sirenLib:Lock(sirenToggleScript) and not ServerLocked then
    print("Server is locked, the script will execute.")
    coroutine.resume(sirenLib.DisableQueue)
    getgenv().ServerLocked = true
elseif sirenToggleScript.Disabled then
    if not ServerLocked then 
       print("Server is disabled, attempting to purge.")
    end
    -- Add crash here
end

return sirenLib