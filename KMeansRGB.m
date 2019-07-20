% KMeansRGB partition the points in an image into k clusters, using the
% k-means algorithm to do so.
% Input;
% A= A 3D array with m rows, n columns and 3 layers, containing an RGB image.
% seedmeans= A 3D array containing k rows, 1 column and 3 layers,
% containing the seed mean values which will be used to initialise the k-means algorithm.
% N=The maximum number of iterations to perform.
% Output;
% means=A 3D array containing k rows, 1 column and 3 layers, where each row
%        contains the mean colour values for the cluster corresponding to
%        that row number.
% clusters= A 2D array with m rows and n columns specifying which cluster
% each pixel belongs to.
% Author:Yicheng Sun
function [clusters, means] = KMeansRGB(A,seedMeans,maxIterations)
% read im seedMeans to find how many rows it has
[rows,~,~]=size(seedMeans);
% assign k to rows number(how many number we randomly selected)
k=rows;
% start loop between Assignment step & Update step
for i=1:maxIterations-1
    [clusters] = AssignToClusters(A,seedMeans);% Assignment step
    means = UpdateMeans(A,k,clusters);% Update step
    if seedMeans==means % stop when converged
        break
    end
    seedMeans=means;% replace seedMeans to means to loop again
end
% when rechaed the maximium iteration,run one more time to check whether
% means are converged.If so,then means are converged otherwise a warning
% message will be displayed says it is still not converged after maximium
% iterations are reched.
[clusters] = AssignToClusters(A,seedMeans);% Assignment step
means = UpdateMeans(A,k,clusters);% Update step
if any(seedMeans~=means) %If it is stll not converged
    disp('Maximum number of iterations reached before convergence was achieved')
end
end