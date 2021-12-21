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

Av = zeros(ne,nd);

for i=1:nd
    for j=1:ne
        Av(i,j)=((Sc-So)/(Enet(j)*b))*(2*pi*D(i));
    end
end
px= [0.1426 .7242 .7242 .7242 .7242 .7242 .7242 1.4067 1.4067 .7242 .7242 1.0654 .5543 .5543 1.4067 1.0078 1.0078]; 
py= [2979571 295857 29122 241064 112319 77645 35737 136350 544291 252404 75396 120650 106110 74044 737302 195762 62553]; 

figure

pcolor(Enet,D,Av)
%contour(Enet,D,Av)
axis([0.14 2 0 3000]);

hold on

plot(px,py*10^-3,'ro')
shading flat
xlabel('Net Evaporation m/yr')
ylabel('Hydraulic Conductivity m/yr')
zlabel ('Vegetated Area m^2')

title('Vegetated Area')
hold on
%contour(Enet,D,Av,'k')
