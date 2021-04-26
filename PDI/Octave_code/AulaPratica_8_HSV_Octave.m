%Transformação HSV
clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

a=imread('cores.jpg');
figure,imshow(a),title('Imagem original');

%Faz a transformação HSV
ahsv=rgb2hsv(a);

%Separa as componentes H, S e V
H=ahsv(:,:,1);
S=ahsv(:,:,2);
V=ahsv(:,:,3);

figure,imshow(H),title('Componente H da imagem de entrada');
figure,imshow(S),title('Componente S da imagem de entrada');
figure,imshow(V),title('Componente V da imagem de entrada');



