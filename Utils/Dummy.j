library Dummy
    globals
        public integer DummyID = 'h000'
        public unit array Dummy
        public integer Dummies = 0
        public player DummyPlayer = Player(PLAYER_NEUTRAL_PASSIVE)
    endglobals
    public function Alloc takes real x, real y returns unit
        if Dummies > 0 then
            set Dummies = Dummies - 1
            return Dummy[Dummies+1]
        else
            return CreateUnit(DummyPlayer,DummyID,x,y,0)
        endif
    endfunction
    public function Release takes unit u returns nothing
        set Dummies = Dummies + 1
        set Dummy[Dummies] = u
    endfunction
endlibrary