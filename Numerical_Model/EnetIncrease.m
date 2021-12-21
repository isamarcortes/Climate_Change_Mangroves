clear all

%% space
xmin=0; %minimum x vector
xmax=100; %maximum x vector
dx=1; %step size
% Enet=-20; %%m/yr
nu=1; % hydraulic conductivity

x = xmin:dx:xmax; %step size
nx= length(x); %number of nodes
smax= 100;%%critical salinity concentration for black mangroves

%% time
tmin=0; %minimum x vector
tmax=10; %years
dt=0.01; %step size

t = tmin:dt:tmax; %step size
nt= length(t); %number of nodes

%% height
s= zeros(nt,nx);
Enet=zeros(1,nt);
s(:,1)=smax;%colon means applied to every row 
s(:,nx)=35; %end represents the end of the first row for boundary cond
%% initial condition
s(1,:)=(-6.5e-3)*((x(:)).^2)+100; %salt profile
Enet(1)=0;
%% equation for loop

for j=1:nt-1 %%specific to time variable
    Enet(j)=-(t(j));
    for i=2:nx-1
        s(j+1,i)=s(j,i)+((nu*(dt/((dx)^2)))*(s(j,i+1)-2*s(j,i)+s(j,i-1)))+(Enet(j)*(dt));
    end
    s(j+1,1) = s(j,1) + Enet(j)*dt;
end

figure
for imovie = 1:.01/dt:nt %step through time nodes
    plot(x,s(imovie,:),'b') %colon means the whole vector in whatever direction you are going
    hold on
    plot(-x,s(imovie,:),'b')
    hold off
    xlabel('distance (m)')
    ylabel('salinity concentration (ppt)')
    title(['t=',num2str(imovie*dt)])
    axis([-x(end) x(end) 0 100])
    drawnow
    M(imovie)= getframe(gcf);
end
movie2gif(M, 'Salinity.gif', 'LoopCount', 0, 'DelayTime', 0)



