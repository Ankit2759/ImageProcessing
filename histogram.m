%% HISTOGRAM AND IMAGE ENHANCEMENT EXPERIMENT

%% Read and display the image
A = imread('cameraman.tif');

subplot(1,3,1);
imshow(A); 
title('Original Image');

% Manual Histogram Calculation
[r,c] = size(A);
H = zeros(1,256);
for i = 1:r
    for j = 1:c
        p = A(i,j);
        H(1,p+1) = H(1,p+1) + 1;
    end
end
subplot(1,3,2);
bar(0:255, H,'red');
title('Histogram of Image');
xlabel('Pixel Intensity (0–255)');
ylabel('Pixel Count');

% Histogram using built-in function
subplot(1,3,3);
 
imhist(A); 
title('Histogram using imhist');

%% Brightness and Contrast Enhancement
I = imread('peppers.png');
grayimg = rgb2gray(I);
B = input('Enter brightness value: ');
Bright = grayimg + B;
C = input('Enter contrast value: ');
Contr = C * double(Bright);

subplot(2,3,1); 
imshow(grayimg); 
title('Original Image');
subplot(2,3,2); 
imshow(uint8(Bright));
title('Bright Image');
subplot(2,3,3); 
imshow(uint8(Contr)); 
title('Contrast Image');
subplot(2,3,4); 
imhist(grayimg); 
title('Histogram of Original');
subplot(2,3,5); 
imhist(uint8(Bright)); 
title('Histogram of Bright');
subplot(2,3,6); 
imhist(uint8(Contr)); 
title('Histogram of Contrast');

%% PDF and CDF Calculation
I = imread('cameraman.tif');
A = imhist(I);
pdf = A / sum(A);
cdf = cumsum(pdf);
figure;
subplot(2,2,1); 
imshow(I); 
title('Original Image');
subplot(2,2,2); 
bar(A); 
title('Histogram');
subplot(2,2,3);
bar(pdf); 
title('PDF');
subplot(2,2,4); 
bar(cdf); 
title('CDF');

%% Transformation using CDF (Histogram Equalization)
[rx, cx] = size(I);
trans = zeros(rx, cx);
for i = 1:rx
    for j = 1:cx
        trans(i,j) = cdf(I(i,j)+1) * 255;
    end
end
figure;
subplot(1,2,1); 
imshow(uint8(trans)); 
title('Transformed Image');
subplot(1,2,2); 
imhist(uint8(trans)); 
title('Histogram of Transformed');

%% Negative Image
W = 255 - I;
figure;
subplot(1,3,1); 
imshow(W); 
title('Negative Image');
subplot(1,3,2); 
imhist(I); 
title('Original Histogram');
subplot(1,3,3); 
imhist(W); 
title('Negative Histogram');

%% Log Transformation
c = 1;
logTrans = c * log(1 + double(I));
logTrans = uint8(logTrans / max(logTrans(:)) * 255);
figure;
subplot(1,2,1); 
imshow(logTrans); 
title('Log Transformed Image');
subplot(1,2,2); 
imhist(logTrans); 
title('Histogram of Log Transform');




