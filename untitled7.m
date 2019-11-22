im = imageWP;

figure;
subplot(221);
imshow(im);
subplot(222);
imshow(strel);
subplot(223);
imshow(skeletize(im, strel));