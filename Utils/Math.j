library Math
    function RealDistance takes real x, real y, real x2, real y2 returns real
        local real dx = x2 - x
        local real dy = y2 - y
        return SquareRoot(dx * dx + dy * dy)
    endfunction
endlibrary