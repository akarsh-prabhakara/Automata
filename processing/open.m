% Run this to start collecting data from feed, process it, perform BFS and give directions to the bot to move

function open

% Get image from feed
% Comment out the below four lines if you want to start with a static image
% dev_info = imaqhwinfo('winvideo',1);
% vid = videoinput('winvideo',1,'YUY2_640x480');
% img = getsnapshot(vid);
% img = ycbcr2rgb(img);

% Comment out this line if you want to start with a webcam feed
img = imread('../arena.jpg');

% Pre-processing
img_gray = rgb2gray(img);
img_gray = wiener2(img_gray,[5 5]);
img_gray = medfilt2(img_gray,[5 5]);

imshow(img_gray);
pause;

% To crop out the borders or extra stuff captured by the feed  - other than the chess board
img_crop = crop(img_gray,img);

imshow(img_crop);
pause;

% Color segmentation
[img_edge, m, k,x_edge,y_edge]  = edge_cen(img_crop);

% Get the centroid of the bot
[bot_centroid , bot] = bot_cen(img_edge);

% Get the centroid of the destination square
[dest_centroid , dest] = dest_cen(img_edge);

img_edge(ceil(bot_centroid(1)),ceil(bot_centroid(2))) = 0;
img_edge(ceil(dest_centroid(1)),ceil(dest_centroid(2))) = 0;

[C,D] = PixelGen(k,m);
[sx sy] = ChessIndex(k,m,ceil(bot_centroid(1)),ceil(bot_centroid(2)),((size(img_edge,2) - (2 * x_edge)) + (size(img_edge,1) - (2 * y_edge)))/2);
[dx dy] = ChessIndex(k,m,ceil(dest_centroid(1)),ceil(dest_centroid(2)),((size(img_edge,2) - (2 * x_edge)) + (size(img_edge,1) - (2 * y_edge)))/2);

% To get the shorted distance using BFS
[M,X1,X2,Y1,Y2] = BFS(sx,sy,dx,dy,C,D)

% Communicate to the processor/uC on bot
start(M)

end