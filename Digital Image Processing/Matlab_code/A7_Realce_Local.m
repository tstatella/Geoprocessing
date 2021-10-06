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

Get = imread('tungstenio.tif');
figure,imshow(Get);
Get = double(Get);
Out = Get;
k0 = 0.4;
k1 = 0.2;
k2 = 0.4;
E  = 3;

mG   = mean2(Get(:));
stdG = std2(Get(:));
[m,n] = size(Get);

for i = 2 : m - 1
    for j = 2 : n - 1
         Viz  = [Get(i-1,j-1) Get(i-1,j) Get(i-1,j+1) Get(i,j-1) Get(i,j),...
              Get(i,j+1) Get(i+1,j+1) Get(i+1,j) Get(i+1,j+1)];  
         mL   = mean2(Viz(:));
         stdL = std2(Viz(:));
          if mL <= (k0 * mG) && (k1 * stdG) <= stdL <= (k2 * stdG)
              Out(i,j) = E * Get(i,j);
          end
    end
end

Out = uint8(Out);
figure,imshow(Out);

              
          
          
          
          