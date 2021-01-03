library Math
    public function Distance takes real x, real y, real x2, real y2 returns real
        local real dx = x2 - x
        local real dy = y2 - y
        return SquareRoot(dx * dx + dy * dy)
    endfunction
    public function Log takes real x, real n returns real
        local real h = 0.001
        return ((Pow(x,h)-1)/h)/((Pow(n,h)-1)/h)
    endfunction
    public function Angle takes real x, real y, real x2, real y2 returns real
        return bj_RADTODEG * Atan2(y2 - y, x2 - x)
    endfunction
    public function AngleRad takes real x, real y, real x2, real y2 returns real
        return Atan2(y2 - y, x2 - x)
    endfunction
    public function IntPow takes integer a, integer pow returns integer
        local integer b = 1
        loop
            exitwhen pow == 0
            set b = b*a
            set pow = pow - 1
        endloop
        return b
    endfunction
endlibrary