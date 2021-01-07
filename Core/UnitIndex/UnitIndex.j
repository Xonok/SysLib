library UnitIndex requires Index,Text
    globals
        private trigger array RegisterHandler
        private string array RegisterHandlerName
        private integer RegisterHandlers = 0
        private trigger array ReleaseHandler
        private string array ReleaseHandlerName
        private integer ReleaseHandlers = 0
        
        public unit Unit
        public integer UnitID = 0
    endglobals
    public function Register takes unit u returns integer
        local integer uID
        local integer i = 1
        if GetUnitUserData(u) == 0 then
            set uID = Index_Alloc()
            call SetUnitUserData(u,uID)
            set Unit = u
            set UnitID = uID
            loop
                exitwhen i > RegisterHandlers
                if not(TriggerEvaluate(RegisterHandler[i])) then
                    call Text_Print("UnitIndex: Register Handler crashed: "+RegisterHandlerName[i])
                endif
                set i = i + 1
            endloop
            set Unit = null
            set UnitID = 0
        else
            call Text_Print("UnitIndex: Trying to add unit, but it's already in system.")
            set uID = GetUnitUserData(u)
        endif
        return uID
    endfunction
    public function Release takes integer uID returns nothing
        local integer i = 1
        set UnitID = uID
        loop
            exitwhen i > ReleaseHandlers
            if not(TriggerEvaluate(ReleaseHandler[i])) then
                    call Text_Print("UnitIndex: Release Handler crashed: "+ReleaseHandlerName[i])
                endif
            set i = i + 1
        endloop
        call Index_Release(uID)
    endfunction
    public function AddRegisterHandler takes string name,code func returns nothing
        set RegisterHandlers = RegisterHandlers + 1
        set RegisterHandler[RegisterHandlers] = CreateTrigger()
        call TriggerAddCondition(RegisterHandler[RegisterHandlers],Condition(func))
        set RegisterHandlerName[RegisterHandlers] = name
    endfunction
    public function AddReleaseHandler takes string name,code func returns nothing
        set ReleaseHandlers = ReleaseHandlers + 1
        set ReleaseHandler[ReleaseHandlers] = CreateTrigger()
        call TriggerAddCondition(ReleaseHandler[ReleaseHandlers],Condition(func))
        set ReleaseHandlerName[ReleaseHandlers] = name
    endfunction
    //This function is for lazy people like me. If instant indexing doesn't matter, this will do 100% of the indexing automatically and correctly.
    //But not deindexing.
    public function Check takes unit u returns integer
        if GetUnitUserData(u) == 0 then
            return Register(u)
        else
            return GetUnitUserData(u)
        endif
    endfunction
    //Used only by events that index units.
    public function FilterCheck takes nothing returns boolean
        local unit u = GetFilterUnit()
        if GetUnitUserData(u) == 0 then
            call Register(u)
        endif
        set u = null
        return false
    endfunction
endlibrary