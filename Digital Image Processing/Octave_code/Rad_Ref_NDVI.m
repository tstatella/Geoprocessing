clear all
close all
clc

pkg load image

% Acessar o diretório em que estão minhas imagens
cd 'D:\OneDrive\GitHub\Geoprocessing\Digital Image Processing\Image_dataset';

% Fazendo a leitura de uma imagem
Nome_B1 = 'LANDSAT_5_TM_19860908_226_071_L2_BAND1_Corte.tif';
Nome_B3 = 'LANDSAT_5_TM_19860908_226_071_L2_BAND3_Corte.tif';
Nome_B4 = 'LANDSAT_5_TM_19860908_226_071_L2_BAND4_Corte.tif';
Nome_B6 = 'LANDSAT_5_TM_19860908_226_071_L2_BAND6_Corte.tif';
B1 = imread(Nome_B1); % Lendo o arquivo de imagem na variável img
B3 = imread(Nome_B3); % Lendo o arquivo de imagem na variável img
B4 = imread(Nome_B4);
B6 = imread(Nome_B6);

figure;
subplot(2,2,1),imshow(B1,[]),title('Banda do Azul');
set(gca,'FontSize',40,'visible','on'),c=colorbar();set(c,'FontSize',40);
subplot(2,2,2),imshow(B3,[]),title('Banda do Vermelho');
set(gca,'FontSize',40,'visible','on'),c=colorbar();set(c,'FontSize',40);
subplot(2,2,3),imshow(B4,[]);title('Banda do IVP');
set(gca,'FontSize',40,'visible','on'),c=colorbar();set(c,'FontSize',40);
subplot(2,2,4),imshow(B6,[]);title('Banda do Termal');
set(gca,'FontSize',40,'visible','on'),c=colorbar();set(c,'FontSize',40);

%Converter de inteiro para double
B1 = double(B1);
B3 = double(B3);
B4 = double(B4);
B6 = double(B6);


Lmin1 = -1.52;
Lmax1 = 169;
Lmin3 = -1.17;
Lmax3 = 264;
Lmin4 = -1.51;
Lmax4 = 221;
Lmin6 = 1.2378;
Lmax6 = 15.303;

%{
Uma alternativa:

LB1 = [-1.52 169];
L1 = ((LB1(2) - LB1(1)) / 255) * B1 + LB1(1);
%}

L1 = ((Lmax1 - Lmin1) / 255) * B1 + Lmin1;
L3 = ((Lmax3 - Lmin3) / 255) * B3 + Lmin3;
L4 = ((Lmax4 - Lmin4) / 255) * B4 + Lmin4;
L6 = ((Lmax6 - Lmin6) / 255) * B6 + Lmin6;

%{
Fazer a visualização da imagem
figure,imshow(L1,[]);title("Radiância da Banda 1");
c=colorbar();
set(c,'FontSize',20);
set(gca,'FontSize',20,'visible','on');

figure,imshow(L3,[]);title("Radiância da Banda 3");
c=colorbar();
set(c,'FontSize',20);
set(gca,'FontSize',20,'visible','on');
%}


%============================================================================
% Cálculo de reflectância

d     = 1;
E1    = 1983;
E3    = 1536;
E4    = 1031;

% Fazer E3 e E4
theta = 47 * pi / 180;

ro1 = (pi * L1 * d^2) / (E1 * cos(theta));
ro3 = (pi * L3 * d^2) / (E3 * cos(theta));
ro4 = (pi * L4 * d^2) / (E4 * cos(theta));

%{
figure,imshow(ro4,[]);title("Reflectância da Banda 4");
c=colorbar();
set(c,'FontSize',12);
set(gca,'FontSize',12,'visible','on');
%}
%============================================================================
% Cálculo de NDVI [-1,1]

NDVI = (ro4 - ro3) ./ (ro4 + ro3);


figure,imshow(NDVI,'DisplayRange',[],'colormap',jet);title("NDVI");
c=colorbar();
set(c,'FontSize',40);
set(gca,'FontSize',40,'visible','on');



