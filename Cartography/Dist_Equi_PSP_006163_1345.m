%EXEMPLO PARA A IMAGEM PSP_006163_1345
% http://hirise.lpl.arizona.edu/PSP_006163_1345

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

%Centro da projeção: Lat = -45, Lon = 180, conforme informado no label da
%imagem
%Lat min = -45.503388208405 e Lat max = -45.101910397651 conforme label
%Lon min (westernmost)= 316.19305828111 e Lon max (easternmost) = 316.38248559381


%Largura L: 31665 pixels
%Comprimento C: 94909 pixels
%Resolução: 0.25 m
%Portanto, L = 31665 pixels x 0.25 m = aprox. 8 km
%Portanto, C = 94909 pixels x 0.25 m = aprox. 24 km

%Convertendo largura L e comprimento C em ângulo:
L = 8 / 3386.1507470034;%Raio usado no label
L = rad2deg(L);

C = 24 / 3386.1507470034;
C = rad2deg(C);
 

%Coordenadas do centro da cena
LonCenter = 316.288;
LatCenter = -45.303;

% LimLat1 = LatCenter - (C / 2);
% LimLat2 = LatCenter + (C / 2);
LimLat2 = -45.101910397651; %Usando os limites dados no label da imagem
LimLat1 = -45.503388208405; %Usando os limites dados no label da imagem
StepLat =  0.1;
% LimLon1 = LonCenter - (L / 2);
% LimLon2 = LonCenter + (L / 2);
LimLon1 = 316.19305828111;%Usando os limites dados no label da imagem
LimLon2 = 316.38248559381;%Usando os limites dados no label da imagem
StepLon =  0.05;

%Note que o meridiano central e a Lat central (paralelo padrão) não estão
%na cena
Lon0 = 180;
Lat1 = -45;

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
