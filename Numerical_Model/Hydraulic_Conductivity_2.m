clc
clear all
close all
 
Enet=linspace(0.14,2,1000);
D=linspace(1,3001,1000);
So=35;
b=1;
Sc=72;
 
ne=length(Enet);
nd=length(D);
 
Av = NaN(ne,nd);
Av_km = NaN(ne,nd);
 
for i=1:nd
    for j=1:ne
        Av(i,j)=((Sc-So)/(Enet(j)*b))*(2*pi*D(i));
        Av_km(i,j)=Av(i,j)/(1e6);
    end
end
px= [0.8451 0.8457 .6405 .6405 .8559 .8559 .1426 .5072 .7242 .7242 .7242 .7242 .7242 .7242 .0328 1.0443 .038 1.4904 1.4904 .7234 .6225 1.4067 1.4067 .7242 .7242 1.0654 .5543 .5543 1.4067 1.0078 1.0078];
py= [8487 7174 17014 23700 67701 85012 2979571 1197621 296857 29122 241064 112319 77645 35737 116179 579468 677416 161227 366635 1293025 42603 136350 544291 252404 75396 120650 106110 74044 737302 195762 62553];
 
figure (1)
 
pcolor(Enet,D,Av_km)
%contour(Enet,D,Av)
axis([0.14 1.6 0 3000]);
shading flat
hold on
 
plot(px,py*10^-3,'ro')
shading flat
 
xlabel('Net Evaporation (m/yr)')
ylabel('Hydraulic Conductivity (m/yr)')
title('Vegetation Area')
%contour(Enet,D,Av,'k')