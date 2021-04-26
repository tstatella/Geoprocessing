%Binarização iterativa

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

Get0  = imread('finger.tif');
Get0  = double(Get0);
%critério de parada
Dt   = 0;
cont = 0;
%limiar inicial
tini = round(mean2(Get0(:)));
Dif  = 300;%inicializando Dif
t    = tini;%inicializando o limiar como tini

%testando o primeirolimiar pra ver se é o ideal
    
while Dif > Dt

     [r,c] = find(Get0 > t);
      V = r;
      for i = 1 : size(r,1)
          V(i) = Get0(r(i),c(i));
      end
    m1 = mean2(V(:));
    
     [r,c] = find(Get0 <= t);
      V = r;
      for i = 1 : size(r,1)
          V(i) = Get0(r(i),c(i));
      end    
     m2 = mean2(V(:));
    
    t  = round((m1 + m2) / 2);
    Dif = round(abs(tini - t));
    tini = t;
    cont = cont + 1;
end

Get0 = uint8(Get0);
Bin = im2bw(Get0,(t / 255));
figure,imshow(Get0);
figure,imshow(Bin);
