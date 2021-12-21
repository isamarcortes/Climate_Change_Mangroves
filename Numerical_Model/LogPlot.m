clear all;
Sc=72; %ppt salinity mortality of red mangroves
So=35; %ppt ocean salinity
Enet=10:1:200; %net evaporation in cm/yr
b=1; %conversion factor ppt/m
D=10; %testing out a value for hydraulic conductivity
n=length(Enet);
Av=zeros(1,n);

for i=1:n
    Av=((Sc-So)*2*pi*D)./(Enet*b);
end

plot(Av,Enet)