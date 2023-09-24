if game.PlaceId ~= 2788229376 then
    game:GetService("Players").LocalPlayer:Kick("ERROR: Script only works inside of Da Hood.")
    task.wait(3)
    game:Shutdown()
elseif game.PlaceId == 2788229376 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/15rih/Cytox-Seller-Gui/main/source.lua"))()
end
