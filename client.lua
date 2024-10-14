local originalModel = nil
local originalData = nil
local hasChangedPed = false

RegisterNetEvent('pedmenu:menu')
AddEventHandler('pedmenu:menu', function()
    local input = lib.inputDialog(Config.getLocale('ped_select_dialog'), {
        {type = 'select', label = 'Ped', options = getPedOptions(), searchable = true}
    })
    if input then
        local selectedPed = input[1]
        changePed(selectedPed)
    end
end)

RegisterNetEvent('pedmenu:reset')
AddEventHandler('pedmenu:reset', function()
    resetPed()
end)

function getPedOptions()
    local options = {}
    for _, ped in ipairs(Config.Peds) do
        table.insert(options, {value = ped, label = ped})
    end
    return options
end

function changePed(pedModel)
    local playerPed = PlayerPedId()
    if not hasChangedPed then
        originalModel = GetEntityModel(playerPed)
        originalData = exports['illenium-appearance']:getPedAppearance(playerPed)
        hasChangedPed = true
    end

    lib.requestModel(pedModel)
    SetPlayerModel(PlayerId(), pedModel)
    SetModelAsNoLongerNeeded(pedModel)
end

function resetPed()
    if hasChangedPed and originalModel and originalData then
        lib.requestModel(originalModel)
        SetPlayerModel(PlayerId(), originalModel)
        SetModelAsNoLongerNeeded(originalModel)
        exports['illenium-appearance']:setPlayerAppearance(originalData)
        hasChangedPed = false
    else
        lib.notify({ description = Config.getLocale('ped_change_error'), type = 'error'})
    end
end
