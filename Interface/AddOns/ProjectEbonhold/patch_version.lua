-- =======================================================
-- PROJECT EBONHOLD - DETECTOR DE ACTUALIZACIÓN DEL PARCHE
-- =======================================================
EBONHOLD_PATCH_VERSION = 20260904 -- GitHub Actions actualiza este numero solo
local GITHUB_REPO_URL = "https://github.com/TU_USUARIO/TU_REPOSITORIO/releases/latest"

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("CHAT_MSG_ADDON")

f:SetScript("OnEvent", function(self, event, prefix, msg)
    if event == "PLAYER_ENTERING_WORLD" then
        -- Anunciar nuestra versión por canales ocultos
        SendAddonMessage("EBON_PATCH_VER", tostring(EBONHOLD_PATCH_VERSION), "GUILD")
        SendAddonMessage("EBON_PATCH_VER", tostring(EBONHOLD_PATCH_VERSION), "ZONE")
        
    elseif event == "CHAT_MSG_ADDON" and prefix == "EBON_PATCH_VER" then
        local versionRemota = tonumber(msg)
        if versionRemota and versionRemota > EBONHOLD_PATCH_VERSION then
            -- Guardamos en la memoria global para que la pantalla de selección lo sepa
            EBON_LATEST_SEEN_VERSION = versionRemota
            
            if not self.notificado then
                self.notificado = true
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Parche en Español]|r |cffffcc00¡Nueva versión detectada (v" .. versionRemota .. ")!|r")
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Parche en Español]|r Puedes descargarla en: |cff3399ff" .. GITHUB_REPO_URL .. "|r")
            end
        end
    end
end)