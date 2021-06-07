I = checkerboard(30,10,10);
I = I>0.5;

x1 = resizem(I,1/2,'nearest');
x1 = uint8(x1);
x2 = resizem(I,1/4,'nearest');
x2 = uint8(x2);
figure,imshow(I,[]);
figure,imshow(x1,[]);
figure,imshow(x2,[]);

[m,n] = size(I);
t = 210;
Im = I(1:t:m-1,1:t:n-1);

x2 = resizem(Im,[m n],'nearest');
figure,imshow(I,[]);
figure,imshow(Im,[]);
figure,imshow(x2,[]);