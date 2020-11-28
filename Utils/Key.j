library Key requires Text
    globals
        public hashtable Table = InitHashtable()
        public integer InitialOffset = 1000000//So that it would be possible to have tablekeys and objects in the same tables
        public integer CurrentOffset = InitialOffset
    endglobals
    public function Register takes integer amount returns integer
        local integer start = CurrentOffset + 1
        if amount == 0 then
            call Text_Print("Key_Register tried to allocate 0. Reverting to 100 to reduce chance of bugs.")
            set amount = 100
        endif
        set CurrentOffset = CurrentOffset + amount
        return start
    endfunction
endlibrary