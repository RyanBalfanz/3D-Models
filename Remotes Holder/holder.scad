$fn = 24;
// $fn = 240;

height = 20;
width = 40;
thickness = 40;
shell_thickness = 20;
roundedness = 10;

module rounded_box(points, radius, height){
    hull(){
        for (p = points){
            translate(p) cylinder(r=radius, h=height);
        }
    }
}

module multiHull(){
    for (i = [1 : $children-1])
        hull(){
            children(0);
            children(i);
        }
}
 
module sequentialHull(){
    for (i = [0: $children-2])
        hull(){
            children(i);
            children(i+1);
        }
}

module remote() {
    centimeters_per_inch = 2.54;
    remote_width = 10 * 1.6 * centimeters_per_inch;
    remote_height = 10 * 0.8 * centimeters_per_inch;
    remote_thickness = 10 * 5.5 * centimeters_per_inch;
    remote_roundedness = 1;
    color("black")
    rounded_box(
        [
            [0.0*remote_width, 0, 0],
            [1.0*remote_width, 0, 0],
            [0.2*remote_width, remote_height, shell_thickness],
            [0.8*remote_width, remote_height, shell_thickness]
        ],
        remote_roundedness,
        remote_thickness
    );
}

module main() {
    // translate([0,0,10])
    // remote();
    #difference(){
        rounded_box(
            [
                [0, 0, 0],
                [width, 0, 0],
                [0.2*width, height, 0],
                [0.8*width, height, 0]
            ],
            roundedness,
            thickness
        );
        #rounded_box(
            [
                [0.0*width, 0, -thickness + 65 - 20],
                [1.0*width, 0, -thickness + 65 - 20],
                [0.2*width, height, -thickness + 65],
                [0.8*width, height, -thickness + 65]
            ],
            roundedness - 5,
            thickness
        );
    }
}

main();