ProjectEbonhold = ProjectEbonhold or {}

LFD_RANDOM_REWARD_EXPLANATION1 = "Las primeras 3 mazmorras aleatorias que completes cada día te otorgarán:"
    
ProjectEbonhold.ActionTypes = {
    INSTANCE_RESET = 1,
}

ProjectEbonhold.InstanceResetConfig = {
    BASE_COST = 50000,
    COST_MULTIPLIER = 5,
}

ProjectEbonhold.Constants = {
    MAX_INTENSITY = 475,
    MAX_SOUL_ASHES = 428303860,
    -- Committed Soul Ashes required to unlock a prestige (display value;
    -- must mirror PrestigeHandler::PRESTIGE_GATE_SOUL_ASHES server-side)
    PRESTIGE_GATE_SOUL_ASHES = 10771440,
    -- Permanent Soul Ash gain granted by a prestige. It is PROPORTIONAL to the
    -- committed pool the reset destroys, counted in "gate worths": prestiging
    -- the moment the gate opens burns one and grants the full base rate,
    -- banking ten gate worths grants ten times that. A flat rate punished
    -- banking, so a player sitting on 400M lost everything for the same +3%
    -- as one resetting at the gate.
    --
    --   gateWorths = min(destroyed, CAP) / PRESTIGE_GATE_SOUL_ASHES
    --   bonus      = PRESTIGE_SOUL_ASH_GAIN_PER_PRESTIGE
    --                * gateWorths ^ PRESTIGE_SOUL_ASH_BONUS_EXPONENT
    --
    -- The rate is the SAME at every prestige number: the milestone track ends
    -- at 75, the Soul Ash gain does not.
    --
    -- Above the gate the curve DIMINISHES: banking 37 gate worths (the 400M
    -- cap) pays about 6 times the base rate, not 37, so hoarding stays worth
    -- it without ever being the only sane play.
    --
    -- Past the cap the reset still destroys everything, it just stops buying
    -- more. Must mirror PrestigeHandler::ComputeSoulAshBonusPct EXACTLY
    -- (server side), or the preview lies about what the reset buys.
    PRESTIGE_SOUL_ASH_GAIN_PER_PRESTIGE = 0.20,
    PRESTIGE_SOUL_ASH_BONUS_MAX_DESTROYED = 400000000,
    -- Curve of the diminishing returns: 1.0 = linear, 0.5 = square root.
    -- Must equal PrestigeHandler::PRESTIGE_BONUS_EXPONENT server side.
    PRESTIGE_SOUL_ASH_BONUS_EXPONENT = 0.5,
    -- Absolute ceiling on the TOTAL Soul Ash bonus an account can hold from prestiging
    -- (15.0 = +1500%). Enforced SERVER-side in SoulPointsHandler::GetAccountSoulPointsMultiplier,
    -- which subtracts everything above PrestigeHandler::PRESTIGE_BONUS_MAX_TOTAL before any
    -- reward is computed; mirrored here only so the preview never promises past it.
    PRESTIGE_SOUL_ASH_BONUS_MAX_TOTAL = 100.0,
    -- Intensity Levels
    INTENSITY_LEVEL_1 = 75,
    INTENSITY_LEVEL_2 = 200,
    INTENSITY_LEVEL_3 = 275,
    INTENSITY_LEVEL_4 = 400,
    INTENSITY_LEVEL_5 = 475,
    ENABLE_BANISH_SYSTEM = true,
    -- Transmog
    TRANSMOG_DEBUG_ENABLED = false,
    OUTFIT_DEBUG_ENABLED = false,
}

