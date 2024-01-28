Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function (caster, spell, _, _, _)
    if  Osi.HasActiveStatus(caster,"CONSUMPTIVE_POWER") == 1 then
        local spellData = Ext.Stats.Get(spell)
        local spellLevel = spellData.Level
        _D(spellLevel)
        local lastCharSpell = tonumber(string.sub(spell, -1), 10) -- returns nil if string isn't an integer
         -- For some reason upcasted spells' spellData.Level equals their base level
         -- So we check for the last caster in the spell's name, to check for upcasting
        if lastCharSpell then
            spellLevel = lastCharSpell
        end
        _D(lastCharSpell)
        if spellLevel >= 1 and spellLevel <= 5 then
            local casterHp = Osi.GetHitpoints(caster)
            local casterData = Ext.Stats.Get(caster)
            if casterHp < (spellLevel * 2) then
                Osi.Die(caster,10,caster,0,1,1)
            else
                local boostName = "CONSUMPTIVE_POWER_MAX_HP_L" .. spellLevel
                Osi.ApplyStatus(caster,boostName,-1,100,caster)
            end
        end
    end
end)