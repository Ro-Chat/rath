local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
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
            if not Locked and instance and instance.Enabled then
                Locked = false
            end
        end)

        InstanceDisabled = instance:GetPropertyChangedSignal("Enabled"):Connect(function()
            -- if instance.Enabled then return end
            InstanceDisabled:Disconnect();
            Locked = true
        end)

        task.wait(0.7);

        if Locked or Locked == nil then return Locked end
        if ServerLocked then return true end

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

            local Counter = 0

            HeartbeatConnecton = RunService.Heartbeat:Connect(function()
                Counter = Counter + 1

                if not instance or not instance.Parent or stop or not instance.Enabled then
                    HeartbeatConnecton:Disconnect()
                    return
                end

                if not sirenToggleScript.Enabled then
                    sirenToggleScript:GetPropertyChangedSignal("Enabled"):Wait()
                end

                -- if Counter % 2 == 0 then
                    task.wait(PingValue / 10000)
                    -- RunService.RenderStepped:Wait()
                -- end

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

local Locked = sirenLib:Lock(sirenToggleScript)

if Locked and not ServerLocked then
    print("Server is locked, the script will execute.")
    coroutine.resume(sirenLib.DisableQueue)
    getgenv().ServerLocked = true
elseif not Locked and sirenToggleScript.Enabled == false and not ServerLocked then
    getgenv().ServerLocked = true
       print("Server is disabled, attempting to purge.")
        Remote.ItemHandler:InvokeServer(Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)

        local gun = LocalPlayer.Backpack:FindFirstChild("Remington 870") or Player.Character:FindFirstChild("Remington 870")
        local shootevent = ReplicatedStorage.ShootEvent;
        local weldevent = ReplicatedStorage.weldEvent
        local bullets = {};

        task.spawn(function()
            for _ = 1, 25 do
                table.insert(bullets, {
                    Cframe = CFrame.new(),
                    RayObject = Ray.new(Vector3.new(), Vector3.new()),
                    Distance = 0,
                    Hit = LocalPlayer.Character.Head
                })
            end
        end)

        task.wait(0.1)

        -- if not customCheck or teamCheck then Remote.TeamEvent:FireServer("Bright yellow"); end
        -- task.spawn(function ()
        --     while true do task.wait()
        --         for i, instance in next, Players:GetDescendants() do
        --             if instance:IsA("Tool") then
        --                 task.spawn(function()
        --                     for i = 1, 3 do
        --                         weldevent:FireServer(instance)
        --                     end
        --                 end)
        --             end
        --         end
        --     end
        -- end)
        while true do task.wait()
            task.spawn(function()
                -- for i = 1, 2 do
                    ReplicatedStorage.ReloadEvent:FireServer(gun);
                -- end
            end)
            shootevent:FireServer(bullets, gun)
            -- gun.Parent = LocalPlayer.Backpack
            -- weldevent:FireServer(gun)
            -- gun.Parent = LocalPlayer.Character 
        end
    -- Add crash here
    -- Add crash here
end

return sirenLib