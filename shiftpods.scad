// Example
// scale_factor = 1/75;
// color("lightgray") scale(scale_factor) shiftpod_v20();

// https://shiftpod.com/shiftpod/shelter/shiftpod-v20
// OPEN SIZE: 12'9" Hexagon (Corner to Corner) X 6'7" feet at center (5'10" at shoulder)
// 106.9721795633 SQUARE FEET
// STOWED SIZE: 76″ x 13″ x 13″
// WEIGHT: 67 Pounds
module shiftpod_v20() {
    mm_per_inch = 25.4;
    mm_per_foot = 12 * mm_per_inch;

    sp_radius =  mm_per_foot * (12 + (9/12)) / 2;
    sp_height = mm_per_foot * (6 + (7/12));
    sp_height_shoulder =  mm_per_foot * (5 + (10/12));

    union(){
        // body
        cylinder(r=sp_radius, h=sp_height_shoulder, $fn=6);
        // roof
        translate([0, 0, sp_height_shoulder])
            cylinder(r1=sp_radius, r2=0, h=sp_height-sp_height_shoulder, $fn=6);
    }
}
