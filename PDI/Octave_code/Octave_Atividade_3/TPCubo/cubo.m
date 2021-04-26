%Este programa gera um cubo unit�rio e permite a sua manipula��o atrav�s de
%opera��es de rota��o e transla��o nos eixos (X,Y,Z) e proje��o perspectiva.


%Programado por:
%**************************************************************************
%                        Thiago Statella 
%**************************************************************************
%
%                                            Computa��o Gr�fica 09/2009

clear all;
close all;
clear function;
clc;


disp('Programado por:');
disp('*********************************************************************');
disp('                           Thiago Statella');
disp('*********************************************************************');
disp('    ');



%Declarando os v�rtices e faces como vari�veis globais que ser�o 
%atualizados pelas fun��es


global vertices %Ser� usada para desfazer as opera��es
global faceA faceB faceC faceD faceE faceF
global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
       vertice7 vertice8 


%V�rtices do cubo em coordenadas homog�neas
%%
vertice1 = [0 0 0 1];
vertice2 = [1 0 0 1];
vertice3 = [1 1 0 1];
vertice4 = [0 1 0 1];
vertice5 = [0 0 1 1];
vertice6 = [1 0 1 1];
vertice7 = [1 1 1 1];
vertice8 = [0 1 1 1];


%Lista de v�rtices

vertices = [0 0 0 1;
            1 0 0 1;
            1 1 0 1;
            0 1 0 1;
            0 0 1 1;
            1 0 1 1;
            1 1 1 1;
            0 1 1 1];
      

%%

%Fun��o para cria��o das faces
makeFace = @criafaces;   
makeFace();

%Imprimindo vers�o aramada
print3d = @imprime3d;
print3d(faceA, faceB, faceC,faceD,faceE,faceF),title('Cubo aramado');
disp('Pressione uma tecla para continuar ...');
pause;

%Exibe o cubo preenchido
 
prtfilled = @impr_filled;
prtfilled(faceA, faceB, faceC,faceD,faceE,faceF),title('Cubo preenchido');

%Menu chama as op��es de processamento
menu();


        

         