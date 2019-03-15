MONO = 1;
DI = 2;
TRI = 3;
TETRA = 4;
PENTA = 5;
HEXA = 6;
HEPTA = 7;
OCTA = 8;
ENNEA = 9;
DECA = 10;
HENDECA = 11;
DODECA = 12;
TRISKAIDECA = 13;
ICOSA = 20;
ICOSIKAIHENA = 21;
TRIACONTA = 30;
HECTO = 100;
CHILIA = 1000;
MYRIA = 1000;

function x(r, dr, theta) = (r - dr)*cos(theta);

function y(r, dr, theta) = (r - dr)*sin(theta);

function z(r, dr, theta) = 0;

function rounded_ngon_points(n, r, roundedness) = let(
    interior_angle_sum = 180*(n - 2),
    alpha = interior_angle_sum/n,
    t = roundedness/tan(alpha/2),
    dr = sqrt(pow(roundedness, 2) + pow(t, 2))
) [ for (theta = [ 0 : (360/n) : 360 ])[ x(r, dr, theta), y(r, dr, theta), z(r, dr, theta) ] ];

module rounded_ngon(n, r, h, roundedness) {
    // Places children along each vertex's radial vector of the regular convex n-gon.
    hull() {
        for (point = rounded_ngon_points(n, r, roundedness)) {
            translate(point) {
                if ($children > 0) {
                    children();
                } else {
                    cylinder(r=roundedness, h=h);
                }
                // children();
            }
        }
    }
}

// Regular polygons

module pentagon(r, h, center) {
        cylinder(r=r, h=h, center=center, $fn=PENTA);    
}

module hexagon(r, h, center) {
        cylinder(r=r, h=h, center=center, $fn=HEXA);    
}

// Regular polygons with rounded verticies.

module rounded_pentagon(r, h, roundedness) {
    rounded_ngon(PENTA, r, h, roundedness) {
            if ($children > 0) {
                children();
            } else {
                cylinder(r=roundedness, h=h);
            }
    };
}

module rounded_hexagon(r, h, roundedness) {
    rounded_ngon(HEXA, r, h, roundedness) {
        if ($children > 0) {
            children();
        } else {
            cylinder(r=roundedness, h=h);
        }
    };
}
