% Este programa aplica os fatores de correção atmosférica gerados pelo
% programa AulaPratica_2_CorAtm e faz a composição colorida com realce de
% histograma das bandas

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

%Leitura da imagem
Name     = input('Informe o nome da imagem (componente azul-B): ','s');
Azul     = imread(Name); %Leitura da imagem
ND_Azul  = input('Informe o fator de correção em ND para esta banda: ');

Name      = input('Informe o nome da imagem (componente verde-G): ','s');
Verde     = imread(Name); %Leitura da imagem
ND_Verde  = input('Informe o fator de correção em ND para esta banda: ');

Name         = input('Informe o nome da imagem (componente vermelha-R): ','s');
Vermelha     = imread(Name); %Leitura da imagem
ND_Vermelha  = input('Informe o fator de correção em ND para esta banda: ');

%corrigindo as imagens 
Azul_Corr = double(Azul) - ND_Azul;
Azul_Corr = uint8(Azul_Corr);

Verde_Corr = double(Verde) - ND_Verde;
Verde_Corr = uint8(Verde_Corr);

Vermelha_Corr = double(Vermelha) - ND_Vermelha;
Vermelha_Corr = uint8(Vermelha_Corr);

[m,n] = size(Azul);

%composição sem correção
img_Color = zeros(m,n,3);
img_Color = uint8(img_Color);
img_Color(:,:,3) = Azul;
img_Color(:,:,2) = Verde;
img_Color(:,:,1) = Vermelha;

%composição com correção
img_Color_Corr = zeros(m,n,3);
img_Color_Corr = uint8(img_Color_Corr);
img_Color_Corr(:,:,3) = Azul_Corr;
img_Color_Corr(:,:,2) = Verde_Corr;
img_Color_Corr(:,:,1) = Vermelha_Corr;

figure,imshow(img_Color,[]),title('Composição colorida sem correção');
figure,imshow(img_Color_Corr,[]),title('Composição colorida com correção');










