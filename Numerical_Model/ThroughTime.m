clear all

%% space
xmin=0; %minimum x vector
xmax=100; %maximum x vector
dx=1; %step size
% Enet=-20; %%m/yr
nu=50; % hydraulic conductivity m/yr

x = xmin:dx:xmax; %step size
nx= length(x); %number of nodes
smax= 100;%%critical salinity concentration for black mangroves

%% time
tmin=0; %minimum x vector
tmax=650; %years
dt=0.01; %step size

t = tmin:dt:tmax; %step size
nt= length(t); %number of nodes

%%numerical stability
c = (dt/(dx^2))*nu;
%% height
s= zeros(nt,nx);
Enet=zeros(1,nt);
s(:,nx)=35; %end represents the end of the first row for boundary cond
%% initial condition
%s(1,:)=(-6.5e-3)*((x(:)).^2)+100; %salt profile
s(1,:)=35; %salt profile
Enet(1)=0;
%% equation for loop

for j=1:nt-1 %%specific to time variable
    %Enet(j)=(t(j))^2;
    %Enet(j)= -(t(j));
    %Enet(j)= (t(j));%%constant increase
    Enet(j) = 0.41;
    %Enet(j)=2*sin(t(j));%%sinusoidal
    %Enet(j)=sin(t(j));
    for i=2:nx-1
        s(j+1,i)=s(j,i)+((nu*(dt/((dx)^2)))*(s(j,i+1)-2*s(j,i)+s(j,i-1)))+(Enet(j)*(dt));
    end
    s(j+1,1)=s(j,1)+((nu*(dt/((dx)^2)))*(s(j,2)-2*s(j,1)+s(j,2)))+(Enet(j)*(dt));
    %s(j+1,1) = s(j,1) + Enet(j)*dt;
end
hold on
plot(x,s(65001,:),'Linewidth',5)
plot(x,s(20001,:),'Linewidth',5)
plot(x,s(10001,:),'Linewidth',5)
plot(x,s(1,:),'Linewidth',5)
legend('Year 650','Year 200','Year 100','Year 1')
xlabel('Distance from Center (m)')
ylabel('Salinity Concentration ppt')
%plot(t,s(:,1),'Linewidth',5)
%xlabel('Years')
%ylabel('Salinity Concentration ppt')


%plot(t,s(:,50),'Linewidth',5)
%plot(t,s(:,101),'Linewidth',5)

%legend('Center','x=50','Edge of Island')
%plot(x,s)
%plot(s(:,1)-100,t)

%plot(x,S)

% s(s>99.9999)= NaN;
% s(isnan(s))=1;
% TestDOR = zeros(1,nt);
% Area = pi*(100)^2;
% AreaChange = zeros(1,nt);
% 
% for l= 1:nt
%     TestDOR(l) = sum(s(l,:)==1)*dx;
%     AreaChange(l) = Area - ((pi*TestDOR(l))^2);
% end




% hold on
% scatter(t,AreaChange,1,'g');
% xlabel('Time');
% ylabel('Vegetated Area');
% legend('Sinosoidal Enet','Constant Increase Enet','Enet Decrease')

%s(s<100)=NaN;
%s(isnan(s))=0;

%%%%Calculating Area Change
% TimeTest = linspace(1,269,25);
% TT = length(TimeTest);
% TestT = zeros(1,TT);
% DistTest = linspace(1,25,25);
% DT = length(DistTest);
% TestX = zeros(1,DT);
% Area = pi*(100)^2;
% AreaChange = zeros(1,TT);
% for k=1:DT
%     AreaChange(k) = Area - ((pi*DistTest(k))^2);
% end

% plot(TimeTest,(AreaChange*10^-6))
% xlabel('Time')
% ylabel('Av Change (km^2)')




% figure (1)
% for imovie = 1:.01/dt:nt %step through time nodes
%     plot(x,s(imovie,:),'b') %colon means the whole vector in whatever direction you are going
%     hold on
%     plot(-x,s(imovie,:),'b')
%     hold off
%     xlabel('distance (m)')
%     ylabel('salinity concentration (ppt)')
%     title(['t=',num2str(imovie*dt)])
%     axis([-x(end) x(end) 0 100])
%     drawnow
%     M(imovie)= getframe(gcf);
% end
% movie2gif(M, 'Salinity.gif', 'LoopCount', 0, 'DelayTime', 0)

%figure (2)
% hold on
% plot(Enet,t,'r');
% plot(s(:,1)-100,t);
%plot(x,s);




%h=pcolor(x,t,s);
%set(h,'edgecolor','none');
%colormap(jet);
%plot(t,Enet);
%contour(x,t,s)
%contour(x,t,s,'b','ShowText','on');
%ylabel('Salinity');
%xlabel('time (years)');
%xlabel('Distance (years)');
%title('Fluctuations in Net Evaporation')


% 
% figure(3)
% plot(t,Enet);
% xlabel('Time');
% ylabel('Net Evaporation Rate (m/yr)');
% title('Net Evaporation Through Time');



