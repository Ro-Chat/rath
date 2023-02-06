local HttpService = game:GetService("HttpService")

local Theme = {}

if not isfile("Rath/UI/Layout.json") or not isfolder("Rath/UI") or not isfolder("Rath") then
    if not isfolder("Rath") then makefolder("Rath") end
    if not isfolder("Rath/UI") then makefolder("Rath/UI") end
    if not isfolder("Rath/UI/Assets") then makefolder("Rath/UI/Assets") end
    if not isfile("Rath/UI/Layout.json") then
        Theme = {
            CommandBar = {
                HotKey = ",",
                Colors = {
                    Background = {
                        Idle = {61, 61, 61},
                        Hover = {61, 61, 61}
                    },
                    ButtonSelection = {
                        Idle = {43, 43, 43},
                        Hover = {43, 43, 43}
                    },
                    Accent = {
                        Idle = {240, 140, 26},
                        Hover = {240, 140, 26}
                    }
                },
                Home = {
                    Image = false,
                    Colors = {
                        Idle = {77, 77, 77},
                        Hover = {77, 77, 77}
                    }
                },
                Code = {
                    Image = false,
                    Colors = {
                        Idle = {77, 77, 77},
                        Hover = {77, 77, 77}
                    }
                }
            }
        }
        writefile("Rath/UI/Layout.json", HttpService:JSONEncode(Theme))
    else
        Theme = HttpService:JSONDecode(readfile("Rath/UI/Layout.json"))
    end
else
    Theme = HttpService:JSONDecode(readfile("Rath/UI/Layout.json"))
end

return Theme