close all;%fechando figuras
clear all; %limpando as variáveis da memória
clc; %limpando a tela

cd('C:\Users\Thiago\Documents\PDI\Aulas_PDI\Atividades\Banco_Imagens');
a = imread('cores.jpg');

%separando as componentes RGB
R = double(a(:,:,1));
G = double(a(:,:,2));
B = double(a(:,:,3));

%Transformando em vídeo componente
Y  = 0.299 * R + 0.587 * G + 0.114 * B;
RY = R - Y;%componente R-Y
BY = B - Y;%componente B-Y

%Transformação em YUV
U = 0.493 * (B - Y);
V = 0.877 * (R - Y);

figure,imshow(a),title('Imagem original');
figure,imshow(uint8(Y)),title('Componente Y da imagem original');
figure,imshow(uint8(U)),title('Componente U da imagem original');
figure,imshow(uint8(V)),title('Componente V da imagem original');

figure,imshow(uint8(RY)),title('Componente R-Y da imagem original');
figure,imshow(uint8(BY)),title('Componente B-Y da imagem original');

%Retorno para RGB
R = (V / 0.877) + Y;
B = (U / 0.493) + Y;
Y = (Y - (0.299 * R) - (0.114 * B)) / 0.587;

RGB(:,:,1) = R;
RGB(:,:,2) = G;
RGB(:,:,3) = B;

figure,imshow(uint8(RGB)),title('Transformação YUV>RGB');