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

% Fazendo a leitura da imagem 
img = imread('cachorro.jpg');
figure,imshow(img); % Visualizando
figure,imhist(img);

y = histeq(img);
figure,imshow(y*255,[]);c=colorbar();
set(gca,'FontSize',12,'fontname','Arial','visible','on');
set(c,'FontSize',12);
figure,imhist(uint8(y*255));grid on;
set(gca,'FontSize',14,'fontname','Arial');
xlim([0 255]);