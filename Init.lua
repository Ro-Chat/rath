return function(Release)

    ------------ Services ------------

    local Players = game:GetService("Players")

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

    local Loop       = Import("Loop")
    local Admin      = Import("Admin")
    local Siren      = Import("Siren")
    local GunSystem  = Import("GunSystem")
    local CarSystem  = Import("CarSystem")
    local Protection = Import("Protection")

    ------------ Loops ------------

    local Bean     = Loop:Add("Bean")
    local RLeg     = Loop:Add("RLeg")
    local LLeg     = Loop:Add("LLeg")
    local RArm     = Loop:Add("RArm")
    local LArm     = Loop:Add("LArm")
    local RJoint   = Loop:Add("RJoint")
    local LoopKill = Loop:Add("Kill")

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

    ------------ Car System ------------

    GunSystem:Add("CarDamage", CarSystem.CarDamageHandler)

    for _, Player in next, Players:GetPlayers() do
        GunSystem:AddPlayer("CarDamage", Player)
    end

    Players.PlayerAdded:Connect(function(Player)
        GunSystem:AddPlayer("CarDamage", Player)
    end)

    Players.PlayerRemoving:Connect(function(Player)
        GunSystem:RemovePlayer("CarDamage", Player)
    end)

    ------------ Commands ------------

    Admin:SetRank(game.Players.LocalPlayer, math.huge)
    
    -- Admin:SetSilent(true)

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
        Name = {"os", "oneshot"},
        Rank = 2,
        Description = "Enables oneshot for the player",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                GunSystem:AddPlayer("Oneshot", Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"unos", "unoneshot"},
        Rank = 2,
        Description = "Disables oneshot for the player",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                GunSystem:RemovePlayer("Oneshot", Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"stungun", "sg"},
        Rank = 2,
        Description = "Enables stungun for the player",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                GunSystem:AddPlayer("Disable", Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"unsg", "unstungun"},
        Rank = 2,
        Description = "Disables stungun for the player",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                GunSystem:RemovePlayer("Disable", Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"corruptcop", "cc"},
        Rank = 2,
        Description = "Enables corruptcop for the player",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                GunSystem:AddPlayer("Hostile", Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"uncorruptcop", "uncc"},
        Rank = 2,
        Description = "Disables corruptcop for the player",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                GunSystem:RemovePlayer("Hostile", Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"is", "innocentshot"},
        Rank = 2,
        Description = "Enables innocentshot for the player",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                GunSystem:AddPlayer("Innocent", Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"unis", "uninnocentshot"},
        Rank = 2,
        Description = "Disables innocentshot for the player",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                GunSystem:RemovePlayer("Innocent", Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"lk", "loopkill"},
        Rank = 2,
        Description = "Loop kills the player that is specified",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local Torso = Character and Character:FindFirstChild("Torso")
                local Neck = Torso and Torso:FindFirstChild("Neck")

                Siren:Disable(Neck)

                LoopKill:Append(Player, Player.CharacterAdded:Connect(function(Character)
                    repeat task.wait() until Character:FindFirstChild("Torso") and Character.Torso:FindFirstChild("Neck")

                    if not (Character:FindFirstChild("Torso") and Character.Torso:FindFirstChild("Neck")) then return end

                    Siren:Disable(Player.Character.Torso.Neck)
                end))
            end
        end
    })

    Admin:AddCommand({
        Name = {"unlk", "unloopkill"},
        Rank = 2,
        Description = "Stops the loopkill on the player.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                LoopKill:Remove(Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"lb", "loopbean"},
        Rank = 2,
        Description = "Loop beans the player that is specified",
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

                Bean:Append(Player, Player.CharacterAdded:Connect(function(Character)
                    repeat task.wait() until Character:FindFirstChild("Torso") and Character.Torso:FindFirstChild("Left Shoulder") and Character.Torso:FindFirstChild("Right Shoulder") and Torso:FindFirstChild("Right Hip") and Torso:FindFirstChild("Left Hip")

                    if not Character:FindFirstChild("Torso") then return end

                    local Torso = Character and Character:FindFirstChild("Torso")

                    local RHip = Torso and Torso:FindFirstChild("Right Hip")
                    local LHip = Torso and Torso:FindFirstChild("Left Hip")
                    local RShoulder = Torso and Torso:FindFirstChild("Right Shoulder")
                    local LShoulder = Torso and Torso:FindFirstChild("Left Shoulder")

                    Siren:Disable(RShoulder)
                    Siren:Disable(LShoulder)
                    Siren:Disable(RHip)
                    Siren:Disable(LHip)
                end))
            end
        end
    })

    Admin:AddCommand({
        Name = {"unlb", "unloopbean"},
        Rank = 2,
        Description = "Stops the loop bean on the player.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                Bean:Remove(Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"lrl", "looprightleg"},
        Rank = 2,
        Description = "Loop removes the player's right leg.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local Torso = Character and Character:FindFirstChild("Torso")
                
                local RHip = Torso and Torso:FindFirstChild("Right Hip")

                Siren:Disable(RHip)

                RLeg:Append(Player, Player.CharacterAdded:Connect(function(Character)
                    repeat task.wait() until Character:FindFirstChild("Torso") and Character.Torso:FindFirstChild("Right Hip")

                    if not Character:FindFirstChild("Torso") then return end

                    local Torso = Character and Character:FindFirstChild("Torso")

                    local RHip = Torso and Torso:FindFirstChild("Right Hip")

                    Siren:Disable(RHip)
                end))
            end
        end
    })

    Admin:AddCommand({
        Name = {"unlrl", "unlooprightleg"},
        Rank = 2,
        Description = "Stops the right leg loop on the player.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                RLeg:Remove(Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"lll", "loopleftleg"},
        Rank = 2,
        Description = "Loop removes the player's left leg.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local Torso = Character and Character:FindFirstChild("Torso")
                
                local LHip = Torso and Torso:FindFirstChild("Left Hip")

                Siren:Disable(LHip)

                LLeg:Append(Player, Player.CharacterAdded:Connect(function(Character)
                    repeat task.wait() until Character:FindFirstChild("Torso") and Character.Torso:FindFirstChild("Left Hip")

                    if not Character:FindFirstChild("Torso") then return end

                    local Torso = Character and Character:FindFirstChild("Torso")

                    local LHip = Torso and Torso:FindFirstChild("Left Hip")

                    Siren:Disable(LHip)
                end))
            end
        end
    })

    Admin:AddCommand({
        Name = {"unlll", "unloopleftleg"},
        Rank = 2,
        Description = "Stops the left leg loop on the player.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                LLeg:Remove(Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"lla", "loopleftarm"},
        Rank = 2,
        Description = "Loop removes the player's left arm.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local Torso = Character and Character:FindFirstChild("Torso")
                
                local LShoulder = Torso and Torso:FindFirstChild("Left Shoulder")

                Siren:Disable(LShoulder)

                LArm:Append(Player, Player.CharacterAdded:Connect(function(Character)
                    repeat task.wait() until Character:FindFirstChild("Torso") and Character.Torso:FindFirstChild("Left Shoulder")

                    if not Character:FindFirstChild("Torso") then return end

                    local Torso = Character and Character:FindFirstChild("Torso")

                    local LShoulder = Torso and Torso:FindFirstChild("Left Shoulder")

                    Siren:Disable(LShoulder)
                end))
            end
        end
    })

    Admin:AddCommand({
        Name = {"unlla", "unloopleftarm"},
        Rank = 2,
        Description = "Stops the left arm loop on the player.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                LArm:Remove(Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"lra", "looprightarm"},
        Rank = 2,
        Description = "Loop removes the player's right arm.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local Torso = Character and Character:FindFirstChild("Torso")
                
                local RShoulder = Torso and Torso:FindFirstChild("Right Shoulder")

                Siren:Disable(RShoulder)

                RArm:Append(Player, Player.CharacterAdded:Connect(function(Character)
                    repeat task.wait() until Character:FindFirstChild("Torso") and Character.Torso:FindFirstChild("Right Shoulder")

                    if not Character:FindFirstChild("Torso") then return end

                    local Torso = Character and Character:FindFirstChild("Torso")

                    local RShoulder = Torso and Torso:FindFirstChild("Right Shoulder")

                    Siren:Disable(RShoulder)
                end))
            end
        end
    })

    Admin:AddCommand({
        Name = {"unlla", "unlooprightarm"},
        Rank = 2,
        Description = "Stops the right arm loop on the player.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                RArm:Remove(Player)
            end
        end
    })

    Admin:AddCommand({
        Name = {"lr", "looproot"},
        Rank = 2,
        Description = "Loop removes the player's root joint.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                local Character = Player.Character
                local HRPart = Character and Character:FindFirstChild("HumanoidRootPart")
                
                local RootJoint = HRPart and HRPart:FindFirstChild("RootJoint")

                Siren:Disable(RootJoint)

                RJoint:Append(Player, Player.CharacterAdded:Connect(function(Character)
                    repeat task.wait() until Character:FindFirstChild("HumanoidRootPart") and Character.HumanoidRootPart:FindFirstChild("RootJoint")

                    if not Character:FindFirstChild("HumanoidRootPart") then return end

                    local HRPart = Character and Character:FindFirstChild("HumanoidRootPart")

                    local RootJoint = HRPart and HRPart:FindFirstChild("RootJoint")

                    Siren:Disable(RootJoint)
                end))
            end
        end
    })

    Admin:AddCommand({
        Name = {"unlr", "unlooproot"},
        Rank = 2,
        Description = "Stops the root joint loop on the player.",
        Function = function(plr, name)
            for _, Player in next, Admin.GetPlayers(plr, name) do
                RJoint:Remove(Player)
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

    -- Admin:AddCommand({
    --     Name = {""},
    --     Rank = 1,
    --     Description = "Stop players from regenerating health."
    -- })

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