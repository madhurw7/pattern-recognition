function dilatedImage = dilationFunc(image, strel, padd)
    %Assuming Symmetric Filter Otherwise needs to be reflected
    [mx, ~] = size(strel);
    [x, y] = size(image);
    offsetParam = (mx-1)/2;
    
    if (padd == 1)
        for i = 1:offsetParam
            z = zeros(x,1);
            image = [z image z];
            [x, y] = size(image);
            z = zeros(1,y);
            image = [z; image; z];
            [x, y] = size(image);
        end
    end
    
    dilatedImage = zeros(size(image));
    for i = offsetParam+1:x-offsetParam
        for j = offsetParam+1:y-offsetParam
            local = image(i-offsetParam: i+offsetParam, j-offsetParam: j+offsetParam);
            dilatedImage(i,j) = max(max((strel & local)));
        end
    end
    
     if(padd)
        %removePadding
        dilatedImage = dilatedImage(offsetParam+1:x-offsetParam, offsetParam+1:y-offsetParam);
    end
    

end


