DEBUG = true;
DEBUG = false;

inner_radius = 16.5;
rim_thickness = 5;
rim_height = 3;
outer_radius = inner_radius + rim_thickness;
n_sides = 6;
standoff_height = 10;
height = standoff_height + rim_height;

module body() {
    difference(){
        // Main body
        cylinder(r=outer_radius, h=height, $fn=n_sides);

        // Inner recess
        translate([0,0, standoff_height])
        cylinder(r=inner_radius, h=(rim_height + 1), $fn=n_sides);
    }
}

module chop_top() {
    difference() {
        body();
        translate([-50,-50,-92]) cube(100);
    }
}


module main(chop=false) {
    difference() {
        if (chop) {
            chop_top();
        } else {
            body();
        }

        text_depth = 2;
        text_font = "helvetica";
        text_font = "Liberation Sans:style=Bold Italic";
        translate([0, 0, standoff_height - text_depth])
            linear_extrude(text_depth)
            text("RB", font=text_font, halign="center", valign="center");
    }
}

main(chop=DEBUG);