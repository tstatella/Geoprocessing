%% Código para geração de imagens monocromáticas e coloridas
clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');

%Imagens monocromáticas
impreta=zeros(100,100);
impreta=uint8(impreta);
figure,imshow(impreta),title('Imagem totalmente preta');
impreta(40:60,40:60)=255;
figure,imshow(impreta),title('Imagem preta com um quadrado branco no centro');

imcinza=impreta;
imcinza(25:75,25:75)=127;
figure,imshow(imcinza),title('Imagem preta com um quadrado cinza no centro');
imcinza(40:60,40:60)=255;
figure,imshow(imcinza),title('Imagem preta com um quadrado cinza e branco no centro');

%Imagens coloridas

imcolor=zeros(100,100,3);
imcolor=uint8(imcolor);
imcolor(:,:,3)=255;
figure,imshow(imcolor),title('Imagem Azul');
imcolor(25:75,25:75,3)=0;
imcolor(25:75,25:75,2)=255;
figure,imshow(imcolor),title('Imagem Azul e Verde');
imcolor(40:60,40:60,3)=0;
imcolor(40:60,40:60,2)=0;
imcolor(40:60,40:60,1)=255;
figure,imshow(imcolor),title('Imagem Axul, Verde e Vermelha');

%% Código para leitura e gravação de imagens

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
imwrite(GetGray,'meninapbm.pbm','encoding','ASCII');
imwrite(GetGray,'meninapgm.pgm','encoding','ASCII');
imwrite(GetGray,'meninajpg.jpg');