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
endlibrary