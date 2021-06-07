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

Get0 = imread('sjnirautocontr8bit.tif');
k   = 5;

%Agu�amento usando m�scara obtida da suaviza��o****************************
%Tamanho da m�scara de suaviza��o
n = 7;
%Usando suaviza��o por m�dia
h = fspecial('average',[n n]);%filtro de m�dia
S = imfilter(Get0,h,'replicate','same');%replicando pixels de borda e mantendo o tamanho da imagem original 

Mask = double(Get0) - double(S);
A1   = double(Get0) + (k * Mask);%filtragem high boost
A1   = uint8(A1);

%Agu�amento usando prewitt*************************************************
%detectando bordas
Mask = edge(Get0,'prewitt',[],'both');
%A imagem Mask � bin�ria. Para obter o brilho das bordas ela ser�
%multiplicada pela imagem original
Mask = double(Mask) .* double(Get0);

A2 = double(Get0) + Mask;
A2 = uint8(A2);

figure,imshow(Get0),title('Original');
figure,imshow(A1),title('Agu�amento com filtro de m�dia');
figure,imshow(A2),title('Agu�amento com filtro de Prewitt');