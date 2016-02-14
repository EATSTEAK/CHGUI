# CHGUI
GUI Package for CommandHelper


# How to Use It?

Go to the [releases](https://github.com/itstake/chgui/releases) tab,

And download latest version.


When download completed, Go to the CommandHelper's config folder.

click LocalPackages Folder, and paste it(Maybe It named CHGUI~~~.mslp).

# Example

<pre>
@array = array(
#Title: this menu's title
title: 'Title',
#ID: This menu's id(not visible id)
id: 'TEST',
#size: this menu's slot size(optional)(9 is one line. this means 9xline number is size)
size: 9,
#menu: Menu Item's Array
menu: array(
#Item 1
array(
#item: displayed item's info(ItemArray)
item:array(type:1,data:0,qty:1),
#<click type name here(in lower char)>: set closure of specifed click type. Supported click types: left, right, shift_left, shift_right, window_border_left, window_border_right, middle, number_key, double_click, drop, control_drop, creative or unknown
left: closure(msg('left click')),
#If click type is not specific, run click closure.
click: closure(msg('normal click'))
#End Item 1 Array
),
#Item 2
array(
#item: displayed item's info(ItemArray)
item:array(type:2,data:0,qty:2),
#<click type name here(in lower char)>: set closure of specifed click type. Supported click types: left, right, shift_left, shift_right, drop
shift_right: closure(msg('shift right click 2')),
#If click type is not specific, run click closure.
click: closure(msg('normal click 2'))
#End Item 2 Array
)
#End Menu Array
)
#End GUI Array
)
#Show GUI to player()
_itemmenu_create(@array)
</pre>


