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

cd('D:\OneDrive\Projetos\Extensao\Projeto_Extensao_Edital_85_2021_PDI_MOOC\Banco_de_Imagens');

img = imread('janela.jpg');

%Operador de Prewitt******************************************************
%Máscara vertical
%[1 1 1
% 0 0 0
%-1 -1 -1]
pH   = fspecial('prewitt');%Máscara vertical para detectar bordas horizontais
P_H  = filter2(pH,img,'same');
%P_H será double com negativos
%eliminando os negativos fazendo o módulo e reescalonando
P_H    = abs(P_H);%fazendo o módulo

%Máscara horizontal para detectar bordas verticais
pV     = pH';
P_V    = filter2(pV,img,'same');
P_V    = abs(P_V);

%Magnitude do gradiente
P_H_V  = P_H + P_V;

%Operador de Sobel*********************************************************
%Máscara vertical para detectar bordas horizontais
%[1 2 1
% 0 0 0
%-1 -2 -1]
sH   = fspecial('sobel');
S_H  = filter2(sH,img,'same');
S_H    = abs(S_H);%fazendo o módulo

%Máscara horizontal para detectar bordas verticais
sV     = sH';
S_V    = filter2(sV,img,'same');
S_V    = abs(S_V);

%Magnitude do gradiente
S_H_V  = S_H + S_V;

%Laplaciano***************************************************************
h = [0 -1 0; -1 4 -1;0 -1 0];
L = filter2(h,img,'same');
L = abs(L);
figure,imshow(img);c=colorbar();set(c,'FontSize',10);
%Prewitt
figure,imshow(P_H,[]);c=colorbar();set(c,'FontSize',10);
figure,imshow(P_V,[]);c=colorbar();set(c,'FontSize',10);
figure,imshow(P_H_V,[]);c=colorbar();set(c,'FontSize',10);
%Sobel
figure,imshow(S_H,[]);c=colorbar();set(c,'FontSize',10);
figure,imshow(S_V,[]);c=colorbar();set(c,'FontSize',10);
figure,imshow(S_H_V,[]);c=colorbar();set(c,'FontSize',10);
%Laplaciano
figure,imshow(L,[]);c=colorbar();set(c,'FontSize',10);

P = P_H_V(110:160,100:150);
figure,imshow(P,[]);%c=colorbar();set(c,'FontSize',14); 
S = S_H_V(110:160,100:150);
figure,imshow(S,[]);%c=colorbar();set(c,'FontSize',14);
L = L(110:160,100:150);
figure,imshow(L,[]);%c=colorbar();set(c,'FontSize',14);