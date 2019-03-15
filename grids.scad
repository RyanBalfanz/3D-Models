// https://stackoverflow.com/questions/20734438/algorithm-to-generate-a-hexagonal-grid-with-coordinate-system
// https://tbswithunity3d.wordpress.com/2012/02/21/hexagonal-grid-generating-the-grid/
module hexagonal_grid(radius, inner_radius, padding, size, height) {
    xOff = cos(30) * (radius + padding);
    yOff = sin(30) * (radius + padding);
    half = floor(size / 2);

    for (row = [0 : 1 : size - 1]){
        cols = size - abs(row - half);
        for (col = [0 : 1 : cols - 1]) {
            x = (0 + xOff * (col * 2 + 1 - cols));
            y = (0 + yOff * (row - half) * 3);
            z = 0;
            translate([x, y, z]) {
                children();
            }
        }
    }
}
