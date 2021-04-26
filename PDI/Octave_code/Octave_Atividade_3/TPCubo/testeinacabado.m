% Código para efetuar rotação, translação e escala em um quadrado unitário

clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');

%Coordenadas dos pontos

pto1.x = 0;
pto1.y = 1;
pto1.z = 1;

pto2.x = 1;
pto2.y = 1;
pto2.z = 1;

pto3.x = 1;
pto3.y = 0;
pto3.z = 1;

pto4.x = 0;
pto4.y = 0;
pto4.z = 1;

X = [pto1.x;pto2.x;pto3.x;pto4.x;pto1.x];
Y = [pto1.y;pto2.y;pto3.y;pto4.y;pto1.y];
Z = [pto1.z;pto2.z;pto3.z;pto4.z;pto1.z];

figure,plot3(X,Y,Z),grid on, xlabel('X'),ylabel('Y'),zlabel('Z');

%aplicando escala********************************************************

sx = input('Informe a escala em X: '); 
sy = input('Informe a escala em Y: ');
sz = input('Informe a escala em Z: ');
             
             s = [sx  0   0   0;
                  0   sy  0   0;
                  0   0   sz  0;
                  0   0   0   1];

pto1S = S * [pto1.x;
             pto1.y;
             pto1.z];

pto2S = S * [pto2.x;
             pto2.y;
             pto2.z];

pto3S = S * [pto3.x;
             pto3.y;
             pto3.z];





