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

% Aplicando realce linear comet saturação (média e desvio)
x = double(img);
y = 255 * (x - (121-2*19)) / ((121+2*19)-(121-2*19));
y = uint8(y);
figure,imshow(y); % Visualizando
figure,imhist(y);

% Fazendo saturação de 1% e 98%

format long e
p1 = numel(img) * (1/100);
p2 = numel(img) * (99/100);

M       = zeros(2^8,1,'uint8'); 
hist    = imhist(img,2^8); 
cdf     = cumsum(hist); 

cdf_p1  = cdf < p1;
Xmin    = sum(cdf_p1);
cdf_p2  = cdf < p2;
Xmax    = sum(cdf_p2);

x = double(img);
y = 255 * (x - Xmin) / (Xmax - Xmin);
y = uint8(y);
figure,imshow(y); % Visualizando
set(gca,'FontSize',12,'fontname','Arial');
figure,imhist(y);grid on;
set(gca,'FontSize',12,'fontname','Arial');
xlim([0 255]);
