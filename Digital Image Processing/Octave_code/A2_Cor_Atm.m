%% Código para correção de efeitos atmosféricos segundo 
%CHAVEZ Jr., P.S. An improved dark-object subtraction technique for 
%scattering correction of multispectral data. Remote Sensing of Environment,
%New York, v.24, p.459-479, 1988.

clc;
clear all;
close all;

disp('*********************************************************************');
disp('****        Código criado pelo Prof. Dr. Thiago Statella         ****');
disp('****        Disciplina: Processamento Digital de Imagens         ****');
disp('****  Instituto Federal de Educação, Ciência e Tecnologia de MT  ****');
disp('*********************************************************************');
disp(' ');
disp(' ');

%Leitura da imagem
Name  = input('Informe o nome da imagem (banda azul): ','s');
L     = input('Landsat-5 ou Landsat-7? ');

if L == 7
    Ganho = input('Ganho baixo (1) ou alto (2)? ');
end

Data  = input('Informe a data de aquisição da imagem (dd.mm.aaaa): ','s');
%Transformando em um número para poder comparar diferentes datas
Data  = datenum(Data,'dd.mm.yyyy');

NAME  = strtok(Name, '.'); %Lê apenas o nome
Get0  = imread(Name); %Leitura da imagem
figure,imshow(Get0,[]);
figure,imhist(Get0);

%ND com bruma sugerido
NDmin = min(Get0(:));

disp(['ND com bruma sugerido: ',num2str(NDmin)]);
Ans = input('Aceita ND com bruma sugerido? (s/n)','s');

if Ans == 'n' || Ans == 'N'
%Informando o valor de pixel escuro para banda azul
NDmin  = input('Informe o menor ND da banda do azul: ');
end

%Testando para identificar o modelo de espalhamento atmosférico
if NDmin < 56
   Power = -4;
   Mod = 'Muito limpa';
else
    if NDmin >= 56 && NDmin < 75
      Power = -2;
      Mod = 'Limpa';
    else
        if NDmin >= 75 && NDmin < 95
         Power = -1;
         Mod = 'Moderada';
        else
            if NDmin >= 95 && NDmin < 115
              Power = -0.7;
              Mod = 'Com bruma';
            else
                if NDmin >= 115
                 Power = -0.5;
                 Mod = 'Com muita bruma';
                end
            end
        end
    end
end

disp(['A potência do Modelo de Espalhamento (Lambda^Power) identificada foi: ',num2str(Power)]);

%Valores médios de comprimento de onda para as bandas do Landsat 5/7
MeanLambda_Azul     = 0.485;
MeanLambda_Verde    = 0.560;
MeanLambda_Vermelho = 0.660;
MeanLambda_IVP      = 0.830;
MeanLambda_IVM1     = 1.650;
MeanLambda_IVM2     = 2.215;

%Função específica de espalhamento atmosférico para cada uma das bandas de acordo
%com o modelo de atmosférico estabelecido a partir do ND escuro lido na banda
%do Azul

MOD_Esp_Azul     = MeanLambda_Azul^Power;
MOD_Esp_Verde    = MeanLambda_Verde^Power;
MOD_Esp_Vermelho = MeanLambda_Vermelho^Power;
MOD_Esp_IVP      = MeanLambda_IVP^Power;
MOD_Esp_IVM1     = MeanLambda_IVM1^Power;
MOD_Esp_IVM2     = MeanLambda_IVM2^Power;

% Estimando valores de ND com reflectância mínima para as demais bandas,a
% partir do valor ND identificado na banda do Azul
% Os dados abaixo são factores de multiplicação que serão usados para predizer
% valores de bruma nas bandas 2 a 7. Eles são calculados usando o modelo 
% específico de espalhamento para a banda Azul como normalizador

Factor_Predict_Azul     = MOD_Esp_Azul / MOD_Esp_Azul;
Factor_Predict_Verde    = MOD_Esp_Verde / MOD_Esp_Azul;
Factor_Predict_Vermelho = MOD_Esp_Vermelho / MOD_Esp_Azul;
Factor_Predict_IVP      = MOD_Esp_IVP / MOD_Esp_Azul;
Factor_Predict_IVM1     = MOD_Esp_IVM1 / MOD_Esp_Azul;
Factor_Predict_IVM2     = MOD_Esp_IVM2 / MOD_Esp_Azul;

%Os valores acima ainda são fatores de multiplicação para prever
%os valores ND com bruma
%Precisamos considerar as variações de ganho e offset de cada banda
%Isso pode ser resolvido gerando fatores de ganho normalizados. Estes
%valores são então aplicados aos NDs de bruma que serão preditos juntamente com os
%respectivos offsets para encontrar os valores verdadeiros de bruma para
%cada banda

