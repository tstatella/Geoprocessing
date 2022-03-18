clear all
close all
clc
pkg load image

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

img = imread('borboleta.jpg');
figure,imshow(img);
set(gca,'FontSize',12,'fontname','Arial');
n = 7;
h = fspecial('average',[n n]);%filtro de média
S = imfilter(img,h,'replicate','same');%replicando pixels de borda e mantendo o tamanho da imagem original 
figure,imshow(S);


n = 7;
Me = medfilt2(img,[n n]);
figure,imshow(Me);

img2 = imread('senhor.jpeg');
img2_noise = imnoise(img2, "salt & pepper");
figure,imshow(img2_noise(10:2000,590:2500),[]);
c=colorbar();set(c,'FontSize',12,'fontname','Arial')
set(gca,'FontSize',12,'fontname','Arial','visible','on');
figure,imhist(img2_noise);grid on;
set(gca,'FontSize',9);
figure,imhist(img2);grid on;
set(gca,'FontSize',9);

n=7
h = fspecial('average',[n n]);%filtro de média
Media = imfilter(img2_noise,h,'replicate','same');%replicando pixels de borda e mantendo o tamanho da imagem original 
figure,imshow(Media(10:2000,590:2500));

n=7
Me = medfilt2(img2_noise,[n n]);
figure,imshow(Me(10:2000,590:2500));