ProjectEbonhold.IntensityEffects = {
    {
        name = "Intensidad I",
        icon = "Interface\\Icons\\spell_nzinsanity_chasedbyshadows",
        description =
        "Ganancia de Ceniza de alma aumentada un 20%.\n\nLa oscuridad se inquieta. Surgen criaturas corruptas, con sus golpes imbuidos de energía de las Sombras. Estos seres retorcidos son más fuertes, más resistentes e infligen daño de las Sombras con sus golpes.",
    },
    {
        name = "Intensidad II",
        icon = "Interface\\Icons\\spell_shadow_twistedfaith",
        description =
            "Ganancia de Ceniza de alma aumentada un 30%.\n\nLa mirada del Rey Exánime cae sobre ti. Periódicamente, una abrasadora marca de las Sombras quema el suelo bajo tus pies, " ..
            "infligiendo un 5% de tu salud máxima como daño tras 3 segundos, y luego detona infligiendo daño de las Sombras; los afectados sufren más daño de las Sombras recibido.",
    },
    {
        name = "Intensidad III",
        icon = "Interface\\Icons\\achievement_boss_lichking",
        description =
        "Ganancia de Ceniza de alma aumentada un 40%.\n\nLas marcas de las Sombras se vuelven más volátiles. Ahora hasta 3 más pueden quemar el suelo simultáneamente en ubicaciones aleatorias, y su energía oscura se filtra en las criaturas cercanas, sanándolas.",
    },
    {
        name = "Intensidad IV",
        icon = "Interface\\Icons\\spell_shadow_unstableaffliction_3",
        description =
        "Ganancia de Ceniza de alma aumentada un 50%.\n\nEl Rey Exánime desata periódicamente a sus Campeones",
    },
    {
        name = "Intensidad V",
        icon = "Interface\\Icons\\spell_shadow_deathscream",
        description =
        "Si sobrevives durante 10 minutos, el Rey Exánime enviará al Segador a por ti.",
    }
}

ProjectEbonhold.SoulAshesMilestones = {
    { soulAshes = 1000000, spellID = 101259 },
    { soulAshes = 2000000, spellID = 101260 },
    { soulAshes = 25000000, spellID = 101261 },
    { soulAshes = 100000000, spellID = 101262 },
    { soulAshes = 215000000, spellID = 101263 }
}

--- Committed Soul Ashes required to run a Hardcore difficulty tier, keyed by difficulty tier.
--- Tier 1 is Normal and is never gated; tier N (>= 2) is Hardcore N-1.
---
--- NOT derived from the Soul Ashes milestones above: the two are unrelated, and reading the
--- milestones gave gates up to three times too high. Written out in full for that reason.
---
--- CLIENT-SIDE ONLY, for rendering the lock state. The rule that actually applies is the
--- server's Ashendor.Hardmode.SoulAshGates (HardmodeMgr::MeetsSoulAshGate), which is
--- re-checked on every difficulty-switch path; the two MUST be retuned together, exactly
--- like PRESTIGE_GATE_SOUL_ASHES mirrors PrestigeHandler::PRESTIGE_GATE_SOUL_ASHES.
ProjectEbonhold.HARDCORE_SOUL_ASH_GATES = {
    -- EMPTY: no tier costs Soul Ashes anymore. Hardcore access is gated by the "Ahead of the
    -- Curve" achievements alone (HARDCORE_ACHIEVEMENT_GATES below). Kept as a table because a
    -- realm can put a floor back from config (Ashendor.Hardmode.SoulAshGates) - mirror it here
    -- if that ever happens, or the UI will advertise a tier the server refuses.
}

---@param tier number difficulty tier (1 = Normal)
---@return number committed Soul Ashes required, 0 when the tier has no requirement
ProjectEbonhold.GetHardcoreSoulAshGate = function(tier)
    tier = tonumber(tier) or 1
    if tier < 2 then return 0 end

    return ProjectEbonhold.HARDCORE_SOUL_ASH_GATES[tier] or 0
end

--- Achievement required to run a Hardcore difficulty tier, keyed by difficulty tier.
--- "Ahead of the Curve" I-V (6478-6482): each asks for a raid final boss killed at the tier
--- BELOW the one it unlocks, so access is proven by content cleared rather than by a balance.
---
---   Hardcore 1 (tier 2) : Kel'Thuzad on Normal
---   Hardcore 2 (tier 3) : Yogg-Saron on Hardcore 1 or higher
---   Hardcore 3 (tier 4) : Anub'arak on Hardcore 2 or higher
---   Hardcore 4 (tier 5) : the Lich King (ICC 25) on Hardcore 3 or higher
---   Hardcore 5 (tier 6) : Halion on Hardcore 4 or higher
---
--- CLIENT-SIDE ONLY, like the Soul Ash table above: the server re-checks its own copy on every
--- difficulty-switch path. Unlike Soul Ashes, achievement state is per CHARACTER and is known
--- to the client immediately, so nothing here has to wait on a server push.
ProjectEbonhold.HARDCORE_ACHIEVEMENT_GATES = {
    [2] = 6478,   -- Ahead of the Curve I
    [3] = 6479,   -- Ahead of the Curve II
    [4] = 6480,   -- Ahead of the Curve III
    [5] = 6481,   -- Ahead of the Curve IV
    [6] = 6482,   -- Ahead of the Curve V
}

