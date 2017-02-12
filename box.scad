
include <global.scad>;
use <screw_extension.scad>;

module box_with_window()
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

module box()
{
    difference()
    {
        union()
        {
            box_with_window();

            // add screw hole extensions
            screw_extension();

            translate([
                box_x,
                0
                ])
                screw_extension();

            translate([
                box_x,
                box_y
                ])
                screw_extension();

            translate([
                0,
                box_y
                ])
                screw_extension();
        }

        // drill holes in the screw extensions
        screw_hole();

        translate([
            box_x,
            0
            ])
            screw_hole();

        translate([
            box_x,
            box_y
            ])
            screw_hole();

        translate([
            0,
            box_y
            ])
            screw_hole();
    }
}

box();
