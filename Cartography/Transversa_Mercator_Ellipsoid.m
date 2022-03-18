% Projeção Transversa de Mercator
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

%Limitando os dados em latitude e longitude
%{
limiteLat = 90;
limiteLon = 60;
Lat_wo(abs(Lat_wo) > limiteLat) = NaN;
Lon_wo(Lon_wo < -120) = NaN;
Lon_wo(Lon_wo > 0) = NaN;
Lat_mp(abs(Lat_mp) > limiteLat) = NaN;
Lon_mp(Lon_mp < -127) = NaN;
Lon_mp(Lon_mp > 5) = NaN;
%}
%figure,plot(Lon_mp,Lat_mp);
Lon0 = deg2rad(0);%Greenwich era -60
Lat0 = deg2rad(0);
Lat1 = deg2rad(0);%Equador

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
%================================= MERIDIANOS E PARALELOS =====================
%Cálculo das quantidades intermediárias para meridianos e paralelos
e2l = e2 / (1 - e2);%e2l = e2 linha = segunda excentricidade
N   = a ./ sqrt(1 - e2 * sin(Lat_mp).^2);
T   = tan(Lat_mp).^2;
C   = e2l * cos(Lat_mp).^2;
A   = (Lon_mp - Lon0) .* cos(Lat_mp);

%Usando auxiliares no cálculo de M
aux1 = 1 - (e2 / 4) - (3 * e^4 / 64) - (5 * e^6 / 256);
aux2 = (3 * e2 / 8) + (3 * e^4 / 32) + (45 * e^6 / 1024);
aux3 = (15 * e^4 / 256) + (45 * e^6 / 1024);
aux4 = 35 * e^6 / 3072;

%Calculando M(Lat)
M = a * (aux1 * Lat_mp - aux2 * sin(2 * Lat_mp) + aux3 * sin(4 * Lat_mp) - aux4 * sin(6 * Lat_mp));

%Calculando M(Lat0)
M0 = a * (aux1 * Lat0 - aux2 * sin(2 * Lat0) + aux3 * sin(4 * Lat0) - aux4 * sin(6 * Lat0)); 

%Cálculo de X
%Usando valores auxiliares (p)
p1 = 1 - T + C;
p2 = 5 - (18 * T) + T.^2 + (72 * C) - (58 * e2l);

X_mp  = N .* (A + p1 .* A.^3 / 6 + p2 .* A.^5 / 120);

%Cálculo de Y
%Usando valores auxiliares (q)
q1 = N .* tan(Lat_mp);
q2 = 5 - T + 9 * C + 4 * C.^2;
q3 = 61 - 58 * T + T.^2 + 600 * C - 330 * e2l;

Y_mp = M - M0 + q1 .* (A.^2 / 2 + q2 .* A.^4 / 24 + q3 .* A.^6 / 720);

%Fator de escala
r1 = 1 + C;
r2 = 5 - 4 * T + 42 * C + 13 * C.^2 - 28 * e2l;
r3 = 61 - 148 * T + 16 * T.^2;

%======================== CONTINENTES ========================================
%Cálculo das quantidades intermediárias para continentes
e2l = e2 / (1 - e2);%e2l = e2 linha = segunda excentricidade
N   = a ./ sqrt(1 - e2 * sin(Lat_wo).^2);
T   = tan(Lat_wo).^2;
C   = e2l * cos(Lat_wo).^2;
A   = (Lon_wo - Lon0) .* cos(Lat_wo);

%Usando auxiliares no cálculo de M
aux1 = 1 - (e2 / 4) - (3 * e^4 / 64) - (5 * e^6 / 256);
aux2 = (3 * e2 / 8) + (3 * e^4 / 32) + (45 * e^6 / 1024);
aux3 = (15 * e^4 / 256) + (45 * e^6 / 1024);
aux4 = 35 * e^6 / 3072;

%Calculando M(Lat)
M = a * (aux1 * Lat_wo - aux2 * sin(2 * Lat_wo) + aux3 * sin(4 * Lat_wo) - aux4 * sin(6 * Lat_wo));

%Calculando M(Lat0)
M0 = a * (aux1 * Lat0 - aux2 * sin(2 * Lat0) + aux3 * sin(4 * Lat0) - aux4 * sin(6 * Lat0)); 

%Cálculo de X
%Usando valores auxiliares (p)
p1 = 1 - T + C;
p2 = 5 - (18 * T) + T.^2 + (72 * C) - (58 * e2l);

X_wo  = N .* (A + p1 .* A.^3 / 6 + p2 .* A.^5 / 120);

%Cálculo de Y
%Usando valores auxiliares (q)
q1 = N .* tan(Lat_wo);
q2 = 5 - T + 9 * C + 4 * C.^2;
q3 = 61 - 58 * T + T.^2 + 600 * C - 330 * e2l;

Y_wo = M - M0 + q1 .* (A.^2 / 2 + q2 .* A.^4 / 24 + q3 .* A.^6 / 720);

%Fator de escala
r1 = 1 + C;
r2 = 5 - 4 * T + 42 * C + 13 * C.^2 - 28 * e2l;
r3 = 61 - 148 * T + 16 * T.^2;

%Plotando em coordenadas da projeção
figure,plot(X_mp,Y_mp,'LineWidth',0.9,'color',[43/255 150/255 220/255]);
hold on;grid on;
plot(X_wo,Y_wo,'LineWidth',1.1);
xlabel('Coord. X [km]'),ylabel('Coord. Y [km]');
%xlim([-8500 8500]);ylim([-10000 10000]);
set(gca,'FontSize',10);