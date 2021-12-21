% clc
% clear all
% close all

Enet=linspace(0.5,2,1000);
D=linspace(0,100,1000);
So=35;
b=1;
Sc=82;

ne=length(Enet);
nd=length(D);

Av = zeros(ne,nd);

for i=1:nd
    for j=1:ne
        Av(i,j)=((Sc-So)*(2*pi*D(i)/(Enet(j)*b)));
    end
end

figure (1)

pcolor(Enet,D,Av)

axis([0.5 1.75 0 100]);
shading flat
hold on

contour(Enet,D,Av,'k')
xlabel('Net Evaporation (m/yr)')
ylabel('Hydraulic Conductivity (m/yr)')
title('Area of mangrove vegetation')

