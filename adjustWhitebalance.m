function adjustedImage = adjustWhitebalance( img )
% To adjust the white balance of the color channels RGB to be more
% balanced
% img - input image
% Get color channels
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Ideal values for RGB (equal)
Ir = mean(mean(G));
Ig = mean(mean(G));
Ib = mean(mean(G));

% Take the mean values for every color channel
aveR = mean(mean(R));
%aveG = mean(mean(G));
aveB = mean(mean(B));

% Calculate the difference between ideal RGB and our average
dr = Ir - aveR;
%dg = Ig - aveG;
db = Ib - aveB;

% Add the difference to every color channel to compensate
newR = R + dr;
%newG = G + dg;
newB = B + db;

adjustedImage = img;
adjustedImage(:,:,1) = newR;
adjustedImage(:,:,2) = G;
adjustedImage(:,:,3) = newB;
end

