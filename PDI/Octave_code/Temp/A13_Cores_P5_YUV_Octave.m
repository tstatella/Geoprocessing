%Transformação YUV
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
R=double(a(:,:,1));
G=double(a(:,:,2));
B=double(a(:,:,3));

%Transformação em YUV
Y=0.299*R+0.587*G+0.114*B;
U=0.493*(B-Y);
V=0.877*(R-Y);

figure,imshow(a),title('Imagem original');
figure,imshow(uint8(Y)),title('Componente Y da imagem original');
figure,imshow(uint8(U)),title('Componente U da imagem original');
figure,imshow(uint8(V)),title('Componente V da imagem original');

%Retorno para RGB
R=(V/0.877)+Y;
B=(U/0.493)+Y;
Y=(Y-(0.299*R)-(0.114*B))/0.587;

RGB(:,:,1)=R;
RGB(:,:,2)=G;
RGB(:,:,3)=B;

figure,imshow(uint8(RGB)),title('Transformação YUV>RGB');