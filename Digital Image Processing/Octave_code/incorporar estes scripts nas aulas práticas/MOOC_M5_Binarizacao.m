%Detecção de bordas
clc
clear all
close all
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
figure,imhist(img);grid on;set(gca,'FontSize',10);
xlim([0 255]);ylim([0 50000]);

bin  = img > 170;
bin2 = im2bw(img,150/255);
bin3 = im2bw(img,graythresh(img));

figure,imshow(bin);
figure,imshow(bin2);
figure,imshow(bin3);