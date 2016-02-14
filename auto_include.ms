#########################################
# Copyright 2016 ITSTAKE GPL v2.0
# Script by itstake (bexco2010@gmail.com)
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
        
        array_set(@chest, @key, @value['item'])
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
        array_set(@chest, @key, @value['item'])
    }
	msg(@chest)
    create_virtualchest(@chest)
    popen_virtualchest(@id)
}
)