%Os NDs da imagem podem ser estimados por meio de ND = Gain * L + Offset 
%em que L é a radiância. Temos que L = {[(Lmax - Lmin) / 255] * ND} + Lmin
% Portanto: ND = [(L - Lmin) * 255] / (Lmax - Lmin)
%Fazendo G = 255 / (Lmax - Lmin) e Offset = (-255 * Lmin) / (Lmax - Lmin)
%Podemos escrever: ND = G * L + Offset


%NOTE: OS VALORES DE CALIBRAÇÃO SÃO DA BANDA 1 À 7, INCLUINDO A BANDA 6 DO
%TERMAL
if L == 5
    Data04052003  = datenum('04.05.2003','dd.mm.yyyy');
%Parâmetros de calibração para o TM5 antes de 04/05/2003 em W/m^2.sr.um
          if Data <= Data04052003
             Lmin = [-1.52 -2.84 -1.17 -1.51 -0.37 1.2378 -0.15];
             Lmax = [152.1 296.81 204.3 206.2 27.19 15.303 14.38];
          else %Parâmetros de calibração para o TM5 depois de 04/05/2003 em W/m^2.sr.um
             Lmin = [-1.52 -2.84 -1.17 -1.51 -0.37 1.2378 -0.15];
             Lmax = [193 365 264 221 30.2 15.303 16.5];
          end
end

%NOTE: OS VALORES DE CALIBRAÇÃO SÃO DA BANDA 1 À 7, INCLUINDO A BANDA 6 DO
%TERMAL
if L == 7 && Ganho == 1
    Data01072000  = datenum('01.07.2000','dd.mm.yyyy');
%Parâmetros de calibração para o ETM+ antes de 01/07/2000 em W/m^2.sr.um
%Ganho baixo (1) e alto (2)
    if Data <= Data01072000
        Lmin = [-6.2 -6 -4.5 -4.5 -1 0.0 -0.35];
        Lmax = [297.5 303.4 235.5 235 47.7 17.04 16.6];
    else
        Lmin = [-6.2 -6.4 -5 -5.1 -1 0.0 -0.35];
        Lmax = [293.7 300.9 234.4 241.1 47.57 17.04 16.54];
    end
end

if L == 7 && Ganho == 2
    Data01072000  = datenum('01.07.2000','dd.mm.yyyy');
    if Data <= Data01072000
        Lmin = [-6.2 -6 -4.5 -4.5 -1 3.2 -0.35];
        Lmax = [194.3 202.4 158.6 157.5 31.76 12.65 10.932];
    else
        Lmin = [-6.2 -6.4 -5 -5.1 -1 3.2 -0.35];
        Lmax = [191.6 196.5 152.9 157.4 31.06 12.65 10.8];
    end
end

%Calculando o Ganho e offset
%Fazendo Gain = 255 / (Lmax - Lmin) e Offset = (-255 * Lmin) / (Lmax - Lmin)
%Podemos escrever: ND = Gain * L + Offset


Gain_Azul       = 255 / (Lmax(1,1) - Lmin(1,1));
Offset_Azul     = -255 * Lmin(1,1) / (Lmax(1,1) - Lmin(1,1));
Gain_Verde      = 255 / (Lmax(1,2) - Lmin(1,2));
Offset_Verde    = -255 * Lmin(1,2) / (Lmax(1,2) - Lmin(1,2));
Gain_Vermelho   = 255 / (Lmax(1,3) - Lmin(1,3));
Offset_Vermelho = -255 * Lmin(1,3) / (Lmax(1,3) - Lmin(1,3));
Gain_IVP        = 255 / (Lmax(1,4) - Lmin(1,4));
Offset_IVP      = -255 * Lmin(1,4)/ (Lmax(1,4) - Lmin(1,4));
Gain_IVM1       = 255 / (Lmax(1,5) - Lmin(1,5));
Offset_IVM1     = -255 * Lmin(1,5) / (Lmax(1,5) - Lmin(1,5));
Gain_IVM2       = 255 / (Lmax(1,7) - Lmin(1,7));
Offset_IVM2     = -255 * Lmin(1,7) / (Lmax(1,7) - Lmin(1,7));

%Estimando os fatores de ganho normalizados: Gain_Azul / Gain_Bi = 2,
%3,..., 7.

NormalizedGain_Azul     = Gain_Azul / Gain_Azul;
NormalizedGain_Verde    = Gain_Verde / Gain_Azul;
NormalizedGain_Vermelho = Gain_Vermelho / Gain_Azul;
NormalizedGain_IVP      = Gain_IVP / Gain_Azul;
NormalizedGain_IVM1     = Gain_IVM1 / Gain_Azul;
NormalizedGain_IVM2     = Gain_IVM2 / Gain_Azul;

