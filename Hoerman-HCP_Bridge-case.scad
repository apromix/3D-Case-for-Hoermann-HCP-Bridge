/*
3D Case for Hoermann HCPBridge assembled on universal PCB
Project: https://github.com/Gifford47/HCPBridgeMqtt

Author: Apromix
Date: 9th August 2023
Version: 20230809
*/

x=70; // PCB size
y=50; // PCB size
z=20; // PCB with Electronic component size
thickness=4;
thickness_z=2;
screw_hole=1.5;
screw_hole_offset=2.9;
screw_hole_depth=5;
antenna_hole=6.2;
PCB_distance=3;
PCB_thickness=1.2;

$fn= $preview ? 16 : 40; // number of fragments

//// 1st object: Body
difference(){
// case
  cube([x+2*thickness,y+2*thickness,z+thickness_z]);

// remove inside space
  translate([thickness, thickness, thickness_z]) cube([x,y,z]);

// space for terminal block
  translate([0,thickness+2,thickness_z+PCB_distance+PCB_thickness])
    cube([thickness,22,z-PCB_distance-PCB_thickness]);

// space for USB cable
  translate([0,thickness+29,thickness_z+z-10])
    cube([thickness,12,10]);

// space for build-in antenna
  translate([x+thickness,thickness+24,thickness_z+13])
    cube([thickness,22,z-13]);

// hole for external antenna
  translate([x+thickness+thickness/2,thickness+18,thickness_z+10])
    difference(){
      rotate([0,90,0])
        cylinder(d=antenna_hole,h=thickness, center=true);
      translate([0 ,0,-antenna_hole/2+antenna_hole/10/2])
        cube([thickness,antenna_hole,antenna_hole/10], center=true);
    }
   
   
//    rotate([0,90,0]) cylinder(d=antenna_hole,h=thickness, center=true); // hole for external antenna

// 4xscrew hole
  translate([thickness/2,thickness/2,thickness_z+z-screw_hole_depth/2])
    cylinder(d=screw_hole,h=screw_hole_depth, center=true);
  translate([thickness/2,y+thickness+thickness/2,thickness_z+z-screw_hole_depth/2])
    cylinder(d=screw_hole,h=screw_hole_depth, center=true);
  translate([x+thickness+thickness/2,thickness/2,thickness_z+z-screw_hole_depth/2])
    cylinder(d=screw_hole,h=screw_hole_depth, center=true);
  translate([x+thickness+thickness/2,y+thickness+thickness/2,thickness_z+z-screw_hole_depth/2])
    cylinder(d=screw_hole,h=screw_hole_depth, center=true);
}
// 4x distance corner
difference(){
  translate([thickness,thickness,thickness_z])
    cube([2*screw_hole_offset,2*screw_hole_offset,PCB_distance]);
  translate([thickness+screw_hole_offset,thickness+screw_hole_offset,thickness_z+3/2])
    cylinder(d=screw_hole,h=3, center=true);
}
difference(){
  translate([thickness,thickness+y-2*screw_hole_offset,thickness_z])
    cube([2*screw_hole_offset,2*screw_hole_offset,PCB_distance]);
  translate([thickness+screw_hole_offset,thickness+y-2*screw_hole_offset+screw_hole_offset,thickness_z+PCB_distance/2])
    cylinder(d=screw_hole,h=PCB_distance, center=true);
}
difference(){
  translate([thickness+x-2*screw_hole_offset,thickness,thickness_z])
    cube([2*screw_hole_offset,2*screw_hole_offset,PCB_distance]);
  translate([thickness+x-2*screw_hole_offset+screw_hole_offset,thickness+screw_hole_offset,thickness_z+PCB_distance/2])
    cylinder(d=screw_hole,h=PCB_distance, center=true);
}
difference(){
  translate([thickness+x-2*screw_hole_offset,thickness+y-2*screw_hole_offset,thickness_z])
    cube([2*screw_hole_offset,2*screw_hole_offset,PCB_distance]);
  translate([thickness+x-2*screw_hole_offset+screw_hole_offset,thickness+y-2*screw_hole_offset+screw_hole_offset,thickness_z+PCB_distance/2]) cylinder(d=screw_hole,h=PCB_distance, center=true);
}

//// 2nd object: Lid
translate([0,y+2*thickness+10,0])
  difference(){
    cube([x+2*thickness,y+2*thickness,thickness_z]);
    translate([thickness/2,thickness/2,thickness_z/2])
      cylinder(d1=1.2*screw_hole, d2=2.4*screw_hole,h=thickness_z, center=true);
    translate([thickness/2,y+thickness+thickness/2,thickness_z/2])
      cylinder(d1=1.2*screw_hole, d2=2.4*screw_hole,h=thickness_z, center=true);
    translate([x+thickness+thickness/2,thickness/2,thickness_z/2])
      cylinder(d1=1.2*screw_hole, d2=2.4*screw_hole,h=thickness_z, center=true);
    translate([x+thickness+thickness/2,y+thickness+thickness/2,thickness_z/2])
      cylinder(d1=1.2*screw_hole, d2=2.4*screw_hole,h=thickness_z, center=true);
// logo
    translate([x/2+thickness,y*2/3+thickness,thickness_z/2]) linear_extrude(thickness_z/2) text("Hörmann", halign="center", valign="center", size=7, font="Tlwg Mono:style=Bold");
    translate([x/2+thickness,y*1/3+thickness,thickness_z/2]) linear_extrude(thickness_z/2) text("HCP Bridge", halign="center", valign="center", size=7, font="Tlwg Mono:style=Bold");
  }