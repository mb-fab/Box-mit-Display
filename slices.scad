
include <global.scad>;
use <box.scad>;

module slice(i)
{
    projection(cut=true)
        translate([0, 0, -i*material_width])
            box();
}

module slices()
{
    // number of slices
    n = ceil(box_y / material_width);

    for (i = [0 : n])
    {
        translate([i*(total_x+1), 0])
            slice(i);
    }
}

slices();
