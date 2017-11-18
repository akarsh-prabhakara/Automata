function img_crop = crop(img_gray,img)

midh = ceil((size(img_gray,1)/2) + 10);
midw = ceil((size(img_gray,2)/2) + 10);
x_max = size(img_gray,2);
x_min = 1;
y_min = 1;
y_max = size(img_gray,1);

% Detect left vertical green line 
for i = 1:size(img,2)
    if((img(midh,i,2) > 110)&&(img(midh,i,1) < 110)&& (img(midh,i,3) < 110))
        x_min = i;
        break
    end
end

% Detect right vertical green line
for i = size(img,2):-1:1
    if((img(midh,i,2) > 110)&&(img(midh,i,1) < 110)&& (img(midh,i,3) < 110))
        x_max = i;
        break
    end
end

% Detect top horizontal green line
for i = 1:size(img,1)
    if((img(i,midw,2) > 110)&&(img(i,midw,1) < 110)&& (img(i,midw,3) < 110))
        y_min = i;
        break
    end
end

% Detect bottom horizontal green line
for i = size(img,1):-1:1
    if((img(i,midw,2) > 110)&&(img(i,midw,1) < 110)&& (img(i,midw,3) < 110))
        y_max = i;
        break
    end
end

width = x_max - x_min;
height = y_max - y_min;
img_crop = imcrop(img,[x_min y_min width height]);

end