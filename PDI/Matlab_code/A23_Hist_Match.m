% Histogram matching
% Matches the histogram of image 2 to the histogram of the image 1

im1      = imread('pout.tif');% reference image
%im2      = uint8(double(im1)*1.5);% image to be modified
im2      = imread('tire.tif');% image to be modified

M        = zeros(2^8,1,'uint8'); %// Store mapping - Cast to uint8 to respect data type
hist1    = imhist(im1,2^8); %// Compute histograms with 256 bins each
hist2    = imhist(im2,2^8);
%hist1(1) = 0;
%hist2(1) = 0;
    cdf1     = cumsum(hist1) / numel(im1); %// Compute CDFs (cumulated histograms)
    cdf2     = cumsum(hist2) / numel(im2);

%// Compute the mapping
for i = 1 : 1 : 2^8
    [~,ind] = min(abs(cdf2(i) - cdf1));
    % ind is the position (in the histogram) for which the cdf2(i) is
    % closest to the cdf1. Let's call this position cdf1(r).
    %So, we want cdf2(i) to equal cdf1(r).
     M(i)   = ind;
end

%// Now apply the mapping to the second image
[m,n] = size(im2);
out   = zeros(m,n);

for j = 1 : 1 : m
    for k = 1 : 1 : n
        aux = im2(j,k);
        out(j,k) = M(aux + 1);% aux + 1 to avoid M(0)
    end
end
        

out = uint8(out);

figure,subplot(2,2,1),imshow(im1);title('Reference image');
subplot(2,2,2),imhist(im1);title('Histogram of the reference image');
subplot(2,2,3),imshow(im2);title('image to be modified');
subplot(2,2,4),imhist(im2);title('Histogram of the image to be modified');

figure,subplot(2,2,1),imshow(im1);title('Reference image');
subplot(2,2,2),imhist(im1);title('Histogram of the reference image');
subplot(2,2,3),imshow(out);title('Modified image');
subplot(2,2,4),imhist(out);title('Matched histogram');
