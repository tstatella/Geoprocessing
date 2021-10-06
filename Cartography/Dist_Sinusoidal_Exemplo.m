%EXEMPLO PARA A IMAGEM E14-00400
% http://www.msss.com/moc_gallery/e13_e18/images/E14/E1400400.html

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

%No site é informada a Lon w = 41.84. Nas imagens MOC a Lon é positiva para
%W. Como a distorção é simétrica ao redor do MC, não faz diferença. O
%paralelo padrão será considerado como o equador, já que nada foi
%especificado
Lon0 = -41.84;

%Assumindo largura máxima como 8° e comprimento máximo 25°

%Coordenadas do centro da cena
LonCenter = -41.84;
LatCenter = -47.18;

LimLat1 = round(LatCenter - 12);
LimLat2 = round(LatCenter + 12);
StepLat =  1;
LimLon1 = round(LonCenter - 4);
LimLon2 = round(LonCenter + 4);
StepLon =  1;

%Para a projeção Sinusoidal k = 1
k = 1;

%Definição do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);

%Cálculo da deformação angular máxima
w         = 2 .* atan(abs(0.5 .* deg2rad(Lon - Lon0) .* sin(deg2rad(Lat))));                                        
w         = rad2deg(w);

%Cálculo do fator de escala relativo ao longo dos meridianos
h         = sqrt(1 + (deg2rad(Lon) - deg2rad(Lon0)).^2 .* sin(deg2rad(Lat)).^2);

%Plotando a deformação angular
figure,surf(Lon,Lat,w);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Angular distortion (°)');
title('Sinusoidal Projection');
xlim([LimLon1 LimLon2]);
ylim([LimLat1 LimLat2]);
set(gca,'XTick',LimLon1:StepLon:LimLon2);
set(gca,'YTick',LimLat1:StepLat:LimLat2);
grid on;

%Plotando a distorção ao longo dos meridianos
figure,surf(Lon,Lat,h);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Scale factor along meridians');
title('Sinusoidal Projection');
xlim([LimLon1 LimLon2]);
ylim([LimLat1 LimLat2]);
set(gca,'XTick',LimLon1:StepLon:LimLon2);
set(gca,'YTick',LimLat1:StepLat:LimLat2);
grid on;




