local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local Remote = workspace:WaitForChild("Remote")
local toggleSiren = Remote:WaitForChild("toggleSiren")
local sirenToggleScript = toggleSiren:WaitForChild("sirenToggleScript")
local Prison_ITEMS = workspace:WaitForChild("Prison_ITEMS")

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
                self:Disable(Weld)
            end
        end
    end,
    Disable = function(self, instance)
        local stop = false

        task.delay(1, function()
            stop = true
        end)

        local Finished = true

        local DisableConnection; DisableConnection = sirenToggleScript:GetPropertyChangedSignal("Disabled"):Connect(function()
            if not instance or instance.Enabled == false or stop then
                DisableConnection:Disconnect()
                return
            end
            if not sirenToggleScript.Enabled and Finished then
                Finished = false
                for _ = 1, 4 do
                    if _ % 3 == 0 then
                        task.wait(0.5)
                        RunService.RenderStepped:Wait()
                    end
                    if not instance or not instance.Enabled or stop then break end
                    if sirenToggleScript.Enabled then
                        sirenToggleScript:GetPropertyChangedSignal("Enabled"):Wait()
                    end
                    coroutine.wrap(function()
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

                        if _ == 4 then
                            Finished = true
                        end
                    end)()
                end
            end
        end)
    end
}

sirenLib.DisableQueue = coroutine.create(function()
    while true do task.wait()
        for i, instance in next, sirenLib.Disabled do
            if i % 5 == 0 then task.wait(0.2) end
            if instance then
                task.spawn(sirenLib.Disable, sirenLib, instance)
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
    print("Server is disabled, attempting to purge.")
    -- Add crash here
end

return sirenLib