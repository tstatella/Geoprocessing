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

% Obtendo informação
Min = min(img(:));
Max = max(img(:));
a   = Max - Min;
M   = mean2(img(:));
d   = std2(img(:));

printf('Valor mínimo: %f\n',Min);
printf('Valor máximo: %f\n',Max);
printf('Valor médio: %f\n',M);
printf('Amplitude: %f\n',a);
printf('Desvio padrão: %f\n',d);

% Aplicando realce linear sem saturação
x = double(img);
y = 255 * (x - 79) / (179 - 79);
y = uint8(y);
figure,imshow(y); % Visualizando

y = imadjust(img,[],[]);
figure,imshow(y,[]);

