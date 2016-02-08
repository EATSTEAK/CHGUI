#########################################
# Copyright 2015 ASTIA Project All rights reserved.
# Script by itstake (bexco2010@gmail.com)
# This script is use in ASTIA only.
#########################################

proc(_itemmenu_create, @array,
if(import('MenuOpen'.player()) != true) {
    export('MenuOpen'.player(), true)
    export('CurMenu'.player(), @array)
    
    @title = @array['title']
    @id = @array['id']
	if(array_index_exists(@array, size)) {
		@size = @array['size']
	} else {
	    @size = ceil((array_size(@array['menu'])) / 9) * 9 # Dynamically set the size
	}

    @chest = array(id: @id, size: @size, title: @title)
    @items = @array['menu']
    
    foreach(@key:@value in @items) {
        if(!is_array(@value)) { 
            if(@value == 'MSpecialItem') {
                # Add custom code for an item with a specific name.
            }
            continue() # Any non array gets skipped so just add a random string to skip a slot
        }
        array_set(@value[0]['meta'], 'lore', split('\n', @value[0]['meta']['lore']))
        # Split lore on newlines
        
        array_set(@chest, @key, @value[0])
    }
    
    create_virtualchest(@chest)
    popen_virtualchest(@id)
)
proc(_itemmenu_update, @array,
    export('MenuOpen'.player(), true)
    export('CurMenu'.player(), @array)
    
    @title = @array['title']
    @id = @array['id']
	if(array_index_exists(@array, size)) {
		@size = @array['size']
	} else {
	    @size = ceil((array_size(@array['menu'])) / 9) * 9 # Dynamically set the size
	}

    @chest = array(id: @id, size: @size, title: @title)
    @items = @array['menu']
        for(@i = 0, @i < @size, @i++,
        if(!array_index_exists(@items, @i)) { 
        array_set(@chest, @i, array(type: 0,data: 0,qty: 0))
		}
    )
    foreach(@key:@value in @items) {
        if(!is_array(@value)) { 
            if(@value == 'MSpecialItem') {
                # Add custom code for an item with a specific name.
            }
            continue() # Any non array gets skipped so just add a random string to skip a slot
        }
        array_set(@value[0]['meta'], 'lore', split('\n', @value[0]['meta']['lore']))
        # Split lore on newlines
        
        array_set(@chest, @key, @value[0])
    }
	msg(@chest)
    create_virtualchest(@chest)
    popen_virtualchest(@id)
}
)



