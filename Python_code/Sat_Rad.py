# -*- coding: utf-8 -*-
"""
Created on Sat Apr 10 10:16:09 2021

@author: Thiago Statella
"""
#%% Importando biblioteca
import rasterio
import numpy as np
from matplotlib import pyplot as plt
from rasterio.mask import mask

#%% Abrindo arquivos

ETM_1 = rasterio.open('Banda_ETM+1.tif')
ETM_2 = rasterio.open('Banda_ETM+2.tif')
ETM_3 = rasterio.open('Banda_ETM+3.tif')
ETM_4 = rasterio.open('Banda_ETM+4.tif')
ETM_5 = rasterio.open('Banda_ETM+5.tif')
ETM_7 = rasterio.open('Banda_ETM+7.tif')

# Exibindo informações básicas dos arquivos:
print(f"Informação sobre o arquivo:\n {ETM_1}")

# Número de bandas no arquivo
print(f"O número de bandas neste arquivo é: {ETM_1.count}")
print(f"A largura do arquivo é: {ETM_1.width} colunas")
print(f"A altura do arquivo é: {ETM_1.height} linhas")

#Como o arquivo é georreferenciado, vamos exibir os limites:
print(f"O bounding box do arquivo é: {ETM_1.bounds}")

#Exibindo o sistema de coordenadas
print(f"O istema de coordenadas é: {ETM_1.crs}")

#Para entender mais: https://epsg.org/home.html

# %% Leitura de imagens
#Quantidade de bandas
print(f"A quantidade de bandas é: {ETM_1.indexes}")

B1 = ETM_1.read(1)
B2 = ETM_2.read(1)
B3 = ETM_3.read(1)

#Imprimir o tipo de dado:
print(f"O arquivo ETM_1 está no formato: {B1.dtype}")
print(f"A imagem é um numpy array do tipo: {type(B1)}")

#Exibir as dimensões da matriz e comparar com as dimensões do arquivo
print(f"Número de linhas: {B1.shape[0]}, Número de colunas: {B1.shape[1]}")

# %% Acessando valores
print(f"O valor do pixel na linha 100 e coluna 200 é: {B1[100,200]}")

#Acessando as coordnadas espaciais de um dado pixel:
print(f"As coord. do pixel na linha 100 e coluna 200 são: {ETM_1.xy(100,200)}")
#Note que o método é aplicado sobre o arquivo e não sobre a array numpy

#Exibindo valores mínimo e máximo da imagem:
print(f"O valor mínimo da imagem é: {B1.min()}")
print(f"O valor máximo da imagem é: {B1.max()}")

# %% Exibindo imagens
plt.imshow(B1,cmap='gray')
plt.xlabel('Banda 1'); 
plt.title('Imagem ETM+1', fontsize=18)
plt.colorbar();  
plt.show()
#%% Composição colorida e exibição
comp_BGR123 = np.stack([B3, B2, B1],axis=2)

plt.imshow(comp_BGR123,cmap='gray')
plt.xlabel('Composição BGR123'); 
plt.axis('off')
plt.show()

#%% Recortando as imagens
#Para uma AOI

#Para estabalecer o bbox
aoi = [{'type': 'Polygon', 'coordinates':\
          [[(ETM_1.bounds.left, ETM_1.bounds.top),\
            (ETM_1.bounds.right-40000, ETM_1.bounds.top),\
            (ETM_1.bounds.right-40000, ETM_1.bounds.bottom),\
            (ETM_1.bounds.left, ETM_1.bounds.bottom),\
            (ETM_1.bounds.left, ETM_1.bounds.top)]]}]

ETM_1_clipped, transform = mask(ETM_1, aoi,crop=True)


print(f"O número de linhas por colunas era: {ETM_1.shape}")
print(f"Agora, é: {ETM_1_clipped.shape}")

#%% Atualizando os metadados
# Recuperando o metadado da imagem original
meta_1 = ETM_1.meta.copy()

# Atualizando
meta_1.update({"transform": transform,
    "height":ETM_1_clipped.shape[1],
    "width":ETM_1_clipped.shape[2]})

# Gravar a imagem cortada como um novo GeoTiff
with rasterio.open('ETM_1_clipped.tif', 'w', **meta_1) as dst:
    dst.write(ETM_1_clipped)

# Verificando
clipped_img = rasterio.open('ETM_1_clipped.tif')
B1_c        = clipped_img.read(1)

plt.imshow(B1_c,cmap='gray')
plt.xlabel('Banda 1'); 
plt.title('Imagem ETM+1 cortada', fontsize=18)
plt.colorbar();  
plt.show()

#%% Reprojetando com rasterio
#Fazendo a reprojeção para WGS84 lat/lon

from rasterio.warp import calculate_default_transform, reproject

# definir o target CRS - rasterio suporta qualquer CRS que possa ser definido por WKT
target_crs = 'EPSG:4326'














