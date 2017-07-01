local addonName = ...

LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

local Frost = Engine:RegisterClassProfile({
    classID = 8,
    specID = 3,
    defaultActionProfile = 'simc::mage::frost',
    resource = { 'mana' }
})

Frost:AddActions({
    fingers_of_frost = Engine:RegisterPlayerMySpell('fingers_of_frost', { 44544, 112965 }),
    icy_veins = Engine:RegisterPlayerMySpell('icy_veins', 12472),
})
