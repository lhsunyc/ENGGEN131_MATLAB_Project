% AssignToClusters assigns each point (pixel) in an image to a cluster, based on which mean that point is closest to.
% Input;P=A 3D array with m rows, n columns and 3 layers, containing an RGB image
%       Q=A 3D array containing k rows, 1 column and 3 layers containing the colour information for each of k means.
% Output;clusters=A single output being a 2D array with m rows and n columns,
% that contains the corresponding cluster number for each pixel in the image.
% Author:Yicheng Sun
function [clusters] = AssignToClusters(A,seedMeans)
%read in image to find how many rows and columns the image has
[rows,cols,~]=size(A);
%read in seedMeans to find k value we used eg(if k=4 then r=4)
[r,~,~]=size(seedMeans);
% find means for each group
Means=reshape(seedMeans,r,3);
%find coordinates of pixels and store them into an 2D array
N=reshape(A,rows*cols,3);
%preallocate to increase running speed
D=zeros(rows*cols,r);
%calculates squared distance from each pixel to each Means value
for i=1:rows*cols
   D(i,:)=sum((N(i,:)-Means)'.^2);
end
% if there is only one seed mean then all pixels will be assign to cluster 1
if r==1
    clusters=ones(rows,cols);
else
%find witch group of means the pixel close to    
[~,I] = min(transpose(D));
%store(assign) them into clusters
clusters=reshape(I,rows,cols);
end
end

