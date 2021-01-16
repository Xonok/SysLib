library UnitRegistry initializer in requires Unit
    globals
        integer Key_UnitHandle
    endglobals
    private function register takes nothing returns boolean
        call SaveUnitHandle(Object_Table,UnitIndex_UnitID,Key_UnitHandle,UnitIndex_Unit)
        return true
    endfunction
    private function in takes nothing returns nothing
        call UnitIndex_AddRegisterHandler("Unit Registry Register",function register)
        set Key_UnitHandle = Key_Register(1)
    endfunction
endlibrary