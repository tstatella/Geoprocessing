close all
clear all
clc

cd('C:\Users\Thiago\Documents\PDI\Aulas_PDI\Atividades\Banco_Imagens');

x   = imread('cores.jpg');
figure,imshow(x);title('Imagem original');
HSV = rgb2hsv(x);

figure,imshow(HSV(:,:,1),[]),colormap,title('Componente H');
figure,imshow(HSV(:,:,2),[]),colormap,title('Componente S');
figure,imshow(HSV(:,:,3),[]),colormap,title('Componente V');

HSV(:,:,1) = mod(HSV(:,:,1)+0.4,1);
%fun��o mod para obter o resto da divis�o de X por Y 
%para que o resultado esteja sempre em [0,1]

RGB = hsv2rgb(HSV);
figure,imshow(RGB);title('Cores alteradas');