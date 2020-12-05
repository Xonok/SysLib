library AutoFly initializer i
    private function AutoFly takes nothing returns nothing
        call UnitAddAbility(GetTriggerUnit(), 'Amrf')
	call UnitRemoveAbility(GetTriggerUnit(), 'Amrf')
    endfunction

    private function i takes nothing returns nothing
        local trigger t = CreateTrigger()
        local region rectRegion = CreateRegion()
        call RegionAddRect(rectRegion,bj_mapInitialPlayableArea)
        call TriggerRegisterEnterRegion(t,rectRegion,null)
        call TriggerAddAction(t,function AutoFly)
    endfunction
endlibrary