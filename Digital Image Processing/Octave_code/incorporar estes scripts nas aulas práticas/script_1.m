disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

% Carregando o pacote de processamento de imagens
pkg load image

% Fazendo a leitura da imagem menina_cinza.jpg
img = imread('menina_cinza.jpg');

% Exibindo a figura
figure,imshow(img);

% Salvando a imagem com um formato diferente
imwrite(img,'menina_cinza.tif');