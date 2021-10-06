%EXEMPLO PARA A IMAGEM E14-00400
% http://www.msss.com/moc_gallery/e13_e18/images/E14/E1400400.html

clear all;
close all;
clc;
%Superf�cie de distor��o para a proje��o Sinusoidal
%Baseado nas equa��es apresentadas em Snyder (1926)
%No mapeamento de Marte, esta proje��o � usada nos limites 65�S-65�N
%Acima destes limites utiliza-se a Polar Estereogr�fica

%Lon0:       Longitude do centro da proje��o (meridiano central)
%Lat0:       Latitude m�dia ou latitude escolhida como origem do sistema de
             %coordenadas retangulares da proje��o
%Lat1, Lat2: Paralelos padr�o
%h:          Fator de escala relativo ao longo dos meridianos
%k:          Fator de escala relativo ao longo dos paralelos
%w:          M�xima deforma��o angular num dado ponto da proje��o
%X, Y:       Coordenadas retangulares da proje��o
%R:          Raio da esfera de refer�ncia (km)

%No site � informada a Lon w = 41.84. Nas imagens MOC a Lon � positiva para
%W. Como a distor��o � sim�trica ao redor do MC, n�o faz diferen�a. O
%paralelo padr�o ser� considerado como o equador, j� que nada foi
%especificado
Lon0 = -41.84;

%Assumindo largura m�xima como 8� e comprimento m�ximo 25�

%Coordenadas do centro da cena
LonCenter = -41.84;
LatCenter = -47.18;

LimLat1 = round(LatCenter - 12);
LimLat2 = round(LatCenter + 12);
StepLat =  1;
LimLon1 = round(LonCenter - 4);
LimLon2 = round(LonCenter + 4);
StepLon =  1;

%Para a proje��o Sinusoidal k = 1
k = 1;

%Defini��o do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);

%C�lculo da deforma��o angular m�xima
w         = 2 .* atan(abs(0.5 .* deg2rad(Lon - Lon0) .* sin(deg2rad(Lat))));                                        
w         = rad2deg(w);

%C�lculo do fator de escala relativo ao longo dos meridianos
h         = sqrt(1 + (deg2rad(Lon) - deg2rad(Lon0)).^2 .* sin(deg2rad(Lat)).^2);

%Plotando a deforma��o angular
figure,surf(Lon,Lat,w);
xlabel('Longitude (�)'),ylabel('Latitude (�)'),zlabel('Angular distortion (�)');
title('Sinusoidal Projection');
xlim([LimLon1 LimLon2]);
ylim([LimLat1 LimLat2]);
set(gca,'XTick',LimLon1:StepLon:LimLon2);
set(gca,'YTick',LimLat1:StepLat:LimLat2);
grid on;

%Plotando a distor��o ao longo dos meridianos
figure,surf(Lon,Lat,h);
xlabel('Longitude (�)'),ylabel('Latitude (�)'),zlabel('Scale factor along meridians');
title('Sinusoidal Projection');
xlim([LimLon1 LimLon2]);
ylim([LimLat1 LimLat2]);
set(gca,'XTick',LimLon1:StepLon:LimLon2);
set(gca,'YTick',LimLat1:StepLat:LimLat2);
grid on;




