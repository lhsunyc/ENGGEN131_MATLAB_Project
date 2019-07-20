% GetRGBValuesForPoints function returns the RGB colour values for a list
% of specified points from an image.
% Inputs:
% A = A 3D image array from which to select points from
% points = A 2D array of k rows and 2 columns identifying which points (i.e.
%         pixels) to extract colour values for.
% Outputs:
% seedMeans = a 3D array, containing k rows, 1 column and 3 layers,
%             representing a list of k points from the image.
% Author:Yicheng Sun
function [seedMeans] = GetRGBValuesForPoints(A,points)
%read in points(output from first function) to find rows and columns for each random selected point eg
%if points=[1 2;3 4], then the row for these points are[1 3] columns are [2 4]
rows=points(:,1);
cols=points(:,2);
% preallocate to increase running speed
Colours=zeros(length(rows),1,3);
%extract the RGB values for the pixel in rows and columns(Select specified
%points from each color group based on random selected points).
for i=1:length(rows)
    Colours(i,1,:)=A(rows(i),cols(i),:);
end
%create a 3D array of seedMeans to return containing Colours
seedMeans=Colours;
end

