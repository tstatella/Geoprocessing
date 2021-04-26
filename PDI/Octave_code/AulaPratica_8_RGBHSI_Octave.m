%Transformação RGB - HSI

%Detecção de bordas com função edge
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

%linhas marcadas com // terão seu comentário retirado na segunda parte do
%exercício. As marcadas com /// terão comentário retirado na terceira parte
%e linhas marcadas com # terão comentário adicionado na segunda e terceira 
%parte do experimento

%a=imread('forest.jpg');%///
a=imread('cores.jpg');%#
a=double(a);

%separando as componentes RGB
R=a(:,:,1);
G=a(:,:,2);
B=a(:,:,3);
[n,m]=size(R);

%Diminuindo o contraste***************************************************
% R=double(R)*0.35;%///
% G=double(G)*0.35;%///
% B=double(B)*0.35;%///
% a=a * 0.35;%só pra exibição no final 
%normalizando em [0,1]
r=R/255;
g=G/255;
b=B/255;

%Calculando as componentes HSI*********************************************
I = zeros(n,m);%inicializando as componentes
S = zeros(n,m);
H = zeros(n,m);

for i=1:n
    for j=1:m
        I(i,j)=(1/3)*(r(i,j)+g(i,j)+b(i,j));
        
        
        if I(i,j)==0 %se I=0, S não é definido
            S(i,j)=1;
           else
              S(i,j)=1-((3*min([r(i,j);g(i,j);b(i,j)]))/(r(i,j)+g(i,j)+b(i,j)));
        end

        if S(i,j)==0 %se S=0, H não é definido
           H(i,j)=0; 
           else
             H(i,j)=acos(((1/2)*((r(i,j)-g(i,j))+(r(i,j)-b(i,j))))/(sqrt((r(i,j)-g(i,j))^2+((r(i,j)-b(i,j))*(g(i,j)-b(i,j))))));
             H(i,j)=rad2deg(H(i,j));
        end
             
             
         if (b(i,j)/I(i,j))>(g(i,j)/I(i,j))
            H(i,j)=360-H(i,j);
        end
    end
end

H=H/360;%normalizando para [0,1]

%exibição fazendo a volta para o intervalo [0,255] e convertendo
%pra inteiros
figure,imshow(uint8(H*255)),title('Componente H');
figure,imshow(uint8(S*255)),title('Componente S');
figure,imshow(uint8(I*255)),title('Componente I');

%Fazendo a composição HSI com as cores RGB
HSICorlor(:,:,1)=uint8(H*255);
HSICorlor(:,:,2)=uint8(S*255);
HSICorlor(:,:,3)=uint8(I*255);

figure,imshow(HSICorlor),title('Composição H>R, S>G, I>B');

%Realce de imagem**********************************************************
% I=imadjust(I); %aumentando o contraste %///
% R=imadjust(uint8(R));%aumentando o contraste RGB %///
% G=imadjust(uint8(G)); %///
% B=imadjust(uint8(B)); %///
% c(:,:,1)=R; %///
% c(:,:,2)=G; %///
% c(:,:,3)=B; %///

%Modificando o matiz*******************************************************
%H=mod(H+0.4,1);%alterando as cores %// #

%retornando para RGB******************************************************
H=360*H; %voltando para o intervalo [0,360]
bn = zeros(n,m);
rn = zeros(n,m);
gn = zeros(n,m);
R2 = zeros(n,m);
G2 = zeros(n,m);
B2 = zeros(n,m);

for i=1:n
    for j=1:m
       
      
       if (H(i,j)>=0)&&(H(i,j)<=120)
            bn(i,j)=(1/3)*(1-S(i,j));%bn será o valor normalizado segundo r+g+b=1
            rn(i,j)=(1/3)*(1+((S(i,j)*cos(deg2rad(H(i,j))))/(cos(deg2rad(60-H(i,j))))));
            gn(i,j)=1-(rn(i,j)+bn(i,j));
            
            R2(i,j)=3*I(i,j)*rn(i,j);
            G2(i,j)=3*I(i,j)*gn(i,j);
            B2(i,j)=3*I(i,j)*bn(i,j);
        end
        if (H(i,j)>120)&&(H(i,j)<=240)
            H(i,j)=H(i,j)-120;
            rn(i,j)=(1/3)*(1-S(i,j));
            gn(i,j)=(1/3)*(1+((S(i,j)*cos(deg2rad(H(i,j))))/(cos(deg2rad(60-H(i,j))))));
            bn(i,j)=1-(rn(i,j)+gn(i,j));
            
            R2(i,j)=3*I(i,j)*rn(i,j);
            G2(i,j)=3*I(i,j)*gn(i,j);
            B2(i,j)=3*I(i,j)*bn(i,j);
        end
        if (H(i,j)>240)&&(H(i,j)<=360)
            H(i,j)=H(i,j)-240;
            gn(i,j)=(1/3)*(1-S(i,j));
            bn(i,j)=(1/3)*(1+((S(i,j)*cos(deg2rad(H(i,j))))/(cos(deg2rad(60-H(i,j))))));
            rn(i,j)=1-(gn(i,j)+bn(i,j));
            
            R2(i,j)=3*I(i,j)*rn(i,j);
            G2(i,j)=3*I(i,j)*gn(i,j);
            B2(i,j)=3*I(i,j)*bn(i,j);
        end
    end
end

%formando a imagem RGB novamente
k(:,:,1)=(R2*255);
k(:,:,2)=(G2*255);
k(:,:,3)=(B2*255);
k=uint8(k);
%figure,imshow(I),title('Componente I realçada');%///
figure,imshow(k),title('Imagem HSI>RGB');%imagem formada do sistema HSI
figure,imshow(uint8(a)),title('Imagem original');%imagem original
%figure,imshow(c),title('Imagem realçada no espaço RGB');%imagem realçada
%no sistema RGB %///


        
        
        
