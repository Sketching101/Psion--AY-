Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function (character, spell, _, _, _)
    if  Osi.HasActiveStatus(character,"CONSUMPTIVE_POWER") then
        local spellData = Ext.Stats.Get(spell)
        local spellLevel = spellData.Level
        _D(spellLevel)
        local lastCharSpell = tonumber(string.sub(spell, -1), 10) -- returns nil if string isn't an integer
         -- For some reason upcasted spells' spellData.Level equals their base level
         -- So we check for the last character in the spell's name, to check for upcasting
        if lastCharSpell then
            spellLevel = lastCharSpell
        end
        _D(lastCharSpell)
        if Osi.IsTagged(character,"dc8a847f-77b0-4dbb-a564-1ded034a1976") == 1 and spellLevel >= 1 and spellLevel <= 5 then
            local characterHp = Osi.GetHitpoints(character)
            local characterData = Ext.Stats.Get(character)
            if characterHp < (spellLevel * 2) then
                
            else
                local boostName = "CONSUMPTIVE_POWER_MAX_HP_L" .. spellLevel
                Osi.ApplyStatus(character,boostName,-1,100,character)
            end
        end
    end
end)