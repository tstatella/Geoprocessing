clear all
close all
clc
%Superf�cie de distor��o para a proje��o Polar Estereogr�fica
%Baseado nas equa��es apresentadas em Snyder (1926)
%Caso polar N

%Lon0:       Longitude do centro da proje��o (meridiano central)
%Lat0:       Latitude m�dia ou latitude escolhida como origem do sistema de
             %coordenadas retangulares da proje��o
%Lat1, Lat2: Paralelos padr�o
%h:          Fator de escala relativo ao longo dos meridianos
%k:          Fator de escala relativo ao longo dos paralelos
%w:          M�xima deforma��o angular num dado ponto da proje��o
%X, Y:       Coordenadas retangulares da proje��o
%R:          Raio da esfera de refer�ncia (km)

%cd('D:\Projetos\Projeto_Cartografia');

load('cost_pa_me.mat')
%carrega a vari�vel cost_pa_me com lon na primeiroa coluna e lat na segunda
Lon = cost_pa_me(:,1);
Lat = cost_pa_me(:,2);

%Limitando os dados ao hemisf�rio Norte
for i = 1 : 10015
    if Lat(i) < 0
        Lat(i) = NaN;
        Lon(i) = NaN;
    end
end

Lat1 = 90;
Lon0 = 0;

%Plotando em coordenadas geod�sicas
figure,plot(Lon,Lat);
xlabel('Lon [deg.]'),ylabel('Lat [deg.]');
title('Geodesic coord.','FontSize',14);

%C�lculo das coordenadas [X Y]. O raio equatorial: 6371 km
R = 6371;
k0 = 1;

X = 2 * k0 * R .* tan((pi / 4) - (deg2rad(Lat / 2))) .* sin(deg2rad(Lon - Lon0));
Y = -2 * k0 * R .* tan((pi / 4) - (deg2rad(Lat / 2))) .* cos(deg2rad(Lon - Lon0));

figure,plot(X,Y);
xlabel('Coord. X [km]'),ylabel('Coord. Y [km]');
title('Polar Stereographic Projection','FontSize',14);
set(gca,'FontSize',30);grid on;

%% Superf�cies de distor��o

%Definindo limites
LimLat1 = 0;
LimLat2 = 90;
StepLat =  10;
LimLon1 = -180;
LimLon2 =  180;
StepLon =  20;

%Defini��o do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);

%C�lculo do fator de escala relativo ao longo dos paralelos
k = (2 * k0) ./ (1 + sin(deg2rad(Lat)));

%Como � uma proje��o conforme, k = h

%Distor��o em �rea = k^2
area = k.^2;

%Plotando a deforma��o ao longo dos paralelos
figure,surf(Lon,Lat,k);
xlabel('Longitude [deg.]'),ylabel('Latitude [deg.]'),zlabel('Scale factor along parallels');
title('Stereographic Projection','FontSize',14),view(-136,44);
xlim([-180 180]);
ylim([0 90]);
set(gca,'XTick',-180:30:180);
set(gca,'YTick',0:20:90);
grid on;

%Plotando a distor��o em �rea
figure,surf(Lon,Lat,area);
xlabel('Longitude [deg.]'),ylabel('Latitude [deg.]'),zlabel('Area scale factor');
title('Stereographic Projection','FontSize',14), view(-136,44);
xlim([-180 180]);
ylim([0 90]);
set(gca,'XTick',-180:30:180);
set(gca,'YTick',0:20:90);
grid on;
