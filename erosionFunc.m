function erodedImage = erosionFunc(image, strel, padd)
    [mx, ~] = size(strel);
    [x, y] = size(image);
    offsetParam = (mx-1)/2;
    
    if (padd)
            z = zeros(x,offsetParam);
            image = [z image z];
            [x, y] = size(image);
            z = zeros(offsetParam,y);
            image = [z; image; z];
            [x, y] = size(image);
    end
    
    erodedImage = zeros(size(image));
    for i = offsetParam+1:x-offsetParam
        for j = offsetParam+1:y-offsetParam
            local = image(i-offsetParam: i+offsetParam, j-offsetParam: j+offsetParam);
            erodedImage(i,j) = min(min(strel == (strel & local)));
        end
    end
    
    if(padd)
        %removePadding
        erodedImage = erodedImage(offsetParam+1:x-offsetParam, offsetParam+1:y-offsetParam);
    end
    
    
    

end