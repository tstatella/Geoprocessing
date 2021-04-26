%Esta função cria as faces do cubo. Tal operação é executada sempre que há
%mudança nas coordenadas dos vértices



function criafaces()

global faceA faceB faceC faceD faceE faceF
global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
       vertice7 vertice8

faceA.x = [vertice1(1);
           vertice2(1);
           vertice3(1);
           vertice4(1);
           vertice1(1)];
 
       
 faceA.y = [vertice1(2);
           vertice2(2);
           vertice3(2);
           vertice4(2);
           vertice1(2)];
       
faceA.z = [vertice1(3);
           vertice2(3);
           vertice3(3);
           vertice4(3);
           vertice1(3)];
       
faceB.x = [vertice3(1);
           vertice4(1);
           vertice8(1);
           vertice7(1);
           vertice3(1)];
       
 faceB.y = [vertice3(2);
           vertice4(2);
           vertice8(2);
           vertice7(2);
           vertice3(2)];
  
 faceB.z = [vertice3(3);
           vertice4(3);
           vertice8(3);
           vertice7(3);
           vertice3(3)];
 

 faceC.x = [vertice2(1);
           vertice3(1);
           vertice7(1);
           vertice6(1);
           vertice2(1)];
 
 faceC.y = [vertice2(2);
           vertice3(2);
           vertice7(2);
           vertice6(2);
           vertice2(2)];
       
 faceC.z = [vertice2(3);
           vertice3(3);
           vertice7(3);
           vertice6(3);
           vertice2(3)];
       

faceD.x = [vertice2(1);
           vertice1(1);
           vertice5(1);
           vertice6(1);
           vertice2(1)];

faceD.y = [vertice2(2);
           vertice1(2);
           vertice5(2);
           vertice6(2);
           vertice2(2)];
       
faceD.z = [vertice2(3);
           vertice1(3);
           vertice5(3);
           vertice6(3);
           vertice2(3)];


faceE.x = [vertice1(1);
           vertice4(1);
           vertice8(1);
           vertice5(1);
           vertice1(1)];
       
faceE.y = [vertice1(2);
           vertice4(2);
           vertice8(2);
           vertice5(2);
           vertice1(2)];
       
 faceE.z = [vertice1(3);
           vertice4(3);
           vertice8(3);
           vertice5(3);
           vertice1(3)];

  faceF.x = [vertice5(1);
           vertice6(1);
           vertice7(1);
           vertice8(1);
           vertice5(1)];
       
  faceF.y = [vertice5(2);
           vertice6(2);
           vertice7(2);
           vertice8(2);
           vertice5(2)];
       
 faceF.z = [vertice5(3);
           vertice6(3);
           vertice7(3);
           vertice8(3);
           vertice5(3)];
       
end
