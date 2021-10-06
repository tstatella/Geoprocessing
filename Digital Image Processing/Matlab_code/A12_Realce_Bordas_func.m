%Detecção de bordas com função edge
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

Get = imread('sjnirautocontr8bit.tif');

%Roberts******************************************************************

%a função edge fará a binarização automática
[Roberts tr] = edge(Get,'roberts');

%Prewitt******************************************************************
PrewittH     = edge(Get,'prewitt',[],'horizontal');
PrewittV     = edge(Get,'prewitt',[],'vertical');
[Prewitt tp] = edge(Get,'prewitt',[],'both');

%Sobel********************************************************************
SobelH     = edge(Get,'sobel',[],'horizontal');
SobelV     = edge(Get,'sobel',[],'vertical');
[Sobel ts] = edge(Get,'sobel',[],'both');

%Canny*********************************************************************
[Canny tc] = edge(Get,'canny',[],1);%valor de sigma foi especificado como 1
%o sigma é a abertura da gaussiana que será aplaicada na suavização

figure,imshow(Roberts),title('Roberts');
figure,imshow(PrewittH),title('Prewitt horizontal');
figure,imshow(PrewittV),title('Prewitt vertical');
figure,imshow(Prewitt),title('Prewitt total');
figure,imshow(SobelH),title('Sobel horizontal');
figure,imshow(SobelV),title('Sobel vertical');
figure,imshow(Sobel),title('Sobel total');
figure,imshow(Canny),title('Canny');