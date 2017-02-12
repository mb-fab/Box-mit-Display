
include <global.scad>;
use <box.scad>;

module slice(i)
{
    intersection()
    {
        box();
        translate([0, 0, i*material_width])
            cube([100, 100, material_width]);
    }
}

module slices(n)
{
    for (i = [0 : n])
    {
        translate([i*120, 0, -i*material_width])
            slice(i);
    }
}

projection() slices(9);
