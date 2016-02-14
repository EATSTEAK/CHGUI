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
        	if(array_index_exists(@array['menu'][@number], to_lower(@e[clicktype]))) {
        		execute(@array['menu'][@number][to_lower(@e[clicktype])])
        	} else {
        		execute(@array['menu'][@number]['click'])
        	}
	play_sound(ploc(@e[player]), array(sound: CLICK), @e[player])
    }
)
