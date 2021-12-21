%% input parameters for PDE
D=5; %Diffusivity m^2/yr
Da=30;
Db=90;
Dc=130; %Different diffusion values
Sc=82; %Salinity concentration at tree death. (Cintron et al 1978) (ppt)
So=35;% (ppt ocean salinity average)
Sos=40; %Second Ocean salinity value
ETnet=linspace(0.01,2,1001); %m/yr
b=1 %conversion factor


% for i=1:n
Av=((Sc-So)*2*pi*D)./(ETnet)*(35*b)
Ava=((Sc-Sos)*2*pi*D)./(ETnet)*(35*b)

Avb=((Sc-So)*2*pi*Da)./(ETnet)*(35*b)
Avc=((Sc-Sos)*2*pi*Da)./(ETnet)*(35*b)

Avd=((Sc-So)*2*pi*Db)./(ETnet)*(35*b)
Ave=((Sc-Sos)*2*pi*Db)./(ETnet)*(35*b)

%Avf=((Sc-So)*2*pi*Dc)./(ETnet)*(35*b)
%Avg=((Sc-Sos)*2*pi*Dc)./(ETnet)*(35*b)
% end
px= [0.1426 .7242 .7242 .7242 .7242 .7242 .7242 1.4067 1.4067 .7242 .7242 1.0654 .5543 .5543 1.4067 1.0078 1.0078]; 
py= [2979576 295857 29122 241064 112319 77645 35737 136350 544291 252404 75396 120650 106110 74044 737302 195762 62553]; 
%(original px, py values) px = [.1741 .7217 .7391 .5925 .5864 .7582 .7569 .1855 .1855 .1541 .7591 .9908 .9592 .9908 .9908 .9908 .9908 .4115 1.6703 .4115 1.4122 1.4122 .9074 .9592];% -47.88 -47.67 -51.57 -51.57 -7.67];
%py = [27650 8487 7174 17014 23700 67701 85012 9217.9 10824.5 2979571 1197621 295857 29122 241064 112319 77654 35737 116179 579468 677416 161227 366635 1293025 2578];% 73078 170271 94668 116199 335447];   


figure (1)
plot(ETnet,Av*10^-6,'b',ETnet,Ava*10^-6,'b--',ETnet,Avb*10^-6,'g',ETnet,Avc*10^-6,'g--',ETnet,Avd*10^-6,'r',ETnet,Ave*10^-6,'r--',px,py*10^-6,'ko')%,ETnet,Avf*10^-6,'k',ETnet,Avg*10^-6,'k--',px,py*10^-6,'ko')
%loglog(ETnet,Av,'r')

hold on

xlabel('Net Evaporation (m/yr)')
 ylabel('Av (km^2)')
 title('Florida and Belize Vegetated Area')
 legend('k=5 m^2/yr S=35 ppt','k=5 m^2/yr S=40 ppt','k=30 m^2/yr S=35 ppt','k=30 m^2/yr S=40 ppt','k=90 m^2/yr S=35 ppt','k=90 m^2/yr S=40 ppt')%,'D=130 m^2/yr S=35 ppt','D=130 m^2/yr S=40 ppt')
legend boxoff
 axis([0 1.8 0 3])