%Função que faz a projeção perspectiva do cubo. A variável "plano" dá a
%distância do plano de projeção (plano perpendicular ao eixo Z)ao centro de
%projeção (0,0,0). O plano pode estar entre o centro de projeção e o
%objeto, à frente do objeto ou atrás do centro de projeção (-z). Porém, a 
%projeção é indefinida para valores de Z = 0.

function proj()
         
         global faceA faceB faceC faceD faceE faceF
         global vertice1 vertice2 vertice3 vertice4 vertice5 vertice6...
                vertice7 vertice8

         clc;   
         plano = input('Informe a posição do plano de projeção perpendicular ao plano Z: ');        
            
         
            Mp = [1  0  0  0;
                  0  1  0  0;
                  0  0  1  0;
                  0  0  1/plano  0];
              
%Faz o teste pra ver se há algum vértice com coord. z = 0. Se houver, 
%é feita uma translação em Z de uma unidade
        
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