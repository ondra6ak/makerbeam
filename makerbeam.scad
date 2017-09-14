// cube([10, 10, 1], center=true);

$fn = 50;

module slot(l) {
	minkowski() {
		polyhedron(points=[[-0.85, 0, 0],
						   [0.85, 0, 0],
						   [-2.85, 1.85, 0],
						   [2.85, 1.85, 0],
						   [-0.85, 0, l/2],
						   [0.85, 0, l/2],
						   [-2.85, 1.85, l/2],
						   [2.85, 1.85, l/2]],
				   faces=[[0, 1, 3, 2],
				   		  [6, 7, 5, 4],
				   		  [4, 5, 1, 0],
				   		  [5, 7, 3, 1],
				   		  [2, 3, 7, 6],
				   		  [4, 0, 2, 6]]);
		translate([0, 0.15, 0]) cylinder(h=l/2, r=0.15);
	}
	translate([-1.5, 2, 0]) cube([3, 1.1, l]);
}

module makerbeam(l) {
	difference() {
		translate([0, 0, l/2]) cube([10, 10, l], center=true);
		for (i = [0:3]) {
			rotate([0, 0, 90 * i]) translate([0, 2, 0]) slot(l);
		}
		cylinder(h=l, r=1.25);
	}
}

makerbeam(10);