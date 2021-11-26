pkg load image
% Fazendo a leitura da imagem 
img = imread('cachorro1.jpg');
figure,imshow(img); % Visualizando
set(gca,'FontSize',12,'fontname','Arial');
figure,imhist(img);grid on;
set(gca,'FontSize',12,'fontname','Arial');


% fazendo saturação de 1% e 98%

format long e
p1   = numel(img) * (1/100)
p2   = numel(img) * (99/100)
M    = zeros(2^8,1,'uint8'); %// Store mapping - Cast to uint8 to respect data type
hist = imhist(img,2^8); %// Compute histograms with 256 bins each
cdf  = cumsum(hist); %// Compute CDFs (cumulated histograms)

cdf_p1 = cdf1<p1; %// find where the cdf < 1%
NDsat1 = sum(cdf_p1);
cdf_p2 = cdf<p2; %// find where the cdf < 99% 
NDsat2 = sum(cdf_p2);

x = double(img);
y = 255 * (x - NDsat1) / (NDsat2 - NDsat1);
y = uint8(y);

figure,imshow(y); % Visualizando
set(gca,'FontSize',12,'fontname','Arial');
figure,imhist(y);grid on;
set(gca,'FontSize',12,'fontname','Arial');
xlim([0 255]);

% mostrando pixels saturados em cores
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
