%Suaviza��o por m�dia e mediana
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

Get = imread('sjaeroruido.tif');

%Tamanho da m�scara de suaviza��o
n = 7;

%Usando suaviza��o por m�dia
h = fspecial('average',[n n]);%filtro de m�dia
S = imfilter(Get,h,'replicate','same');%replicando pixels de borda e mantendo o tamanho da imagem original 

%Filtragem pela gaussiana
% o tamanho do filtro deve ser 6 x sigma. sigma, neste caso, foi 1.0
hg = fspecial('gaussian', [7 7], 1);
Sg = imfilter(Get,hg,'replicate','same');

%Filtro de mediana
Me = medfilt2(Get,[n n]);

figure,imshow(Get),title('Imagem original');
figure,imshow(S),title('Suaviza��o pela m�dia');
figure,imshow(Sg),title('Suaviza��o pela gaussiana');
figure,surf(hg),title('Gaussiana');
figure,imshow(Me),title('Filtrada pela mediana');

media = S;
mediana = Me;
gaussiana = Sg;
save('media','media');
save('mediana','mediana');
save('gaussiana','gaussiana');
imwrite(S,'media.tif','compression','none');
imwrite(Me,'mediana.tif','compression','none');
