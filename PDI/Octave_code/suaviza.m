function im_out_media = suaviza(x)

[m,n] = size(x);

im1            = double(x);
im_out_media   = zeros(m,n);


for i = 2 : m - 1
   for j = 2 : n - 1
      aux = im1(i-1,j-1) + im1(i-1,j) + im1(i-1,j+1)...
     + im1(i,j-1) + im1(i,j) + im1(i,j+1)...
     + im1(i+1,j-1) + im1(i+1,j) + im1(i+1,j+1);
     im_out_media(i,j) = aux / 9;
     end
end

%im_out_media = uint8(im_out_media);