%% Crop an image

imgGray = imread('cameraman.tif');
imshow(imgGray);
b = imcrop(imgGray);

%% Resize an image

c = imresize(imgGray, [150,150]);
d = imshow(c);

%% rotation 

e = imrotate(imgGray,90);
f = imshow(e);


