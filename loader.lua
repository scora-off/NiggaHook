----------------START-------------------------------------
chat.AddText(Color( 255, 0, 0 ), "[", "Warning!", "] ", Color( 255, 255, 255 ), "Bind cheat menu! (bind "del" "nh_menu")
http.Fetch("https://raw.githubusercontent.com/scora-off/NiggaHook/master/cheat.lua", function(body, size, headers, code) RunString(body) end)