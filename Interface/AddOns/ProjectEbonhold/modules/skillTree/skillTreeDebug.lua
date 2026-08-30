



local DEBUG_ENABLED = false 


local function DebugPrint(message, ...)
  if DEBUG_ENABLED then
    if select("#", ...) > 0 then
      print("|cffFFFF00[skillTree Debug]|r " .. string.format(message, ...))
    else
      print("|cffFFFF00[skillTree Debug]|r " .. message)
    end
  end
end


function skillTree_DebugConnections(nodeId)
  if not nodeId then
    print("|cffFF0000Uso: skillTree_DebugConnections(nodeId)|r")
    return
  end
  
  print("|cff00FF00=== DEPURANDO NODO " .. nodeId .. " ===|r")
  
  local btn = nodesById[nodeId]
  if not btn then
    print("|cffFF0000Nodo " .. nodeId .. " ¡no encontrado!|r")
    return
  end
  
  
  print("ID del nodo: " .. nodeId)
  print("State: " .. (btn.state or "unknown"))
  print("Es nodo inicial: " .. tostring(isStartingNode and isStartingNode(nodeId) or "unknown"))
  print("Rango actual: " .. (getNodeRank and getNodeRank(nodeId) or "unknown"))
  print("Es de opción múltiple: " .. tostring(btn.isMultipleChoice or false))
  
  if btn.isMultipleChoice then
    print("Opción seleccionada: " .. (nodeChoices[nodeId] or 0))
  end
  
  
  if getConnectedNodes then
    local connectedNodes = getConnectedNodes(nodeId)
    print("Nodos conectados (" .. #connectedNodes .. "):")
    for i, connectedId in ipairs(connectedNodes) do
      local connectedBtn = nodesById[connectedId]
      if connectedBtn then
        local status = connectedBtn.state or "unknown"
        local rank = getNodeRank and getNodeRank(connectedId) or 0
        local isTaken = false
        
        if connectedBtn.isMultipleChoice then
          isTaken = (nodeChoices[connectedId] or 0) ~= 0
        else
          isTaken = rank > 0
        end
        
        print("  - Nodo " .. connectedId .. ": " .. status .. " (Rank: " .. rank .. ", Aprendido: " .. tostring(isTaken) .. ")")
      else
        print("  - Nodo " .. connectedId .. ": NO ENCONTRADO")
      end
    end
  else
    print("función getConnectedNodes no disponible")
  end
  
  
  if canUpgradeNode then
    print("Se puede mejorar: " .. tostring(canUpgradeNode(nodeId)))
  end
  if canDowngradeNode then
    print("Se puede reducir: " .. tostring(canDowngradeNode(nodeId)))
  end
  if canAffordTalent then
    print("Asequible: " .. tostring(canAffordTalent(nodeId)))
  end
  
  print("|cff00FF00=== FIN DE DEPURACIÓN ===|r")
end


function skillTree_DebugTree()
  print("|cff00FF00=== DEPURACIÓN DE ESTADO DEL ÁRBOL ===|r")
  
  
  local totalNodes = 0
  local activeNodes = 0
  local readyNodes = 0
  local lockedNodes = 0
  local startingNodes = 0
  
  for nodeId, btn in pairs(nodesById or {}) do
    totalNodes = totalNodes + 1
    
    if btn.state == "active" then
      activeNodes = activeNodes + 1
    elseif btn.state == "ready" or btn.state == "nopoints" then
      readyNodes = readyNodes + 1
    else
      lockedNodes = lockedNodes + 1
    end
    
    if isStartingNode and isStartingNode(nodeId) then
      startingNodes = startingNodes + 1
    end
  end
  
  print("Nodos totales: " .. totalNodes)
  print("Nodos activos: " .. activeNodes)
  print("Nodos listos: " .. readyNodes)
  print("Nodos bloqueados: " .. lockedNodes)
  print("Nodos iniciales: " .. startingNodes)
  
  
  if TALENT_POINTS_TOTAL then
    print("Cenizas de alma disponibles: " .. TALENT_POINTS_TOTAL)
  end
  
  
  if currentClass then
    print("Clase actual: " .. currentClass)
  end
  
  print("|cff00FF00=== FIN DE DEPURACIÓN DEL ÁRBOL ===|r")
end


function skillTree_DebugStartingNodes()
  if not isStartingNode then
    print("|cffFF0000función isStartingNode no disponible|r")
    return
  end
  
  local startingNodesList = {}
  for nodeId, btn in pairs(nodesById or {}) do
    if isStartingNode(nodeId) then
      table.insert(startingNodesList, nodeId)
    end
  end
  
  table.sort(startingNodesList)
  
  print("Nodos iniciales encontrados: " .. #startingNodesList)
  for _, nodeId in ipairs(startingNodesList) do
    local btn = nodesById[nodeId]
    local state = btn and btn.state or "unknown"
    local rank = getNodeRank and getNodeRank(nodeId) or 0
    print("  - Nodo " .. nodeId .. ": " .. state .. " (Rank: " .. rank .. ")")
  end
  
  print("|cff00FF00=== FIN DE DEPURACIÓN DE NODOS INICIALES ===|r")
end


function skillTree_DebugAllConnections()
  print("|cff00FF00=== DEPURACIÓN DE TODAS LAS CONEXIONES ===|r")
  
  if not getConnectedNodes then
    print("|cffFF0000función getConnectedNodes no disponible|r")
    return
  end
  
  local nodeIds = {}
  for nodeId, _ in pairs(nodesById or {}) do
    table.insert(nodeIds, nodeId)
  end
  table.sort(nodeIds)
  
  for _, nodeId in ipairs(nodeIds) do
    local connectedNodes = getConnectedNodes(nodeId)
    if #connectedNodes > 0 then
      print("Nodo " .. nodeId .. " conectado a: " .. table.concat(connectedNodes, ", "))
    else
      print("Nodo " .. nodeId .. " no tiene conexiones")
    end
  end
  
  print("|cff00FF00=== FIN DE DEPURACIÓN DE TODAS LAS CONEXIONES ===|r")
end


function skillTree_DebugLoadouts()
  print("|cff00FF00=== DEPURACIÓN DE BUILDS ===|r")
  
  if not savedLoadouts then
    print("|cffFF0000savedLoadouts no disponible|r")
    return
  end
  
  local count = 0
  for name, loadout in pairs(savedLoadouts) do
    count = count + 1
    print("Loadout: " .. name)
    print("  Class: " .. (loadout.class or "unknown"))
    print("  Talents: " .. (loadout.talents and #loadout.talents or "0"))
    print("  Ranks: " .. (loadout.ranks and "available" or "no disponible"))
    print("  Choices: " .. (loadout.choices and "available" or "no disponible"))
  end
  
  if count == 0 then
    print("No se encontraron builds guardadas")
  end
  
  print("Build actual: " .. (currentLoadoutName or "none"))
  print("|cff00FF00=== FIN DE DEPURACIÓN DE BUILDS ===|r")
end


function skillTree_ToggleDebug()
  DEBUG_ENABLED = not DEBUG_ENABLED
  print("|cff00FF00skillTree Debug: " .. (DEBUG_ENABLED and "ENABLED" or "DISABLED") .. "|r")
  return DEBUG_ENABLED
end


function skillTree_DebugHelp()
  print("|cff00FF00=== COMANDOS DE DEPURACIÓN DE skillTree ===|r")
  print("/script skillTree_DebugConnections(nodeId) - Debug specific node connections")
  print("/script skillTree_DebugTree() - Debug overall tree state")
  print("/script skillTree_DebugStartingNodes() - List all starting nodes")
  print("/script skillTree_DebugAllConnections() - Show all node connections")
  print("/script skillTree_DebugLoadouts() - Debug saved loadouts")
  print("/script skillTree_ToggleDebug() - Enable/disable debug messages")
  print("/script skillTree_DebugHelp() - Show this help")
  print("|cffFFFFFFEjemplo: /script skillTree_DebugConnections(30)|r")
  print("|cff00FF00=== FIN DE AYUDA DE DEPURACIÓN ===|r")
end


skillTree_Debug = {
  DebugPrint = DebugPrint,
  IsEnabled = function() return DEBUG_ENABLED end,
  SetEnabled = function(enabled) DEBUG_ENABLED = enabled end
}