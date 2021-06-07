%Binarização

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

Get0 = imread('gaussian_shaded.tif');

%binarização manual
Lm = 0.2;%limiar manual
BinManual = im2bw(Get0,Lm);

%binarização por Otsu
BinOtsu = im2bw(Get0,graythresh(Get0));

%Usando suavização por média
h = fspecial('average',[5 5]);
S = imfilter(Get0,h,'replicate','same'); 
BinS = im2bw(S,graythresh(S));

%fazendo particionamento
%linha 1
P11 = Get0(1:325,1:271);
P12 = Get0(1:325,272:542);
P13 = Get0(1:325,543:814);
%linha 2
P21 = Get0(326:651,1:271);
P22 = Get0(326:651,272:542);
P23 = Get0(326:651,543:814);

%aplicando Otsu
P11_Otsu = im2bw(P11,graythresh(P11));
P12_Otsu = im2bw(P12,graythresh(P12));
P13_Otsu = im2bw(P13,graythresh(P13));
P21_Otsu = im2bw(P21,graythresh(P21));
P22_Otsu = im2bw(P22,graythresh(P22));
P23_Otsu = im2bw(P23,graythresh(P23));

%juntando as imagens
P_Otsu = zeros(651,814);
P_Otsu(1:325,1:271)     = P11_Otsu;
P_Otsu(1:325,272:542)   = P12_Otsu;
P_Otsu(1:325,543:814)   = P13_Otsu;
P_Otsu(326:651,1:271)   = P21_Otsu;
P_Otsu(326:651,272:542) = P22_Otsu;
P_Otsu(326:651,543:814) = P23_Otsu;
P_Otsu = logical(P_Otsu);

figure,imshow(Get0),title('Original');
figure,imshow(S),title('Imagem suavizada por média');
figure,imshow(BinManual),title('Binarização manual');
figure,imshow(BinOtsu),title('Binarização por Otsu');
figure,imshow(BinS),title('Binarização por Otsu após suavização');
figure,imshow(P_Otsu),title('Binarização por partes e Otsu');





