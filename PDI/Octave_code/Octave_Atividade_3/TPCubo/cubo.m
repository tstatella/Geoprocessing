%Este programa gera um cubo unitário e permite a sua manipulação através de
%operações de rotação e translação nos eixos (X,Y,Z) e projeção perspectiva.


%Programado por:
%**************************************************************************
%                        Thiago Statella 
%**************************************************************************
%
%                                            Computação Gráfica 09/2009

clear all;
close all;
clear function;
clc;


disp('Programado por:');
disp('*********************************************************************');
disp('                           Thiago Statella');
disp('*********************************************************************');
disp('    ');



%Declarando os vértices e faces como variáveis globais que serão 
%atualizados pelas funções


global vertices %Será usada para desfazer as operações
global faceA faceB faceC faceD faceE faceF
global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
       vertice7 vertice8 


%Vértices do cubo em coordenadas homogêneas
%%
vertice1 = [0 0 0 1];
vertice2 = [1 0 0 1];
vertice3 = [1 1 0 1];
vertice4 = [0 1 0 1];
vertice5 = [0 0 1 1];
vertice6 = [1 0 1 1];
vertice7 = [1 1 1 1];
vertice8 = [0 1 1 1];


%Lista de vértices

vertices = [0 0 0 1;
            1 0 0 1;
            1 1 0 1;
            0 1 0 1;
            0 0 1 1;
            1 0 1 1;
            1 1 1 1;
            0 1 1 1];
      

%%

%Função para criação das faces
makeFace = @criafaces;   
makeFace();

%Imprimindo versão aramada
print3d = @imprime3d;
print3d(faceA, faceB, faceC,faceD,faceE,faceF),title('Cubo aramado');
disp('Pressione uma tecla para continuar ...');
pause;

%Exibe o cubo preenchido
 
prtfilled = @impr_filled;
prtfilled(faceA, faceB, faceC,faceD,faceE,faceF),title('Cubo preenchido');

%Menu chama as opções de processamento
menu();


        

         