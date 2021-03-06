/*
* Copyright (c) 1994, Regents of the University of California
* All rights reserved.
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*        notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of the University of California, Berkeley nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS" AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE REGENTS AND CONTRIBUTORS BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// TomKeddie (github@bronwenandtom.com)

hole_diameter=3.3;
corner_radius=5;
edge_offset=5;
pmod_overhang=103-80;
x_hole_spacing_main=77-33;
x_hole_spacing_pmod=92-33;
y_hole_spacing_main=63-32;
y_hole_spacing_pmod=55-40;

module main_holes() {
        translate([+x_hole_spacing_main/2, +y_hole_spacing_main/2]) circle(d=hole_diameter, $fn=48);
        translate([+x_hole_spacing_main/2, -y_hole_spacing_main/2]) circle(d=hole_diameter, $fn=48);
        translate([-x_hole_spacing_main/2, +y_hole_spacing_main/2]) circle(d=hole_diameter, $fn=48);
        translate([-x_hole_spacing_main/2, -y_hole_spacing_main/2]) circle(d=hole_diameter, $fn=48);
}

module pmod_holes() {
        translate([+x_hole_spacing_main/2+(x_hole_spacing_pmod-x_hole_spacing_main), +y_hole_spacing_pmod/2]) circle(d=hole_diameter, $fn=48);
        translate([+x_hole_spacing_main/2+(x_hole_spacing_pmod-x_hole_spacing_main), -y_hole_spacing_pmod/2]) circle(d=hole_diameter, $fn=48);
}

module plate_no_pmod() {
    difference() {
        hull() {
            translate([+(x_hole_spacing_main/2+edge_offset), +(y_hole_spacing_main/2+edge_offset)]) circle(r=corner_radius, $fn=48);
            translate([+(x_hole_spacing_main/2+edge_offset), -(y_hole_spacing_main/2+edge_offset)]) circle(r=corner_radius, $fn=48);
            translate([-(x_hole_spacing_main/2+edge_offset), +(y_hole_spacing_main/2+edge_offset)]) circle(r=corner_radius, $fn=48);
            translate([-(x_hole_spacing_main/2+edge_offset), -(y_hole_spacing_main/2+edge_offset)]) circle(r=corner_radius, $fn=48);
        }

        main_holes();
    }
}

module plate_with_pmod() {
    difference() {
        hull() {
            translate([+(x_hole_spacing_main/2+edge_offset+pmod_overhang), +(y_hole_spacing_main/2+edge_offset)]) circle(r=corner_radius, $fn=48);
            translate([+(x_hole_spacing_main/2+edge_offset+pmod_overhang), -(y_hole_spacing_main/2+edge_offset)]) circle(r=corner_radius, $fn=48);
            translate([-(x_hole_spacing_main/2+edge_offset), +(y_hole_spacing_main/2+edge_offset)]) circle(r=corner_radius, $fn=48);
            translate([-(x_hole_spacing_main/2+edge_offset), -(y_hole_spacing_main/2+edge_offset)]) circle(r=corner_radius, $fn=48);
        }

        main_holes();
        pmod_holes();
    }
}

//plate_no_pmod();
plate_with_pmod();