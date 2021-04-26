%Fun��o que faz a proje��o perspectiva do cubo. A vari�vel "plano" d� a
%dist�ncia do plano de proje��o (plano perpendicular ao eixo Z)ao centro de
%proje��o (0,0,0). O plano pode estar entre o centro de proje��o e o
%objeto, � frente do objeto ou atr�s do centro de proje��o (-z). Por�m, a 
%proje��o � indefinida para valores de Z = 0.

function proj()
         
         global faceA faceB faceC faceD faceE faceF
         global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
                vertice7 vertice8

         clc;   
         plano = input('Informe a posi��o do plano de proje��o perpendicular ao plano Z: ');        
            
         
            Mp = [1  0  0  0;
                  0  1  0  0;
                  0  0  1  0;
                  0  0  1/plano  0];
              
%Faz o teste pra ver se h� algum v�rtice com coord. z = 0. Se houver, 
%� feita uma transla��o em Z de uma unidade
        
       if min([vertice1(1,3); vertice2(1,3); vertice3(1,3); vertice4(1,3);...
               vertice5(1,3); vertice6(1,3); vertice7(1,3); vertice8(1,3)]) == 0
             
             vertice1(1,3) = vertice1(1,3) + 1;
             vertice2(1,3) = vertice2(1,3) + 1;
             vertice3(1,3) = vertice3(1,3) + 1;
             vertice4(1,3) = vertice4(1,3) + 1;
             vertice5(1,3) = vertice5(1,3) + 1;
             vertice6(1,3) = vertice6(1,3) + 1;
             vertice7(1,3) = vertice7(1,3) + 1;
             vertice8(1,3) = vertice8(1,3) + 1;
        end
        
vertice1 = (Mp*vertice1');
vertice2 = (Mp*vertice2');
vertice3 = (Mp*vertice3');
vertice4 = (Mp*vertice4');
vertice5 = (Mp*vertice5');
vertice6 = (Mp*vertice6');
vertice7 = (Mp*vertice7');
vertice8 = (Mp*vertice8');

vertice1 = vertice1'/((vertice1(3,1)/plano));
vertice2 = vertice2'/((vertice2(3,1)/plano));
vertice3 = vertice3'/((vertice3(3,1)/plano));
vertice4 = vertice4'/((vertice4(3,1)/plano));
vertice5 = vertice5'/((vertice5(3,1)/plano));
vertice6 = vertice6'/((vertice6(3,1)/plano));
vertice7 = vertice7'/((vertice7(3,1)/plano));
vertice8 = vertice8'/((vertice8(3,1)/plano));


makeFace = @criafaces;   
makeFace();

prtfilled = @impr_filled;
prtfilled(faceA,faceB,faceC,faceD,faceE,faceF),...
         title('Cubo projetado com faces preenchidas');

print3d = @imprime3d;
print3d(faceA, faceB, faceC,faceD,faceE,faceF),title('Cubo projetado aramado'); 
end