%Esta normalização juntamente com os offsets permitem transformar os
%valores de ND com bruma preditos em ND com bruma reais
% Isto é feito aplicando-se a seguinte equação
% NDhaze = NormalizedGain * ND_Predicted + Offset
% Os valores preditos para a banda 2, por exemplo, são calculados como
%ND_Predicted_2 = (NDmin - Offset_Azul) * Factor_Predict_Verde

ND_Predicted_Azul     = (NDmin - Offset_Azul) * Factor_Predict_Azul;
ND_Predicted_Verde    = (NDmin - Offset_Azul) * Factor_Predict_Verde;
ND_Predicted_Vermelho = (NDmin - Offset_Azul) * Factor_Predict_Vermelho;
ND_Predicted_IVP      = (NDmin - Offset_Azul) * Factor_Predict_IVP;
ND_Predicted_IVM1     = (NDmin - Offset_Azul) * Factor_Predict_IVM1;
ND_Predicted_IVM2     = (NDmin - Offset_Azul) * Factor_Predict_IVM2;

%Finalmente, os valores de ND com bruma são obtidos por

ND_Haze_Azul     = round((NormalizedGain_Azul * ND_Predicted_Azul) + Offset_Azul);
ND_Haze_Verde    = round((NormalizedGain_Verde * ND_Predicted_Verde) + Offset_Verde);
ND_Haze_Vermelho = round((NormalizedGain_Vermelho * ND_Predicted_Vermelho) + Offset_Vermelho);
ND_Haze_IVP      = round((NormalizedGain_IVP * ND_Predicted_IVP) + Offset_IVP);
ND_Haze_IVM1     = round((NormalizedGain_IVM1 * ND_Predicted_IVM1) + Offset_IVM1);
ND_Haze_IVM2     = round((NormalizedGain_IVM2 * ND_Predicted_IVM2) + Offset_IVM2);

figure,plot([1 2 3 4 5 7],[ND_Haze_Azul ND_Haze_Verde ND_Haze_Vermelho ND_Haze_IVP ND_Haze_IVM1 ND_Haze_IVM2],'-sr'),...
    xlabel('Bandas'),ylabel('Valor de ND correspondente à bruma'),grid on, legend(['Modelo de Espalhamento: ' num2str(Power)]);
xlim([1 7]);

disp(['Espalhamento em ND na banda do Azul: ',num2str(ND_Haze_Azul)]);
disp(['Espalhamento em ND na banda do Verde: ',num2str(ND_Haze_Verde)]);
disp(['Espalhamento em ND na banda do Vermelho: ',num2str(ND_Haze_Vermelho)]);
disp(['Espalhamento em ND na banda do IVP: ',num2str(ND_Haze_IVP)]);
disp(['Espalhamento em ND na banda do IVM1: ',num2str(ND_Haze_IVM1)]);
disp(['Espalhamento em ND na banda do IVM2: ',num2str(ND_Haze_IVM2)]);

%% Aplicando as correções estimadas

%Leitura da imagem
Name     = input('Informe o nome da imagem (componente azul-B): ','s');
Azul     = imread(Name); %Leitura da imagem
ND_Azul  = input('Informe o fator de correção em ND para esta banda: ');

Name      = input('Informe o nome da imagem (componente verde-G): ','s');
Verde     = imread(Name); %Leitura da imagem
ND_Verde  = input('Informe o fator de correção em ND para esta banda: ');

Name         = input('Informe o nome da imagem (componente vermelha-R): ','s');
Vermelha     = imread(Name); %Leitura da imagem
ND_Vermelha  = input('Informe o fator de correção em ND para esta banda: ');

%corrigindo as imagens 
Azul_Corr = double(Azul) - ND_Azul;
Azul_Corr = uint8(Azul_Corr);

Verde_Corr = double(Verde) - ND_Verde;
Verde_Corr = uint8(Verde_Corr);

Vermelha_Corr = double(Vermelha) - ND_Vermelha;
Vermelha_Corr = uint8(Vermelha_Corr);

[m,n] = size(Azul);

%composição sem correção
img_Color = zeros(m,n,3);
img_Color = uint8(img_Color);
img_Color(:,:,3) = Azul;
img_Color(:,:,2) = Verde;
img_Color(:,:,1) = Vermelha;

%composição com correção
img_Color_Corr = zeros(m,n,3);
img_Color_Corr = uint8(img_Color_Corr);
img_Color_Corr(:,:,3) = Azul_Corr;
img_Color_Corr(:,:,2) = Verde_Corr;
img_Color_Corr(:,:,1) = Vermelha_Corr;

figure,imshow(img_Color,[]),title('Composição colorida sem correção');
figure,imshow(img_Color_Corr,[]),title('Composição colorida com correção');









