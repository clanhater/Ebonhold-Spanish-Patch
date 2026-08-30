local addon, Addon = ...

Addon.ShopEntries = {}

-- Client-side localization data for shop items
local SHOP_ITEM_LOCALIZATION = {
    ["en"] = {
        [1] = {
            name = "Pergamino de jinete aprendiz",
            description = "Te enseña a montar monturas terrestres con un 60% de velocidad. Requiere nivel 20.",
            icon = "inv_misc_scrollrolled01b"
        },
        [2] = {
            name = "Pergamino de jinete oficial",
            description = "Te enseña a montar monturas terrestres con un 100% de velocidad. Requiere nivel 40 y \"Jinete aprendiz\".",
            icon = "inv_misc_scrollrolled01d"
        },
        [3] = {
            name = "Pergamino de jinete experto",
            description = "Te enseña a montar todas las monturas voladoras con un 150% de velocidad. Requiere nivel 60 y \"Jinete oficial\".",
            icon = "inv_misc_scrollrolled02d"
        },
        [4] = {
            name = "Pergamino de jinete artesano",
            description = "Te enseña a montar todas las monturas voladoras con un 280% de velocidad. Requiere nivel 70 y \"Jinete experto\".",
            icon = "inv_misc_scrollrolled02b"
        },
        [5] = {
            name = "Pergamino de vuelo en clima frío",
            description = "Te enseña a montar todas las monturas voladoras en Rasganorte. Requiere nivel 77 y \"Jinete experto\".",
            icon = "inv_misc_scrollrolled03d"
        },
        [6] = {
            name = "Pergamino de personalización",
            description = "Te permite personalizar a tu personaje una vez (cambiar color, cabello, ...).",
            icon = "inv_misc_scrollunrolled01"
        },
        [7] = {
            name = "Pergamino de cambio de facción",
            description = "Te permite cambiar la facción de tu personaje.",
            icon = "inv_misc_scrollunrolled01b"
        },
        [8] = {
            name = "Pergamino de cambio de raza",
            description = "Te permite cambiar la raza de tu personaje.",
            icon = "inv_misc_scrollunrolled02b"
        }
    },
    ["fr"] = {
        [1] = {
            name = "Pergamino de jinete aprendiz",
            description = "Te enseña a utilizar monturas terrestres (60%). Requiere nivel 20.",
            icon = "inv_misc_scrollrolled01b"
        },
        [2] = {
            name = "Pergamino de jinete oficial",
            description = "Te enseña a utilizar monturas terrestres (100%). Requiere nivel 40 y \"Jinete aprendiz\".",
            icon = "inv_misc_scrollrolled01d"
        },
        [3] = {
            name = "Pergamino de jinete experto",
            description = "Te enseña a utilizar monturas voladoras (150%). Requiere nivel 60 y \"Jinete oficial\".",
            icon = "inv_misc_scrollrolled02d"
        },
        [4] = {
            name = "Pergamino de jinete artesano",
            description = "Te enseña a utilizar monturas voladoras (280%). Requiere nivel 70 y \"Jinete experto\".",
            icon = "inv_misc_scrollrolled02b"
        },
        [5] = {
            name = "Pergamino de vuelo en clima frío",
            description = "Te enseña a utilizar monturas voladoras en Rasganorte. Requiere nivel 77 y \"Jinete experto\".",
            icon = "inv_misc_scrollrolled03d"
        },
        [6] = {
            name = "Pergamino de personalización",
            description = "Te permite personalizar a tu personaje una sola vez (cambio de color, cabello, ...).",
            icon = "inv_misc_scrollunrolled01"
        },
        [7] = {
            name = "Pergamino de cambio de facción",
            description = "Te permite cambiar la facción de tu personaje.",
            icon = "inv_misc_scrollunrolled01b"
        },
        [8] = {
            name = "Pergamino de cambio de raza",
            description = "Te permite cambiar la raza de tu personaje.",
            icon = "inv_misc_scrollunrolled02b"
        }
    }
}

