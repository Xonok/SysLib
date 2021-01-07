library UnitEnterCheck initializer in requires UnitIndex
    private function in takes nothing returns nothing
        local rect r = GetWorldBounds()
        local region re = CreateRegion()
        call RegionAddRect(re,r)
        call TriggerRegisterEnterRegion(CreateTrigger(),re,Filter(function UnitIndex_FilterCheck))
        call RemoveRect(r)
        set r = null
        set re = null
    endfunction
endlibrary