---@param tier number difficulty tier (1 = Normal)
---@return number achievement id required, 0 when the tier has no achievement requirement
ProjectEbonhold.GetHardcoreAchievementGate = function(tier)
    tier = tonumber(tier) or 1
    if tier < 2 then return 0 end

    return ProjectEbonhold.HARDCORE_ACHIEVEMENT_GATES[tier] or 0
end

-- 12345678 -> "12,345,678" -- shared thousands separator for UI numbers
-- (Soul Ash balances/costs get large enough to be unreadable without it)
--
-- string.format("%.0f", ...) rather than tostring(): Soul Ashes are 64-bit server-side and
-- routinely pass a billion, and tostring() switches to scientific notation ("1.2345678901235e+16")
-- past 14 significant digits, which the separator pattern below would then mangle. %.0f always
-- prints plain decimal digits. Never %d here - that truncates to a 32-bit int on this client,
-- so anything above 2,147,483,647 comes out as garbage.
ProjectEbonhold.FormatThousands = function(n)
    local s = string.format("%.0f", math.floor(tonumber(n) or 0))
    while true do
        local replaced
        s, replaced = s:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
        if replaced == 0 then break end
    end
    return s
end

ProjectEbonhold.UITexts = {
    tooltips = {
        soulPoints = {
            title = function(sp) return "Cenizas de alma: " .. ProjectEbonhold.FormatThousands(sp) end,
            line = "Cuando mueras, tus Cenizas de alma se añadirán a tu Árbol de Habilidades.",
        },
        multiplier = {
            title = function(mult)
                return "Multiplicador de Ceniza de alma: +" ..
                    string.format("%.0f", mult * 100) .. "%"
            end,
            line =
            "Este es tu multiplicador de ganancia de Ceniza de alma. Puedes aumentarlo completando logros y alcanzando niveles de Intensidad más altos."
        },
        reaper = {
            title = "El Segador",
            spawned = function(areaName)
                return "El Segador está en |cffFF4500" .. areaName .. "|r"
            end,
            notSpawned = "El Segador no ha aparecido"
        },
        survival = {
            title = "Estadísticas de supervivencia",

            playerRezs = "Resurrecciones concedidas por jugadores (Máx. permitido): ",
            freeRezs = "Autorresurrecciones gratuitas (Sin coste de Ceniza de alma): ",
            classRezs = "Resurrecciones de clase (Reencarnación, Piedra de alma): ",
            cheatDeath = "Cargas de Burlar a la muerte: ",
            nextRezCost = "Coste de la siguiente resurrección: ",
            nextCost = " Ceniza de alma"
        },
        intensity = {
            title = function(intensity)
                return "Intensidad: " .. intensity
            end,
            description1 =
            "Derrotar enemigos más rápido aumenta tu intensidad a mayor velocidad, mientras que matar enemigos grises no otorga intensidad. Tu intensidad decae gradualmente fuera de combate. A continuación se muestran los efectos de cada umbral de intensidad. ",
            warning =
            "Advertencia: ¡Permanecer con vida en el Nivel de intensidad 5 durante 10 minutos desatará la Cólera del Rey Exánime!"
        }
    },
    ui = {
        echoes = function(count) return "Ecos (" .. count .. ")" end,
        stack = function(current, max)
            return "Cantidad: " .. current .. "/" .. max
        end
    }
}


