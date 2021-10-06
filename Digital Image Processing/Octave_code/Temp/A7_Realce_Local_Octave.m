%Aplicação de realce local com base em estatísticas da imagem

clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

Get0 = imread('tungstenio.jpg');
figure,imshow(Get0);
Get0 = double(Get0);
Out = Get0;
k0 = 0.4;
k1 = 0.2;
k2 = 0.4;
E  = 3;

mG   = mean2(Get0(:));
stdG = std2(Get0(:));
[m,n] = size(Get0);

for i = 2 : m - 1
    for j = 2 : n - 1
         Viz  = [Get0(i-1,j-1) Get0(i-1,j) Get0(i-1,j+1) Get0(i,j-1) Get0(i,j),...
              Get0(i,j+1) Get0(i+1,j+1) Get0(i+1,j) Get0(i+1,j+1)];  
         mL   = mean2(Viz(:));
         stdL = std2(Viz(:));
          if mL <= (k0 * mG) && (k1 * stdG) <= stdL <= (k2 * stdG)
              Out(i,j) = E * Get0(i,j);
          end
    end
end

Out = uint8(Out);
figure,imshow(Out);

              
          
          
          
          