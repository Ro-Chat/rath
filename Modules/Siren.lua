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
        local m9 = LocalPlayer.Backpack:WaitForChild("M9") or LocalPlayer.Character:FindFirstChild("M9")
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

        task.spawn(function

            local stop = false

            repeat task.wait() until PingValue < 850
            task.delay(0.55, function()
                stop = true
                if not instance or not instance.Parent then return end
                    task.wait(0.3)
                    if not instance.Enabled then return end
                    print("not disabled", instance:GetFullName())
                    self:Disable(instance)
            end)

            local DisableConnection; DisableConnection = sirenToggleScript:GetPropertyChangedSignal("Disabled"):Connect(function()
                if not instance or instance.Enabled == false or stop then
                    DisableConnection:Disconnect()
                    return
                end
                if not sirenToggleScript.Enabled and instance.Enabled then
                    local i = 0
                    repeat
                        i += 1

                        -- task.wait()

                        -- if i % 20 == 0 then
                        --     task.wait(0.5)
                        --     -- local t = (PingValue / 10000) * 5
                        --     -- task.wait(t)
                        --     -- task.wait()
                        --     -- print(t)
                        --     -- RunService.Stepped:Wait()
                        -- end

                        if not instance or not instance.Enabled or stop then
                            break
                        end

                        -- if i >= 100 then break end

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

                        

                        if i % 5 == 0 then
                            task.wait((PingValue / 10000))
                            -- if sirenToggleScript.Enabled then
                            --     sirenToggleScript:GetPropertyChangedSignal("Enabled"):Wait()
                            -- end
                            -- RunService.Stepped:Wait()
                        end
                    until false
                end
            end)
        end)
    end
}

sirenLib.DisableQueue = coroutine.create(function()
    while true do task.wait()
        for i, instance in next, sirenLib.Disabled do
            if i % 5 == 0 then task.wait(0.1) end
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