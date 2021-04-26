%Esta função recria o cubo caso se queira que as operações sejam desfeitas



function recria()


            global faceA faceB faceC faceD faceE faceF
            global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
                   vertice7 vertice8
            global vertices
            
vertice1 = [vertices(1,1) vertices(1,2) vertices(1,3) vertices(1,4)];
vertice2 = [vertices(2,1) vertices(2,2) vertices(2,3) vertices(2,4)];
vertice3 = [vertices(3,1) vertices(3,2) vertices(3,3) vertices(3,4)];
vertice4 = [vertices(4,1) vertices(4,2) vertices(4,3) vertices(4,4)];
vertice5 = [vertices(5,1) vertices(5,2) vertices(5,3) vertices(5,4)];
vertice6 = [vertices(6,1) vertices(6,2) vertices(6,3) vertices(6,4)];
vertice7 = [vertices(7,1) vertices(7,2) vertices(7,3) vertices(7,4)];
vertice8 = [vertices(8,1) vertices(8,2) vertices(8,3) vertices(8,4)];
            
            
makeFace = @criafaces;   
makeFace();

prtfilled = @impr_filled;
prtfilled(faceA,faceB,faceC,faceD,faceE,faceF),...
    title('Cubo original recuperado');

end
               
               