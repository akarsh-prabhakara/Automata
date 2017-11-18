function [dest_centroid, dest] = dest_cen(img_edge)

dest = ones(size(img_edge,1),size(img_edge,2));

% Segment destination square
for i = 1:size(dest,1)
    for j = 1:size(dest,2)
        if (img_edge(i,j) == 0.5)
            dest(i,j) = 0;
        end
    end
end

% Removing isolated detections
str = strel('disk',3);
dest = imopen(dest,str);
str = strel('disk',5);
dest = imclose(dest,str);

% Destination square centroid
flag = 0;
x_val = 0;
y_val = 0;
for i = 1:size(dest,1)
    for j = 1:size(dest,2)
        if(dest(i,j) == 0)
            flag = flag + 1;
            x_val = x_val + i;
            y_val = y_val + j;  
        end
    end
end

dest_centroid = [x_val/flag y_val/flag];

end
