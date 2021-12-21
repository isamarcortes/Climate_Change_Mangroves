clc;
%input parameters
k=400; %%hydraulic conductivity
So=37; %%ocean salinity
Enet=1; %%Net evaporation
h=1; %%characteristic depth
dx=0.1; %%step size
y=Enet*h; %%used in calculating a
a=-sqrt(y/k); 
%%vectorizing x
R=100;%%radius?... 
x=0:dx:R;
n=length(x);
S=zeros(1,n);
S(1)=So;
S(end)=So;


for i=1:n
    S(i)=(So*exp(-2*a*R)/(1+exp(-2*a*R)))*exp(a*x(i))+((So)/(1+exp(-2*a*R))*exp(-a*x(i)));
end


plot(x,S);
