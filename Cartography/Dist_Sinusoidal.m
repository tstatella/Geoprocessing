
clear all;
close all;
clc;
%Superfície de distorção para a projeção Sinusoidal
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

%Para a projeção Sinusoidal k = 1
k = 1;

%Definição do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);

%Cálculo das coordenadas [X Y]. O raio equatorial de Marte: 3396 km
R = 3396;
X = R .* (deg2rad(Lon) - deg2rad(Lon0)) .* cos(deg2rad(Lat));
Y = R .* deg2rad(Lat);

%Cálculo da deformação angular máxima
w         = 2 .* atan(abs(0.5 .* deg2rad(Lon - Lon0) .* sin(deg2rad(Lat))));                                        
w         = rad2deg(w);

%Cálculo do fator de escala relativo ao longo dos meridianos
h         = sqrt(1 + (deg2rad(Lon) - deg2rad(Lon0)).^2 .* sin(deg2rad(Lat)).^2);

%ÂNGULO FORMADO ENTRE O MERIDIANO E O PARALELO EM CADA PONTO (TETA')
teta = asin(1 ./ h);
teta = rad2deg(teta);

%Plotando a deformação angular
figure,surf(Lon,Lat,w);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Angular distortion (°)');
title('Sinusoidal Projection');
xlim([-180 180]);
ylim([-70 70]);
set(gca,'XTick',-180:30:180);
set(gca,'YTick',-70:20:70);
grid on;

%Plotando a distorção ao longo dos meridianos
figure,surf(Lon,Lat,h);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Scale factor along meridians');
title('Sinusoidal Projection');
xlim([-180 180]);
ylim([-70 70]);
set(gca,'XTick',-180:30:180);
set(gca,'YTick',-70:20:70);
grid on;

%Plotando o grid transformado em coord. X, Y
[m n] = size(Lon);
figure,surf(X,Y,zeros(m,n));
xlabel('Coord. X (km)'),ylabel('Coord. Y (km)');
title('Sinusoidal Projection'),view(0,90);
zlim([0 1]);
grid on;

%Plotando o ângulo de intersecção entre meridianos e paralelos
figure,surf(Lon,Lat,teta);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Angle of intersection of meridians and parallels');
title('Sinusoidal Projection');




