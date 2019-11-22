function skeleton = skeletize(image, strel)
k = 1;
Sk(:,:,1) = image; %Dummy Value just to start loop
x  = true;
while (x || max(max(Sk(:, :, k-1))) ~= 0)
    x = false;
    kErodedImage = kErosionFunc(image, strel, 1, k-1);
    Sk(:, :, k) = kErodedImage & ~openingFunc(kErodedImage, strel, 1);
    k =  k + 1;
end
[~,~,n] = size(Sk);
skeleton = zeros(size(image));
for i = 1:n
    skeleton = skeleton | Sk(:, :, i);
end


end
