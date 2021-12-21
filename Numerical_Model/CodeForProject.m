%% input parameters for PDE
D=6500; %Diffusivity m^3/yr
Sc=72; %Salinity concentration at tree death. (Cintron et al 1978) (ppt)
ETnet=-157; %E-P over time (m/yr)
R=50; %radius of island (square meters)


%% initializing space vector
dx=1; %the space model goes from one side of island to other
x=-R:dx:R; %Island length going from one side to the other
n=length(x); %initializing vector

%% initializing salinity vector

S=zeros(1,n); %creating space to store values in vector
S0=35; %ocean salinity is 35 ppt on average
S(1)=S0; %first value equals 35 ppt (ocean salinity)
S(end)=S0; %last value equals 35 ppt (ocean salinity)

triplow=0;
triphigh=0;

for i=2:n %forloop of derived equation
     S(i)=(-ETnet/(2*D))*x(i)^2+(ETnet/(2*D))*R.^2+S0;
end

for j = 1:length(S)
    if  S(j)>=72
        xminval = j; 
       break
    end
end

for j= j:length(S)
    if S(j)<72
        xmaxval=j;
        break
    end
end
    


liney = [S0 max(S)]; 
linexmax = [x(xminval) x(xminval)];  %first dashed line
linexmin = [x(xmaxval) x(xmaxval)];  %second dashed line

figure
hold on
plot(x,S,'b',linexmin, liney,'r--', linexmax, liney,'r--')
%plot(x,S,'b',linexmax, liney,'g--', linexmax, liney,'g--')
 xlabel('Distance (m)')
 ylabel('Salinity Concentration (ppt)')
 title('Salinity Profile')







    
