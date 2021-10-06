%Este código faz a filtragem de ruído periódico no domínio da frequência e
%suavização de imagens
clear all
close all
clc

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

cd('D:\OneDrive\Ensino\Disciplinas\PDI\Aulas_PDI\Banco_Imagens');

%% Lendo a imagem 
cm    = imread('cameraman.tif');
[R,C] = size(cm);

%Criando ruído periódico senoidal
[x,y] = meshgrid(1:R,1:C);%grid
p     = 1 + sin(x + y / 1.5);%ruído periódico
cmp   = (double(cm) / 128 + p) / 4;%adicionando à imagem

figure,imshow(cm); title('Imagem original');
figure,imshow(cmp,[]); title('Imagem com ruído');

%Calculando a transformada de Fourier
cmpf = fft2(cmp);

%Centralizando a FFT
cmpfc = fftshift(cmpf);

%Visualizar
visual = 10 * log(1 + abs(cmpfc));
figure,imshow(uint8(visual),[]);

%% Criando um filtro rejeita-banda

z       = sqrt((x - 129).^2 + (y - 129).^2);
rb      =(z < 47 | z > 51);
%Aplicando o filtro
filt_rb = cmpfc .* rb;

%visualizando
visual2 = 10 * log(1 + abs(filt_rb));
figure,imshow(uint8(visual2),[]);

%Transformada inversa
filt_rb_i = ifft2(fftshift(filt_rb));
figure,imshow((abs(filt_rb_i)),[]);

%% Filtragem rejeita notch

%criando/aplicando o filtro (apenas consiste em zerar linhas e colunas com ruído)
notch = cmpfc;
notch(156,:) = 0;
notch(102,:) = 0;
notch(:,170) = 0;
notch(:,88) = 0;

%visualizando
visual3 = 10 * log(1 + abs(notch));
figure,imshow(uint8(visual3),[]);

%Transformada inversa
filt_notch_i = ifft2(fftshift(notch));
figure,imshow((abs(filt_notch_i)),[]);

%% Filtragem passa-baixa ideal
%Criando o filtro
h_ideal = zeros(C,R);%tamanho do filtro
r       = 20;%raio do filtro

for i = 0 : C
    for j = 0 : R
        if (i - C / 2)^2 + (j - R / 2)^2 <= r * r
        h_ideal(i,j) = 1;
        end
    end
end

figure,imshow(255 * h_ideal);

% %A imagem não é quadrada então tenho que reamostrar o filtro
% [R,C] = size(d);
% h_ideal = imresize(c,[R C],'nearest');%tamanho da imagem 368x410

%Aplicando o filtro
filtrada_passa_baixa_ideal_freq = h_ideal .* cmpfc;
filtrada_passa_baixa_ideal      = ifft2(fftshift(filtrada_passa_baixa_ideal_freq));
figure,imshow((abs(filtrada_passa_baixa_ideal)),[]);

%% Filtragem passa-baixa Butterworth
%h_butterworth = butterworth(D,M,n);
%Filtro de tamanho C x R, de ordem n, com frequência de corte a uma
%distância D do centro

n = 4;
D = 20;

k = round(R / 2);
h_butter = zeros(C,R);

for i = 1 : C
    for j = 1 : R
        h_butter(i,j) = 1 / (1 + (sqrt((i - k)^2 + (j - k)^2) / D)^(2 * n));
    end
end

figure,imshow(255 * h_butter);
%h_butter = imresize(y,[R C],'nearest');%tamanho da imagem 368x410

%Aplicando o filtro
filtrada_passa_baixa_butter_freq = h_butter .* cmpfc;
filtrada_passa_baixa_butter      = ifft2(fftshift(filtrada_passa_baixa_butter_freq));
figure,imshow((abs(filtrada_passa_baixa_butter)),[]);
