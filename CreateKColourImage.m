% CreateKColourImage is to create a k-colour image for an image that has
% had its pixels divided into k clusters.All pixels in a given cluster will
% be recoloured using the mean colour values for that cluster.
% Inputs; clusters=A 2D array with m rows and n columns, specifying which
% cluster each pixel belongs to.
%         means=A 3D array containing k rows, 1 column and 3 layers, where
%         each row contains the mean colour values for the cluster
%         corresponding to that row number.
% Outputs:MyImage=A 3D array of unsigned 8 bit integers with m rows, n
%                 columns and 3 layers, representing an RGB image.
%Author:Yicheng Sun

function MyImage = CreateKColourImage(clusters,means)
% make means become rounded number
means=round(means);
% read in means to find how many rows it has(k value)
[rows,~,~]=size(means);
% read in clusters to find rows and columns it has
[r,c,~]=size(clusters);
% change the output from double to uint8
MyImage=zeros(r,c,3,'uint8');
for x=1:rows
% find the same element from each layer of cluster and then replace them to
% the x th rows number of means respectively,(eg. all elements that equal to
% 1 in layer 1 of cluster will be replaced to the value of 1st row number
% of layer 1 of means.) and then store these values to different
% variables(eg i for layer1;j for layer 2)
i(clusters==x)=means(x,:,1);
j(clusters==x)=means(x,:,2);
k(clusters==x)=means(x,:,3);
end
% consist the dimension of the output with clusters
MyImage(:,:,1)=reshape(i,[r,c]);
MyImage(:,:,2)=reshape(j,[r,c]);
MyImage(:,:,3)=reshape(k,[r,c]);
end