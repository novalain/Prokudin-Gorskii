% Clear all variables
clear all

% Read in image
image = imread('images/00106u.tif');

% Set level of accuracy (for size of displacement window)
% Lower level => faster
level = 1;

% Convert to double matrix
image = im2double(image);

% Compute the height of each part (just 1/3 of total)
height = floor(size(image,1)/3);

% Separate color channels
B = image(1:height,:);
G = image(height+1:height*2,:);
R = image(height*2+1:height*3,:);

% Crop images to remove 10% of each side of the image
cB = crop(B, 0.1);
cG = crop(G, 0.1);
cR = crop(R, 0.1);

% Get the displacement for each channel
% Fourth parameter 'ssd' or 'ncc' only
dispR = pyramidAlign(cG, cR, level, 'ssd');
dispB = pyramidAlign(cG, cB, level, 'ssd');

% Use circshift to shift the matrices to the correct values
newR = circshift(cR, dispR);
newB = circshift(cB, dispB);

% Add the channels to final picture
colorim = cat(3, newR, cG, newB);

% Auto crop the ugly borders
cropped = autocrop(colorim);

% Adjust white balance
finalim = adjustWhitebalance(cropped);

%%
% Show result
figure;
imshow(colorim);

figure;
imshow(cropped);

figure;
imshow(finalim);

%%

