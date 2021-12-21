%% input parameters for PDE
clear all;
D=1000; %Diffusivity
Sc=100; %Salinity concentration at tree death. (Cintron et al 1978) (ppt)
ETnet = 100;
% ETnet=linspace(1,100,100); %E-P over time (cm/yr)
R=100; %radius of island (meters)


%% initializing space vector
dx=1; %the space model goes from one side of island to other
x=-R:dx:R; %Island length going from one side to the other
n=length(x); %initializing vector

%% initializing salinity vector

S=zeros(1,n); %creating space to store values in vector
S0=35; %ocean salinity is 35 ppt on average
S(1)=S0; %first value equals 35 ppt (ocean salinity)
S(end)=S0; %last value equals 35 ppt (ocean salinity)
%end et net loop

for i=2:n
         S(i)=(-ETnet/(2*D))*x(i)^2+(ETnet/(2*D))*R.^2+S0;
  

 for j = 1:length(S)
    if  S(j)>=72 
        xminval = 0; 
        break
    end
end
for j = j:length(S)
    if  S(j)<72 
        xmaxval = 0; 
        break
    end
end
liney = [S0 max(S)]; 
linexmin = [x(xminval) x(xminval)]; %first dashed line
linexmax = [x(xmaxval) x(xmaxval)]; %second dashed line
%start etnet loop
%forloop of derived equation

   figure(1)
plot(x,S,'b',linexmin, liney,'g--', linexmax, liney,'g--')
 xlabel('Distance (m)')
 ylabel('Salinity Concentration (ppt)')
 title('Salinity Profile')
end





