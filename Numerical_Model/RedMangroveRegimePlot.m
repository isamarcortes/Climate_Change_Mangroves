clc
clear all
close all

Enet=linspace(0.1,2,100);
Ar=linspace(1,2200000,100);
So=35;
b=1;
Sc=72;

ne=length(Enet);
na=length(Ar);

D = zeros(ne,na);

for i=1:na
    for j=1:ne
        D(i,j)=(Enet(j)*Ar(i))/(2*pi*(Sc-So));
    end
end
%px= [0.8451 0.8457 .6405 .6405 .8559 .1426 .5072 .7242 .7242 .7242 .7242 .7242 .7242 1.4904 1.4904 .7234];
%py= [712 567 10700 7359 14652 2104951 169998 69648 5362 70138 32041 20107 18341 61597 190642 1148204];

figure(1)
pcolor(Enet,Ar*10^-6,D)
hold on
%plot(px,py)%'go')
shading flat
xlabel('Net Evaporation (m/yr)')
ylabel('Red mangrove area km^2')
title('Hydraulic Conductivity')
hold on
contour(Enet,Ar*10^-6,D,'k')
