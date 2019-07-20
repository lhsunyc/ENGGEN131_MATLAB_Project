% UpdateMeans calculate the mean values for each cluster
% Input;A= A 3D array with m row, n columns and 3 layers, containing an RGB image
%       k= A single value, k, specifying how many clusters there are.
%       clusters= A 2D array with m rows and n columns specifying which
%       cluster each pixel belongs to.
% Output;means=a 3D array containing k rows, 1 column and 3 layers,
% containing the mean values for each cluster.
% Author:Yicheng Sun
function means = UpdateMeans(A,k,clusters)
% precllocate to increase running speed
means=zeros(k,1,3);
%start loop for means
for i=1:k
    % identify data in same cluster(eg i=1 means all cluster 1)
    B = (clusters==i);
    for j=1:3
        %average all the colour values for all pixels from k clusters
        means(i,:,j)=(sum(sum(A(:,:,j).*B)/nnz(B)));
    end
end
end