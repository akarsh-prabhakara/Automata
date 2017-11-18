# Automata
Image Processing Bot competition - Technical Symposium NITK 2016

The objective of the competition was to drive a bot from one square to another, in the way in which knight pieces moves on the chess board, on a large scale chess board in the shortest way possible using only overhead camera feed. 

## knightturns

This is the code to be put on the Arduino which drives the bot. The code basically receives moves to execute over Bluetooth and commands the motors of the bot to work accordingly.

## processing

This is the code which is run on a computer with Bluetooth capability. The pipeline includes - extractig image from video feed, filtering, color segmentation, running Breadth First Search algorithm and sending bits to Arduino to perform a certain move.

```
open;
```

This command will start running the entire pipeline. The pipeline will take a [static image](./arena.jpg) and do the processing. One can configure the pipeline to take feed from webcam too. 

## Contributors

Akarsh Prabhakara  
Narendra Shivaraman  
