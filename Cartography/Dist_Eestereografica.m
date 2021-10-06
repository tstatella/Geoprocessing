clear all;
close all;
clc;
%Superf�cie de distor��o para a proje��o Polar Estereogr�fica
%Baseado nas equa��es apresentadas em Snyder (1926)
%No mapeamento de Marte, esta proje��o � usada nos limites 65�S-65�N
%Acima destes limites utiliza-se a Polar Estereogr�fica caso: Polo N

%Lon0:       Longitude do centro da proje��o (meridiano central)
%Lat0:       Latitude m�dia ou latitude escolhida como origem do sistema de
             %coordenadas retangulares da proje��o
%Lat1, Lat2: Paralelos padr�o
%h:          Fator de escala relativo ao longo dos meridianos
%k:          Fator de escala relativo ao longo dos paralelos
%w:          M�xima deforma��o angular num dado ponto da proje��o
%X, Y:       Coordenadas retangulares da proje��o
%R:          Raio da esfera de refer�ncia (km)

LimLat1 = 65;
LimLat2 = 90;
StepLat =  2.5;
LimLon1 = -180;
LimLon2 =  180;
StepLon =  20;

Lat1 = 90;
Lon0 = 0;

%Defini��o do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);

%C�lculo das coordenadas [X Y]. O raio equatorial de Marte: 3396 km
R = 3396;
k0 = 1;

X = 2 * k0 * R .* tan((pi / 4) - (deg2rad(Lat / 2))) .* sin(deg2rad(Lon - Lon0));
Y = -2 * k0 * R .* tan((pi / 4) - (deg2rad(Lat / 2))) .* cos(deg2rad(Lon - Lon0));

%C�lculo do fator de escala relativo ao longo dos paralelos
k = (2 * k0) ./ (1 + sin(deg2rad(Lat)));

%Como � uma proje��o conforme, k = h

%Distor��o em �rea = k^2

area = k.^2;

%Plotando a deforma��o ao longo dos paralelos
figure,surf(Lon,Lat,k);
xlabel('Longitude (�)'),ylabel('Latitude (�)'),zlabel('Scale factor along parallels');
title('Stereographic Projection'),view(-136,44);
xlim([-180 180]);
ylim([65 90]);
set(gca,'XTick',-180:30:180);
set(gca,'YTick',65:5:90);
grid on;

%Plotando a distor��o em �rea
figure,surf(Lon,Lat,area);
xlabel('Longitude (�)'),ylabel('Latitude (�)'),zlabel('Area scale factor');
title('Stereographic Projection'), view(-136,44);
xlim([-180 180]);
ylim([65 90]);
set(gca,'XTick',-180:30:180);
set(gca,'YTick',65:5:90);
grid on;

%Plotando o grid transformado em coord. X, Y
[m n] = size(Lon);
figure,surf(X,Y,zeros(m,n));
xlabel('Coord. X (km)'),ylabel('Coord. Y (km)');
title('Stereographic Projection'),view(0,90);
zlim([0 1]);
grid on;


