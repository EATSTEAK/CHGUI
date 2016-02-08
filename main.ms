#########################################
# Copyright 2015 ASTIA Project All rights reserved.
# Script by itstake (bexco2010@gmail.com)
# This script is use in ASTIA only.
#########################################

bind('virtualchest_closed', null, null, @event,
    @array = import('CurMenu'.player())
    export('MenuOpen'.player(), false) # Itemmenu is closed
)

bind(inventory_click, null, null, @e,
    @array = import('CurMenu'.player()) # Import Menu Array
    if(@array == null) { 
        die() 
    }
    if(import('MenuOpen'.player())) { # Itemmenu is Open
        cancel() # Cancel Click
        @number = @e['rawslot']
		if(@e[clicktype] == 'SHIFT_LEFT' || @e[clicktype] == 'SHIFT_RIGHT') {
			try( execute(@array['menu'][@number][2]), @ex,try( execute(@array['menu'][@number][1]) ))
		} else if(@e[clicktype] == 'DROP') {
			try( execute(@array['menu'][@number][3]), @ex,try( execute(@array['menu'][@number][1]) ))
		} else {
			execute(@array['menu'][@number][1]) # Execute closure, with try() in case you have an empty slot 
        }                                      # or click an item out of your normal inventory
		play_sound(ploc(@e[player]), array(sound: CLICK), @e[player])
    }
)