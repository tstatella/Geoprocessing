%EXEMPLO PARA A IMAGEM M09-00520
% http://www.msss.com/moc_gallery/m07_m12/images/M09/M0900520.html

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

%No site é informada a Lon w = 180.03. Nas imagens MOC a Lon é positiva para
%W. Como a distorção é simétrica ao redor do MC, não faz diferença. O
%paralelo padrão será considerado como o equador, já que nada foi
%especificado
Lon0 = -180.03;

%Largura máxima: aprox. 3 km; comprimento máximo: aprox. 231 km (informação retirada do label da imagem no site)
%ESTES VALORES SÃO MUITO PEQUENOS PRA FAZER OS CÁLCULOS
%VOU ADOTAR OS MAIORES VALORES DE L E C DO BANCO DE IMAGENS

%Largura L máxima das imagens MOC no banco de imagens: 2048 pixels
%Comprimento C máximo das imagens MOC no banco de imagens: 24832 pixels
%Pior resolução imagens MOC: 12 m
%Portanto, L = 2048 pixels x 12 m = 24576 m = aprox. 25 km
%Portanto, C = 24832 pixels x 12 m = 297984 m = aprox. 300 km
%Largura L máxima das imagens HiRISE no banco de imagens: 39910 pixels
%Comprimento C máximo das imagens HiRISE no banco de imagens: 126617 pixels
%Pior resolução imagens HiRISE: 1 m
%Portanto, L = 39910 pixels x 1 m = 39910 m = aprox. 40 km
%Portanto, C = 126617 pixels x 1 m = 126617 m = aprox. 127 km

%Convertendo largura L e comprimento C em ângulo:
L = 25 / 3396;
L = rad2deg(L);

C = 300 / 3396;
C = rad2deg(C);
 

%Coordenadas do centro da cena
LonCenter = -180.03;
LatCenter = -65.21;

LimLat1 = LatCenter - (C / 2);
LimLat2 = LatCenter + (C / 2);
StepLat =  0.3;
LimLon1 = LonCenter - (L / 2);
LimLon2 = LonCenter + (L / 2);
StepLon =  0.01;

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
% xlim([LimLon1 LimLon2]);
% ylim([LimLat1 LimLat2]);

% ATick1 = LimLon1;
% ATick2 = LimLon1 + (abs(LimLon1) - abs(LimLon2)) / 3;
% ATick3 = ATick2 + (abs(LimLon1) - abs(LimLon2)) / 3;
% ATick4 = LimLon2;
% 
% BTick1 = LimLat1;
% BTick2 = LimLat1 + (abs(LimLat1) - abs(LimLat2)) / 3;
% BTick3 = BTick2 + (abs(LimLat1) - abs(LimLat2)) / 3;
% BTick4 = LimLat2;

% set(gca,'XTick',[ATick1 ATick2 ATick3 ATick4]);
% set(gca,'YTick',[BTick1 BTick2 BTick3 BTick4]);
% grid on;

%Plotando a distorção ao longo dos meridianos
figure,surf(Lon,Lat,h);
xlabel('Longitude (°)'),ylabel('Latitude (°)'),zlabel('Scale factor along meridians');
title('Sinusoidal Projection');
% xlim([LimLon1 LimLon2]);
% ylim([LimLat1 LimLat2]);
% set(gca,'XTick',LimLon1:LimLon2);
% set(gca,'YTick',LimLat1:LimLat2);
% grid on;




