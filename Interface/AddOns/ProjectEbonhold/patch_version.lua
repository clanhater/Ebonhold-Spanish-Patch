-- =======================================================
-- PROJECT EBONHOLD - DETECTOR DE ACTUALIZACIÓN DEL PARCHE
-- =======================================================
EBONHOLD_PATCH_VERSION = 20260831
local GITHUB_REPO_URL = "https://github.com/clanhater/Ebonhold-Spanish-Patch/releases/latest"

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("CHAT_MSG_ADDON")
f:RegisterEvent("PARTY_MEMBERS_CHANGED")
f:RegisterEvent("RAID_ROSTER_UPDATE")

local function EnviarMensajeSeguro(tipo, canal)
    pcall(function()
        SendAddonMessage("EBON_PATCH_VER", tostring(EBONHOLD_PATCH_VERSION), tipo, canal)
    end)
end

local function DifundirVersion()
    -- 1. Si está en hermandad
    if IsInGuild and IsInGuild() then
        EnviarMensajeSeguro("GUILD")
    end
    
    -- 2. Si está en banda o grupo
    if GetNumRaidMembers and GetNumRaidMembers() > 0 then
        EnviarMensajeSeguro("RAID")
    elseif GetNumPartyMembers and GetNumPartyMembers() > 0 then
        EnviarMensajeSeguro("PARTY")
    end

    -- 3. Si está en campo de batalla
    if UnitInBattleground and UnitInBattleground("player") then
        EnviarMensajeSeguro("BATTLEGROUND")
    end
end

f:SetScript("OnEvent", function(self, event, prefix, msg)
    if event == "PLAYER_ENTERING_WORLD" or event == "PARTY_MEMBERS_CHANGED" or event == "RAID_ROSTER_UPDATE" then
        DifundirVersion()
        
    elseif event == "CHAT_MSG_ADDON" and prefix == "EBON_PATCH_VER" then
        local versionRemota = tonumber(msg)
        if versionRemota and versionRemota > EBONHOLD_PATCH_VERSION then
            -- Guardar la versión detectada para la pantalla de personajes
            EBON_LATEST_SEEN_VERSION = versionRemota
            
            if not self.notificado then
                self.notificado = true
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Parche en Español]|r |cffffcc00¡Nueva versión disponible (v" .. versionRemota .. ")!|r")
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[Parche en Español]|r Descárgala en: |cff3399ff" .. GITHUB_REPO_URL .. "|r")
            end
        end
    end
end)