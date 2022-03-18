clear all
close all
clc
pkg load image

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

img = imread('borboleta.jpg');
figure,imshow(img);
set(gca,'FontSize',12,'fontname','Arial');

% Tamanho do filtro
n = 7;
h = fspecial('average',[n n]);%filtro de média
S = imfilter(img,h,'replicate','same');%replicando pixels de borda e mantendo o tamanho da imagem original 
figure,imshow(S);

img2_noise = imnoise(img,"salt & pepper");
figure,imshow(img2_noise,[]);
c=colorbar();set(c,'FontSize',12,'fontname','Arial')
set(gca,'FontSize',12,'fontname','Arial','visible','on');

S = imfilter(img2_noise,h,'replicate','same');
figure,imshow(S);