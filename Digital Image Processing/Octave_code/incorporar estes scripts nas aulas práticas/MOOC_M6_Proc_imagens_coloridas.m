%realce de imagens coloridas
clc
clear all
close all
pkg load image

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

img = imread('galo.jpg');
figure,imshow(img,[]);

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

Rr = imadjust(R);
Gr = imadjust(G);
Br = imadjust(B);

imgr = cat(3,Rr,Gr,Br);
figure,imshow(imgr,[]);

HSV = rgb2hsv(img);

figure,imshow(HSV(:,:,1),[]);colorbar,title('Componente H');
figure,imshow(HSV(:,:,2),[]);colorbar,title('Componente S');
figure,imshow(HSV(:,:,3),[]);colorbar,title('Componente V');

Vr = imadjust(uint8(HSV(:,:,3)*255));
HSV(:,:,3) = double(Vr) / 255;
imgr2 = hsv2rgb(HSV);
figure,imshow(imgr2,[]);