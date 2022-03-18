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

n  = 7;
Me = medfilt2(img,[n n]);
figure,imshow(Me);

img2_noise = imnoise(img,"salt & pepper");
figure,imshow(img2_noise,[]);
c=colorbar();set(c,'FontSize',12,'fontname','Arial')
set(gca,'FontSize',12,'fontname','Arial','visible','on');

Me = medfilt2(img2_noise,[n n]);
figure,imshow(Me);