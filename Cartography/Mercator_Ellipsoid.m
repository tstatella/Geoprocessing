% Projeção de Mercator
clc
clear all
close all


%Lon0:       Longitude do centro da projeção (meridiano central)
%Lat0:       Latitude média ou latitude escolhida como origem do sistema de
             %coordenadas retangulares da projeção
%Lat1, Lat2: Paralelos padrão
%h:          Fator de escala relativo ao longo dos meridianos
%k:          Fator de escala relativo ao longo dos paralelos
%w:          Máxima deformação angular num dado ponto da projeção
%X, Y:       Coordenadas retangulares da projeção
%R:          Raio da esfera de referência (km)

load('meridians_and_parallels.mat');
load('world_lon_lat.mat');
%carrega as variáveis com lon na primeira coluna e lat na segunda

Lon_mp = meridians_and_parallels(:,1);
Lat_mp = meridians_and_parallels(:,2);
Lon_wo = world_lon_lat(:,1);
Lat_wo = world_lon_lat(:,2);

%Limitando os dados em latitude para não ocorrerem divisões por zero
limite = 81;
Lat_wo(abs(Lat_wo) >= limite) = NaN;
Lat_mp(abs(Lat_mp) >= limite) = NaN;

Lon0 = 0;%Greenwich
Lat1 = 0;%Equador

%Plotando em coordenadas geodésicas
figure,plot(Lon_mp,Lat_mp,'LineWidth',0.9);hold on;
plot(Lon_wo,Lat_wo,'LineWidth',1.1);
xlabel('Lon [deg.]'),ylabel('Lat [deg.]');
xlim([-180 180]);ylim([-80 80]);
set(gca,'FontSize',12);

%Cálculo das coordenadas [X Y]. Assumindo elipsoide grs80
%Convertendo em radianos
Lon_mp = deg2rad(Lon_mp);
Lat_mp = deg2rad(Lat_mp);
Lon_wo = deg2rad(Lon_wo);
Lat_wo = deg2rad(Lat_wo);

% Parâmetros GRS80 
a  = 6378137/1000;%km
e2 = 0.00669437999015;
e  = sqrt(e2);

% Para as coordenadas dos continentes
X_wo     = a * (Lon_wo - Lon0)
potencia = e / 2;
tangente = tan((45 * pi / 180) + (Lat_wo / 2));
aux1     = 1 - (e * sin(Lat_wo));
aux2     = 1 + (e * sin(Lat_wo));
aux      = aux1 ./ aux2;
Y_wo     = a * log(tangente .* aux.^potencia)

% Para as coordenadas dos meridianos e paralelos
X_mp     = a * (Lon_mp - Lon0)
potencia = e / 2;
tangente = tan((45 * pi / 180) + (Lat_mp / 2));
aux1     = 1 - (e * sin(Lat_mp));
aux2     = 1 + (e * sin(Lat_mp));
aux      = aux1 ./ aux2;
Y_mp     = a * log(tangente .* aux.^potencia)

%Plotando em coordenadas da projeção
figure,plot(X_mp,Y_mp,'LineWidth',0.9,'color',[43/255 150/255 220/255]);hold on;
plot(X_wo,Y_wo,'LineWidth',1.1);
xlabel('Coord. X [km]'),ylabel('Coord. Y [km]');
xlim([-2e+4 2e+4]);ylim([-1.5e+4 1.5e+4]);
set(gca,'FontSize',12);