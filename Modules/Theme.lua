local HttpService = game:GetService("HttpService")

local Theme = {}

if not isfile("rath/UI/Layout.json") or not isfolder("rath/UI") or not isfolder("rath") then
    if not isfolder("rath") then makefolder("rath") end
    if not isfolder("rath/UI") then makefolder("rath/UI") end
    if not isfolder("rath/UI/Assets") then makefolder("rath/UI/Assets") end
    if not isfile("rath/UI/Layout.json") then
        Theme = {
            Axiom = {
                Images = {
                    TabIcons = {
                        Server = false,
                        Client = false,
                        Visuals = false,
                        Default = false
                    }
                }
            },
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
        writefile("rath/UI/Layout.json", HttpService:JSONEncode(Theme))
    else
        Theme = HttpService:JSONDecode(readfile("rath/UI/Layout.json"))
    end
else
    Theme = HttpService:JSONDecode(readfile("rath/UI/Layout.json"))
end

return Theme