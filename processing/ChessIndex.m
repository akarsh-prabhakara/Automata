function [Xindex, Yindex] = ChessIndex(pixelX, pixelY, ValX, ValY, edgelength)

% Convert image data to a form that can be fed to BFS

E=edgelength/16;

for i=1:8
    if(ValX<=(pixelX(i)+E))
        if(ValX>=(pixelX(i)-E))
            Xindex=i;
        end
    end
end

for i=1:8
    if(ValY<=(pixelY(i)+E))
        if(ValY>=(pixelY(i)-E))
            Yindex=i;
        end
    end
end

end