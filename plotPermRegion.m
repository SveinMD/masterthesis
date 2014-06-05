function [] = plotPermRegion(filename, field, c)

perm = getfield(load(filename),field);
perm_region = perm(c(1):c(2),c(3):c(4),c(5):c(6));
[x,y,z] = meshgrid(c(3):c(4),c(1):c(2),c(6):-1:c(5));
slice(x,y,z,log(perm_region),[c(3),c(4)],[c(1),c(2)],[c(5),c(6)]);

axis equal;
shading flat;
end