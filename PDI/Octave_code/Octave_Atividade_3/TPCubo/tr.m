%Função que faz a translação do cubo
function tr()
         
         global faceA faceB faceC faceD faceE faceF
         global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
                vertice7 vertice8

         clc;   
         tx = input('Informe a translação em X: ');
         ty = input('Informe a translação em Y: ');
         tz = input('Informe a translação em Z: ');
             
             t = [1   0  0  tx;
                  0   1  0  ty;
                  0   0  1  tz;
                  0   0  0  1];
             
        
vertice1 = t*vertice1';
vertice2 = t*vertice2';
vertice3 = t*vertice3';
vertice4 = t*vertice4';
vertice5 = t*vertice5';
vertice6 = t*vertice6';
vertice7 = t*vertice7';
vertice8 = t*vertice8';

vertice1 = vertice1';
vertice2 = vertice2';
vertice3 = vertice3';
vertice4 = vertice4';
vertice5 = vertice5';
vertice6 = vertice6';
vertice7 = vertice7';
vertice8 = vertice8';

makeFace = @criafaces;   
makeFace();

prtfilled = @impr_filled;
prtfilled(faceA,faceB,faceC,faceD,faceE,faceF),...
    title(['Cubo transladado por X: ',num2str(tx),', Y: ',num2str(ty),...
    ', Z: ',num2str(tz)]);

 end