hexagonal_prism_body:
	openscad -o hexagonal_prism_body.stl -D 'part="body"' hexagonal_prism.scad

hexagonal_prism_lid:
	openscad -o hexagonal_prism_lid.stl -D 'part="lid"' hexagonal_prism.scad

hexagonal_prism:
	openscad -o hexagonal_prism.stl hexagonal_prism.scad
