clear all

%% input parameters for PDE
D=linspace(0,2,1001); %Diffusivity 
Sc=82; %Salinity concentration at tree death. (Cintron et al 1978) (ppt)
So=35; % (ppt)
ETnet=82; %cm/yr


alpha=ETnet./D; 
% for i=1:n
Av=((2*(Sc-So)./alpha)*pi);
% end

px = [.1741 .7217 .7391 .5925 .5864 .7582 .7569 .1855 .1855 .1541 .7591 .9908 .9592 .9908 .9908 .9908 .9908 .4115 1.6703 .4115 .14122 .14122 .9074 .9592];
py = [27650 8487 7174 17014 23700 67701 85012 9217.9 10824.5 2979571 1197621 295857 29122 241064 112319 77654 35737 116179 579468 677416 161227 366635 1293025 2578];   

% hold on
% plot(ETnet,Av,'g',px,py,'o')
% xlabel('net Evaporation (cm/yr)')
%  ylabel('Av (Vegetated Area, km^2 X 10^3)')
%  title('Vegetated Area')
% axis([0 2 0 10^6.5])

figure
hold on
plot(ETnet,Av*10^-6,'r',px,py*10^-6,'ko')
xlabel('net Evaporation (cm/yr)')
 ylabel('Av (km^2)')
 title('Vegetated Area')
axis([0 1.8 0 10^.5])