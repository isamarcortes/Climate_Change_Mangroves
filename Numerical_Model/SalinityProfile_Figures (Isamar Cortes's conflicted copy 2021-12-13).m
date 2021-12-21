%% input parameters for PDE
clear all;
D=150; %Diffusivity
Sc=100; %Salinity concentration at tree death. (Cintron et al 1978) (ppt)
ETnet = 1.5; %Enet in m/yr
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
end


figure(1)
hold on
plot(x,S,'linewidth',5);
x=xlim;
%axis([-100 100 30 110])
plot([x(1) x(2)],[100 100],'--k','linewidth',5);
plot([x(1) x(2)],[72 72],'--r','linewidth',5);
ylim([20,110]);
%legend('Increasing Enet')
xlabel('Distance (m)')
ylabel('Salinity Concentration (ppt)')
%title('High Enet')
set(gca,'FontSize',25)