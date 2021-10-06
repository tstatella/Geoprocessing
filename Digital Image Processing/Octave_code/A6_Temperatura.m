%Cálculo de temperatura

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

Lmin = 1.2378;%Lmin na banda do IVT
load Banda6_Rad;
load NDVI;
%No cálculo da radiância eu somei o abs(Lmin) às matrizes para evitar
%valores negativos na hora de calcular a reflectância e posteriormente os
%NDVIs. Por isso, aqui estou subtraindo este valor.
Banda6_Rad = Banda6_Rad - Lmin;
%Entrada das constantes k1 e k2
k1 = 607.76;
k2 = 1260.56;

%Cálculo da temperatura de brilho (Trad)
Trad = (k2 ./ (log((k1 ./ Banda6_Rad) + 1))) - 273.15;

%Cálculo da emissividade com base no NDVI
%A imagem NDVI tem resolução melhor que a do IVT. Então é preciso
%reamostrar o NDVI para a resolução da banda termal a fim de calcular a
%emissividade para cada pixel da banda termal.
[m,n]=size(Trad);
NDVI_R = imresize(NDVI,[m n],'nearest');
E = zeros(m,n);
for i = 1 : m
    for j = 1 : n
        if NDVI_R(i,j) > 0.24
            E(i,j) = 1.009 + (0.047 * log(NDVI_R(i,j)));
        else
            E(i,j) = 0.94;
        end
    end
end

%Cálculo da temperatura cinética Tkin
Tkin = Trad ./ E.^(1/4);

%Visualizando em tons de cinza
figure,imshow(Trad,[]);%expandindo os tons de cinza min->0, max->255
title('Temperatura Aparente');

%Visualizando em classes
figure,imshow(Trad);
title('Mapa de Temperatura Aparente');
colormap(jet);%escolhendo a paleta de cores
caxis([min(Trad(:)) max(Trad(:))])%forçando o range de cores a coincidir com valores min e max do Trad
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de Temperatura aparente (°C)');

%Visualizando em tons de cinza
figure,imshow(Tkin,[]);%expandindo os tons de cinza min->0, max->255
title('Temperatura Cinética');

%Visualizando em classes
figure,imshow(Tkin);
title('Mapa de Temperatura Cinética');
colormap(jet);%escolhendo a paleta de cores
caxis([min(Tkin(:)) max(Tkin(:))])%forçando o range de cores a coincidir com valores min e max do Tkin
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de Temperatura cinética (°C)');


