
-- Listening to CONSUMPTIVE_POWER
-- Ext.Osiris.RegisterListener("UsingSpell", 3, "before", function (caster, spell,_,_)
--     -- Osi.ApplyStatus(caster,"BLUR",5.0,1,caster)
--     -- local wis = Osi.GetAbility(caster,"Wisdom")
--     -- OpenMessageBox(caster, wis)
--     if  Osi.HasActiveStatus(caster,"CONSUMPTIVE_POWER") == 1 then
--         Osi.AddBoosts(caster, "IncreaseMaxHP(-2)", caster, "")
--         Osi.UserAddGold(caster, 9999)
--         if Osi.IsTagged(caster,"dc8a847f-77b0-4dbb-a564-1ded034a1976") == 1 then
--             Osi.ApplyStatus(caster,"BLESS",1.0,1,caster)
--         end
--     end
-- end)



Ext.Osiris.RegisterListener("UsingSpell", 5, "before", function (character, spell, _, _, _)
--    Ext.Utils.PrintWarning("UsingSpell",character, spell)
    if  Osi.HasActiveStatus(character,"CONSUMPTIVE_POWER") then
        local spellData = Ext.Stats.Get(spell)
        local spellLevel = spellData.Level
        local spellName = spellData.Name
        local lastCharSpell = tonumber(string.sub(spell, -1), 10)
        if lastCharSpell then
            spellLevel = lastCharSpell
        end
        _D(lastCharSpell)
        if Osi.IsTagged(character,"dc8a847f-77b0-4dbb-a564-1ded034a1976") == 1 and spellLevel >= 1 and spellLevel <= 5 then
            local boostName = "CONSUMPTIVE_POWER_MAX_HP_L" .. spellLevel
            _D(boostName)
            -- Osi.ApplyStatus(character,"BLESS" ,1.0,1,character)
            -- local reduceMaxHPby = string.format(Osi.IntegerToString(Osi.GetActionResourceValuePersonal(character,"ConsumptivePowerResource",0) - 200))
            -- local reduceMaxHP = string.format("IncreaseMaxHP(", reduceMaxHPby, ")")
            Osi.ApplyStatus(character,boostName,-1,100,character)
            -- Osi.AddBoosts(character, reduceMaxHP, character, "")
        end
    end
end)