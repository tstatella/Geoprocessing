%Function para criar uma bola de zeros e uns (1 na bola)
%centrada na imagem de tamanho n x n e raio = r

function c = filtroIdeal(n,r)

c = zeros(n,n);

for i = 0 : n
    for j = 0 : n
        if (i - n / 2)^2 + (j - n / 2)^2 <= r * r
        c(i,j) = 1;
        end
    end
end

figure,imshow(255 * c);