%% input parameters for PDE
D=100;
Sc=82;
ETnet=linspace(0,2,400); %400 spaces between 0 and 1
R=linspace(0,500,400); %400 spaces between 0 and 500


%% initializing space vector
ne=length(ETnet);
nr=length(R);
Sxc=NaN(nr,ne);

%% initializing salinity vector
S=zeros(1,nr);
S0=35; %ocean salinity is 35 ppt on average
S(1)=S0;
S(end)=S0;
for r=1:nr
    r=r;
for e=1:ne
     Sxc(r,e)=(ETnet(e)/(2*D))*R(r)^2+S0;
if Sxc(r,e)>82; Sxc(r,e)=NaN; end
end
end 

px = [17.41 72.17 73.91 59.25 58.64 75.82 75.69 18.55 18.55 15.41 75.91 99.08 95.92 99.08 99.08 99.08 99.08 41.15 167.03 41.15]; %ETNet values
py = [28909 13661 9045 20878 32807 87153 86429 10427 12092 2979571 1299823 688229 51434 397736 140474 135257 37028 120653 617999 884158] %area
pcolor(ETnet,R,Sxc);
%plot(px,py,'o');
shading flat
 xlabel('ETnet')
 ylabel('Radius')
 title('Radius vs ETnet')
 hold on;
contour(ETnet,R,Sxc,'k');






    
