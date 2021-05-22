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

%Lendo a imagem com ruído periódico
d = imread('palhaco.bmp');

%Esta imagem tem 3 bandas, separar:
d = d(:,:,1);
figure,imshow(d);

%Calculando a transformada de Fourier
a1 = fft2(double(d));

%Centralizando a FFT
a2 = fftshift(a1);

%Visualizar
visual = 10 * log(1 + abs(a2));
figure,imshow(uint8(visual),[]);

%Eliminando os ruídos na FFT
a2(165-4:165+4,38-4:38+4)=0;
a2(:,88-3:88+3)=0;
a2(:,135-4:135+4)=0;
a2(:,187-4:187+4)=0;
a2(165-4:165+4,294-4:294+4)=0;
a2(165-4:165+4,346-4:346+4)=0;
a2(167-4:167+4,397-4:397+4)=0;
a2(207-4:207+4,:)=0;
a2(207-4:207+4,323-4:323+4)=0;
a2(207-4:207+4,272-4:272+4)=0;
a2(196-4:165+4,:)=0;
a2(194-4:194+4,243-4:243+4)=0;
a2(207-4:207+4,168-4:168+4)=0;
a2(206-4:206+4,178-4:178+4)=0;
a2(207-4:207+4,:)=0;
a2(:,294-3:294+3)=0;

%Visualizar
visual2 = 10 * log(1 + abs(a2));
figure,imshow(uint8(visual2),[]);

%Transformada inversa
saida_a2_cor = ifft2(fftshift(a2));
figure,imshow(uint8(abs(saida_a2_cor)));

%% Filtragem passa-baixa ideal
%h_ideal = filtroIdeal(300,5);
n = 300;%tamanho do filtro
c = zeros(n,n);
r = 20;%raio do filtro

for i = 0 : n
    for j = 0 : n
        if (i - n / 2)^2 + (j - n / 2)^2 <= r * r
        c(i,j) = 1;
        end
    end
end

figure,imshow(255 * c);

%A imagem não é quadrada então tenho que reamostrar o filtro
[R,C] = size(d);
h_ideal = imresize(c,[R C],'nearest');%tamanho da imagem 368x410

%Aplicando o filtro
filtrada_passa_baixa_ideal_freq = h_ideal .* a2;
filtrada_passa_baixa_ideal      = ifft2(fftshift(filtrada_passa_baixa_ideal_freq));
figure,imshow(uint8(abs(filtrada_passa_baixa_ideal)));

%% Filtragem passa-baixa Butterworth
%h_butterworth = butterworth(D,M,n);
%Filtro de tamanho M x M, de ordem n, com frequência de corte a uma
%distância D do centro

M = 300;
n = 4;
D = 20;

k = round(M / 2);
y = zeros(M,M);

for i = 1 : M
    for j = 1 : M
        y(i,j) = 1 / (1 + (sqrt((i - k)^2 + (j - k)^2) / D)^(2 * n));
    end
end

figure,imshow(255 * y);
h_butter = imresize(y,[R C],'nearest');%tamanho da imagem 368x410

%Aplicando o filtro
filtrada_passa_baixa_butter_freq = h_butter .* a2;
filtrada_passa_baixa_butter      = ifft2(fftshift(filtrada_passa_baixa_butter_freq));
figure,imshow(uint8(abs(filtrada_passa_baixa_butter)));
