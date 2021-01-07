library Index requires Text
    globals
        public boolean array Active
        
        public integer MaxUsed = 0
        public integer array Recycle
        public integer Recycles = 0
    endglobals
    public function Alloc takes nothing returns integer
        local integer i
        if Recycles > 0 then
            set i = Recycle[Recycles]
        else
            set MaxUsed = MaxUsed + 1
            set i = MaxUsed
        endif
        set Active[i] = true
        return i
    endfunction
    public function Release takes integer i returns nothing
        if Active[i] then
            set Recycles = Recycles + 1
            set Recycle[Recycles] = i
            set Active[i] = false
        else
            call Text_Print("Trying to dealloc "+I2S(i)+" but it's already inactive.")
        endif
    endfunction
endlibrary