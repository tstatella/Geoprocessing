%C�lculo de �ndices de vegeta��o

clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        C�digo criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educa��o, Ci�ncia e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

load Banda1_Ref;
load Banda3_Ref;
load Banda4_Ref;

%NDVI (note a divis�o elemento a elemento ./)
NDVI = (Banda4_Ref - Banda3_Ref) ./ (Banda4_Ref + Banda3_Ref);

%SARVI
L    = 0.5;
Gama = 1;

Ref_RB = Banda3_Ref - (Gama * (Banda1_Ref - Banda3_Ref));
SARVI  = (Banda4_Ref - Ref_RB) ./ (Banda4_Ref + Ref_RB + L);

%Visualiza��o
%Os valores de NDVI v�o de -1 a 1
%Evitando valores negativos (os valores agora podem variar de 0 a 2)
NDVI_Vis  = NDVI + abs(min(NDVI(:)));
SARVI_Vis = SARVI + abs(min(SARVI(:)));

%Expandindo o range de ND de (0-2) para (0-255)
NDVI_Vis  = uint8(NDVI_Vis * (255 / 2));
SARVI_Vis = uint8(SARVI_Vis * (255 / 2));

figure,imshow(NDVI_Vis),title('NDVI');
figure,imshow(SARVI_Vis),title('SARVI');

%Visualiza��o em cor do NDVI***********************************************
%Separando em classes tem�ticas
%Abaixo a fun��o contourf faz o mapa de contorno dos dados. Eu escolhi
%empiricamente os valores [min 0 0.5 0.8 max] para serem limites nos quais
%as linhas de contorno s�o geradas. Valores de NDVI negativos geralmente
%representam �gua. Valores positivos baixos podem ser solos.
figure,contourf(NDVI,[min(NDVI(:)) 0 0.5 0.8 max(NDVI(:))]); 
colormap(jet);%escolhendo a paleta de cores
caxis([min(NDVI(:)) max(NDVI(:))])%for�ando o range de cores a coincidir com valores min e max do NDVI
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de NDVI');

%Abaixo, reprodu��o da imagem NDVI, desta vez com escala cont�nua de
%valores
figure,imshow(NDVI);
title('Escala cont�nua de valores de NDVI');
colormap(jet);%escolhendo a paleta de cores
caxis([min(NDVI(:)) max(NDVI(:))])%for�ando o range de cores a coincidir com valores min e max do Tkin
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de NDVI');

%Visualiza��o em cor do SARVI***********************************************
figure,contourf(SARVI,[min(SARVI(:)) 0 0.5 0.8 max(SARVI(:))]); 
colormap(jet);
caxis([min(SARVI(:)) max(SARVI(:))])
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de SARVI');

%Abaixo, reprodu��o da imagem SARVI, desta vez com escala cont�nua de
%valores
figure,imshow(SARVI);
title('Escala cont�nua de valores de SARVI');
colormap(jet);%escolhendo a paleta de cores
caxis([min(SARVI(:)) max(SARVI(:))])%for�ando o range de cores a coincidir com valores min e max do Tkin
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de SARVI');

%Gravando as imagens
save('NDVI','NDVI');
save('SARVI','SARVI');
imwrite(NDVI_Vis,'NDVI_Vis.tif','compression','none');
imwrite(SARVI_Vis,'SARVI_Vis.tif','compression','none');

