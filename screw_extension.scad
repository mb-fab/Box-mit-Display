
include <global.scad>;

module screw_hole()
{
    // drill a hole for the screw
    cylinder(
        h = box_z,
        r = screw_hole_radius,
        center = false
        );
}

module screw_extension()
{
    // make a cylinder
    cylinder(
        h = box_z,
        r = screw_extension_radius,
        center = false
        );
}

// the drill hole must be separate
// in order to allow other modules
// to also cut away from their
// corresponding shapes
difference()
{
    screw_extension();
    screw_hole();
}
