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

%Operador de Sobel*********************************************************
%Máscara vertical para detectar bordas horizontais
%[1 2 1
% 0 0 0
%-1 -2 -1]
sH   = fspecial('sobel');
S_H  = filter2(sH,img,'same');
S_H  = abs(S_H);%fazendo o módulo

%Máscara horizontal para detectar bordas verticais
sV   = sH';
S_V  = filter2(sV,img,'same');
S_V  = abs(S_V);

%Magnitude do gradiente
S_H_V  = S_H + S_V;

%Sobel
figure,imshow(S_H,[]);c=colorbar();set(c,'FontSize',10);
figure,imshow(S_V,[]);c=colorbar();set(c,'FontSize',10);
figure,imshow(S_H_V,[]);c=colorbar();set(c,'FontSize',10);