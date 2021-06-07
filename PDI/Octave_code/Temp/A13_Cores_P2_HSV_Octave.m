%Transforma��o HSV
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

a=imread('cores.jpg');
figure,imshow(a),title('Imagem original');

%Faz a transforma��o HSV
ahsv=rgb2hsv(a);

%Separa as componentes H, S e V
H=ahsv(:,:,1);
S=ahsv(:,:,2);
V=ahsv(:,:,3);

figure,imshow(H),title('Componente H da imagem de entrada');
figure,imshow(S),title('Componente S da imagem de entrada');
figure,imshow(V),title('Componente V da imagem de entrada');



