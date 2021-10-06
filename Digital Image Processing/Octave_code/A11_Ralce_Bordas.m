%Detecção de bordas
clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

cd('D:\OneDrive\Documentos\Docência\Disciplinas\PDI\Aulas_PDI\Banco_Imagens');

Get = imread('sjnirautocontr8bit.tif');

%Operador de Prewitt******************************************************
%Máscara vertical
%[1 1 1
% 0 0 0
%-1 -1 -1]
pH   = fspecial('prewitt');%Máscara vertical para detectar bordas horizontais
P_H  = filter2(pH,Get,'same');
%P_H será double com negativos
%eliminando os negativos fazendo o módulo e reescalonando
P_H    = abs(P_H);%fazendo o módulo
Scale  = max(P_H(:));
P_Hs   = P_H * (255 / Scale); %escalonando para [0,255]
P_Hs   = uint8(P_Hs);%para visualização

%Máscara horizontal para detectar bordas verticais
pV     = pH';
P_V    = filter2(pV,Get,'same');
P_V    = abs(P_V);
Scale  = max(P_V(:));
P_Vs   = P_V * (255 / Scale);
P_Vs   = uint8(P_Vs);

%Magnitude do gradiente
P_H_V  = P_H + P_V;
Scale  = max(P_H_V(:));
P_H_Vs = P_H_V * (255 / Scale);
P_H_Vs = uint8(P_H_Vs);

%Operador de Sobel*********************************************************
%Máscara vertical para detectar bordas horizontais
%[1 2 1
% 0 0 0
%-1 -2 -1]
sH   = fspecial('sobel');
S_H  = filter2(sH,Get,'same');
S_H    = abs(S_H);%fazendo o módulo
Scale  = max(S_H(:));
S_Hs   = S_H * (255 / Scale); %escalonando para [0,255]
S_Hs   = uint8(S_Hs);%para visualização

%Máscara horizontal para detectar bordas verticais
sV     = sH';
S_V    = filter2(sV,Get,'same');
S_V    = abs(S_V);
Scale  = max(S_V(:));
S_Vs   = S_V * (255 / Scale);
S_Vs   = uint8(S_Vs);

%Magnitude do gradiente
S_H_V  = S_H + S_V;
Scale  = max(S_H_V(:));
S_H_Vs = S_H_V * (255 / Scale);
S_H_Vs = uint8(S_H_Vs);

%Operador de Roberts*********************************************************
%Máscara horizontal

rd1    = [1 0;0 -1];
rd2    = [0 1;-1 0];
R_d1   = filter2(rd1,Get,'same');
R_d1   = abs(R_d1);%fazendo o módulo
Scale  = max(R_d1(:));
R_d1s  = R_d1 * (255 / Scale); %escalonando para [0,255]
R_d1s  = uint8(R_d1s);%para visualização

R_d2   = filter2(rd2,Get,'same');
R_d2   = abs(R_d2);%fazendo o módulo
Scale  = max(R_d2(:));
R_d2s  = R_d2 * (255 / Scale); %escalonando para [0,255]
R_d2s  = uint8(R_d2s);%para visualização

%Magnitude do gradiente
R_d1_d2  = R_d1 + R_d2;
Scale    = max(R_d1_d2(:));
R_d1_d2s = R_d1_d2 * (255 / Scale);
R_d1_d2s = uint8(R_d1_d2s);

%Laplaciano***************************************************************

h = [0 -1 0; -1 5 -1;0 -1 0];
L = filter2(h,Get,'same');
% fazendo valores negativos iguais a zero
[m,n] = size(Get);
for i = 1 : m
    for j = 1 : n
        if L(i,j) < 0
            L(i,j) = 0;
        end
    end
end

Scale = max(L(:));
Ls    = L * (255 / Scale);
Ls    = uint8(Ls);

figure,imshow(Get),title('Imagem original');
%Prewitt
figure,imshow(P_Hs),title('Prewitt (Bordas horizontais)');
figure,imshow(P_Vs),title('Prewitt (Bordas verticais)');
figure,imshow(P_H_Vs),title('Prewitt total');
%Sobel
figure,imshow(S_Hs),title('Sobel (Bordas horizontais)');
figure,imshow(S_Vs),title('Sobel (Bordas verticais)');
figure,imshow(S_H_Vs),title('Sobel total');
%Roberts
figure,imshow(R_d1s),title('Roberts diagonal 1');
figure,imshow(R_d2s),title('Roberts diagonal 2');
figure,imshow(R_d1_d2s),title('Roberts total');
%Laplaciano
figure,imshow(L,[]),title('Laplaciano');


