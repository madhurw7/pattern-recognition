function kEroded = kErosionFunc(image, strel, padd, k)
    kEroded = image;
    for i = 1:k
        kEroded = erosionFunc(kEroded, strel, padd);
    end

end