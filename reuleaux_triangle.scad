// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Other_Language_Features#$fa,_$fs_and_$fn
// minimum angle for a fragment
$fa = 12;
// minimum size of a fragment
$fs = 2;
// When this variable has a value greater than zero,
// the other two variables are ignored and full circle is rendered using this number of fragments.
$fn = 360;

width = 50;


module reuleaux_triangle(width) {
    intersection(){
        translate([0, width/2, 0]) circle(width);
        translate([-width/2, -width/2, 0]) circle(width);
        translate([width/2, -width/2, 0]) circle(width);
    }
}

hull(){
linear_extrude(10)
reuleaux_triangle(width);
translate([-12.5,-10,10]) linear_extrude(2) text("JMH", halign="left", valign="baseline");
}