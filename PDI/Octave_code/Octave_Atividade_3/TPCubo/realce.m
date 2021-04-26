%%
%Este programa executa a detecção de rastros de Dust Devils em imagens
%digitais da superfície de Marte através de técnicas de Processamento
%Digital de Imagens. Para executar o programa, digite realce no prompt do
%Matlab e tecle enter. O script faz uso de uma classe chamada obj_img.

%%
%%


clear all; %Limpando as variáveis da memória
close all;
clear classes;%Fechando todas figuras
clc; %Limpando a tela

det=obj_img; %Declaração do objeto det pertencente à classe obj_img

disp('<<<<<Imagem de entrada>>>>>');
det.Nome=input('Digite o nome da imagem: ','s');
det.Imagem=imread(det.Nome); %Leitura da imagem
figure,imshow(det.Imagem,'border','loose'),title('Imagem Original');
clc;

disp('*****************************************');
disp('****Primeira etapa: pré-processamento****');
disp('*****************************************');
disp('        '); %Aqui há a opção de pré-processamento
Resp=input('Deseja efetuar ralce preliminar?(s/n) ','s' );


if Resp=='s'
    det.ImgR=det.Realce;
    det.Imagem=det.ImgR;
    figure,imshow(det.Imagem,'border','loose'),title('Imagem Realçada');
    clc;
end

Resp=input('Deseja efetuar filtragem?(s/n) ','s'); %Opção de pré-processamento

if Resp=='s'
    det.ImgF=det.Filtro;
    det.Imagem=det.ImgF;
    figure,imshow(det.ImgF,'border','loose'),title('Imagem Filtrada');
    clc;
    disp('Limiar utilizado na filtragem com areaopen:');
    disp(det.GetLimiarFilter);
    disp('        ');
    disp('Pressione qualquer tecla para prosseguir...');
    pause;
    clc;
end
disp('        ');
disp('*******************************************');
disp('****Segunda etapa: detecção dos rastros****');
disp('*******************************************');
disp('        ');
disp('Pressione qualquer tecla para prosseguir...');
pause; 
%Aqui começa a parte de detecção
%Todas as funções precedidas por 'mm' são da toolbox de Morfologia
TopFe=det.Fechamento;
figure,imshow(TopFe),title('Fechamento por top-hat');
clc;
disp('Limiar utilizado no fechamento top-hat: ');
disp(det.GetLimiarFech);
disp('        ');
disp('Pressione qualquer tecla para prosseguir...');
pause;
Realce=imadjust(TopFe);
figure,imhist(Realce),title('Histograma da imegem realçada');
clc;
Level=graythresh(Realce);
disp('Limiar utilizado na binarização: ');
disp(uint8(Level*255));
disp('        ');
disp('Pressione qualquer tecla para prosseguir...');
pause;
Bw=im2bw(Realce,Level);
figure,imshow(Realce),title('Realce da imagem fechada com top-hat');
clc;
figure,imshow(Bw),title('Imagem binarizada');
clc;
disp('        ');
disp('*******************************************');
disp('*********Resumo dos processamentos*********');
disp('*******************************************');
disp('        ');
disp('Limiar utilizado na filtragem com areaopen:');
disp(det.GetLimiarFilter);
disp('Limiar utilizado no fechamento top-hat: ');
disp(det.GetLimiarFech);
disp('Limiar utilizado na binarização: ');
disp(uint8(Level*255));
%%
%%


