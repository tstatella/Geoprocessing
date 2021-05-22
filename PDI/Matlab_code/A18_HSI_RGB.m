%Transformação HSI->RGB

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

%As imagens devem estar no intervalo [0,1]
load H;
load S;
load I;

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

figure,imshow(k),title('Imagem HSI>RGB');%imagem formada do sistema HSI



        
        
        