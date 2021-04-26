%%
%Este arquivo contém as definições da classe obj_img. Suas propriedades
%%

classdef obj_img %Definição da classe
    properties 
        TamN             %Número de linhas da imagem
        TamM             %Número de colunas da imagem
        Nome             %Nome da imagem (string)
        Imagem           %Imagem de entrada
        ImgR             %Imagem realçada
        ImgF             %Imagem filtrada
        ImgD             %Imagem com rastros detectados
        ImgBi            %Imagem binarizada
        ImgBo            %Imagem de bordas
    end%propriedades
    methods
        %Determinação dos limiares usados nas funções com base na área da
        %imagem de entrada
        function Limiar_Filt=GetLimiarFilter(obj_img)
            [obj_img.TamN obj_img.TamM]=size(obj_img.Imagem);
            Limiar_Filt=4*(uint16(5e-4*(obj_img.TamN*obj_img.TamM)));
        end
        function Limiar_Fech=GetLimiarFech(obj_img)
            [obj_img.TamN obj_img.TamM]=size(obj_img.Imagem);
            Limiar_Fech=4*(uint16(7.8e-5*(obj_img.TamN*obj_img.TamM)));
        end
        
        function Fimg=Filtro(obj_img) %Método para filtragem de imagens
            LimiarFilt=obj_img.GetLimiarFilter;
            Fimg=mmareaopen(obj_img.Imagem,LimiarFilt);
        end%função
        %Função para aumento de contraste linear
        function Rimg=Realce(obj_img)
            Rimg=imadjust(obj_img.Imagem);
        end%função
        %Função para fechamento por top-hat
        function Fech=Fechamento(obj_img)
            LimiarFech=obj_img.GetLimiarFech;
            Fech=mmcloseth(obj_img.Imagem,mmsebox(LimiarFech));
        end%função
    end%métodos
end%classe
%%





