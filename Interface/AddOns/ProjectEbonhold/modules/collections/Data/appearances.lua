--[[----------------------------------------------------------------------------
    Appearance catalog — folds the generated flat item list (appearances_data.lua)
    into the per-category / per-visual structure the wardrobe browser reads.

      visual  = item displayID          (what the server's collection tracks)
      source  = itemID                  (a concrete item with that appearance)
      category= LE_TRANSMOG_COLLECTION_TYPE_* (Constants.lua)

    Builds ezCollections.AppearanceCatalog:
      [categoryID] = {
        order   = { displayID, ... },              -- stable display order
        sources = { [displayID] = { itemID, ... } },
      }
    plus reverse lookup ezCollections.SourceInfo[itemID] = { visual=displayID,
    category=catID, quality=q }.

    Load order: after core/stub.lua and data/appearances_data.lua.
------------------------------------------------------------------------------]]

local ez = _G.ezCollections
local flat = (_G.Ebonhold and _G.Ebonhold.AppearanceFlat) or {}

-- (class, subclass, invType) -> categoryID. Armor keys on invType; weapons on subclass.
local INVTYPE_TO_ARMOR_CAT = {
    [1]  = LE_TRANSMOG_COLLECTION_TYPE_HEAD,
    [3]  = LE_TRANSMOG_COLLECTION_TYPE_SHOULDER,
    [16] = LE_TRANSMOG_COLLECTION_TYPE_BACK,
    [5]  = LE_TRANSMOG_COLLECTION_TYPE_CHEST,
    [20] = LE_TRANSMOG_COLLECTION_TYPE_CHEST,   -- robe
    [19] = LE_TRANSMOG_COLLECTION_TYPE_TABARD,
    [4]  = LE_TRANSMOG_COLLECTION_TYPE_SHIRT,
    [9]  = LE_TRANSMOG_COLLECTION_TYPE_WRIST,
    [10] = LE_TRANSMOG_COLLECTION_TYPE_HANDS,
    [6]  = LE_TRANSMOG_COLLECTION_TYPE_WAIST,
    [7]  = LE_TRANSMOG_COLLECTION_TYPE_LEGS,
    [8]  = LE_TRANSMOG_COLLECTION_TYPE_FEET,
    [23] = LE_TRANSMOG_COLLECTION_TYPE_HOLDABLE,
}
local WEAPON_SUBCLASS_TO_CAT = {
    [0]  = LE_TRANSMOG_COLLECTION_TYPE_1H_AXE,
    [1]  = LE_TRANSMOG_COLLECTION_TYPE_2H_AXE,
    [2]  = LE_TRANSMOG_COLLECTION_TYPE_BOW,
    [3]  = LE_TRANSMOG_COLLECTION_TYPE_GUN,
    [4]  = LE_TRANSMOG_COLLECTION_TYPE_1H_MACE,
    [5]  = LE_TRANSMOG_COLLECTION_TYPE_2H_MACE,
    [6]  = LE_TRANSMOG_COLLECTION_TYPE_POLEARM,
    [7]  = LE_TRANSMOG_COLLECTION_TYPE_1H_SWORD,
    [8]  = LE_TRANSMOG_COLLECTION_TYPE_2H_SWORD,
    [10] = LE_TRANSMOG_COLLECTION_TYPE_STAFF,
    [13] = LE_TRANSMOG_COLLECTION_TYPE_FIST,
    [15] = LE_TRANSMOG_COLLECTION_TYPE_DAGGER,
    [16] = LE_TRANSMOG_COLLECTION_TYPE_THROWN,
    [18] = LE_TRANSMOG_COLLECTION_TYPE_CROSSBOW,
    [19] = LE_TRANSMOG_COLLECTION_TYPE_WAND,
    [20] = LE_TRANSMOG_COLLECTION_TYPE_FISHING_POLE,
}

local ITEM_CLASS_WEAPON, ITEM_CLASS_ARMOR = 2, 4
local ARMOR_SUBCLASS_SHIELD = 6

local function CategoryFor(itemClass, subClass, invType)
    if itemClass == ITEM_CLASS_ARMOR then
        if subClass == ARMOR_SUBCLASS_SHIELD then return LE_TRANSMOG_COLLECTION_TYPE_SHIELD end
        return INVTYPE_TO_ARMOR_CAT[invType]
    elseif itemClass == ITEM_CLASS_WEAPON then
        return WEAPON_SUBCLASS_TO_CAT[subClass]
    end
end

--=============================================================================
-- Category metadata (for C_TransmogCollection.GetCategoryInfo)
--   { name, isWeapon, invType, canMainHand, canOffHand, canRanged }
--=============================================================================
local T = LE_TRANSMOG_COLLECTION_TYPE_HEAD -- shorthand base is fine; use explicit ids below
local M = {}
local function meta(id, name, isWeapon, invType, mh, oh, ranged)
    M[id] = { name = name, isWeapon = isWeapon, invType = invType,
              canMainHand = mh, canOffHand = oh, canRanged = ranged }
end
meta(LE_TRANSMOG_COLLECTION_TYPE_HEAD,     "Cabeza",      false, 1)
meta(LE_TRANSMOG_COLLECTION_TYPE_SHOULDER, "Hombros", false, 3)
meta(LE_TRANSMOG_COLLECTION_TYPE_BACK,     "Volver",      false, 16)
meta(LE_TRANSMOG_COLLECTION_TYPE_CHEST,    "Pecho",     false, 5)
meta(LE_TRANSMOG_COLLECTION_TYPE_TABARD,   "Tabardo",    false, 19)
meta(LE_TRANSMOG_COLLECTION_TYPE_SHIRT,    "Camisa",     false, 4)
meta(LE_TRANSMOG_COLLECTION_TYPE_WRIST,    "Muñeca",     false, 9)
meta(LE_TRANSMOG_COLLECTION_TYPE_HANDS,    "Manos",     false, 10)
meta(LE_TRANSMOG_COLLECTION_TYPE_WAIST,    "Cintura",     false, 6)
meta(LE_TRANSMOG_COLLECTION_TYPE_LEGS,     "Piernas",      false, 7)
meta(LE_TRANSMOG_COLLECTION_TYPE_FEET,     "Pies",      false, 8)
meta(LE_TRANSMOG_COLLECTION_TYPE_WAND,     "Varitas",      true,  26, false, false, true)
meta(LE_TRANSMOG_COLLECTION_TYPE_1H_AXE,   "Hachas de una mano",   true, 13, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_1H_SWORD, "Espadas de una mano", true, 13, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_1H_MACE,  "Mazas de una mano",  true, 13, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_DAGGER,   "Dagas",   true, 13, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_FIST,     "Armas de puño", true, 13, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_SHIELD,   "Escudos",   true, 14, false, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_HOLDABLE, "Sostenido en mano izquierda", true, 23, false, true, false)
-- Two-handers are off-hand capable here on purpose: the off-hand slot accepts any
-- melee look (shield or weapon equipped, see IsCategoryValidForItem), and the client
-- attaches a 2H display to the left hand exactly like Titan's Grip does.
meta(LE_TRANSMOG_COLLECTION_TYPE_2H_AXE,   "Hachas de dos manos",   true, 17, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_2H_SWORD, "Espadas de dos manos", true, 17, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_2H_MACE,  "Mazas de dos manos",  true, 17, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_STAFF,    "Bastones",    true, 17, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_POLEARM,  "Armas de asta",  true, 17, true, true, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_BOW,      "Arcos",      true, 15, false, false, true)
meta(LE_TRANSMOG_COLLECTION_TYPE_GUN,      "Armas de fuego",      true, 26, false, false, true)
meta(LE_TRANSMOG_COLLECTION_TYPE_CROSSBOW, "Ballestas", true, 26, false, false, true)
meta(LE_TRANSMOG_COLLECTION_TYPE_THROWN,   "Arrojadizas",    true, 25, true, false, false)
meta(LE_TRANSMOG_COLLECTION_TYPE_FISHING_POLE, "Cañas de pescar", true, 17, true, false, false)
ez.AppearanceCategoryMeta = M

--=============================================================================
-- Fold the flat list.
--
-- A "visual" (appearance) groups all items that share a displayID, and is
-- IDENTIFIED to the UI by a representative itemID (the wardrobe treats visualID
-- as an item — GetItemInfo(visualID), invType, model TryOn). The visual's
-- collected state is keyed on its displayID (what the server tracks).
--=============================================================================
local catalog       = {}  -- [cat] = { order = {repItemID,...}, sourcesOf = {[rep]={itemID,...}} }
local sourceInfo    = {}  -- [itemID] = { visual = repItemID, display = displayID, category = cat, quality }
local visualDisplay = {}  -- [repItemID] = displayID   (for collected checks)

do
    -- 1) group items by (category, displayID); pick a representative per visual
    local group = {}  -- [cat] = { [displayID] = { items = {}, bestQ = -1, rep = nil } }
    local i, n = 1, #flat
    while i + 5 <= n do
        local itemID, displayID, quality = flat[i], flat[i+1], flat[i+2]
        local iClass, iSub, invType      = flat[i+3], flat[i+4], flat[i+5]
        i = i + 6

        local cat = CategoryFor(iClass, iSub, invType)
        if cat then
            local g = group[cat]; if not g then g = {}; group[cat] = g end
            local d = g[displayID]
            if not d then d = { items = {}, bestQ = -1, rep = nil }; g[displayID] = d end
            d.items[#d.items + 1] = itemID
            -- representative = highest quality, then lowest itemID (a "clean" example)
            if quality > d.bestQ or (quality == d.bestQ and (not d.rep or itemID < d.rep)) then
                d.bestQ, d.rep = quality, itemID
            end
            sourceInfo[itemID] = { display = displayID, category = cat, quality = quality, subclass = iSub, class = iClass }
        end
    end

    -- 2) build ordered per-category catalog keyed by the representative itemID
    for cat, g in pairs(group) do
        local displays = {}
        for displayID in pairs(g) do displays[#displays + 1] = displayID end
        table.sort(displays)

        local c = { order = {}, sourcesOf = {} }
        for _, displayID in ipairs(displays) do
            local d   = g[displayID]
            local rep = d.rep
            c.order[#c.order + 1] = rep
            c.sourcesOf[rep]      = d.items
            visualDisplay[rep]    = displayID
            for _, item in ipairs(d.items) do sourceInfo[item].visual = rep end
        end
        catalog[cat] = c
    end
end

ez.AppearanceCatalog = catalog
ez.SourceInfo        = sourceInfo

-- Free the flat blob; the folded catalog is the working copy.
if _G.Ebonhold then _G.Ebonhold.AppearanceFlat = nil end

--=============================================================================
-- Accessors used by the C_TransmogCollection backing
--=============================================================================
function ez:GetCategoryVisuals(categoryID)                 -- ordered list of representative itemIDs
    local c = catalog[categoryID]
    return c and c.order or nil
end
function ez:GetVisualSourceItems(visualID)                 -- source itemIDs sharing this visual's display
    local info = sourceInfo[visualID]
    if not info then return nil end
    local c = catalog[info.category]
    return c and c.sourcesOf[visualID] or nil
end
function ez:GetAppearanceSourceRow(itemID)                 -- { visual, display, category, quality }
    return sourceInfo[itemID]
end
function ez:GetVisualDisplayID(visualID)
    return visualDisplay[visualID]
end
function ez:IsVisualCollected(visualID)
    -- The server collects by ITEM ID: transmogrification_appearances stores item
    -- entries (the transmog NPC does GetItemTemplate(appearance)). A visual (one
    -- displayID, one representative) is collected iff ANY source item sharing its
    -- appearance has been collected server-side.
    local collected = ez.Collections.Appearances
    if collected[visualID] then return true end          -- fast path: the representative itself
    local info = sourceInfo[visualID]
    local c = info and catalog[info.category]
    local sources = c and c.sourcesOf[visualID]
    if sources then
        for i = 1, #sources do
            if collected[sources[i]] then return true end
        end
    end
    return false
end
function ez:GetCategoryMeta(categoryID)
    return M[categoryID]
end
