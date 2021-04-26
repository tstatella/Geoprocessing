%Transformação RGB->HSI

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

a=imread('cores.jpg');%#
a=double(a);

%separando as componentes RGB
R=a(:,:,1);
G=a(:,:,2);
B=a(:,:,3);
[n,m]=size(R);

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

%Salvando em .mat
save('H','H');
save('S','S');
save('I','I');

figure,imshow(uint8(a)),title('Imagem original');
%exibição fazendo a volta para o intervalo [0,255] e convertendo
%pra inteiros
figure,imshow(uint8(H*255)),title('Componente H');
figure,imshow(uint8(S*255)),title('Componente S');
figure,imshow(uint8(I*255)),title('Componente I');

        