%Fatiamento de intensidade
clc;
clear all;
close all;
clear colormap;
disp('*********************************************************************');
disp('****        C�digo criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educa��o, Ci�ncia e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

%Fatiamento de intensidade
%Usando duas classes para segmentar a imagem de uma placa
Get = imread('placa1.jpg');

%Definindo um limiar para o fatiamento
Limiar  = 100;
Dados   = Get > 100;
Dados   = double(Dados);%convertendo em double pra fazer a opera��o aritmetica
Fundo   = 1 - Dados;

%Passando para o intervalo 0-255 e retornando as vari�veis para inteiros
Dados  = uint8(Dados * 255);
Fundo  = uint8(Fundo * 255);
%Produzindo uma imagem colorida
[m,n] = size(Get);
Out   = zeros(m,n,3);
Out(:,:,1) = Dados;
Out(:,:,2) = Fundo;
Out(:,:,3) = Dados;

figure,imshow(Get),title('Imagem original');
figure,imshow(Out),title('Imagem fatiada');

%Fatiamento de intensidade
%Usando colormap para segmentar a imagem de precipita��o
Get2 = imread('Lua.jpg');

figure,imshow(Get2),title('Imagem original');
figure,imshow(Get2,colormap(jet)),title('Imagem fatiada');
colormap(jet);%escolhendo a paleta de cores
caxis([min(Get2(:)) max(Get2(:))])%for�ando o range de cores a coincidir com valores min e max 
hcb=colorbar('horiz');
set(get(hcb,'Xlabel'),'String','Valores de Precipita��o');

