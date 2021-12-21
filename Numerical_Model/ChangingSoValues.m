clc;
Enet=1; %net evaporation m/yr
b=1; %conversion factor
k=5; %hydraulic conductivity
h=1; %characteristic depth
So=37; %ocean salinity
Se=50; %higher salinity value for other ocean edge
dx=1;
R=50;%radius
x=-R:dx:R;
n=length(x);
S=zeros(1,n);
 S(1)=Se;
 S(end)=So;


for i=1:n
    S(i)=(-((Enet*b)/(2*k*h)))*x(i)^2+(So+((((Enet*b)/(2*k*h))*R)-((Se+So)/2)))*x(i)+(Se+So*R)/2;    
    %S(i)=(((-Enet*b)/(2*k*h))*(x(i)^2))+(So)+((((Enet*b*R)/(2*k*h)))-((Se+So)/(2))*(x(i)))+((Se+So*R)/(2));
end
hold on
plot(x,S*10^-0.9);
x=xlim;
plot([x(1) x(2)],[100 100],'--')
xlabel('Distance (m)')
ylabel('Salinity concentration (ppt)')

