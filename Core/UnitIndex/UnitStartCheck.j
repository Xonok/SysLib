library UnitStartCheck initializer in requires UnitIndex
    private function handler takes nothing returns nothing
        local group g = CreateGroup()
        local integer i = 0
        loop
            exitwhen i == bj_MAX_PLAYER_SLOTS
            //Unlike *InRange, actually finds hidden units too. Iirc.
            call GroupEnumUnitsOfPlayer(g,Player(i),Filter(function UnitIndex_FilterCheck))
            set i = i + 1
        endloop
        call DestroyGroup(g)
        set g = null
        call DestroyTimer(GetExpiredTimer())
    endfunction
    private function in takes nothing returns nothing
        //Doing large operations in initializers might crash the thread, if done too many times.
        call TimerStart(CreateTimer(),0,false,function handler)
    endfunction
endlibrary