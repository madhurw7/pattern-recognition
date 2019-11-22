function openImage = openingFunc(image, strel, padd)
    openImage = erosionFunc(image, strel, padd);
    openImage = dilationFunc(openImage, strel, padd);
end