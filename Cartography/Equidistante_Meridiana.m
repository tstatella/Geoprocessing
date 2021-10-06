clear all
close all
clc
%Coordenadas e superf�cie de distor��o para a proje��o Equirretangular (Equidistante meridiana)
%Baseado nas equa��es apresentadas em Snyder (1987)

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

Lon0 = 0;%Greenwich
Lat1 = 0;%Equador

%Plotando em coordenadas geod�sicas
figure,plot(Lon,Lat);
xlabel('Lon [deg.]'),ylabel('Lat [deg.]');
title('Equirectangular Projection','FontSize',14);

%C�lculo das coordenadas [X Y]. Assumindo raio equatorial de 6371 km
R = 6371;%km
X = R .* (deg2rad(Lon) - deg2rad(Lon0)) .* cos(deg2rad(Lat1));
Y = R .* deg2rad(Lat);

figure,plot(X,Y);
xlabel('Coord. X [km]'),ylabel('Coord. Y [km]');
title('Equirectangular Projection','FontSize',14);

%% Superficies de distor�ao

%Definindo limites
LimLat1 = -80;
LimLat2 =  80;
StepLat =  10;
LimLon1 = -180;
LimLon2 =  180;
StepLon =  10;

%Defini��o do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);

%Para a proje��o Equirretangular h = 1
h    = 1;

%C�lculo do fator de escala relativo ao longo dos paralelos
k = cos(deg2rad(Lat1))./cos(deg2rad(Lat));

%C�lculo da deforma��o angular m�xima
w = 2.*asin((k-h)./(k+h));                                        
w = rad2deg(w);
w(isnan(w)) = 0;% para lat = 0 a divis�o fica 0/0
w = abs(w);% nao importa o sinal


%Plotando a deforma��o angular
figure,surf(Lon,Lat,w);
xlabel('Longitude [deg.]'),ylabel('Latitude [deg.]'),zlabel('Angular distortion (�)');
title('Equirectangular Projection','FontSize',14);
xlim([LimLon1 LimLon2]);
ylim([LimLat1 LimLat2]);
set(gca,'XTick',LimLon1:30:LimLon2);
set(gca,'YTick',LimLat1:20:LimLat2);
grid on;

%Plotando a distor��o ao longo dos paralelos
figure,surf(Lon,Lat,k);
xlabel('Longitude [deg.]'),ylabel('Latitude [deg.]'),zlabel('Scale factor along parallels');
title('Equirectangular Projection','FontSize',14);
xlim([LimLon1 LimLon2]);
ylim([LimLat1 LimLat2]);
set(gca,'XTick',LimLon1:30:LimLon2);
set(gca,'YTick',LimLat1:20:LimLat2);
grid on;

