library Text
    public function Print takes string s returns nothing
        call DisplayTextToPlayer(GetLocalPlayer(),0,0,s)
    endfunction
    public function PrintToPlayer takes string s, player p returns nothing
        call DisplayTextToPlayer(p,0,0,s)
    endfunction
endlibrary