% Proje��o de Mercatorclcclear allclose all%Lon0:       Longitude do centro da proje��o (meridiano central)%Lat0:       Latitude m�dia ou latitude escolhida como origem do sistema de             %coordenadas retangulares da proje��o%Lat1, Lat2: Paralelos padr�o%h:          Fator de escala relativo ao longo dos meridianos%k:          Fator de escala relativo ao longo dos paralelos%w:          M�xima deforma��o angular num dado ponto da proje��o%X, Y:       Coordenadas retangulares da proje��o%R:          Raio da esfera de refer�ncia (km)load('cost_pa_me.mat')%carrega a vari�vel cost_pa_me com lon na primeiroa coluna e lat na segundaLon = cost_pa_me(:,1);Lat = cost_pa_me(:,2);%Limitando os dados em latitude para n�o ocorrerem divis�es por zerofor i = 1 : 10015    if abs(Lat(i)) >= 81        Lat(i) = NaN;        Lon(i) = NaN;    endifendforLon0 = 0;%GreenwichLat1 = 0;%Equador%Plotando em coordenadas geod�sicasfigure,plot(Lon,Lat);xlabel('Lon [deg.]'),ylabel('Lat [deg.]');title('Mercator Projection','FontSize',14);%C�lculo das coordenadas [X Y]. Assumindo raio equatorial de 6371 km
%Convertendo em radianosLon = deg2rad(Lon);Lat = deg2rad(Lat);R   = 6371;%kmX   = R .* (Lon - Lon0);Y   = R * log(tan((pi/4)+(Lat / 2)));figure,plot(X,Y);xlabel('Coord. X [km]'),ylabel('Coord. Y [km]');title('Mercator Projection','FontSize',14);