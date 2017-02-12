
include <global.scad>;

module box()
{
    difference()
    {
        // begin with a block
        cube([
            box_x,
            box_y,
            box_z
            ]);

        // remove the inside of the block
        translate([
            material_width,
            material_width,
            material_width
            ])
            cube([
                box_x - 2*material_width,
                box_y - 2*material_width,
                box_z - 2*material_width
                ]);

        // make a window for the dislay
        translate([
            (box_x - display_x) / 2,
            (box_y - display_y) / 2,
            box_z-material_width
            ])
            cube([
                display_x,
                display_y,
                material_width
                ]);
    }
}

box();
