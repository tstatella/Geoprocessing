clear all
close all
clc

cd('D:\OneDrive\Ensino\Disciplinas\PDI\Aulas_PDI\Banco_Imagens');

x   = imread('cookies.tif');
bin = im2bw(x,100/255);

figure,imshow(x,[]);title('Imagem original');
figure,imshow(bin);title('Imagem binarizada');

%O biscoito quebrado é ligeiramente menor que o biscoito inteiro. A ideia é
%aplicar uma erosão grande o suficiente para remover completamente o
%biscoito quebrado e manter um marcador do biscoito inteiro. Depois
%aplica-se a dilatação com um EE ligeiramente maior que o usado na erosão.
%O resultado será o biscoito inteiro reconstruído, mas ligeiramente maior
%que a sua versão binária original. Na subtração no top-hat elima-se o
%biscoito inteiro, restando o biscoito quebrado.

SEero  = strel('disk',60);
SEdil  = strel('disk',70);
ero    = imerode(bin,SEero);
dil    = imdilate(ero,SEdil);
opth   = bin - dil;
Bc     = bin - opth;%marcadores do biscoito inteiro

figure,imshow(ero);title('Erosão');
figure,imshow(dil);title('dilatação');
figure,imshow(opth);title('Top-hat por abertura');

%Recuperando o biscoito quebrado
BQ = double(opth) .* double(x);
BQ = uint8(BQ);
figure,imshow(BQ);title('Biscoito quebrado');

%Recuperando o biscoite inteiro
B = double(Bc) .* double(x);
B = uint8(B);
figure,imshow(B);title('Biscoito inteiro');

%Detectando a fronteira
SE   = strel('disk',3);
Fdil = imdilate(bin,SE);
Fero = imerode(bin,SE);
F    = uint8((Fdil - Fero) * 255);
xF   = x + F;%adicionando as bordas à imagem

figure,imshowpair(x,BQ);title('Biscoito inteiro e quebrado');
figure,imshow(xF);title('Fronteiras');






