%Função que faz a rotação no eixo Z
function rz()
         
         global faceA faceB faceC faceD faceE faceF 
         global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
                vertice7 vertice8

         clc;   
         teta = input('Informe o ângulo de rotação e graus decimais: ');
         teta = deg2rad(teta);
         C    = cos(teta);
         S    = sin(teta);
         
         Mrotz = [C  -S  0  0;
                  S   C  0  0;
                  0   0  1  0;
                  0   0  0  1];
             
        
vertice1 = Mrotz*vertice1';
vertice2 = Mrotz*vertice2';
vertice3 = Mrotz*vertice3';
vertice4 = Mrotz*vertice4';
vertice5 = Mrotz*vertice5';
vertice6 = Mrotz*vertice6';
vertice7 = Mrotz*vertice7';
vertice8 = Mrotz*vertice8';

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
    title(['Cubo rotacionado de ',num2str(rad2deg(teta)),' graus']);


 end