library Logger initializer in requires Text
    globals
        private string array LogLine
        private integer LogLines = 0
        
        private integer PrintPointer
    endglobals
    private function handler takes nothing returns nothing
        set PrintPointer = PrintPointer + 1
        if PrintPointer > LogLines then
            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
        else
            call Text_Print(LogLine[PrintPointer])
        endif
    endfunction
    private function act takes nothing returns nothing
        set PrintPointer = 0
        call TimerStart(CreateTimer(),0.2,true,function handler)
    endfunction
    public function AddLine takes string s returns nothing
        set LogLines = LogLines + 1
        set LogLine[LogLines] = s
    endfunction
    private function in takes nothing returns nothing
        local trigger t = CreateTrigger()
        local integer i = 0
        loop
            exitwhen i > bj_MAX_PLAYER_SLOTS-1
            call TriggerRegisterPlayerChatEvent(t,Player(i),"printlog",true)
            set i = i + 1
        endloop
        call TriggerAddAction(t,function act)
    endfunction
endlibrary