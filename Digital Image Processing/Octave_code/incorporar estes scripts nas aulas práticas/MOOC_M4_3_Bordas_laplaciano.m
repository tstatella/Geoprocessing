%Detecção de bordas
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

img = imread('janela.jpg');
figure,imshow(img);c=colorbar();set(c,'FontSize',10);

%Laplaciano***************************************************************
h = [0 -1 0; -1 4 -1;0 -1 0];
L = filter2(h,img,'same');
L = abs(L);

%Laplaciano
figure,imshow(L,[]);c=colorbar();set(c,'FontSize',10);