
// all measures im mm

x = 100;
y = 80;
z = 50;

// material
material_width = 5;

// display measures
d_x = 80;
d_y = 40;

difference()
{
    // a block
    cube([x, y, z]);
    // remove the inside of the block
    translate([material_width, material_width, material_width])
        cube([x-2*material_width, y-2*material_width, z-2*material_width]);
    // make a window for the dislay
    translate([(x-d_x)/2, (y-d_y)/2, z-material_width])
        cube([d_x, d_y, material_width]);
}
