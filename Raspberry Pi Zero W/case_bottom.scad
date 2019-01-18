include <raspberry_pi_zero_w.scad>;

$fn=30;

echo(version=version());

corner_radius = 3.0;
depth = 1.6;
height = 30;
hole_diameter = 2.75;
hole_offset = 3.5;
hole_to_hole = 58;
tollerance = 0.2;
width = 65;
post_height = 4.5;
standoff_height = post_height - 1.6;

module case_bottom() {
    color("steelblue")
    translate([hole_offset, hole_offset, -depth-corner_radius])
    cylinder(h = post_height, r1 = hole_diameter/2-tollerance/2, r2 = hole_diameter/2-tollerance/2);

    color("steelblue")
    translate([58+hole_offset, hole_offset, -depth-corner_radius])
    cylinder(h = post_height, r1 = hole_diameter/2-tollerance/2, r2 = hole_diameter/2-tollerance/2);

    color("steelblue")
    translate([hole_offset, 23+hole_offset, -depth-corner_radius])
    cylinder(h = post_height, r1 = hole_diameter/2-tollerance/2, r2 = hole_diameter/2-tollerance/2);

    color("steelblue")
    translate([58+hole_offset, 23+hole_offset, -depth-corner_radius])
    cylinder(h = post_height, r1 = hole_diameter/2-tollerance/2, r2 = hole_diameter/2-tollerance/2);

    color("steelblue")
    translate([hole_offset, hole_offset, -depth-corner_radius])
    cylinder(h = standoff_height, r1 = hole_diameter, r2 = hole_diameter);

    color("steelblue")
    translate([58+hole_offset, hole_offset, -depth-corner_radius])
    cylinder(h = standoff_height, r1 = hole_diameter);

    color("steelblue")
    translate([hole_offset, 23+hole_offset, -depth-corner_radius])
    cylinder(h = standoff_height, r1 = hole_diameter, r2 = hole_diameter);

    color("steelblue")
    translate([58+hole_offset, 23+hole_offset, -depth-corner_radius])
    cylinder(h = standoff_height, r1 = hole_diameter);

    difference(){
        color("steelblue")
        difference(){
            translate([-corner_radius/2, -corner_radius/2, -depth-corner_radius/2])
            minkowski(){
                cube([width+(corner_radius), height+(corner_radius), 10-corner_radius]);
                sphere(corner_radius/2);
            }

            translate([corner_radius, corner_radius, -depth+corner_radius])
            minkowski(){
                cube([width-2*corner_radius, height-2*corner_radius, 10]);
                sphere(corner_radius+tollerance);
            }
        }
    }
}

module main() {
    difference(){
        case_bottom();
        translate([0, 0, standoff_height - depth - 1.6])
        rpi_zero_w(overfill=3);
    }
}

main();