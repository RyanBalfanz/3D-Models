$fn=300;

echo(version=version());

corner_radius = 3.0;
depth = 1.6;
height = 30;
hole_diameter = 2.75;
hole_offset = 3.5;
hole_to_hole = 58;
usb_receptacle_height = 5.5;
usb_receptacle_protrusion = 1;
usb_receptacle_width = 8;
width = 65;

module pcb() {
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
}

module gpio_header() {
    gpio_height = 5;
    gpio_width = 51;
    gpio_to_hole_offset = 29;
    color("gray")
    translate([hole_offset+gpio_to_hole_offset-gpio_width/2, height-hole_offset-gpio_height/2])
    linear_extrude(height = 6)
    square([gpio_width, gpio_height], center = false);
}

module micro_sd_card_slot() {
    micro_sd_card_slot_height = 12;
    micro_sd_card_slot_width = 12;
    micro_sd_protrusion = -1;
    color("gray")
    translate([1, 16.9-micro_sd_card_slot_height/2])
    linear_extrude(height = 1.6)
    square([micro_sd_card_slot_width, micro_sd_card_slot_height], center = false);
}

module micro_sd_card(overfill=0) {
    micro_sd_card_height = 11;
    micro_sd_card_width = 15;
    micro_sd_card_protrusion = -2;
    color("red")
    translate([micro_sd_card_protrusion-overfill, 16.9-micro_sd_card_height/2, 0.5])
    linear_extrude(height = 1)
    square([micro_sd_card_width+overfill, micro_sd_card_height], center = false);
}

module hdmi_receptacle(overfill=0) {
    hdmi_height = 8;
    hdmi_width = 10.42;
    hdmi_protrusion = 1;
    color("gray")
        translate([12.4-hdmi_width/2, -hdmi_protrusion-overfill, ])
        linear_extrude(height = 2.42)
        square([hdmi_width, hdmi_height+overfill], center = false);
}

module usb_receptacle_0(overfill=0) {
    usb_0_height = usb_receptacle_height;
    usb_0_width = usb_receptacle_width;
    usb_0_protrusion = usb_receptacle_protrusion;
    color("gray")
        translate([41.4-usb_0_width/2, -usb_0_protrusion-overfill, 0])
        linear_extrude(height = 3)
        square([usb_0_width, usb_0_height+overfill], center = false);
}

module usb_receptacle_1(overfill=0) {
    usb_1_height = usb_receptacle_height;
    usb_1_width = usb_receptacle_width;
    usb_1_protrusion = usb_receptacle_protrusion;
    color("gray")
        translate([54-usb_1_width/2, -usb_1_protrusion-overfill])
        linear_extrude(height = 3)
        square([usb_1_width, usb_1_height+overfill], center = false);
}

module rpi_zero_w(micro_sd_card=true, gpio_header=true, overfill=0) {
    pcb();
    if (gpio_header) {
        gpio_header();
    }
    micro_sd_card_slot();
    if (micro_sd_card) {
        micro_sd_card(overfill);        
    }
    hdmi_receptacle(overfill);
    usb_receptacle_0(overfill);
    usb_receptacle_1(overfill);
}

module main() {
    rpi_zero_w(micro_sd_card=true, gpio_header=true, overfill=0);
}

// main();