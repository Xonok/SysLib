library CastDummy
    globals
        public integer DummyID = 'h001'
        public integer StunAbilityID = 'A004'
        public string StunOrderString = "firebolt"
	public integer EnsnareAbilityID = 'A00A'
        public string EnsnareOrderString = "ensnare"
        public integer SilenceAbilityID = 'A00P'
        public string SilenceOrderString = "drunkenhaze"
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
    public function TargetCast takes unit target, integer abilityid, string orderstring returns nothing
	local unit u = Alloc(0,0)
        call UnitAddAbility(u,abilityid)
        call IssueTargetOrder(u,orderstring,target)
        call UnitRemoveAbility(u,abilityid)
        call Release(u)
        set u = null
    endfunction
    public function Stun takes unit target returns nothing
    	call TargetCast(target,StunAbilityID,StunOrderString)
    endfunction
    public function Ensnare takes unit target returns nothing
        call TargetCast(target,EnsnareAbilityID,EnsnareOrderString)
    endfunction
    public function Silence takes unit target returns nothing
        call TargetCast(target,SilenceAbilityID,SilenceOrderString)
    endfunction
endlibrary