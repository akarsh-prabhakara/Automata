function [Move,X1,X2,Y1,Y2] = BFS (sx,sy,dx,dy, Xcen, Ycen )

%% Define visited matrix
V = ones(8,8)*-1;

%% Let source cell indices be g,h;
V(sx,sy) = 0 ;

%% Let destination cell indices be dx,dy

%% To check if source and destination are valid

if((sx>=1)&&(sx<=8)&&(dx>=1)&&(dx<=8))

%% BFS for changing the visited matrix
i=1;j=1;
Vindex=0;
 while(V(dx,dy)==(-1))
    for i=1:8
        for j=1:8
            if (V(i,j)==Vindex)
                %% Mark Validmoves with Vindex + 1;
                    if((i-2)>=1)
                        if((j-1)>=1)
                            if  V(i-2,j-1) == -1
                            V(i-2,j-1) = Vindex + 1;
                            end
                        end
                        if((j+1)<=8)
                             if  V(i-2,j+1) == -1
                            V(i-2,j+1) = Vindex + 1;
                             end
                        end
                    end
                    if((i+2)<=8)
                        if((j-1)>=1)
                             if  V(i+2,j-1) == -1
                            V(i+2,j-1) = Vindex + 1;
                             end
                        end
                        if((j+1)<=8)
                             if  V(i+2,j+1) == -1
                            V(i+2,j+1) = Vindex + 1;
                             end
                        end
                    end
                    if((j-2)>=1)
                        if((i-1)>=1)
                             if  V(i-1,j-2) == -1
                            V(i-1,j-2) = Vindex + 1;
                             end
                        end
                        if((i+1)<=8)
                             if  V(i+1,j-2) == -1
                            V(i+1,j-2) = Vindex + 1;
                             end
                        end
                    end
                    if((j+2)<=8)
                        if((i-1)>=1)
                             if  V(i-1,j+2) == -1
                            V(i-1,j+2) = Vindex + 1;
                             end
                        end
                        if((i+1)<=8)
                            if  V(i+1,j+2) == -1
                            V(i+1,j+2) = Vindex + 1;
                            end
                        end
                    end
                    
                        
                
                
            end
       end
    end
    Vindex=Vindex+1;
end
end

%% Printing the path for the chess coin (Reverse order)
%% Let dv be the visited value at the destination
%% Moves are defined clockwise from 1 to 8. Move = 0 indicates don't move
dv = V(dx,dy);
px = dx;
py = dy;
X2 (dv+1)= Xcen(dx,dy);
Y2(dv+1)=Ycen(dx,dy);
z=dv;
k=0;
if(sx==dx)&&(sy==dy)
    move=[0,0,0,0,0,0,0,0];
