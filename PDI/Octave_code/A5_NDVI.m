%Cálculo de Índices de vegetação

clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

load Banda1_Ref;
load Banda3_Ref;
load Banda4_Ref;

%NDVI (note a divisão elemento a elemento ./)
NDVI = (Banda4_Ref - Banda3_Ref) ./ (Banda4_Ref + Banda3_Ref);

%SARVI
L    = 0.5;
Gama = 1;

Ref_RB = Banda3_Ref - (Gama * (Banda1_Ref - Banda3_Ref));
SARVI  = (Banda4_Ref - Ref_RB) ./ (Banda4_Ref + Ref_RB + L);

%Visualização
%Os valores de NDVI vão de -1 a 1
%Evitando valores negativos (os valores agora podem variar de 0 a 2)
NDVI_Vis  = NDVI + abs(min(NDVI(:)));
SARVI_Vis = SARVI + abs(min(SARVI(:)));

%Expandindo o range de ND de (0-2) para (0-255)
NDVI_Vis  = uint8(NDVI_Vis * (255 / 2));
SARVI_Vis = uint8(SARVI_Vis * (255 / 2));

figure,imshow(NDVI_Vis),title('NDVI');
figure,imshow(SARVI_Vis),title('SARVI');

%Visualização em cor do NDVI***********************************************
%Separando em classes temáticas
%Abaixo a função contourf faz o mapa de contorno dos dados. Eu escolhi
%empiricamente os valores [min 0 0.5 0.8 max] para serem limites nos quais
%as linhas de contorno são geradas. Valores de NDVI negativos geralmente
%representam água. Valores positivos baixos podem ser solos.
figure,contourf(NDVI,[min(NDVI(:)) 0 0.5 0.8 max(NDVI(:))]); 
colormap(jet);%escolhendo a paleta de cores
caxis([min(NDVI(:)) max(NDVI(:))])%forçando o range de cores a coincidir com valores min e max do NDVI
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de NDVI');

%Abaixo, reprodução da imagem NDVI, desta vez com escala contínua de
%valores
figure,imshow(NDVI);
title('Escala contínua de valores de NDVI');
colormap(jet);%escolhendo a paleta de cores
caxis([min(NDVI(:)) max(NDVI(:))])%forçando o range de cores a coincidir com valores min e max do Tkin
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de NDVI');

%Visualização em cor do SARVI***********************************************
figure,contourf(SARVI,[min(SARVI(:)) 0 0.5 0.8 max(SARVI(:))]); 
colormap(jet);
caxis([min(SARVI(:)) max(SARVI(:))])
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de SARVI');

%Abaixo, reprodução da imagem SARVI, desta vez com escala contínua de
%valores
figure,imshow(SARVI);
title('Escala contínua de valores de SARVI');
colormap(jet);%escolhendo a paleta de cores
caxis([min(SARVI(:)) max(SARVI(:))])%forçando o range de cores a coincidir com valores min e max do Tkin
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de SARVI');

%Gravando as imagens
save('NDVI','NDVI');
save('SARVI','SARVI');
imwrite(NDVI_Vis,'NDVI_Vis.tif','compression','none');
imwrite(SARVI_Vis,'SARVI_Vis.tif','compression','none');

