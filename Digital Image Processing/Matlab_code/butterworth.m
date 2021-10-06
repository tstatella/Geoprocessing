%Filtro Butterworth
%Filtro de tamanho M x M, de ordem n, com frequência de corte a uma
%distância D do centro

function y = butterworth(D,M,n)

k=round(M/2);
y=zeros(M,M);

for i = 1 : M
    for j = 1 : M
        y(i,j) = 1 / (1 + (sqrt((i - k)^2 + (j - k)^2) / D)^(2 * n));
    end
end

figure,imshow(255 * y);