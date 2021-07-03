ESX						= nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
ESX.RegisterUsableItem('weed', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_joint:roule_le_teh_zbii', _source)
end)
RegisterNetEvent('esx_joint:roule_le_teh_zbi')
AddEventHandler('esx_joint:roule_le_teh_zbi', function(coord)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local object = xPlayer.getInventoryItem('ocb').count
    if object >= 1 then
     xPlayer.removeInventoryItem('ocb', 1)
     xPlayer.removeInventoryItem('weed', 1)   
     xPlayer.addInventoryItem('joint', 1) 
    else
        TriggerClientEvent('esx:showNotification', source, 'You need a package of ~r~rolling paper~s~ !')
    end
end)
ESX.RegisterUsableItem('joint', function(source)     
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local object = xPlayer.getInventoryItem('lighter').count
    if object >= 1 then
     xPlayer.removeInventoryItem('joint', 1)
     TriggerClientEvent('esx_joint:joint', _source)
    else
        TriggerClientEvent('esx:showNotification', _source, 'You need a ~r~lighter~s~ !')
    end
end)

