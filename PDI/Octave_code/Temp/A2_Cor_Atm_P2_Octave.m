% Este programa aplica os fatores de corre��o atmosf�rica gerados pelo
% programa AulaPratica_2_CorAtm e faz a composi��o colorida com realce de
% histograma das bandas

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

%Leitura da imagem
Name     = input('Informe o nome da imagem (componente azul-B): ','s');
Azul     = imread(Name); %Leitura da imagem
ND_Azul  = input('Informe o fator de corre��o em ND para esta banda: ');

Name      = input('Informe o nome da imagem (componente verde-G): ','s');
Verde     = imread(Name); %Leitura da imagem
ND_Verde  = input('Informe o fator de corre��o em ND para esta banda: ');

Name         = input('Informe o nome da imagem (componente vermelha-R): ','s');
Vermelha     = imread(Name); %Leitura da imagem
ND_Vermelha  = input('Informe o fator de corre��o em ND para esta banda: ');

%corrigindo as imagens 
Azul_Corr = double(Azul) - ND_Azul;
Azul_Corr = uint8(Azul_Corr);

Verde_Corr = double(Verde) - ND_Verde;
Verde_Corr = uint8(Verde_Corr);

Vermelha_Corr = double(Vermelha) - ND_Vermelha;
Vermelha_Corr = uint8(Vermelha_Corr);

[m,n] = size(Azul);

%composi��o sem corre��o
img_Color = zeros(m,n,3);
img_Color = uint8(img_Color);
img_Color(:,:,3) = Azul;
img_Color(:,:,2) = Verde;
img_Color(:,:,1) = Vermelha;

%composi��o com corre��o
img_Color_Corr = zeros(m,n,3);
img_Color_Corr = uint8(img_Color_Corr);
img_Color_Corr(:,:,3) = Azul_Corr;
img_Color_Corr(:,:,2) = Verde_Corr;
img_Color_Corr(:,:,1) = Vermelha_Corr;

figure,imshow(img_Color,[]),title('Composi��o colorida sem corre��o');
figure,imshow(img_Color_Corr,[]),title('Composi��o colorida com corre��o');