-- Auto-detect language based on game locale
local function getGameLanguage()
    local locale = GetLocale()
    if locale == "frFR" then
        return "fr"
    else
        return "en" -- Default to English for all other locales
    end
end

-- Current language (auto-detected)
local currentLanguage = getGameLanguage()

-- Function to get localized data for a shop item
local function getLocalizedItemData(itemId, language)
    language = language or currentLanguage
    local langData = SHOP_ITEM_LOCALIZATION[language]
    if not langData then
        langData = SHOP_ITEM_LOCALIZATION["en"] -- fallback to English
    end
    
    local itemData = langData[itemId]
    if not itemData then
        -- Fallback to English if not found in current language
        if language ~= "en" then
            local enData = SHOP_ITEM_LOCALIZATION["en"]
            itemData = enData and enData[itemId]
        end
    end
    
    return itemData or {
        name = "Objeto desconocido #" .. tostring(itemId),
        description = "No hay descripción disponible para este objeto.",
        icon = "INV_Misc_QuestionMark"
    }
end

local function splitData(texte)
    local champs = {}
    for champ in string.gmatch(texte, "([^#]+)") do
        table.insert(champs, champ)
    end
    return champs
end

local function parseData(texte)
    local data = splitData(texte)
    local obj = {};
    
    -- Determine if it's an item or mount based on creatureId (data[4])
    local isMount = data[4] ~= "NULL"
    
    -- Get localized data for this item
    local localizedData = getLocalizedItemData(tonumber(data[1]))
    
    -- Handle NULL category_id - put in Miscellaneous (ID 12)
    local categoryId = data[2] ~= "NULL" and tonumber(data[2]) or 12
    
    -- Parse common fields (note: no icon field in data anymore)
    obj = {
        id                = tonumber(data[1]),
        category_id       = categoryId,
        item_id           = tonumber(data[3]),
        creatureId        = data[4] ~= "NULL" and tonumber(data[4]) or nil,
        price             = tonumber(data[5]),
        discountActive    = data[6] == "1",
        discount          = data[7] ~= "NULL" and tonumber(data[7]) or nil,
        end_time_discount = data[8] ~= "NULL" and tonumber(data[8]) or nil,
        
        -- Localized fields (including icon)
        name              = localizedData.name,
        extraInfo         = localizedData.description,
        icon              = localizedData.icon,
        
        -- Legacy fields for compatibility
        client_line_type  = isMount and 1 or 0,
        entry_type        = isMount and 1 or 0,
        item_count        = 1, -- Default value
        featured          = 0, -- Default value
        subcategory_id    = isMount and 0 or (categoryId ~= 12 and categoryId or 1),
    }
    
    return obj;
end

-- Register event handlers for the new communication system
ProjectEbonhold.onEventReceived(ProjectEbonhold.SS.SEND_SHOP_DATA, function(body)
    Addon.ShopEntries = {};
    
    -- Split entries by "---" separator
    local entries = {}
    for entry in string.gmatch(body, "([^%-%-%-]+)") do
        if entry and string.len(string.gsub(entry, "%s", "")) > 0 then -- Skip empty entries
            table.insert(entries, entry)
        end
    end
    
    -- Parse each entry
    for _, value in ipairs(entries) do
        local entry = parseData(value)
        tinsert(Addon.ShopEntries, entry);
    end
    
    -- Make shop entries globally accessible for debugging
    ProjectEbonhold.ShopEntries = Addon.ShopEntries
end)

ProjectEbonhold.onEventReceived(ProjectEbonhold.SS.SEND_ACCOUNT_DP, function(body)
    local dp = tonumber(body)
    if dp then
        ModernShopDPSetAmount(dp)
    end
end)

-- Language management functions (now auto-detected)
function Addon.GetShopLanguage()
    return currentLanguage
end

function Addon.GetDetectedLocale()
    return GetLocale()
end

-- Make language functions globally accessible
ProjectEbonhold.GetShopLanguage = Addon.GetShopLanguage
ProjectEbonhold.GetDetectedLocale = Addon.GetDetectedLocale
