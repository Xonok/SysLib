library WorldBounds initializer in
    globals
        real WorldXMin
        real WorldXMax
        real WorldYMin
        real WorldYMax
    endglobals
    
    function RefreshWorldBounds takes nothing returns nothing
        local rect r = GetWorldBounds()
        set WorldXMin = GetRectMinX(r)
        set WorldXMax = GetRectMaxX(r)
        set WorldYMin = GetRectMinY(r)

        set WorldYMax = GetRectMaxY(r)
    endfunction
    
    private function in takes nothing returns nothing
        call RefreshWorldBounds()
    endfunction
endlibrary