end
while (dv >0)
    
      k = k + 1;
      if((px-2)>=1&&(py+1)<=8)
          if V(px-2,py+1) == dv - 1
          move(k)=1;
          px = px-2;
          py = py+1;
          X2(z-k+1)= Xcen(px,py); 
          Y2(z-k+1)= Ycen(px,py);
            dv = dv-1;
          continue;
          end
      end    
      if((px-1)>=1&&(py+2)<=8)
         if V(px-1,py+2) == dv - 1
             move(k)=2; 
             px = px-1;
             py = py+2;
             X2(z-k+1)= Xcen(px,py); 
          Y2(z-k+1)= Ycen(px,py);
               dv = dv-1;
             continue;
         end
      end   
      if((px+1)<=8&&(py+2)<=8)
          if V(px+1,py+2) == dv - 1
          move(k)=3;
          px=px+1;
          py=py+2;
          X2(z-k+1)= Xcen(px,py); 
          Y2(z-k+1)= Ycen(px,py);
            dv = dv-1;
          continue;
          end
      end   
      if((px+2)<=8&&(py+1)<=8)
          if V(px+2,py+1) == dv - 1
          move(k)=4;
          px=px+2;
          py=py+1;    
          X2(z-k+1)= Xcen(px,py); 
          Y2(z-k+1)= Ycen(px,py);
            dv = dv-1;
          continue;
          end
      end   
      if((px+2)<=8&&(py-1)>=1)
          if V(px+2,py-1) == dv - 1
          move(k)=5;
          px=px+2;
          py=py-1;
          X2(z-k+1)= Xcen(px,py); 
          Y2(z-k+1)= Ycen(px,py);
            dv = dv-1;
          continue;
          end
      end   
      if((px+1)<=8&&(py-2)>=1)
          if V(px+1,py-2) == dv -1
          move(k)=6;
          px=px+1;
          py=py-2;   
          X2(z-k+1)= Xcen(px,py); 
          Y2(z-k+1)= Ycen(px,py);
            dv = dv-1;
          continue;
          end
      end   
      if((px-1)>=1&&(py-2)>=1)
          if V(px-1,py-2) == dv - 1
          move(k)=7;
          px=px-1;
          py=py-2;
          X2(z-k+1)= Xcen(px,py); 
          Y2(z-k+1)= Ycen(px,py);
            dv = dv-1;
          continue;
          end
      end   
      if((px-2)>=1&&(py-1)>=1)
          if V(px-2,py-1) == dv - 1
          move(k)=8;
          px=px-2;
          py=py-1;
          X2(z-k+1)= Xcen(px,py); 
          Y2(z-k+1)= Ycen(px,py);
            dv = dv-1;
          continue;
          end
      end 
           
end    

flippedmove = fliplr(move) ;

for i=1:k
     if(flippedmove(i)<=4)
         Move(i) = flippedmove(i) + 4;
     else 
         Move(i)= flippedmove(i) - 4;
     end
end


ax=sx;
ay=sy;
for i=1:k
 
    if Move(i)==1
        X1(i)=Xcen(ax-2,ay);
        Y1(i)=Ycen(ax-2,ay);
        ax=ax-2;
        ay=ay+1;
    end
    if Move(i)==2
        X1(i)=Xcen(ax,ay+2);
        Y1(i)=Ycen(ax,ay+2);
        ax=ax-1;
        ay=ay+2;
    end
    if Move(i)==3
        X1(i)=Xcen(ax,ay+2);
        Y1(i)=Ycen(ax,ay+2);
        ax=ax+1;
        ay=ay+2;
    end
    if Move(i)==4
        X1(i)=Xcen(ax+2,ay);
        Y1(i)=Ycen(ax+2,ay);
        ax=ax+2;
        ay=ay+1;
    end
    if Move(i)==5
        X1(i)=Xcen(ax+2,ay);
        Y1(i)=Ycen(ax+2,ay);
        ax=ax+2;
        ay=ay-1;
    end
    if Move(i)==6
        X1(i)=Xcen(ax,ay-2);
        Y1(i)=Ycen(ax,ay-2);
        ax=ax+1;
        ay=ay-2;
    end
    if Move(i)==7
        X1(i)=Xcen(ax,ay-2);
        Y1(i)=Ycen(ax,ay-2);
        ax=ax-1;
        ay=ay-2;
    end
    if Move(i)==8
        X1(i)=Xcen(ax-2,ay);
        Y1(i)=Ycen(ax-2,ay);
        ax=ax-2;
        ay=ay-1;
    end
end

for i=2:k
    for j=i:k
    if((Move(i-1)==5)||(Move(i-1)==8))
       if(Move(j)<=6)
           Move(j) = Move(j)+2;
       else if (Move(j)>6)
           Move(j) = Move(j)-6;    
           end
       end
    end
     if((Move(i-1)==1)||(Move(i-1)==4))
       if(Move(j)>=3)
           Move(j) = Move(j)-2;
       else if (Move(j)<3)
           Move(j) = Move(j)+6;    
           end
       end
     end 
      if((Move(i-1)==3)||(Move(i-1)==6))
       if(Move(j)<=4)
           Move(j) = Move(j)+4;
       else if (Move(j)>4)
           Move(j) = Move(j)-4;     
           end
       end
     end
    end
end
X2(1)=[];
Y2(1)=[];
end
