A=imread("cameraman.tif");
imshow(A);
%% 
B=imread("peppers.png");
imshow(B);
%%
C = rgb2gray(B);
imshow(C);
%% 
D = im2double(C);
%%
subplot(2,2,1);
R=B(:,:,1);
imshow(R)
title("Red Channel")
subplot(2,2,2);
G=B(:,:,2);
imshow(G)
title("Green Channel")
subplot(2,2,3);
V=B(:,:,3);
imshow(V)
title("Blue Channel")
subplot(2,2,4);
Q=rgb2gray(B);
imshow(Q)
title("Gray Channel")

imwrite(Q,"image.png")
