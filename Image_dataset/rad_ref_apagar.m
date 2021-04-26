pkg load image;

banda_1 = imread('Banda_ETM+1.tif');
banda_1 = double(banda_1);

%Calculando radiancia
RADIANCE_MULT_BAND_1 = 1.52;
RADIANCE_ADD_BAND_1 = 20;

rad_1 =  RADIANCE_MULT_BAND_1 * banda_1 + RADIANCE_ADD_BAND_1;

figure,imshow(rad_1,[]);colorbar;

%Calculando a reflectância

REFLECTANCE_MULT_BAND_1 = 
REFLECTANCE_ADD_BAND_1 = 

ref_1 = REFLECTANCE_MULT_BAND_1 * banda_1 + REFLECTANCE_ADD_BAND_1;

figure,imshow(ref_1,[]);colorbar;
