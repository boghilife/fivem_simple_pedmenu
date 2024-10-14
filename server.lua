lib.addCommand('ped', {
    help = 'Ped menu',
    restricted = Config.Perms,
}, function(source, args, raw)
    TriggerClientEvent('pedmenu:menu', source)
end)

lib.addCommand('pedreset', {
    help = 'Ped reset',
    restricted = Config.Perms,
}, function(source, args, raw)
    TriggerClientEvent('pedmenu:reset', source)
end)