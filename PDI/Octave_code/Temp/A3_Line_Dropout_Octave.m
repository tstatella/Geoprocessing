%Corre��o de line dropout
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
[m,n]        = size(GetGray);

New_R = GetGray; %fazendo uma c�pia da imagem de entrada
New_M = GetGray; %fazendo uma c�pia da imagem de entrada

figure,imshow(GetGray),title(NameGray);
figure,imhist(GetGray),title(['Histograma da imagem ', NameGray]);

Aux = input('Quantas linhas pretende corrigir? ');

Lines = zeros(1,Aux);

for i = 1 : Aux
Lines(1,i) = input(['Digite a coordenada da linha ',num2str(i),':']);
%no caso do matlab, X representa as colunas e Y as linhas
end


%Replicando a linha de cima para substituir a linha defeituosa

for k = 1 : Aux %j ser� o �ndice das linhas
    for i = 1 : n
        j = Lines(1,k);
        New_R(j,i) = GetGray(j-1,i);
        %New_R(Lines(1,j),i) = GetGray(Lines(1,j)-1,i);
    end
end

%antes de fazer opera��es aritm�ticas com a imagem preciso converter para
%double
GetGray = double(GetGray);

%Fazendo a m�dia entre linhas adjacentes para corrigir a imagem
for k = 1 : Aux %j ser� o �ndice das linhas
    for i = 1 : n
        j = Lines(1,k);
        New_M(j,i) = uint8((GetGray(j-1,i) + GetGray(j+1,i)) / 2);
    end
end

figure,imshow(New_R),title('Imagem restaurada (replica��o)');
figure,imshow(New_M),title('Imagem restaurada (m�dia)');
