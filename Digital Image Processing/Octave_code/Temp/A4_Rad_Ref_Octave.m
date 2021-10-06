%C�lculo de radi�ncia e reflect�ncia no topo da atmosfera (TOA)

clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        C�digo criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educa��o, Ci�ncia e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

%Dados de entrada**********************************************************
Banda       = imread('LANDSAT_5_TM_19860908_226_071_L2_BAND1_Corte.tif');
Lmin        = -1.52;
Lmax        = 169;
Data        = '08.09.1986';
Elevation   = 46.7330;
Zenital     = 90 - Elevation;
ESUN        = 1983;
%**************************************************************************

%Calculando a dist�ncia Terra-Sol******************************************
%Dia do ano
dda  = datenum(Data,'dd.mm.yyyy') - datenum('01.01.1986','dd.mm.yyyy');
d    = 1 + (0.0167 * sin(2 * pi * (dda - 93.5) / 365));
%**************************************************************************

%Calculando radi�ncia******************************************************
Banda = double(Banda);
Rad   = (((Lmax - Lmin) / 255) * Banda) + Lmin;
%deslocando para evitar valores de radi�ncia negativa
Rad   = Rad + abs(Lmin);
figure,imshow(Rad,[]),title('Imagem de radi�ncia');
%**************************************************************************

%Reflect�ncia (TOA)********************************************************
Ref = (pi * Rad * d^2) / (ESUN * cos(deg2rad(Zenital)));
figure,imshow(Ref,[]),title('Imagem de reflect�ncia');
%**************************************************************************

%Salvando: aten��o ao nome

Banda1_Rad = Rad;
save('Banda1_Rad','Banda1_Rad');
Banda1_Ref = Ref;
save('Banda1_Ref','Banda1_Ref');



