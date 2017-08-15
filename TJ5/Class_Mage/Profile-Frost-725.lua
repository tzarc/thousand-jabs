local SPELL_POWER_MANA = SPELL_POWER_MANA

LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

local Frost = Engine:RegisterClassProfile({
    Name = 'FrostMage',
    ClassID = 8,
    SpecID = 3,
    DefaultActionProfile = 'simc::mage::frost',
})

Frost:AddActions({
    -- Base resources
    Engine:CreateResourceHandler('mana', 'player', SPELL_POWER_MANA, 'regen_power'),

    -- Buffs/debuffs
    Engine:CreateAuraMySpellOnPlayer('fingers_of_frost', { 44544, 112965 }),
    Engine:CreateAuraMySpellOnPlayer('icy_veins', 12472),
})
