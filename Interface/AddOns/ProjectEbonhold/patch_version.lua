-- Guardar en variables globales del juego
EBON_LOCAL_VERSION = 20260904

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("CHAT_MSG_ADDON")

f:SetScript("OnEvent", function(self, event, prefix, msg)
    if event == "PLAYER_ENTERING_WORLD" then
        -- Anunciar nuestra versión por canales ocultos
        SendAddonMessage("EBON_PATCH_VER", tostring(EBON_LOCAL_VERSION), "GUILD")
        SendAddonMessage("EBON_PATCH_VER", tostring(EBON_LOCAL_VERSION), "ZONE")
        
    elseif event == "CHAT_MSG_ADDON" and prefix == "EBON_PATCH_VER" then
        local versionRemota = tonumber(msg)
        if versionRemota and versionRemota > EBON_LOCAL_VERSION then
            -- Guardamos en la memoria global para que la pantalla de selección lo sepa
            EBON_LATEST_SEEN_VERSION = versionRemota
            
            if not self.notificado then
                self.notificado = true
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Parche en Español]|r |cffffcc00¡Nueva versión detectada (v" .. versionRemota .. ")!|r Podrás actualizarla desde la pantalla de personajes o en GitHub.")
            end
        end
    end
end)