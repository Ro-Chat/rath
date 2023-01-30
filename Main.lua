
--- For debugging put this script inside your executor instead of the loadstring.

local Status, Release = pcall(function() return debug.getinfo(4) end)
Release = Status and Release

local Script = not Release and readfile("Rath/Init.lua") or game:HttpGet("https://raw.githubusercontent.com/Ro-Chat/rath/main/Init.lua")

loadstring(Script)()(Release)
