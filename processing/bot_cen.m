function [bot_centroid, bot] = bot_cen(img_edge)

bot = ones(size(img_edge,1),size(img_edge,2));

% Segment bot
for i = 1:size(bot,1)
    for j = 1:size(bot,2)
        if (img_edge(i,j) == 0.33)
            bot(i,j) = 0;
        end
    end
end

% Removingving isolated detections
str = strel('disk',3);
bot = imopen(bot,str);
str = strel('disk',1);
bot = imclose(bot,str);

flag = 0;
x_val = 0;
y_val = 0;

% Bot centroid
for i = 1:size(bot,1)
    for j = 1:size(bot,2)
        if(bot(i,j) == 0)
            flag = flag + 1;
            x_val = x_val + i;
            y_val = y_val + j;  
        end
    end
end

bot_centroid = [x_val/flag y_val/flag];

end