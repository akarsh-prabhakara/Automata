function start(move)
bt = Bluetooth('HC-05',1);
fclose(bt);
fopen(bt);
for i = 1:1:size(move,2)
    fwrite(bt,move(i));
    pause(10)
    A = fread(bt,3);
    while(size(A) ~= 0)
        A = fread(bt,3);
    end
end
fclose(bt);
end