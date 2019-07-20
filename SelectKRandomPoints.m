% SelectKRandomPoints function generates a list of k randomly selected
% pixels from an image¡£
% Inputs:A= A 3D image array from which to select points from
%        k= The number of points to randomly select
% Outputs:points= a 2D array, containing k rows and 2 columns, representing
% k randomly selected points (pixels)¡£
% Author:Yicheng Sun

function  [points] = SelectKRandomPoints(A,k)
% Read in image
[rows,cols,~]=size(A);
% Generate a series of unrepeated random numbers(indicate the i th number
% from the image)and then select k number of them to be used.
i=randperm(rows*cols,k);
%To get the row-column equivalent of a linear index,use ind2sub function
[rows,cols] = ind2sub(size(A), i);
% Generate k randomly selected points (pixels).
points=[rows;cols]';
end

