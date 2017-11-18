function [CentroidXP,CentroidYP] = PixelGen(mA,mB)

% Convert image data to a form that can be fed to BFS
 
for i = 1:8
    for j=1:8
        CentroidXP(i,j) = mA(i);
        CentroidYP(i,j) = mB(j);
    end
end
CentroidXP = transpose(CentroidXP);
CentroidYP = transpose(CentroidYP);
end

