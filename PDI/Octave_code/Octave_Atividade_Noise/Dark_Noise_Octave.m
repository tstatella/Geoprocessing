clear al
close all
clc

cd('C:\Users\Thiago\Documents\PDI\Aulas_PDI\Praticas_Octave\Pratica_Noise\Img_Nikon\E_6');

p         = which('DSC_2950.jpg');
filelist  = dir([fileparts(p) filesep 'DSC_*.jpg']);
fileNames = {filelist.name}'; %All file names are stored in fileNames vaiable
nImages   = length(fileNames);

I = cell(5,3);

for i = 1 : nImages
    aux = imread(fileNames{i});
    I{i,1} = aux(:,:,1);
    I{i,2} = aux(:,:,2);
    I{i,3} = aux(:,:,3);
end

Mean_R = double(I{1,1} + I{2,1} + I{3,1} + I{4,1} + I{5,1}) / 5;
Mean_R = uint8(Mean_R);

Mean_G = double(I{1,2} + I{2,2} + I{3,2} + I{4,2} + I{5,2}) / 5;
Mean_G = uint8(Mean_G);

Mean_B = double(I{1,3} + I{2,3} + I{3,3} + I{4,3} + I{5,3}) / 5;
Mean_B = uint8(Mean_B);

figure,imshow(Mean_R>0);title('Red image values > 0');
figure,imshow(Mean_G>0);title('Green image values > 0');
figure,imshow(Mean_B>0);title('Blue image values > 0');

h_R = imhist(Mean_R);
h_G = imhist(Mean_G);
h_B = imhist(Mean_B);

figure,plot(h_R(2:10),'r');grid on;title('Histogram');
xlabel('DN');ylabel('Freq.');
hold on
plot(h_G(2:10),'g');
plot(h_B(2:10),'b');
legend('Red band','Green band','Blue band');
h = getframe(gcf);
imwrite(h.cdata,'E_6.jpg');














