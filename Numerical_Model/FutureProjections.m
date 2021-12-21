hold on

%Puerto Rico
ax= [1.661	1.661	1.702	1.702	1.657	1.661];
ay= [49.12101144	49.08488862	62.36780259	62.36780259	48.34640917	49.08488862];

%Belize
bx= [1.9614];
by= [92.72968288];

%Mexico
cx = [1.7954];
cy = [71.75002785];

%Bahamas
dx=[0.806];
dy= [-29.56575682];

%Venezuela
ex=[1.281	1.281];
ey=[-16.34660422 -16.34660422];

%Cuba
fx=[1.83	1.87];
fy=[60.46994536	66.71122995];

%Florida
gx=[1.418	1.418	1.3933	1.3933	1.3933	1.418	1.418	1.3933	1.3933	1.3933	1.3933	1.3933	1.3933	1.3933	1.3933	1.3933];
gy=[0.796897038	0.796897038	48.02267997	48.02267997	23.53405584	60.90973202	60.90973202	-0.961745496	27.66812603	27.66812603	48.02267997	48.02267997	48.02267997	48.02267997	48.02267997	48.02267997];

plot(ax,ay,'bo',gx,gy,'rx',bx,by,'m*',cx,cy,'kd',ex,ey,'gs',fx,fy,'b<',dx,dy,'kx','MarkerSize',7)
xlabel('Net evaporation rate in 2050 (m yr^-^1)')
ylabel('Vegetated Area loss (%)')
title('Year: 2050')
legend('Puerto Rico','Florida','Belize','Mexico','Venezuela','Cuba','Bahamas')
legend('boxoff')
set(gca,'FontSize',15)
box on