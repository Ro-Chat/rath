local CarSystem = {}
local GunSystem = Import("GunSystem")
local Siren = Import("Siren")

--[[
    How to disable instances
      1. The instance must have the property .Enabled
      
      Siren:Disable(instance)
]]

-- Add vehicle health
-- Make the windows break and shoot through them
-- Tire "pops" when they're shot
-- Make the car break on car crashes

return CarSystem