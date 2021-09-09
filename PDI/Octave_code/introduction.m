img = imread('peppers.png');
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
figure;
subplot(2,2,1),imshow(img);title("imagem colorida");set(gca,'FontSize',20);
subplot(2,2,2),imshow(R,[]);title("componente R");c=colorbar();set(c,'FontSize',20);set(gca,'FontSize',20);
subplot(2,2,3),imshow(G,[]);title("componente G");c=colorbar();set(c,'FontSize',20);set(gca,'FontSize',20);
subplot(2,2,4),imshow(B,[]);title("componente B");c=colorbar();set(c,'FontSize',20);set(gca,'FontSize',20);