ProjectEbonhold.DeathTexts = {
    frame = {
        title = "Estás muerto",
        description = "Elige una opción:",
        arenaTitle = "Modo espectador",
        arenaDescription = "Puedes presenciar la arena:",
        battlegroundTitle = "Muerte en campo de batalla"
    },

    buttons = {
        acceptDeath = function(soulPointsGain)
            return "Aceptar la muerte    |cff00FF00+" .. tostring(soulPointsGain) ..
                " Cenizas de alma|r"
        end,
        releaseSpirit = "Liberar espíritu",
        useSoulstone = function(text, countCanClassRezs)
            return "Resucitar con " .. text .. " " ..
                tostring(countCanClassRezs) .. " restantes"
        end,
        selfRezAvailable = function(count)
            return "Resucitar sin penalización " .. tostring(count) ..
                " restantes"
        end,
        soulPointsAffordable = function(cost)
            return "Resucitar |cffEB0000-" .. cost .. "|r Cenizas de alma"
        end,
        acceptPlayerRez = function(count)
            return "Resurrección de jugador (" .. tostring(count) .. " restantes)"
        end
    },

    confirmations = {
        acceptDeath = {
            title = "Confirmar aceptar la muerte",
            message = function(soulPointsGain)
                return "Obtendrás " .. soulPointsGain ..
                    " Cenizas de alma que puedes gastar en el Árbol de Habilidades.\n\nTu equipo equipado se enviará a tu inventario, volverás al nivel 1 y serás teletransportado a tu zona de inicio.\n\n¿Estás seguro?"
            end
        },
        selfRez = {
            title = "Confirmar autorresurrección",
            message = function(remaining)
                return
                    "¿Usar una de tus autorresurrecciones restantes?\n\nResucitarás en el cementerio más cercano.\n\n(" ..
                    remaining .. " restantes)"
            end
        },
        soulPointsRez = {
            title = "Confirmar resurrección por Cenizas de alma",
            message = function(cost, remaining)
                return "Usar " .. cost ..
                    " Cenizas de alma para resucitar?\n\nTe quedarán " ..
                    remaining .. " Cenizas de alma restantes y resucitarás en el cementerio más cercano."
            end
        },
        soulstone = {
            title = function(text)
                return "Confirmar uso de " .. text .. " de uso"
            end,
            message = function(text, remaining)
                return "¿Usar tu " ..
                    text .. " para resucitar?\n\nResucitarás en el cementerio más cercano.\n\n(" ..
                    remaining .. " resurrecciones de clase restantes)"
            end
        },
        acceptPlayerRez = {
            title = "Confirmar resurrección de jugador",
            message = function(remaining)
                return "¿Aceptar la resurrección de otro jugador?\n\nResucitarás en la ubicación de tu compañero.\n\n(" ..
                    remaining .. " resurrecciones aceptadas restantes)"
            end
        }
    },


    tooltips = {
        acceptDeath = {
            title = "Aceptar la muerte",
            line1 = function(soulPointsGain)
                return "Obtendrás " .. soulPointsGain .. " Cenizas de alma."
            end,
            line2 = "Las Cenizas de alma se pueden gastar en el Árbol de Habilidades para desbloquear poderosas habilidades."
        },
        selfRez = {
            title = "Autorresurrección",
            line1 = "Revive sin ninguna penalización.",
            line2 = function(remaining)
                return "Tienes " .. remaining .. " restantes."
            end
        },
        soulPointsRez = {
            title = "Resurrección por Cenizas de alma",
            canAfford = {
                line1 = function(cost)
                    return "Usar " .. cost .. " Cenizas de alma para resucitar."
                end,
                line2 = "Esto deducirá Cenizas de alma de tu run actual, no de tu Árbol de Habilidades.",
                line3 = function(remaining)
                    return "Te quedarán " .. remaining ..
                        " Cenizas de alma restantes en esta run."
                end
            },
            cantAfford = {
                line1 = function(cost)
                    return "Necesitas " .. cost .. " Cenizas de alma para resucitar."
                end,
                line2 = function(current)
                    return "Actualmente tienes " .. current ..
                        " Cenizas de alma en esta run."
                end
            }
        },
        soulstone = {
            title = function(text) return "Usar " .. text end,
            line1 = function(text)
                return "¿Usar tu " .. text .. " para resucitar."
            end,
            line2 = function(remaining)
                return "Tienes " .. remaining ..
                    " resurrecciones de clase restantes."
            end
        },
        acceptPlayerRez = {
            title = "Aceptar resurrección de jugador",
            line1 = "Acepta la resurrección de otro jugador.",
            line2 = function(remaining)
                return "Tienes " .. remaining ..
                    " resurrecciones aceptadas restantes."
            end
        }
    },


    messages = {
        notEnoughSoulPoints = "|cffFF0000¡No tienes suficientes Cenizas de alma para resucitar!|r",
        arenaSpectator = function()
            return ARENA_SPECTATOR or "Ahora estás en modo espectador."
        end,
        confirmPrints = {
            acceptDeath = "Aceptar la muerte confirmado - Llamada personalizada a implementar",
            selfRez = "Autorresurrección confirmada - Llamada personalizada a implementar",
            soulPointsRez = "Resurrección por Cenizas de alma confirmada - Llamada personalizada a implementar",
            acceptPlayerRez = "Aceptar resurrección de jugador confirmada - Llamada personalizada a implementar"
        }
    }
}
