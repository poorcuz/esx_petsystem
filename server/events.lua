ESX.RegisterServerCallback("bc_pets:getPetList", function(source, cb)
    local success, data = GetPetsFromSource(source)
    if not success then
        return cb({}) 
    end
    
    return cb(data)
end)