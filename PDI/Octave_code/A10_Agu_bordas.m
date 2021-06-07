%Agu�amento
clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        C�digo criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educa��o, Ci�ncia e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

Get = imread('sjnirautocontr8bit.tif');
k   = 5;

%Agu�amento usando m�scara obtida da suaviza��o****************************
%Tamanho da m�scara de suaviza��o
n = 7;
%Usando suaviza��o por m�dia
h = fspecial('average',[n n]);%filtro de m�dia
S = imfilter(Get,h,'replicate','same');%replicando pixels de borda e mantendo o tamanho da imagem original 

Mask = double(Get) - double(S);
A1   = double(Get) + (k * Mask);%filtragem high boost
A1   = uint8(A1);

%Agu�amento usando prewitt*************************************************
%detectando bordas
Mask = edge(Get,'prewitt',[],'both');
%A imagem Mask � bin�ria. Para obter o brilho das bordas ela ser�
%multiplicada pela imagem original
Mask = double(Mask) .* double(Get);

A2 = double(Get) + Mask;
A2 = uint8(A2);

figure,imshow(Get),title('Original');
figure,imshow(A1),title('Agu�amento com filtro de m�dia');
figure,imshow(A2),title('Agu�amento com filtro de Prewitt');