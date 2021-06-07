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

Get  = imread('finger.tif');
Get  = double(Get);
%critério de parada
Dt   = 0;
cont = 0;
%limiar inicial
tini = round(mean2(Get(:)))
Dif  = 300;%inicializando Dif
t    = tini;%inicializando o limiar como tini

%testando o primeirolimiar pra ver se é o ideal
    
while Dif > Dt

     [r,c] = find(Get > t);
      V = r;
      for i = 1 : size(r,1)
          V(i) = Get(r(i),c(i));
      end
    m1 = mean2(V(:))
    
     [r,c] = find(Get <= t);
      V = r;
      for i = 1 : size(r,1)
          V(i) = Get(r(i),c(i));
      end    
     m2 = mean2(V(:))
    
    t  = round((m1 + m2) / 2)
    Dif = round(abs(tini - t));
    tini = t;
    cont = cont + 1;
end

Get = uint8(Get);
Bin = im2bw(Get,(t / 255));
figure,imshow(Get);
figure,imshow(Bin);
