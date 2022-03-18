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

%Operador de Prewitt******************************************************
%Máscara vertical
%[1 1 1
% 0 0 0
%-1 -1 -1]
pH   = fspecial('prewitt');%Máscara vertical para detectar bordas horizontais
P_H  = filter2(pH,img,'same');
%P_H será double com negativos
%eliminando os negativos fazendo o módulo e reescalonando
P_H  = abs(P_H);%fazendo o módulo

%Máscara horizontal para detectar bordas verticais
pV   = pH';
P_V  = filter2(pV,img,'same');
P_V  = abs(P_V);

%Magnitude do gradiente
P_H_V  = P_H + P_V;

%Prewitt
figure,imshow(P_H,[]);c=colorbar();set(c,'FontSize',10);
figure,imshow(P_V,[]);c=colorbar();set(c,'FontSize',10);
figure,imshow(P_H_V,[]);c=colorbar();set(c,'FontSize',10);