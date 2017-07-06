
include <settings.scad>;

module bearing_inner()
{
    cylinder(r=radius_bearing+inter_bearing_margin, h=height, center=true);
}

module hole_inner()
{
    cylinder(r=radius_bearing, h=height+1, center=true);
}

module bearing_outer()
{
    translate([center_shift_bearing, 0, 0])
    bearing_inner();

    translate([center_shift_bearing/2, 0, 0])
    cube([
        center_shift_bearing,
        diameter_bearing + inter_bearing_margin,
        height
        ], center=true);
}

module hole_outer()
{
    translate([center_shift_bearing, 0, 0])
    hole_inner();
}

module fidget_spinner_positive()
{
    bearing_inner();
    bearing_outer();
    rotate(120)
    bearing_outer();
    rotate(-120)
    bearing_outer();
}

module fidget_spinner_holes()
{
    hole_inner();
    hole_outer();
    rotate(120)
    hole_outer();
    rotate(-120)
    hole_outer();
}

module fidget_spinner_inner_rounding()
{
    rotate(60)
    hole_outer();
    rotate(180)
    hole_outer();
    rotate(300)
    hole_outer();
}

module fidget_spinner()
{
    difference()
    {
        fidget_spinner_positive();
        fidget_spinner_holes();
        fidget_spinner_inner_rounding();
    }
}

fidget_spinner();
