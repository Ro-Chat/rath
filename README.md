# Rath
The toggleSiren remote was patched.
# Commands

The prefix is `;`

* help | cmds | cmd ?command
* commandwhitelist | cw | givecommand player, command
* gunban | gb player
* ungunban | ungb player
* status | stat player, status
* rejoin | rj
* prefix prefix
* rank plr rank
* kill | k player
* loopkill | lk player
* oneshot | os player
* unoneshot | unos player
* stungun | sg player
* unstungun | unsg player
* corruptcop | cc player
* uncorruptcop | uncc player
* innocentshot | is player
* uninnocentshot | unis player
* loopbean | lb player
* looproot | lr player
* looprightleg | lrl player
* loopleftleg | lll player
* loopleftarm | lla player
* looprightarm | lra player
* unloopbean | unlb player
* unlooproot | unlr player
* unlooprightleg | unlrl player
* unloopleftleg | unlll player
* unloopleftarm | unlla player
* unlooprightarm | unlra player
* rlegs | nolegs player
* rarms | noarms player
* rroot | noroot player
* rlimbs | nolimbs player
* rhat | nohat player
* uncar | breakcar | bc | unc player

# Siren Library Usage

Using the Siren Library you can disable and enable anything that has the property `Enabled`, play Sounds, and toggle BoolValues.

### List of instances that have the `Enabled` property
* ScreenGui
* SurfaceGui
* BillboardGui
* ImageButton
* UIStroke
* UIGradient
* ChatWindowConfiguration
* ChatInputBarConfiguration
* BubbleChatConfiguration
* ProximityPromptService
* PointLight
* SpawnLocation
* Script
* LocalScript
* CoreScript
* SurfaceLight
* ManualWeld
* Snap
* Weld
* RotateV
* Motor6D

### Siren Library Example

```lua
local Siren = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ro-Chat/rath/main/Modules/Siren.lua"))()

local LocalPlayer = game:GetService("Players").LocalPlayer

local Status = LocalPlayer.Status
local Character = LocalPlayer.Character

local Head = Character and Character.Head
local Torso = Character and Character.Torso

local PunchSound = Head and Head.punchSound
local isHostile = Status and Status.isHostile
local NeckWeld = Torso and Torso.Neck

--- Disable 
Siren:Disable(NeckWeld)

--- Enable
Siren:Enable(NeckWeld)

--- Play
Siren:Play(PunchSound)

--- Stop
Siren:Stop(PunchSound)

--- Set BooleanValue
Siren:Bool(isHostile, true)
```
