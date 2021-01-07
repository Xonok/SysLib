library UnitRemoveCheck initializer in requires Trigger,Text,UnitIndex
    globals
        private unit array U
        private integer array UID
        private integer H = 0//Head of queue
        private integer T = 0//Tail of queue
        
        private integer array Index
        
        private timer Timer = CreateTimer()
        private real Timeout = 0.1//10 units are checked per second. Consistent performance, hopefully.
    endglobals
    private function handler takes nothing returns nothing
        if GetUnitTypeId(U[H]) == 0 then
            call UnitIndex_Release(UID[H])
            set U[H] = null
            set Index[UID[H]] = 0
            set UID[H] = 0
            if H == T then
                set H = 0
                set T = 0
                call PauseTimer(Timer)
            else
                set H = H + 1
            endif
        else
            set T = T + 1
            set U[T] = U[H]
            set UID[T] = UID[H]
            set Index[UID[H]] = T
            set H = H + 1
        endif
    endfunction
    private function act takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local integer uID = GetUnitUserData(u)
        if Index[uID] == 0 then
            if H == 0 then
                set H = 1
                call TimerStart(Timer,Timeout,true,function handler)
            endif
            set T = T + 1
            set U[T] = u
            set UID[T] = uID
            set Index[uID] = T
        endif
        set u = null
    endfunction
    private function in takes nothing returns nothing
        call Trigger_FastPUE(EVENT_PLAYER_UNIT_DEATH,function act)
    endfunction
endlibrary