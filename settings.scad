
/*
 * All units in millimeters
 */

$fn = 200;

diameter_bearing = 22;
diameter_outer = 78;
height = 5;

radius_bearing = diameter_bearing/2;
radius_outer = diameter_outer/2;

inter_bearing_margin = (diameter_outer/2 - 3/2*diameter_bearing)/2;
center_shift_bearing = diameter_bearing + inter_bearing_margin;
