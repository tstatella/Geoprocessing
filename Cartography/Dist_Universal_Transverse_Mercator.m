clear all
close all
clc
%Superfície de distorção para a projeção Mercator
%Baseado nas equações apresentadas em Snyder (1926)

%Lon0:       Longitude do centro da projeção (meridiano central)
%Lat0:       Latitude média ou latitude escolhida como origem do sistema de
             %coordenadas retangulares da projeção
%Lat1, Lat2: Paralelos padrão
%h:          Fator de escala relativo ao longo dos meridianos
%k:          Fator de escala relativo ao longo dos paralelos
%w:          Máxima deformação angular num dado ponto da projeção
%X, Y:       Coordenadas retangulares da projeção
%R:          Raio da esfera de referência (km)

LimLat1 = -80;
LimLat2 =  80;
StepLat =  1;
LimLon1 = -60;
LimLon2 =  -54;%-54
StepLon =  0.1;

Lon0 = deg2rad(-57);

% Parâmetros GRS80 
a  = 6378137/1000;%km
e2 = 0.00669437999015;
e  = sqrt(e2);

%Definição do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);
Lon = deg2rad(Lon);
Lat = deg2rad(Lat);

e2l = e2 / (1 - e2);%e2l = e2 linha = segunda excentricidade
N   = a ./ sqrt(1 - e2 * sin(Lat).^2);
T   = tan(Lat).^2;
C   = e2l * cos(Lat).^2;
A   = (Lon - Lon0) .* cos(Lat);

%Usando auxiliares no cálculo de M
aux1 = 1 - (e2 / 4) - (3 * e^4 / 64) - (5 * e^6 / 256);
aux2 = (3 * e2 / 8) + (3 * e^4 / 32) + (45 * e^6 / 1024);
aux3 = (15 * e^4 / 256) + (45 * e^6 / 1024);
aux4 = 35 * e^6 / 3072;

%Fator de escala
r1 = 1 + C;
r2 = 5 - 4 * T + 42 * C + 13 * C.^2 - 28 * e2l;
r3 = 61 - 148 * T + 16 * T.^2;


m  = 1 + (r1 .* A.^2 / 2) + (r2 .* A.^4 / 24) + (r3 .* A.^6 / 720);
m = m * 0.9996;

%Plotando a distorção
figure,surf(rad2deg(Lon),rad2deg(Lat),m,'EdgeColor','none');
%colormap jet;
xlabel('Longitude [°]'),ylabel('Latitude [°]'),zlabel('Scale factor');
xlim([-60 -54]);
ylim([-80 80]);
zlim([0.9996 1.001]);
set(gca,'XTick',-54:-1:-60);
set(gca,'YTick',-80:40:80);
%grid on;
set(gca,'FontSize',13);
saveas(gcf,'dist_UTM','png');