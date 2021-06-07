%Suavização por média e mediana
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

Get0 = imread('sjaeroruido.tif');

%Tamanho da máscara de suavização
n = 7;

%Usando suavização por média
h = fspecial('average',[n n]);%filtro de média
S = imfilter(Get0,h,'replicate','same');%replicando pixels de borda e mantendo o tamanho da imagem original 

%Filtragem pela gaussiana
% o tamanho do filtro deve ser 6 x sigma. sigma, neste caso, foi 1.0
hg = fspecial('gaussian', [7 7], 1);
Sg = imfilter(Get0,hg,'replicate','same');

%Filtro de mediana
Me = medfilt2(Get0,[n n]);

figure,imshow(Get0),title('Imagem original');
figure,imshow(S),title('Suavização pela média');
figure,imshow(Sg),title('Suavização pela gaussiana');
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
