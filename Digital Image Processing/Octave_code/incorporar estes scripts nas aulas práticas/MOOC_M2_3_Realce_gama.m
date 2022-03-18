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
img = imread('cachorrinha.jpg');
figure,imshow(img); % Visualizando
figure,imhist(img);

y = 1 * double(img).^0.2;
figure,imshow(y,[]);
set(gca,'FontSize',12,'fontname','Arial');

y = imadjust(img,[],[],0.2);
figure,imshow(y,[]);
set(gca,'FontSize',12,'fontname','Arial');