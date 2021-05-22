%Transformação CMY
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

%separando as componentes RGB
R=a(:,:,1);
G=a(:,:,2);
B=a(:,:,3);

%normalizando em [0,1]
r=double(R)/255;
g=double(G)/255;
b=double(B)/255;

%Componetes CMY
C=1-r;
M=1-g;
Y=1-b;

C=uint8(C*255);
M=uint8(M*255);
Y=uint8(Y*255);

figure,imshow(C),title('Componente C da imagem original');
figure,imshow(M),title('Componente M da imagem original');
figure,imshow(Y),title('Componente Y da imagem original');

%Composição CMY
RGBNew(:,:,1)=C;
RGBNew(:,:,2)=M;
RGBNew(:,:,3)=Y;

figure,imshow(a),title('Imagem original');
figure,imshow(RGBNew),title('Composição CMY');



