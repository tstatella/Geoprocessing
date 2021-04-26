close all;%fechando figuras
clear all; %limpando as variáveis da memória
clc; %limpando a tela

%Fazendo paleta de cores

Hp=zeros(50,300);
Sp=Hp;
Vp=Hp;

for i=1:300
    Hp(:,i)=i/300;
end

Sp=Sp+0.5;
Vp=Vp+1;

figure,imshow(Hp),title('Componente H da paleta de cores');
figure,imshow(Sp),title('Componente S da paleta de cores');
figure,imshow(Vp),title('Componente V da paleta de cores');


%Retornando para RGB

A(:,:,1)=Hp;
A(:,:,2)=Sp;
A(:,:,3)=Vp;

RGB=hsv2rgb(A);

figure,imshow(RGB),title('Paleta de cores');
