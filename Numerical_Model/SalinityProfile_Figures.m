%% Salt Concentration Profiles for Qualifying Exam
clear all;

D=170; %Diffusivity
Sc=100; %Salinity concentration at tree death. (Cintron et al 1978) (ppt)
ETnet = 0.74;
%ETnet = 1; %Enet in m/yr
% ETnet=linspace(1,100,100); %E-P over time (cm/yr)
R=150; %radius of island (meters)


%% initializing space vector
dx=0.0009; %the space model goes from one side of island to other
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

% %X = linspace(-60,60,104);
%  figure(1)
%  hold on
%  plot(x,S,'linewidth',5);
% title('Low Altitude Low Tide');
% legend('Precipitation = 500 mm','Precipitation = 4,000 mm');
% %legend('Steady State')
% %x=xlim;
% %axis([-100 100 30 110])
% %plot([x(1) x(2)],[100 100],'--k','linewidth',5);
% %plot([x(1) x(2)],[72 72],'--r','linewidth',5);
% %ylim([20,110]);
% %legend('Increasing Enet')
% xlabel('Distance (m)')
% ylabel('Salinity Concentration (ppt)')
% %title('High Enet')
% set(gca,'FontSize',13)