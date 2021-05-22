clc
clear all
close all

a = imread('pout.tif');
H_Ref = imhist(a);
b = imread('tire.tif');
b = b(:,:,1);
c = histeq(b,H_Ref);
figure,imshow(b),title('Imagem original');
figure,imshow(c),title('Imagem real�ada');
figure,imhist(b),title('Histograma da imagem a ser processada');
figure,imhist(a),title('Histograma de refer�ncia');
figure,imhist(c),title('Histograma da imagem real�ada');


