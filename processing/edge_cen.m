function [img_edge, m, k, x_edge,y_edge] = edge_cen(img_crop)

midh = ceil((size(img_crop,1)/2) + 10);
midw = ceil((size(img_crop,2)/2) + 10);
img_edge = ones(size(img_crop,1),size(img_crop,2));

% RGB segmentation
for i = 1:size(img_crop,1)
    for j = 1:size(img_crop,2)
        if((img_crop(i,j,2) > 110)&&(img_crop(i,j,1) < 110)&& (img_crop(i,j,3) < 110))
            img_edge(i,j) = 0;
        end
        if((img_crop(i,j,1) > 160)&&(img_crop(i,j,2) < 100)&& (img_crop(i,j,3) < 100))
            img_edge(i,j) = 0.5;
        end
        if((img_crop(i,j,3) > 95)&&(img_crop(i,j,2) > 95)&& (img_crop(i,j,1) < 95))
            img_edge(i,j) = 0.33;
        end
    end
end

% Removing isolated detections
str = strel('disk',3);
img_edge = imopen(img_edge,str);
str = strel('disk',5);
img_edge = imclose(img_edge,str);

% Left border
for i = 1:size(img_edge,2)
    if(img_edge(midh,i) > 0.5)
        x_edge = i-1;
        break
    end
end

% Top border
for i = 1:size(img_edge,1)
    if(img_edge(i,midw) > 0.5)
        y_edge = i-1;
        break
    end
end

% Centers of squares
x_size = (size(img_edge,2) - (2 * x_edge)) / 8;
y_size = (size(img_edge,1) - (2 * y_edge)) / 8;
k = x_size / 2 : x_size :(16 * x_size) / 2;
k = ceil(k + x_edge);
m = y_size / 2 : y_size :(16 * y_size) / 2;
m = ceil(m + y_edge);
for i = m
    for j = k
        img_edge(i,j) = 0; 
    end
end
end