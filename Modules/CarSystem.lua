local Siren = Import("Siren")

local Players = game:GetService("Players")

local Prison_ITEMS = workspace.Prison_ITEMS
local CarContainer = workspace.CarContainer

local CarSystem = {
    CarInfo = {
        Sedan = {
            Health = 1000,
            Window = 100,
            Tires = 60
        },
        Squad = {
            Health = 1500,
            Window = 150,
            Tires = 100
        }
    },
    Cars = {},
    New = function(self, car, pos)
        -- spawn a new car and teleport it to position

    end,
    Destroy = function(self, Car)
        self.Cars[Car] = nil
        Siren:BreakJoints(Car)
    end,
    CarDamageHandler = function(Data)
        local Hit = Data.Hit
        local Gun = Data.Gun
        local GunStates = Gun and Gun:FindFirstChild("GunStates") and require(Gun.GunStates)
    
        if not Hit or not Gun then return end
        
        local Car, CarData = GetCarFromPart(Hit)
        CarData:Update(Hit, GunStates.Damage)
    end
}

CarContainer.ChildAdded:Connect(function(Car)
    print(Car.Name, "Spawned")
    CarSystem.Cars[Car] = {
        Car = Car,
        Name = Car.Name,
        Window = CarSystem.CarInfo[Car.Name].Window,
        Tire = CarSystem.CarInfo[Car.Name].Tire,
        Health = {
            Base = CarSystem.CarInfo[Car.Name].Health,
            Windshield = CarSystem.CarInfo[Car.Name].Window,
            RearWindow = CarSystem.CarInfo[Car.Name].Window,
            LeftWindow = CarSystem.CarInfo[Car.Name].Window,
            Rightshield = CarSystem.CarInfo[Car.Name].Window,
            LFTire = CarSystem.CarInfo[Car.Name].Tire,
            RFTire = CarSystem.CarInfo[Car.Name].Tire,
            LBTire = CarSystem.CarInfo[Car.Name].Tire,
            RBTire = CarSystem.CarInfo[Car.Name].Tire,
        },
        DisableWelds = function(self, Part)
            for _, Weld in next, self.Car:GetDescendants() do
                pcall(function()
                    if Weld:IsA("JointInstance") and (Weld.Part0 == Part or Weld.Part1 == Part) then
                        Siren:Disable(Weld)
                    end
                end)
            end
        end,
        IdentifyPart = function(self, Part)
            local Main = self.Car.Body.Main
            local Offset = Main.Position - Part.Position

            Offset = Vector3.new(math.floor(Offset.X), math.floor(Offset.Y), math.floor(Offset.Z))

            if self.Name == "Squad" then
                if Offset == Vector3.new(-7, -3, 5) or Offset == Vector3.new(-6, -4, 4) then
                    -- Windshield
                    return "Windshield"
                end

                if Offset == Vector3.new(0, -3, -1) then
                    -- Rear window
                    return "RearWindow"
                end

                if Offset == Vector3.new(-2, -2, 6) then
                    -- Left window
                    return "LeftWindow"
                end

                if Offset == Vector3.new(-7, -2, 0) then
                    -- Right window
                    return "RightWindow"
                end

                if Offset == Vector3.new(-7, 0, 12) then
                    -- Front left tire
                    return "LFTire"
                end

                if Offset == Vector3.new(-13, 0, 4) then
                    -- Front right tire
                    return "RFTire"
                end

                if Offset == Vector3.new(-4, 1, -4) then
                    -- Back right tire
                    return "RBTire"
                end

                if Offset == Vector3.new(3, 1, 3) then
                    -- Back left tire
                    return "BLTire"
                end

                return "Base"
            end

            if self.Name == "Sedan" then
                if Offset == Vector3.new(0, -3, -9) or Offset == Vector3.new(0, -4, -8) then
                    -- Windshield
                    return "Windshield"
                end

                if Offset == Vector3.new(0, -4, -8) then
                    -- Rear window
                    return "RearWindow"
                end

                if Offset == Vector3.new(3, -2, -5) then
                    -- Right window
                    return "RightWindow"
                end

                if Offset == Vector3.new(-4, -2, -5) then
                    -- Left window
                    return "LeftWindow"
                end

                if Offset == Vector3.new(4, 1 -13) then
                    -- Front left tire
                    return "LFTire"
                end

                if Offset == Vector3.new(-5, 0, -13) then
                    -- Front right tire
                    return "LRTire"
                end

                if Offset == Vector3.new(-5, 0, -1) then
                    -- Back left tire
                    return "LBTire"
                end

                if Offset == Vector3.new(4, 0, -1) then
                    -- Back right tire
                    return "RBTire"
                end

                return "Base"
            end
        end,
        Update = function(self, Hit, Damage)
            local Identifier = self:IdentifyPart(Hit)
            local Health = self.Health[Identifier]

            Health = Health - Damage

            print("Car hit at", Identifier, "for", Damage, "damage.")

            self.Health[Identifier] = Health

            if Health <= 0 then
                if Identifier ~= "Base" then
                    self:DisableWelds(Hit)
                    return
                end
                self:Destroy()
            end
        end,
        Destroy = function(self)
            CarSystem:Destroy(self.Car)
        end
    }
end)

-- Tire "pops" when they're shot

function GetCarFromPart(part)
    for Car, Data in next, CarSystem.Cars do
        if part:IsDescendantOf(Car) then
            return Car, Data
        end
    end
end



-- Make the car break on car crashes

return CarSystem