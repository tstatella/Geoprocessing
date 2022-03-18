disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

pkg load image
% Fazendo a leitura da imagem 
img = imread('cachorro.jpg');
figure,imshow(img); % Visualizando
set(gca,'FontSize',12,'fontname','Arial');
figure,imhist(img);grid on;
set(gca,'FontSize',12,'fontname','Arial');

Min = min(img(:));
Max = max(img(:));
a = Max - Min;
M = mean2(img(:));
d = std2(img(:));
printf('Valor mínimo: %f\n',Min);
printf('Valor máximo: %f\n',Max);
printf('Valor médio: %f\n',M);
printf('Amplitude: %f\n',a);
printf('Desvio padrão: %f\n',d);


x = double(img);
y = 255 * (x - (121-2*19)) / ((121+2*19)-(121-2*19));
y = uint8(y);
figure,imshow(y); % Visualizando
set(gca,'FontSize',12,'fontname','Arial');
figure,imhist(y);grid on;
set(gca,'FontSize',12,'fontname','Arial');
xlim([0 255]);

R = y;
G = y;
B = y;

[r,c] =size(y);

for i = 1 : r
  for j = 1 : c
    if y(i,j) == 255
      G(i,j) = 0;
      B(i,j) = 0;
    endif
    if y(i,j) == 0
      R(i,j) = 0;
      G(i,j) = 0;
      B(i,j) = 255;
    endif
  endfor
endfor

RGB = cat(3,R,G,B);
figure,imshow(RGB);

% fazendo saturação de 1% e 98%

format long e
p1 = numel(img) * (1/100)
p2 = numel(img) * (99/100)

M        = zeros(2^8,1,'uint8'); %// Store mapping - Cast to uint8 to respect data type
hist    = imhist(img,2^8); %// Compute histograms with 256 bins each

cdf     = cumsum(hist); %// Compute CDFs (cumulated histograms)

cdf_p1 = cdf<p1
Xmin = sum(cdf_p1)
cdf_p2 = cdf<p2
Xmax = sum(cdf_p2)

x = double(img);
y = 255 * (x - Xmin) / (Xmax - Xmin);
y = uint8(y);
figure,imshow(y); % Visualizando
set(gca,'FontSize',12,'fontname','Arial');
figure,imhist(y);grid on;
set(gca,'FontSize',12,'fontname','Arial');
xlim([0 255]);

R = y;
G = y;
B = y;

[r,c] =size(y);

for i = 1 : r
  for j = 1 : c
    if y(i,j) == 255
      G(i,j) = 0;
      B(i,j) = 0;
    endif
    if y(i,j) == 0
      R(i,j) = 0;
      G(i,j) = 0;
      B(i,j) = 255;
    endif
  endfor
endfor

RGB = cat(3,R,G,B);
figure,imshow(RGB);


L = 1 : 1 : 255;
Gama1 = L.^0.2;
Escala = 255 / max(Gama1(:));
Gama1s = Gama1 * Escala;

Gama2 = L.^0.4;
Escala = 255 / max(Gama2(:));
Gama2s = Gama2 * Escala;
%{
Gama3 = L.^0.6;
Escala = 255 / max(Gama3(:));
Gama3s = Gama3 * Escala;

Gama4 = L.^0.8;
Escala = 255 / max(Gama4(:));
Gama4s = Gama4 * Escala;
%}
Gama5 = L.^1.0;
Escala = 255 / max(Gama5(:));
Gama5s = Gama5 * Escala;

Gama6 = L.^2;
Escala = 255 / max(Gama6(:));
Gama6s = Gama6 * Escala;

Gama7 = L.^4;
Escala = 255 / max(Gama7(:));
Gama7s = Gama7 * Escala;
%{
Gama8 = L.^5;
Escala = 255 / max(Gama8(:));
Gama8s = Gama8 * Escala;

Gama9 = L.^6;
Escala = 255 / max(Gama9(:));
Gama9s = Gama9 * Escala;
%}

figure,plot(L,Gama1s,'LineWidth',1.2);hold on %ok
plot(L,Gama2s,'LineWidth',1.2);%ok
plot(L,Gama5s,'LineWidth',1.2);% ok
plot(L,Gama6s,'LineWidth',1.2);% ok
plot(L,Gama7s,'LineWidth',1.2);% ok
xlim([0 255]);ylim([0 255]);grid on;
legend('\gamma=0,2','\gamma=0,4','\gamma=1',...
'\gamma=2','\gamma=4','Location','southeast','FontSize',14);
set(gca,'FontSize',14,'fontname','Arial');

dog = imread('cachorro2.jpg');
figure,imshow(dog); % Visualizando
set(gca,'FontSize',12,'fontname','Arial');
figure,imhist(dog);grid on;
set(gca,'FontSize',14,'fontname','Arial');
xlim([0 255]);
ylim([0 2000000]);

dog2 = 1 * double(dog).^0.2;
figure,imshow(dog2,[]);
set(gca,'FontSize',12,'fontname','Arial');

x = imadjust(dog,[],[],0.2);
figure,imshow(x,[]);
set(gca,'FontSize',12,'fontname','Arial');

y = imadjust(dog,[84/255 156/255],[]);
figure,imshow(y,[]);


eq = histeq(img);
figure,imshow(eq*255,[]);c=colorbar();
set(gca,'FontSize',12,'fontname','Arial','visible','on');
set(c,'FontSize',12);
figure,imhist(uint8(eq*255));grid on;
set(gca,'FontSize',14,'fontname','Arial');
xlim([0 255]);
