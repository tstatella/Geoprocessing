%Função que faz a rotação no eixo Y
function ry()
       
      
      global faceA faceB faceC faceD faceE faceF         
      global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
             vertice7 vertice8

         clc;   
         teta = input('Informe o ângulo de rotação e graus decimais: ');
         teta = deg2rad(teta);
         C    = cos(teta);
         S    = sin(teta);
         
         Mroty = [C  0  S  0;
                  0  1  0  0;
                 -S  0  C  0;
                  0  0  0  1];
             
        
vertice1 = Mroty*vertice1';
vertice2 = Mroty*vertice2';
vertice3 = Mroty*vertice3';
vertice4 = Mroty*vertice4';
vertice5 = Mroty*vertice5';
vertice6 = Mroty*vertice6';
vertice7 = Mroty*vertice7';
vertice8 = Mroty*vertice8';

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