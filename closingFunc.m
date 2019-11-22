function closeImage = closingFunc(image, strel, padd)
    closeImage = dilationFunc(image, strel, padd);
    closeImage = erosionFunc(closeImage, strel, padd);
end