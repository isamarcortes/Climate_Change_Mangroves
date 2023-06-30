%% input parameters for PDE
D=17.41; %Diffusivity m^2/yr
Da=500;
Db=1000;
Dc=2811.13; %Different diffusion values
Sc=82; %Salinity concentration at tree death. (Cintron et al 1978) (ppt)
So=27;% (ppt ocean salinity average)
Sos=60; %Second Ocean salinity value
ETnet=linspace(0.01,2,1001); %m/yr
b=1; %conversion factor


Av=((Sc-So)*2*pi*D)./(ETnet);
Ava=((Sc-Sos)*2*pi*D)./(ETnet);

Avb=((Sc-So)*2*pi*Da)./(ETnet);
Avc=((Sc-Sos)*2*pi*Da)./(ETnet);

Avd=((Sc-So)*2*pi*Db)./(ETnet);
Ave=((Sc-Sos)*2*pi*Db)./(ETnet);

Avf=((Sc-So)*2*pi*Dc)./(ETnet);
Avg=((Sc-Sos)*2*pi*Dc)./(ETnet);

% for i=1:n

%Av=((Sc-So)*2*pi*D)./(ETnet)*(35*b);
%Ava=((Sc-Sos)*2*pi*D)./(ETnet)*(35*b);

%Avb=((Sc-So)*2*pi*Da)./(ETnet)*(35*b);
%Avc=((Sc-Sos)*2*pi*Da)./(ETnet)*(35*b);

%Avd=((Sc-So)*2*pi*Db)./(ETnet)*(35*b);
%Ave=((Sc-Sos)*2*pi*Db)./(ETnet)*(35*b);

%Avf=((Sc-So)*2*pi*Dc)./(ETnet)*(35*b);
%Avg=((Sc-Sos)*2*pi*Dc)./(ETnet)*(35*b);
% end
%px= [0.8451 0.8457 .6405 .6405 .8559 .8559 .1426 .5072 .7242 .7242 .7242 .7242 .7242 .7242 1.0443 1.4904 1.4904 .7234 .6225 1.4067 1.4067 .7242 .7242 1.0654 .5543 .5543 1.4067 1.0078 1.0078];
%py= [8487 7174 17014 23700 67701 85012 2979571 1197621 296857 29122 241064 112319 77645 35737 579468 161227 366635 1293025 42603 136350 544291 252404 75396 120650 106110 74044 737302 195762 62553];

%px= [.8451 .8451 .6405 .6405 .8559 .8559 .1426 .5076 .7242 .7242 .7242 .7242 .7242 .7242 .0328 1.0443 .0328 1.4904 1.4904 .7234 .6225]; 
%py= [8487 7174 17014 23700 67701 85012 2979571 1197621 295857 29122 241064 112319 77645 35737 116179 579468 677416 161227 366635 1293025 42603]; 
%px = [.1741 .7217 .7391 .5925 .5864 .7582 .7569 .1855 .1855 .1541 .7591 .9908 .9592 .9908 .9908 .9908 .9908 .4115 1.6703 .4115 1.4122 1.4122 .9074 .9592];% -47.88 -47.67 -51.57 -51.57 -7.67];
%py = [27650 8487 7174 17014 23700 67701 85012 9217.9 10824.5 2979571 1197621 295857 29122 241064 112319 77654 35737 116179 579468 677416 161227 366635 1293025 2578];% 73078 170271 94668 116199 335447];   


figure (1)
plot(ETnet,Av*10^-6,'b',ETnet,Ava*10^-6,'b--',ETnet,Avb*10^-6,'g',ETnet,Avc*10^-6,'g--',ETnet,Avd*10^-6,'r',ETnet,Ave*10^-6,'r--',ETnet,Avf*10^-6,'k',ETnet,Avg*10^-6,'k--','linewidth',2)

%plot(ETnet,Av*10^-6,'b',ETnet,Ava*10^-6,'b--',ETnet,Avb*10^-6,'g',ETnet,Avc*10^-6,'g--',ETnet,Avd*10^-6,'r',ETnet,Ave*10^-6,'r--',ETnet,Avf*10^-6,'k',ETnet,Avg*10^-6,'k--',px,py*10^-6,'ko')

%loglog(ETnet,Av,'r')
figure(1)
hold on

xlabel('{\itE_n_e_t} (m yr^-^1)','FontSize',15)
 ylabel('{\itA_v} (km^2)','FontSize',15)
 title('{\itA_v} vs {\itE_n_e_t}','FontSize',16)
 
ax = gca;
ax.FontSize = 14;
h= legend('{\itD_c}=17.41 m^2/yr  {\itS_o}=27 ppt','{\itD_c}=17.41 m^2/yr  {\itS_o}=60 ppt','{\itD_c}=500 m^2/yr  {\itS_o}=27 ppt','{\itD_c}=500 m^2/yr  {\itS_o}=60 ppt','{\itD_c}=1000 m^2/yr  {\itS_o}=27 ppt','{\itD_c}=1000 m^2/yr  {\itS_o}=60 ppt','{\itD_c}=2811.13 m^2/yr  {\itS_o}=27 ppt','{\itD_c}=2811.13 m^2/yr  {\itS_o}=60 ppt');
set(h,'FontSize',13)
legend boxoff
 axis([0 1.8 0 3])