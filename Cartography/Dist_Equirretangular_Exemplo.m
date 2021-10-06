%EXEMPLO PARA A IMAGEM ESP_029009_2425
% http://hirise.lpl.arizona.edu/ESP_029009_2425

clear all;
close all;
clc;
%Superfície de distorção para a projeção Equirretangular
%Baseado nas equações apresentadas em Snyder (1926)
%No mapeamento de Marte, esta projeção é usada nos limites 65°S-65°N
%Acima destes limites utiliza-se a Polar Estereográfica

%Lon0:       Longitude do centro da projeção (meridiano central)
%Lat0:       Latitude média ou latitude escolhida como origem do sistema de
             %coordenadas retangulares da projeção
%Lat1, Lat2: Paralelos padrão
%h:          Fator de escala relativo ao longo dos meridianos
%k:          Fator de escala relativo ao longo dos paralelos
%w:          Máxima deformação angular num dado ponto da projeção
%X, Y:       Coordenadas retangulares da projeção
%R:          Raio da esfera de referência (km)

%Centro da projeção: Lat = 60, Lon = 180, conforme informado no label da
%imagem
%Lat min = 62.035247498324 e Lat max = 62.310971344687 conforme label
%Lon min (westernmost)= 87.268403947419 e Lon max (easternmost) = 87.559422407561
%ESTES VALORES SÃO MUITO PEQUENOS PRA FAZER OS CÁLCULOS
%VOU ADOTAR OS MAIORES VALORES DE L E C DO BANCO DE IMAGENS

%Largura L máxima das imagens MOC no banco de imagens: 2048 pixels
%Comprimento C máximo das imagens MOC no banco de imagens: 24832 pixels
%Pior resolução imagens MOC: 12 m
%Portanto, L = 2048 pixels x 12 m = 24576 m = aprox. 25 km
%Portanto, C = 24832 pixels x 12 m = 297984 m = aprox. 300 km
%Largura L máxima das imagens HiRISE no banco de imagens: 39910 pixels
%Comprimento C máximo das imagens HiRISE no banco de imagens: 126617 pixels
%Pior resolução imagens HiRISE: 1 m
%Portanto, L = 39910 pixels x 1 m = 39910 m = aprox. 40 km
%Portanto, C = 126617 pixels x 1 m = 126617 m = aprox. 127 km

%Convertendo largura L e comprimento C em ângulo:
L = 40 / 3396;
L = rad2deg(L);

C = 127 / 3396;
C = rad2deg(C);
 

%Coordenadas do centro da cena
LonCenter = 87.404;
LatCenter = 62.172;

LimLat1 = LatCenter - (C / 2);
LimLat2 = LatCenter + (C / 2);
StepLat =  0.1;
LimLon1 = LonCenter - (L / 2);
LimLon2 = LonCenter + (L / 2);
StepLon =  0.05;

%Note que o meridiano central e a Lat central (paralelo padrão) não estão
%na cena
Lon0 = 180;
Lat1 = 60;

%Para a projeção Equirretangular h = 1
h    = 1;

%Definição do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);


%Cálculo do fator de escala relativo ao longo dos paralelos
k = cos(deg2rad(Lat1))./cos(deg2rad(Lat));

%Cálculo da deformação angular máxima
w = 2.*asin((k-h)./(k+h));                                        
w = rad2deg(w);


%Plotando a deformação angular
figure,surf(Lon,Lat,w);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Angular distortion (°)');
title('Equirectangular Projection');
% xlim([-180 180]);
% ylim([-70 70]);
% set(gca,'XTick',-180:30:180);
% set(gca,'YTick',-70:20:70);
% grid on;

%Plotando a distorção ao longo dos paralelos
figure,surf(Lon,Lat,k);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Scale factor along parallels');
title('Equirectangular Projection');
% xlim([-180 180]);
% ylim([-70 70]);
% set(gca,'XTick',-180:30:180);
% set(gca,'YTick',-70:20:70);
% grid on;

