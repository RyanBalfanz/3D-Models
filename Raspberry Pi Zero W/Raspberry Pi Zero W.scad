$fn=50;

echo(version=version());

// simple 2D -> 3D extrusion of a rectangle
height = 30;
width = 65;
depth = 1.6;
corner_radius = 3.0;
hole_offset = 3.5;
hole_diameter = 2.75;
hole_to_hole = 58;
difference(){
color("green")
    translate([corner_radius, corner_radius, -depth])
    linear_extrude(height = depth)
    minkowski(){
        square([width-(2*corner_radius), height-(2*corner_radius)]);
        circle(corner_radius);
    }
    
    translate([hole_offset, hole_offset, -2*depth])
    linear_extrude(height = 3*depth)
    circle(hole_diameter/2);

    translate([hole_offset, height-hole_offset, -2*depth])
    linear_extrude(height = 3*depth)
    circle(hole_diameter/2);

    translate([hole_to_hole+hole_offset, hole_offset, -2*depth])
    linear_extrude(height = 3*depth)
    circle(hole_diameter/2);

    translate([hole_to_hole+hole_offset, height-hole_offset, -2*depth])
    linear_extrude(height = 3*depth)
    circle(hole_diameter/2);

}

difference(){
    color("gold")
    translate([hole_offset, hole_offset, -depth])
    linear_extrude(height = 1.1*depth)
    circle(6/2);

    translate([hole_offset, hole_offset, -2*depth])
    linear_extrude(height = 3*depth)
    circle(hole_diameter/2);
}

difference(){
    color("gold")
    translate([58+hole_offset, hole_offset, -depth])
    linear_extrude(height = 1.1*depth)
    circle(6/2);

    translate([58+hole_offset, hole_offset, -2*depth])
    linear_extrude(height = 3*depth)
    circle(hole_diameter/2);
}

difference(){
    color("gold")
    translate([hole_offset, 23+hole_offset, -depth])
    linear_extrude(height = 1.1*depth)
    circle(6/2);

    translate([hole_offset, 23+hole_offset, -2*depth])
    linear_extrude(height = 3*depth)
    circle(hole_diameter/2);
}

difference(){
    color("gold")
    translate([58+hole_offset, 23+hole_offset, -depth])
    linear_extrude(height = 1.1*depth)
    circle(6/2);

    translate([58+hole_offset, 23+hole_offset, -2*depth])
    linear_extrude(height = 3*depth)
    circle(hole_diameter/2);
}


// GPIO
gpio_height = 5;
gpio_width = 51;
gpio_to_hole_offset = 29;
color("gray")
    translate([hole_offset+gpio_to_hole_offset-gpio_width/2, height-hole_offset-gpio_height/2])
    linear_extrude(height = 6)
    square([gpio_width, gpio_height], center = false);


// Micro SD Card Slot
micro_sd_height = 12;
micro_sd_width = 12;
micro_sd_protrusion = -1;
color("gray")
    translate([1, 16.9-micro_sd_height/2])
    linear_extrude(height = 1.6)
    square([micro_sd_width, micro_sd_height], center = false);

// Micro SD Card
micro_sd_card_height = 11;
micro_sd_card_width = 15;
micro_sd_card_protrusion = -2;
color("red")
    translate([micro_sd_card_protrusion, 16.9-micro_sd_card_height/2, 0.5])
    linear_extrude(height = 1)
    square([micro_sd_card_width, micro_sd_card_height], center = false);


// HDMI
hdmi_height = 8;
hdmi_width = 10.42;
hdmi_protrusion = 1;
color("gray")
    translate([12.4-hdmi_width/2, -hdmi_protrusion, ])
    linear_extrude(height = 2.42)
    square([hdmi_width, hdmi_height], center = false);


// USB 0
usb_0_height = 5.5;
usb_0_width = 8;
usb_0_protrusion = 1;
color("gray")
    translate([41.4-usb_0_width/2, -usb_0_protrusion, 0])
    linear_extrude(height = 3)
    square([usb_0_width, usb_0_height], center = false);

// USB 1
usb_1_height = usb_0_height;
usb_1_width = usb_0_width;
usb_1_protrusion = usb_0_protrusion;
color("gray")
    translate([54-usb_1_width/2, -usb_1_protrusion, 0])
    linear_extrude(height = 3)
    square([usb_1_width, usb_1_height], center = false);
