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
StepLat =  0.1;
LimLon1 = -180;
LimLon2 =  180;
StepLon =  0.1;

Lon0 = 0;

% Parâmetros GRS80 
a  = 6378137/1000;%km
e2 = 0.00669437999015;
e  = sqrt(e2);

%Definição do reticulado
[Lon,Lat] = meshgrid(LimLon1:StepLon:LimLon2,LimLat1:StepLat:LimLat2);

m = sqrt(1 - (e2 * sin(deg2rad(Lat)).^2)) ./ cos(deg2rad(Lat));

%Plotando a distorção
figure,surf(Lon,Lat,m,'EdgeColor','none');
%colormap jet;
xlabel('Longitude [°]'),ylabel('Latitude [°]'),zlabel('Scale factor');
xlim([-180 180]);
ylim([-80 80]);
set(gca,'XTick',-180:90:180);
set(gca,'YTick',-80:40:80);
%grid on;
set(gca,'FontSize',13);
saveas(gcf,'dist_mercator','png')
