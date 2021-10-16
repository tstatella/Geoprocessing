clear all
close all
clc

pkg load image

% Acessar o diretório em que estão minhas imagens
cd 'D:\OneDrive\GitHub\Geoprocessing\Digital Image Processing\Image_dataset';

% Fazendo a leitura de uma imagem
Nome_B1 = 'LANDSAT_5_TM_19860908_226_071_L2_BAND1_Corte.tif';
B1      = imread(Nome_B1); % Lendo o arquivo de imagem na variável img

figure,imshow(B1,[]),title('Banda do Azul');
set(gca,'FontSize',40,'visible','on'),c=colorbar();set(c,'FontSize',40);

% Vamos criar um histograma para a nossa imagem
figure,imhist(B1),title('Histograma da banda 1');
set(gca,'FontSize',40);grid on;

[freq,X] = imhist(B1);

% Realce linear de imagem
B1 = double(B1);

Ymax = 255;
Xmin = 90;% depois vira 0
Xmax = 120;% depois vira 255

B1R = Ymax * (B1 - Xmin) ./ (Xmax - Xmin);
B1R = uint8(B1R);

figure,
subplot(1,2,1),imhist(B1R),title('Histograma da banda 1 realçada');
set(gca,'FontSize',40);grid on;
subplot(1,2,2),imhist(uint8(B1)),title('Histograma da imagem original');
set(gca,'FontSize',40);grid on;

figure,
subplot(1,2,1),imshow(B1,[]),c=colorbar();title('Imagem original');
set(c,'FontSize',40);set(gca,'FontSize',40,'visible','on');
subplot(1,2,2),imshow(B1R,[]),c=colorbar();title('Imagem realçada');
set(c,'FontSize',40);set(gca,'FontSize',40,'visible','on');


% Equalização de histograma
B1eq = histeq(B1);
figure,
subplot(1,3,1),imshow(B1,[]),title('B1 original');
set(gca,'FontSize',40);
subplot(1,3,2),imshow(B1eq,[]),title('B1 equalizada');
set(gca,'FontSize',40);
subplot(1,3,3),imshow(B1R,[]),title('B1 contraste linear');
set(gca,'FontSize',40);

figure,imhist(uint8(255*B1eq));



%====================================================================
% Transformação de gamma!
format long e
%{
gama1 = 0.1;
gama2 = 4;
gama3 = 1;

x = 0 : 1 : 100;

y1 = x.^gama1;
y2 = x.^gama2;
y3 = x.^gama3;

y1 = y1 / max(y1(:));
y2 = y2 / max(y2(:));
y3 = y3 / max(y3(:));

% normalizando os valores de y para o intervalo [0,1]
figure,plot(x,y1,'-b','LineWidth',2);
hold on
plot(x,y2,'-r','LineWidth',2);
plot(x,y3,'-g','LineWidth',2);
xlabel('X');ylabel('Y');
legend('gama = 0.1','gama = 4','gama = 1','Location','EastOutside');
grid on;
set(gca,'FontSize',40);
%}
img_aero = imread('Aeroporto.jpg');
figure,imshow(img_aero,[]);
set(gca,'FontSize',40,'visible','on');

figure,imhist(img_aero);
set(gca,'FontSize',40,'visible','on');

img_aero_gama = double(img_aero).^4;
figure,imshow(img_aero_gama,[]);
set(gca,'FontSize',40,'visible','on');

img_aero_gama_01 = img_aero_gama / max(img_aero_gama(:));
img_aero_gama_255 = uint8(img_aero_gama_01 * 255);

figure,imhist(img_aero_gama_255);



















