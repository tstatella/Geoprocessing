% Código para leitura e gravação de imagens

clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');

%Fazendo a leitura da imagem
NameGray     = input('Digite o nome da imagem: ','s');
GetGray      = imread(NameGray); %Leitura da imagem

figure,imshow(GetGray,[]),title(NameGray);
figure,imhist(GetGray),title(['Histograma da imagem ', NameGray]);

%Gravando a imagem em diversos formatos
imwrite(GetGray,'meninapbm.pbm');
imwrite(GetGray,'meninapgm.pgm');
imwrite(GetGray,'meninajpg.jpg');