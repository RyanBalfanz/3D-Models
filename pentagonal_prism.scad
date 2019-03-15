use <shapes.scad>;

$fa = 0.1;
$fs = 0.1;

// $fn = 360/20;
// $fn = 100;

GOLDEN_RATIO = 1.618;

radius = 10;
height = 2*radius/GOLDEN_RATIO/2;
sub_height = height/10;
roundedness = radius / 5;

main();

part = "body";
part = "lid";
part = "all";

module main() {
    if (part == "body") {
        body();
    } else if (part == "lid") {
        lid();
    } else if (part == "all") {
        SeparateChildren([2.5*radius, 0, 0]) {
            body();
            // Position the lid in a printable orientation on the same plane as the body.
            rotate([0, 180, 0]) translate([0, 0, -height])
                lid();
        }
    } else {
        echo("ERROR: unexpected part=", part);
        // echo("This is a cylinder with h=", my_h, " and r=", my_r);
    }
}

// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#Children
module SeparateChildren(space) {
    for ( i= [0:1:$children-1]) {
        dx = i*space[0];
        dy = i*space[1];
        dz = i*space[2];
        translate([dx, dy, dz]) {
            children(i);
        }
    }
}

module body() {
    // Bottom
    rounded_pentagon(r=radius, h=1*sub_height, roundedness=roundedness);
    // Side wall
    tubify(radius=radius, wall=radius*0.1)
        rounded_pentagon(r=radius, h=9*sub_height, roundedness=roundedness);
}

module lid() {
    difference(){
        translate([0, 0, 8/10*height])
            rounded_pentagon(r=radius, h=2*sub_height, roundedness=roundedness);
        body();
    }
}

module tubify(radius, wall) {
    tollerance = 0.00;
    difference() {
        children(0);
        ds = (1.0 - tollerance) * (radius - wall)/radius;
        translate([0, 0, -0.1]) scale([ds, ds, 2]) children(0);
    }
}
