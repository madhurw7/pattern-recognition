    clear;
close all;

I = imread('unnamed.png');
subplot(2,3,1);
imshow(I);
I2 = rgb2gray(I);


m = size(I, 1);
n = size(I, 2);


figure;
temp = I2;
slices = zeros(m,n,8);

for i = 1:8
    slices(:,:,i) = mod(temp, 2);
    temp = floor(temp./2);
    subplot(2,4,i);
    colormap(gray);
    imshow(slices(:,:,i));
end