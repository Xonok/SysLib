library CastDummy
    globals
        public integer DummyID = 'h001'
        public integer StunAbilityID = 'A004'
        public string StunOrderString = "firebolt"
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
    public function Stun takes unit target returns nothing
        local unit u = Alloc(0,0)
        call UnitAddAbility(u,StunAbilityID)
        call IssueTargetOrder(u,StunOrderString,target)
        call UnitRemoveAbility(u,StunAbilityID)
    endfunction
endlibrary