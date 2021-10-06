steplon = 10;
steplat = 10;
lonmin = -180;
lonmax = 180;
latmin = -90;
latmax = 90;

Lon0 = 0;
Lat1 = 0;
% len = length(lonaxis);
% lat_pa_1 = ones(len,1) * 80;
% parallel_1 = [lonaxis lat_pa_1]; 

[LonQ,LatQ] = meshgrid(lonmin:steplon:lonmax,latmin:steplat:latmax);
[m,n] = size(LatQ);
NAN = [NaN NaN];

pa1 = [LonQ(1,:)' LatQ(1,:)';NAN];
pa2 = [LonQ(2,:)' LatQ(2,:)';NAN];
pa3 = [LonQ(3,:)' LatQ(3,:)';NAN];
pa4 = [LonQ(4,:)' LatQ(4,:)';NAN];
pa5 = [LonQ(5,:)' LatQ(5,:)';NAN];
pa6 = [LonQ(6,:)' LatQ(6,:)';NAN];
pa7 = [LonQ(7,:)' LatQ(7,:)';NAN];
pa8 = [LonQ(8,:)' LatQ(8,:)';NAN];
pa9 = [LonQ(9,:)' LatQ(9,:)';NAN];
pa10 = [LonQ(10,:)' LatQ(10,:)';NAN];
pa11 = [LonQ(11,:)' LatQ(11,:)';NAN];
pa12 = [LonQ(12,:)' LatQ(12,:)';NAN];
pa13 = [LonQ(13,:)' LatQ(13,:)';NAN];
pa14 = [LonQ(14,:)' LatQ(14,:)';NAN];
pa15 = [LonQ(15,:)' LatQ(15,:)';NAN];
pa16 = [LonQ(16,:)' LatQ(16,:)';NAN];
pa17 = [LonQ(17,:)' LatQ(17,:)';NAN];
pa18 = [LonQ(18,:)' LatQ(18,:)';NAN];
pa19 = [LonQ(19,:)' LatQ(19,:)';NAN];
pa = [pa1;pa2;pa3;pa4;pa5;pa6;pa7;pa8;pa9;pa10;pa11;pa12;pa13;pa14;pa15;pa16;pa17;pa18;pa19];


me1 = [LonQ(:,1) LatQ(:,1);NAN];
me2 = [LonQ(:,2) LatQ(:,2);NAN];
me3 = [LonQ(:,3) LatQ(:,3);NAN];
me4 = [LonQ(:,4) LatQ(:,4);NAN];
me5 = [LonQ(:,5) LatQ(:,5);NAN];
me6 = [LonQ(:,6) LatQ(:,6);NAN];
me7 = [LonQ(:,7) LatQ(:,7);NAN];
me8 = [LonQ(:,8) LatQ(:,8);NAN];
me9 = [LonQ(:,9) LatQ(:,9);NAN];
me10 = [LonQ(:,10) LatQ(:,10);NAN];
me11 = [LonQ(:,11) LatQ(:,11);NAN];
me12 = [LonQ(:,12) LatQ(:,12);NAN];
me13 = [LonQ(:,13) LatQ(:,13);NAN];
me14 = [LonQ(:,14) LatQ(:,14);NAN];
me15 = [LonQ(:,15) LatQ(:,15);NAN];
me16 = [LonQ(:,16) LatQ(:,16);NAN];
me17 = [LonQ(:,17) LatQ(:,17);NAN];
me18 = [LonQ(:,18) LatQ(:,18);NAN];
me19 = [LonQ(:,19) LatQ(:,19);NAN];
me20 = [LonQ(:,20) LatQ(:,20);NAN];
me21 = [LonQ(:,21) LatQ(:,21);NAN];
me22 = [LonQ(:,22) LatQ(:,22);NAN];
me23 = [LonQ(:,23) LatQ(:,23);NAN];
me24 = [LonQ(:,24) LatQ(:,24);NAN];
me25 = [LonQ(:,25) LatQ(:,25);NAN];
me26 = [LonQ(:,26) LatQ(:,26);NAN];
me27 = [LonQ(:,27) LatQ(:,27);NAN];
me28 = [LonQ(:,28) LatQ(:,28);NAN];
me29 = [LonQ(:,29) LatQ(:,29);NAN];
me30 = [LonQ(:,30) LatQ(:,30);NAN];
me31 = [LonQ(:,31) LatQ(:,31);NAN];
me32 = [LonQ(:,32) LatQ(:,32);NAN];
me33 = [LonQ(:,33) LatQ(:,33);NAN];
me34 = [LonQ(:,34) LatQ(:,34);NAN];
me35 = [LonQ(:,35) LatQ(:,35);NAN];
me36 = [LonQ(:,36) LatQ(:,36);NAN];
me37 = [LonQ(:,37) LatQ(:,37);NAN];

me = [me1;me2;me3;me4;me5;me6;me7;me8;me9;me10;me11;me12;me13;me14;me15;me16;me17;...
      me18;me19;me20;me21;me22;me23;me24;me25;me26;me27;me28;me29;me30;me31;me32;...
      me33;me34;me35;me36;me37];
pa_me = [pa;me];  

cost_pa_me = [ncst;pa_me];
figure,plot(cost_pa_me(:,1),cost_pa_me(:,2));


X1 = R .* (deg2rad(cost_pa_me(:,1)) - deg2rad(Lon0)) .* cos(deg2rad(0));
Y1 = R .* deg2rad(cost_pa_me(:,2));

figure,plot(X1,Y1);

save('cost_pa_me','cost_pa_me');

