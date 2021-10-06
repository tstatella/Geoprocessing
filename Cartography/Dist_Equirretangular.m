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

LimLat1 = -70;
LimLat2 =  70;
StepLat =  5;
LimLon1 = -180;
LimLon2 =  180;
StepLon =  20;

Lon0 = 0;
Lat1 = 0;

%Para a projeção Equirretangular h = 1
h    = 1;

%Definição do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);

%Cálculo das coordenadas [X Y]. O raio equatorial de Marte: 3396 km
R = 3396;
X = R .* (deg2rad(Lon) - deg2rad(Lon0)) .* cos(deg2rad(Lat1));
Y = R .* deg2rad(Lat);

%Cálculo do fator de escala relativo ao longo dos paralelos
k = cos(deg2rad(Lat1))./cos(deg2rad(Lat));

%Cálculo da deformação angular máxima
w = 2.*asin((k-h)./(k+h));                                        
w = rad2deg(w);


%Plotando a deformação angular
figure,surf(Lon,Lat,w);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Angular distortion (°)');
title('Equirectangular Projection');
xlim([-180 180]);
ylim([-70 70]);
set(gca,'XTick',-180:30:180);
set(gca,'YTick',-70:20:70);
grid on;

%Plotando a distorção ao longo dos paralelos
figure,surf(Lon,Lat,k);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Scale factor along parallels');
title('Equirectangular Projection');
xlim([-180 180]);
ylim([-70 70]);
set(gca,'XTick',-180:30:180);
set(gca,'YTick',-70:20:70);
grid on;

%Plotando o grid transformado em coord. X, Y
[m n] = size(Lon);
figure,surf(X,Y,zeros(m,n));
xlabel('Coord. X (km)'),ylabel('Coord. Y (km)');
title('Equirectangular Projection');
zlim([0 1]);
grid on;

