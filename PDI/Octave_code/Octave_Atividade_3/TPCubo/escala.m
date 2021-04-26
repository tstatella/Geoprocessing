%Função que altera a escala do cubo

function escala()

         global faceA faceB faceC faceD faceE faceF
         global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
                vertice7 vertice8

         clc;   
         sx = input('Informe a escala em X: ');
         sy = input('Informe a escala em Y: ');
         sz = input('Informe a escala em Z: ');
             
             s = [sx  0   0   0;
                  0   sy  0   0;
                  0   0   sz  0;
                  0   0   0   1];
             
        
vertice1 = s*vertice1';
vertice2 = s*vertice2';
vertice3 = s*vertice3';
vertice4 = s*vertice4';
vertice5 = s*vertice5';
vertice6 = s*vertice6';
vertice7 = s*vertice7';
vertice8 = s*vertice8';

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
    title(['Cubo com escalas X: ',num2str(sx),', Y: ',num2str(sy),...
    ', Z: ',num2str(sz)]);

 end