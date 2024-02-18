if Config.framework == 'esx' then 
    ESX = nil
    ESX = exports["es_extended"]:getSharedObject()

    RegisterServerEvent('Roda-Electricista:PayJob')
    AddEventHandler('Roda-Electricista:PayJob', function(money, can)
        local src = source
        if can == 'sdafghjrehrw2345dfe' then 
            local xPlayer = ESX.GetPlayerFromId(src)
            xPlayer.addAccountMoney(Config.Account, money)
        else
            DropPlayer(src, 'Bye, Bye Cheater')
        end
    end)

