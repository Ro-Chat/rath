local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Remote = workspace:WaitForChild("Remote")
local toggleSiren = Remote:WaitForChild("toggleSiren")
local sirenToggleScript = toggleSiren:WaitForChild("sirenToggleScript")
local Prison_ITEMS = workspace:WaitForChild("Prison_ITEMS")


local sirenLib = {
    Locked = false,
    RemoteCounter = 0,
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

        task.delay(0.2, function()
            if InstanceDisabled then
                InstanceDisabled:Disconnect();
            end
        end)

        InstanceDisabled = instance:GetPropertyChangedSignal("Enabled"):Connect(function()
            if instance.Enabled then return end
            InstanceDisabled:Disconnect();
            Locked = true
        end)

        task.wait(0.2);

        if Locked then return Locked end

        self.Loop(instance)

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
                self.Loop(instance)
                Connection:Disconnect()
            end
        end)
    end,
    Disable = function(self, instance)
        local stop;
        
        task.delay(0.65, function()
            stop = true
        end)

        local DisableConnection; DisableConnection = sirenToggleScript:GetPropertyChangedSignal("Disabled"):Connect(function()
            if not instance or instance.Enabled == false or stop then
                DisableConnection:Disconnect()
                return
            end

            if sirenToggleScript.Disabled then
                -- if not instance or instance.Enabled == false or stop then stop = true;return end
                -- RunService.Heartbeat:Wait()
                if self.RemoteCounter < 50 then
                    sirenToggleScript:GetPropertyChangedSignal("Enabled"):Wait()
                    for _ = 1, 4 do
                        if _ % 2 == 0 then
                            sirenToggleScript:GetPropertyChangedSignal("Enabled"):Wait()
                        end
                    -- task.wait( 0.01)
                        -- RunService.Stepped:Wait()
                        if not instance or instance.Enabled == false or stop then break end
                        coroutine.wrap(function()
                            workspace.Remote.toggleSiren:FireServer({
                            Part1 = {
                                Part_Weld = true,
                                l = instance
                            },
                            isOn = LocalPlayer.Status.isArrested,
                            Speaker = {
                                Part_Weld = true,
                                Sound = GetSound()
                            }
                        })
                        self.RemoteCounter += 1
                        --  if _ == 2 then task.wait(0.1) end
                        end)()
                        -- if _ == 2 then
                        --     RunService.Heartbeat:Wait()
                        -- end
                    end
                else
                    -- Prevents overflow by adding it to a queue
                    table.insert(self.Disabled, instance)
                end
            end
        end)
    end
}

sirenLib.DisableQueue = coroutine.create(function()
    while true do task.wait()
        for i, instance in next, sirenLib.Disabled do
            if i % 5 == 0 then task.wait(0.2) end
            task.spawn(Disable, instance)
        end
    end
end)

if sirenLib:Lock(sirenToggleScript) then
    print("Server is locked, the script will execute.")
    coroutine.resume(sirenLib.DisableQueue)
elseif sirenToggleScript.Disabled then
    print("Server is disabled, attempting to purge.")
end

return sirenLib
