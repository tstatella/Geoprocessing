clear all
close all
clc

x = imread('cores.jpg');
figure,imshow(x);
R = x(:,:,1);
G = x(:,:,2);
B = x(:,:,3);

Rs = suaviza(R);
Gs = suaviza(G);
Bs = suaviza(B);

RGBs = cat(3,Rs,Gs,Bs);
figure, imshow(RGBs);