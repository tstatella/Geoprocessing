% C�digo para leitura e grava��o de imagens

clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        C�digo criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educa��o, Ci�ncia e Tecnologia de MT  ****');
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