library Time initializer in
    globals
        public integer CurrentTime = 0
        private constant real Timeout = 0.0312500
    endglobals
    
    public function GetCurrent takes nothing returns integer
        return CurrentTime
    endfunction
    public function GetElapsed takes integer timestamp returns real
        return I2R(CurrentTime-timestamp)*Timeout
    endfunction
    
    private function timestep takes nothing returns nothing
        set CurrentTime = CurrentTime + 1
    endfunction
    private function in takes nothing returns nothing
        call TimerStart(CreateTimer(),Timeout,true,function timestep)
    endfunction
endlibrary