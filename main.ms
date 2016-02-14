#########################################
# Copyright 2016 ITSTAKE GPL v2.0
# Script by itstake (bexco2010@gmail.com)
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
        	if(@e[clicktype] == 'LEFT') {
        		try( execute(@array['menu'][@number]['left']), @ex,try( execute(@array['menu'][@number]['click']) ))
        	} else if(@e[clicktype] == 'RIGHT') {
        		try( execute(@array['menu'][@number]['right']), @ex,try( execute(@array['menu'][@number]['click']) ))
        	} else if(@e[clicktype] == 'SHIFT_LEFT') {
			try( execute(@array['menu'][@number]['shift_left']), @ex,try( execute(@array['menu'][@number]['click']) ))
		} else if(@e[clicktype] == 'SHIFT_RIGHT') {
        		try( execute(@array['menu'][@number]['shift_right']), @ex,try( execute(@array['menu'][@number]['click']) ))
		} else if(@e[clicktype] == 'DROP') {
			try( execute(@array['menu'][@number]['drop']), @ex,try( execute(@array['menu'][@number]['click']) ))
		} else {
			execute(@array['menu'][@number]['click']) # Execute closure, with try() in case you have an empty slot 
        }                                      # or click an item out of your normal inventory
		play_sound(ploc(@e[player]), array(sound: CLICK), @e[player])
    }
)
