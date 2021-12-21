%% input parameters for PDE
clear all;
k=1000; %Diffusivity
Sc=72; %Salinity concentration at tree death. (Cintron et al 1978) (ppt)
ETnet = linspace (1,2,1000);
% ETnet=linspace(1,100,100); %E-P over time (cm/yr)
R=100; %radius of island (meters)


%% initializing space vector
dx=1; %the space model goes from one side of island to other
x=-R:dx:R; %Island length going from one side to the other
n=length(x); %initializing vector
ne=length(ETnet);

%% initializing salinity vector

S=zeros(1,n); %creating space to store values in vector
S0=35; %ocean salinity is 35 ppt on average
S(1)=S0; %first value equals 35 ppt (ocean salinity)
S(end)=S0; %last value equals 35 ppt (ocean salinity)

%start etnet loop
for j=2:ne
    for i=2:n %forloop of derived equation
     S(i)=(-ETnet(j)/(2*k))*x(i)^2+(ETnet(j)/(2*k))*R.^2+S0;
    end
end

for p = 1:length(S)
    if  S(p)>=72 
        xminval = p; 
        break
    end
end
for p = p:length(S)
    if  S(p)<72 
        xmaxval = p; 
        break
    end
end
%end et net loop
liney = [S0 max(S)]; 
linexmin = [x(xminval) x(xminval)]; %first dashed line
linexmax = [x(xmaxval) x(xmaxval)]; %second dashed line


figure(1)
figure
for imovie = 1:nt %step through time nodes
    plot(x,u(imovie,:)) %colon means the whole vector in whatever direction you are going
    xlabel('x')
    ylabel('y')
    title(['ETnet=',num2str(imovie*dt)])
    axis([ETnet(1) ETnet(end) -1 1])
    drawnow
    M(imovie)= getframe(gcf)
end



