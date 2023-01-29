return function(Release)

    ------------ Import ------------

    getgenv().Import = function(module)
        local Script

        if not Release then
            Script = readfile(("Rath/Modules/%s.lua"):format(module))
        end
        
        Script = Script or game:HttpGet(("https://raw.githubusercontent.com/Ro-Chat/rath/main/Modules/%s.lua"):format(module))
        return loadstring(Script)()
    end
    
    ------------ Modules ------------

    local Admin = Import("Admin")
    local Siren = Import("Siren")

    local GunSystem = Import("GunSystem")
    -- local CarSystem = Import("CarSystem")

    ------------ Tables ------------

    local Loop = {
        Kill = {},
        Bean = {},

    }

    ------------ Gun System ------------
    
    GunSystem:Add("Disable", function(Data)
        local Shot = Data.Shot
        local Character = Shot and Shot.Character

        local HRPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local RootJoint = HRPart and HRPart:FindFirstChild("RootJoint")

        Siren:Disable(RootJoint)
    end)

    GunSystem:Add("Oneshot", function(Data)
        local Shot = Data.Shot
        local Character = Shot and Shot.Character

        if Character:FindFirstChild("Humanoid") and Character.Humanoid.Health == 0 then return end

        local Torso = Character and Character:FindFirstChild("Torso")
        local Neck = Torso and Torso:WaitForChild("Neck")

        Siren:Disable(Neck)
    end)

    GunSystem:Add("Hostile", function(Data)
        local Shot = Data.Shot
        local Status = Shot and Shot:FindFirstChild("Status")

        if Status.isHostile.Value then return end

        Siren:Bool(Status.isHostile, true)
    end)

    GunSystem:Add("Innocent", function(Data)
        local Shot = Data.Shot
        local Status = Shot and Shot.Status

        if not Status.isHostile.Value then return end

        Siren:Bool(Status.isHostile, false)
    end)

    ------------ Commands ------------

    Admin:SetRank(game.Players.LocalPlayer, math.huge)
    Admin:SetSilent(true)

    Admin:AddCommand({
        Name = "prefix",
        Rank = 1,
        Description = "Changes the prefix used for commands.",
        Function = function(plr, prefix)
            if not prefix then
                return
            end
            Admin.Admins[plr].Prefix = prefix
        end
    })

    Admin:AddCommand({
        Name = {"kill", "k"},
        Rank = 2,
        Description = "Player that's specified becomes unalive.", -- epic roblox censor
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                Siren:Disable(Player.Character and Player.Character:FindFirstChild("Torso") and Player.Character.Torso:FindFirstChild("Neck"))
            end
        end
    })

    Admin:AddCommand({
        Name = {"rleg", "noleg"},
        Rank = 1,
        Description = "Disables the hip joints.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local Torso = Character and Character:FindFirstChild("Torso")
                
                local RHip = Torso and Torso:FindFirstChild("Right Hip")
                local LHip = Torso and Torso:FindFirstChild("Left Hip")

                Siren:Disable(RHip)
                Siren:Disable(LHip)

            end
        end
    })

    Admin:AddCommand({
        Name = {"rroot", "noroot"},
        Rank = 1,
        Description = "Disables the players movement",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local HRPart = Character and Character:FindFirstChild("HumanoidRootPart")

                Siren:Disable(HRPart:FindFirstChild("RootJoint"))
            end
        end
    })

    Admin:AddCommand({
        Name = {"rarm", "noarm"},
        Rank = 1,
        Description = "Disables the shoulder joints.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local Torso = Character and Character:FindFirstChild("Torso")
                
                local RShoulder = Torso and Torso:FindFirstChild("Right Shoulder")
                local LShoulder = Torso and Torso:FindFirstChild("Left Shoulder")

                Siren:Disable(RShoulder)
                Siren:Disable(LShoulder)
            end
        end
    })

    Admin:AddCommand({
        Name = {"rlimb", "nolimb"},
        Rank = 1,
        Description = "Disables all of the joints.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local Torso = Character and Character:FindFirstChild("Torso")
                
                local RHip = Torso and Torso:FindFirstChild("Right Hip")
                local LHip = Torso and Torso:FindFirstChild("Left Hip")
                local RShoulder = Torso and Torso:FindFirstChild("Right Shoulder")
                local LShoulder = Torso and Torso:FindFirstChild("Left Shoulder")

                Siren:Disable(RShoulder)
                Siren:Disable(LShoulder)
                Siren:Disable(RHip)
                Siren:Disable(LHip)

            end
        end
    })

    Admin:AddCommand({
        Name = {"nohat", "rhat"},
        Rank = 1,
        Description = "Removes the player's hat.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                for _, Child in next, Player.Character:GetChildren() do
                  if Child:IsA("Accessory") then
                      for _, Weld in next, Child:GetDescendants() do
                        if Weld:IsA("JointInstance") then
                          Siren:Disable(Weld)
                        end
                      end
                  end
                end
              end
        end
    })

    Admin:AddCommand({
        Name = "cars",
        Rank = 2,
        Description = "Disables the welds for every car.",
        Function = function(plr)
            Siren:BreakJoints(workspace.CarContainer)
        end
    })
end