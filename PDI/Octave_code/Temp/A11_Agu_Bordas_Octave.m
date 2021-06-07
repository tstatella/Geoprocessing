%Aguçamento
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

Get0 = imread('sjnirautocontr8bit.tif');
k   = 5;

%Aguçamento usando máscara obtida da suavização****************************
%Tamanho da máscara de suavização
n = 7;
%Usando suavização por média
h = fspecial('average',[n n]);%filtro de média
S = imfilter(Get0,h,'replicate','same');%replicando pixels de borda e mantendo o tamanho da imagem original 

Mask = double(Get0) - double(S);
A1   = double(Get0) + (k * Mask);%filtragem high boost
A1   = uint8(A1);

%Aguçamento usando prewitt*************************************************
%detectando bordas
Mask = edge(Get0,'prewitt',[],'both');
%A imagem Mask é binária. Para obter o brilho das bordas ela será
%multiplicada pela imagem original
Mask = double(Mask) .* double(Get0);

A2 = double(Get0) + Mask;
A2 = uint8(A2);

figure,imshow(Get0),title('Original');
figure,imshow(A1),title('Aguçamento com filtro de média');
figure,imshow(A2),title('Aguçamento com filtro de Prewitt');