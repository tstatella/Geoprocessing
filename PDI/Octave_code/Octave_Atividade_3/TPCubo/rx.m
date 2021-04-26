%Função que faz a rotação no eixo X
function rx()
         
            
            global faceA faceB faceC faceD faceE faceF
            global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
                   vertice7 vertice8

         clc;   
         teta = input('Informe o ângulo de rotação e graus decimais: ');
         teta = deg2rad(teta);
         C    = cos(teta);
         S    = sin(teta);
         
         Mrotx = [1  0  0  0;
                 0  C -S  0;
                 0  S  C  0;
                 0  0  0  1];
             
        
vertice1 = Mrotx*vertice1';
vertice2 = Mrotx*vertice2';
vertice3 = Mrotx*vertice3';
vertice4 = Mrotx*vertice4';
vertice5 = Mrotx*vertice5';
vertice6 = Mrotx*vertice6';
vertice7 = Mrotx*vertice7';
vertice8 = Mrotx*vertice8';

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
