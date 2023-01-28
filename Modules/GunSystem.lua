local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local ReplicateEvent = ReplicatedStorage:WaitForChild("ReplicateEvent")

local GunSystem = {
    Add = function(self, type, func)
        table.insert(self.Gun, {
            Callback = func,
            Type = type,
            Players = {}
        })
    end,
    AddPlayer = function(self, type, plr)
        for i, v in next, self.Gun do
            if v.Type == type then
                table.insert(v.Players, plr)
            end
        end
    end,
    RemovePlayer = function(self, tye, plr)
        for i, v in next, self.Gun do
            if v.Type == type then
                local idx = table.find(v.Players, plr)
                if idx then
                    table.remove(v.Players, idx)
                end
            end
        end
    end,
    Gun = {},
}

function GetClosestPlayerToPosition(Position, MaxDistance)
    local Max, Closest = MaxDistance or math.huge;

    for i,v in pairs(Players:GetPlayers()) do
        if v.Character then
            local Tool = v.Character:FindFirstChildOfClass("Tool") or v.Backpack:FindFirstChildOfClass("Tool");
            if Tool then
                local ShootPart = Tool:FindFirstChild("Muzzle");
                local PrimaryPart = v.Character.PrimaryPart;
                if PrimaryPart and ShootPart then
                    local Distance = (ShootPart.Position-Position).Magnitude;
                    if Distance < Max then
                        Max = Distance;
                        Closest = v;
                    end
                end
            end
        end
    end

    return Closest;
end

function GetPlayerFromPart(part)
    for _, Player in next, Players:GetPlayers() do
        if Player.Character and part and part:IsDescendantOf(Player.Character) then
            return Player
        end
    end
end

GunSystem.Connection = ReplicateEvent.OnClientEvent:Connect(function(bulletData, isTaser)
    for _, bullet in next, bulletData do
        local Hit, Cframe, Distance, RayObject = bullet.Hit, bullet.Cframe, bullet.Distance, bullet.RayObject;

        local CalculatedCFrame = Cframe * CFrame.new(0, 0, -Distance / 2);
        local WhoShot = GetClosestPlayerToPosition(CalculatedCFrame.p, 30);
        local HitPlayer = GetPlayerFromPart(Hit);

        for _, GunData in next, GunSystem.Gun do
            if table.find(GunData.Players, WhoShot) then
                GunData.Callback({
                    Shot = HitPlayer,
                    From = WhoShot,
                    Hit = Hit,
                    CFrame = Cframe,
                    RayObject = RayObject,
                    Distance = Distance
                })
            end
        end
    end
end)

return GunSystem