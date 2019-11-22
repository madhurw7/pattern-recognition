clear all;
close all;

a = false(50,50);
a(20:30, 20:30) = true;


strel = [0 0 1 0 0;
         0 1 1 1 0;
         1 1 1 1 1;
         0 1 1 1 0;
         0 0 1 0 0]; %strel should also be 0/1
[mx, my] = size(strel); 

padd = input("Padding? 1/0");
[x, y] = size(a);
%disp("x = "); disp(x);
%disp("y = "); disp(y);

offsetParam = (mx-1)/2;

if (padd == 1)
    for i = 1:offsetParam
   
        z = zeros(x,1);
        a = [z a z];
        [x, y] = size(a);
        z = zeros(1,y);
        a = [z; a; z];
        [x, y] = size(a);
    end
end
b = a;


for i = offsetParam+1:x-offsetParam
    for j = offsetParam+1:y-offsetParam
        
        local = a(i-offsetParam: i+offsetParam, j-offsetParam: j+offsetParam);
        b(i,j) = min(min(strel == (strel & local)));
        
        %Dilation b(i,j) = max(max(strel & local))
        
        
    end
end

figure(1);
subplot(221);
imshow(a);
subplot(222);
imshow(strel);
subplot(223);
imshow(b);
