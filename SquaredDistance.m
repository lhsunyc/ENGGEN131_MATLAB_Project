% SquaredDistance calculates the square of the distance between two points in 3D space
% Input;P=An array containing three elements representing a point in 3D space
%       Q=An array containing three elements representing a second point in 3D space
% Output;squaredDistance=the square of the distance between the two points in 3D space
% Author:Yicheng Sun
function squaredDistance = SquaredDistance(P,Q)
% squaredDistance=(P(1)-Q(1))^2+(P(2)-Q(2))^2+(P(3)-Q(3))^2; find the
% squardistance between two points.
squaredDistance=(sum((P-Q).^2));
end