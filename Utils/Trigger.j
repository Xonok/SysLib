library Trigger
    public function RegisterPlayerUnitEvent takes trigger t, playerunitevent pue returns nothing
        local integer i = 0
        loop
            exitwhen i > bj_MAX_PLAYER_SLOTS-1
            call TriggerRegisterPlayerUnitEvent(t,Player(i),pue,null)
            set i = i + 1
        endloop
    endfunction
endlibrary